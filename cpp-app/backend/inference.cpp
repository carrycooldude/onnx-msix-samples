
// C++ Backend: ONNX Runtime Inference Example
#include <onnxruntime_cxx_api.h>
#include <vector>
#include <iostream>
#include <filesystem>

void run_inference() {
    // Path to model (assume running from Release/)
    std::string model_path = "model.onnx";
    if (!std::filesystem::exists(model_path)) {
        std::cerr << "Model file not found: " << model_path << std::endl;
        return;
    }

    Ort::Env env(ORT_LOGGING_LEVEL_WARNING, "test");
    Ort::SessionOptions session_options;
    Ort::Session session(env, model_path.c_str(), session_options);

    // Prepare dummy input for squeeze.onnx (shape: [1, 3, 224, 224])
    std::vector<float> input_tensor_values(1 * 3 * 224 * 224, 1.0f);
    std::vector<int64_t> input_shape = {1, 3, 224, 224};

    // Get input/output names
    Ort::AllocatorWithDefaultOptions allocator;
    char* input_name = session.GetInputName(0, allocator);
    char* output_name = session.GetOutputName(0, allocator);

    // Create input tensor
    Ort::MemoryInfo mem_info = Ort::MemoryInfo::CreateCpu(OrtArenaAllocator, OrtMemTypeDefault);
    Ort::Value input_tensor = Ort::Value::CreateTensor<float>(mem_info, input_tensor_values.data(), input_tensor_values.size(), input_shape.data(), input_shape.size());

    // Run inference
    auto output_tensors = session.Run(Ort::RunOptions{nullptr}, &input_name, &input_tensor, 1, &output_name, 1);

    // Get output
    float* output_data = output_tensors.front().GetTensorMutableData<float>();
    std::cout << "ONNX inference result (first value): " << output_data[0] << std::endl;

    allocator.Free(input_name);
    allocator.Free(output_name);
}

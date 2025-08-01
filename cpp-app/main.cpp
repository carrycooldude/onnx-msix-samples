#include <onnxruntime_c_api.h>
#include <iostream>
#include <vector>
#include <cmath>

int main() {
    OrtEnv* env;
    OrtCreateEnv(ORT_LOGGING_LEVEL_WARNING, "test", &env);

    OrtSessionOptions* session_options;
    OrtCreateSessionOptions(&session_options);
    OrtSession* session;
    OrtCreateSession(env, L"model.onnx", session_options, &session);

    OrtAllocator* allocator;
    OrtGetAllocatorWithDefaultOptions(&allocator);

    const char* input_name = session->GetInputName(0, allocator);
    std::vector<float> input_tensor_values(3 * 224 * 224, 0.5f);
    std::vector<int64_t> input_shape = {1, 3, 224, 224};

    OrtMemoryInfo* memory_info;
    OrtCreateCpuMemoryInfo(OrtArenaAllocator, OrtMemTypeDefault, &memory_info);

    OrtValue* input_tensor = nullptr;
    OrtCreateTensorWithDataAsOrtValue(memory_info, input_tensor_values.data(), input_tensor_values.size() * sizeof(float),
                                      input_shape.data(), input_shape.size(), ONNX_TENSOR_ELEMENT_DATA_TYPE_FLOAT, &input_tensor);

    OrtValue* output_tensor = nullptr;
    const char* output_names[] = {"output"};
    OrtRun(session, nullptr, &input_name, &input_tensor, 1, output_names, 1, &output_tensor);

    float* output_data;
    OrtGetTensorMutableData(output_tensor, (void**)&output_data);

    int max_index = std::distance(output_data, std::max_element(output_data, output_data + 1000));
    std::cout << "Prediction: " << max_index << std::endl;

    OrtReleaseValue(output_tensor);
    OrtReleaseValue(input_tensor);
    OrtReleaseSession(session);
    OrtReleaseSessionOptions(session_options);
    OrtReleaseEnv(env);

    return 0;
}
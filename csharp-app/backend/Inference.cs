
// C# Backend: ONNX Runtime Inference Example
using Microsoft.ML.OnnxRuntime;
using Microsoft.ML.OnnxRuntime.Tensors;
using System;
using System.IO;

public class Inference {
    public void RunInference() {
        string modelPath = "model.onnx";
        if (!File.Exists(modelPath)) {
            Console.WriteLine($"Model file not found: {modelPath}");
            return;
        }

        using var session = new InferenceSession(modelPath);
        // Prepare dummy input for squeeze.onnx (shape: [1, 3, 224, 224])
        var inputData = new DenseTensor<float>(new[] { 1, 3, 224, 224 });
        for (int i = 0; i < inputData.Length; i++) inputData.Buffer.Span[i] = 1.0f;

        var inputName = session.InputMetadata.Keys.First();
        var inputs = new List<NamedOnnxValue> { NamedOnnxValue.CreateFromTensor(inputName, inputData) };
        using var results = session.Run(inputs);
        var output = results.First().AsEnumerable<float>().ToArray();
        Console.WriteLine($"ONNX inference result (first value): {output[0]}");
    }
}

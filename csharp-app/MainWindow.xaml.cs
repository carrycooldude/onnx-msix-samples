using Microsoft.ML.OnnxRuntime;
using Microsoft.ML.OnnxRuntime.Tensors;
using System;
using System.Linq;
using System.Windows;

namespace ONNXCSharpApp
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            RunInference();
        }

        private void RunInference()
        {
            var session = new InferenceSession("model.onnx");
            var inputTensor = new DenseTensor<float>(new float[3 * 224 * 224], new[] { 1, 3, 224, 224 });
            var inputs = new[] { NamedOnnxValue.CreateFromTensor("input", inputTensor) };
            using var results = session.Run(inputs);
            var output = results.First().AsEnumerable<float>().ToArray();
            ResultText.Text = $"Prediction: {Array.IndexOf(output, output.Max())}";
        }
    }
}
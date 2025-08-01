const ort = require('onnxruntime-node');

async function runModel() {
  const session = await ort.InferenceSession.create('model.onnx');
  const input = new ort.Tensor('float32', new Float32Array(3 * 224 * 224), [1, 3, 224, 224]);
  const output = await session.run({ input });
  document.getElementById('result').innerText = `Prediction: ${output.output.data.indexOf(Math.max(...output.output.data))}`;
}

window.onload = runModel;
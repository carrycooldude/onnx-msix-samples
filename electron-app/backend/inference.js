
// Electron Backend: ONNX Runtime Node.js Example
const ort = require('onnxruntime-node');
const path = require('path');

async function runInference() {
  const modelPath = path.join(__dirname, '../model.onnx');
  try {
    const session = await ort.InferenceSession.create(modelPath);
    // Prepare dummy input for squeeze.onnx (shape: [1, 3, 224, 224])
    const input = new Float32Array(1 * 3 * 224 * 224).fill(1.0);
    const feeds = {};
    feeds[session.inputNames[0]] = new ort.Tensor('float32', input, [1, 3, 224, 224]);
    const results = await session.run(feeds);
    const outputName = session.outputNames[0];
    console.log('ONNX inference result (first value):', results[outputName].data[0]);
    return results[outputName].data[0];
  } catch (e) {
    console.error('ONNX inference error:', e);
    return null;
  }
}

module.exports = { runInference };

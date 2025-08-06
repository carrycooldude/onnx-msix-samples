# Python Backend: ONNX Runtime + pywinrt Example
import onnxruntime as ort
# import winrt (pywinrt) as needed
import numpy as np
import os

def run_inference():
    model_path = os.path.join(os.path.dirname(__file__), '../model.onnx')
    if not os.path.exists(model_path):
        print(f"Model file not found: {model_path}")
        return
    session = ort.InferenceSession(model_path)
    # Prepare dummy input for squeeze.onnx (shape: [1, 3, 224, 224])
    input_data = np.ones((1, 3, 224, 224), dtype=np.float32)
    input_name = session.get_inputs()[0].name
    result = session.run(None, {input_name: input_data})
    print("ONNX inference result (first value):", result[0].flat[0])
    return result[0].flat[0]

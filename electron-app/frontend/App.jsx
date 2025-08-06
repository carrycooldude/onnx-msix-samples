
// Electron Frontend: React App Demo
import React, { useState } from 'react';

function App() {
  const [result, setResult] = useState('');

  const runInference = async () => {
    // In a real Electron app, use IPC to call backend. For demo, require backend directly (if possible)
    try {
      const backend = window.require ? window.require('../backend/inference.js') : null;
      if (backend && backend.runInference) {
        const value = await backend.runInference();
        setResult('Inference result: ' + value);
      } else {
        setResult('Backend not available in browser preview.');
      }
    } catch (e) {
      setResult('Error: ' + e.message);
    }
  };

  return (
    <div style={{ textAlign: 'center', marginTop: 40 }}>
      <button onClick={runInference}>Run Inference</button>
      <div style={{ marginTop: 20, fontSize: 18 }}>{result}</div>
    </div>
  );
}

export default App;

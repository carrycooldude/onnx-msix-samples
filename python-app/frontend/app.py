
# Python Frontend: Flask App Demo
from flask import Flask, render_template_string, jsonify
import sys
sys.path.append('../backend')
from inference import run_inference

app = Flask(__name__)

HTML = '''
<html><body style="text-align:center;margin-top:40px;">
<button onclick="fetch('/run').then(r=>r.json()).then(d=>document.getElementById('result').innerText=d.result)">Run Inference</button>
<div id="result" style="margin-top:20px;font-size:18px;"></div>
</body></html>
'''

@app.route('/')
def index():
    return render_template_string(HTML)

@app.route('/run')
def run():
    value = run_inference()
    return jsonify(result=f'Inference result: {value}')

if __name__ == '__main__':
    app.run(debug=True)


// C++ WinUI 3 Frontend Entry Point (Demo)
#include <iostream>
extern void run_inference();

int main() {
    std::cout << "Running ONNX inference via backend..." << std::endl;
    run_inference();
    std::cout << "Done." << std::endl;
    return 0;
}

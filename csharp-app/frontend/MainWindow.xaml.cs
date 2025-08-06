using System.Windows;

namespace Frontend
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void RunButton_Click(object sender, RoutedEventArgs e)
        {
            var backend = new Inference();
            backend.RunInference();
            ResultText.Text = "Inference complete. See console for result.";
        }
    }
}

using System.Windows.Input;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Feather_UI
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : INotifyPropertyChanged
    {
        public MainWindow()
        {
            DataContext = this;
            InitializeComponent();
        }

        private string _currentActivityName = "Color";

        public string currentActivityName
        {
            get
            {
                return _currentActivityName;
            }
            set
            {
                if (_currentActivityName != value)
                {
                    currentActivityName = value;
                    onPropertyChanged();
                }
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void onPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        private void windowDrag(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }
    }
}

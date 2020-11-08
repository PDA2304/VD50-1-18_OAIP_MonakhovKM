using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using VD50_1_18_OAIP_MonakhovKM_PR3.Assets;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// Документацию по шаблону элемента "Пустая страница" см. по адресу https://go.microsoft.com/fwlink/?LinkId=234238

namespace VD50_1_18_OAIP_MonakhovKM_PR3
{
    /// <summary>
    /// Пустая страница, которую можно использовать саму по себе или для перехода внутри фрейма.
    /// </summary>
    public sealed partial class PanelFrame : Page
    {
        config Config = new config();
        public PanelFrame()
        {
            this.InitializeComponent();
            // Объявление переменную для хранения инициалов
            //пользователя, обрезание значения «Имя» до одного символа с
            //точкой
            string initials = " " +
            Config.localSettings.Values["first_name"].ToString().Substring(0, 1) + ".";
            // Проверка на пустое значение поля «Отчество». В случае наличия, происходит обрезание значения до одного символа с точкой по аналогии с именем сотрудника
            if (Config.localSettings.Values["mid_name"] != "") initials
            += " " +
            Config.localSettings.Values["mid_name"].ToString().Substring
            (0, 1) + ".";
            // Назначение содержания на элемент
            UserProfileBtn.Content = Config.localSettings.Values["last_name"] + initials;
        }
    }
}
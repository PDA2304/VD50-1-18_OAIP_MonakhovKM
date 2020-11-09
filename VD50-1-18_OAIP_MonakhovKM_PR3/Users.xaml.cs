using Microsoft.Toolkit.Uwp.UI.Controls;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
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
    public sealed partial class Users : Page
    {
        public Users()
        {
            this.InitializeComponent();
        }

        private void CommandBar_Closing(object sender, object e)
        {
            GetList();
        }

        private void AppBarButton_Click(object sender, RoutedEventArgs e)
        {
            throw new NotImplementedException();
        }

        private void GetList()
        {
            Database data_base = new Database();
            // Запрос на выборку из представления
            string sql = "SELECT * FROM `users_list`";
            DataTable data_table = data_base.Select(sql);
            // Очистка столбцов по умолчанию в таблице с данными
            userList.Columns.Clear();
            // Цикл, который на основе выборки добавляет необходимые колонки
            for (int i = 0; i < data_table.Columns.Count; i++)
            {
                userList.Columns.Add(new DataGridTextColumn()
                {
                    // Заголовок задаётся на основе такового в MySQL (AS)
                    Header = data_table.Columns[i].ColumnName,
                    // Преобразование данные
                    Binding = new Binding
                    {
                        Path = new PropertyPath("[" +
                i.ToString() + "]")
                    }
                });
            }
            // Создание коллекции с данными, которые будут принимать в себя
            var collection = new ObservableCollection<object>();
            // Цикл, который добавляет каждую строку выборку в коллекцию
            foreach (DataRow row in data_table.Rows)
            {
                collection.Add(row.ItemArray);
            }
            // Запись значений коллекции в таблицу с данными
            userList.ItemsSource = collection;
        }

    }
}

using Microsoft.Toolkit.Uwp.UI.Controls;
using Renci.SshNet.Messages;
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
using Windows.UI.Popups;
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

        }

        private void AppBarButton_Click(object sender, RoutedEventArgs e)
        {
            GetList();
        }

        private void GetList()
        {
            Database data_base = new Database();
            string sql = "SELECT * FROM `users_list`";
            DataTable data_table = data_base.Select(sql);
            // Запрос на выборку из представления

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
        string index;
        private async void userList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            edit.IsEnabled = true;
            Delete.IsEnabled = true;
            var test1 = userList.SelectedItem as Object[];
            if (test1 != null)
            {
                index = test1[0].ToString();
            }
        }

        private void Grid_LostFocus(object sender, RoutedEventArgs e)
        {
            edit.IsEnabled = false;
            Delete.IsEnabled = false;
            GetList();
        }

        static bool Prov(PasswordBox pas, TextBox Name, TextBox Email, PasswordBox pas1)
        {
            if (pas.Password == "" && pas1.Password == "" && Name.Text == "" && Email.Text == "")
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        //Добавление пользователя
        private async void Add_Click(object sender, RoutedEventArgs e)
        {
            config config = new config();
            StackPanel panel = new StackPanel();
            Database data_base = new Database();
            var collection = new ObservableCollection<object>();
            PasswordBox password = new PasswordBox();
            TextBox Name = new TextBox();
            PasswordBox password1 = new PasswordBox();
            TextBox Email = new TextBox();
            ContentDialog contentDialog = new ContentDialog();


            Name.PlaceholderText = "Имя пользователя";
            Name.HorizontalAlignment = HorizontalAlignment.Stretch;
            Name.SelectionChanged += (send, args) =>
            {
               contentDialog.IsPrimaryButtonEnabled = Prov(password, Name, Email, password1);
            };

            password.PlaceholderText = "Пароль";
            password.HorizontalAlignment = HorizontalAlignment.Stretch;
            password.PasswordChanged += (send, args) =>
            {
                contentDialog.IsPrimaryButtonEnabled = Prov(password, Name, Email, password1);
            };

            password1.PlaceholderText = "подтверждения пароля";
            password1.HorizontalAlignment = HorizontalAlignment.Stretch;
            password1.PasswordChanged += (send, args) =>
            {
                contentDialog.IsPrimaryButtonEnabled = Prov(password, Name, Email, password1);
            };

            Email.PlaceholderText = "Почта";
            Email.HorizontalAlignment = HorizontalAlignment.Stretch;
            Email.SelectionChanged += (send, args) =>
            {
                contentDialog.IsPrimaryButtonEnabled = Prov(password, Name, Email, password1);
            };

            ComboBox sotrudnik = new ComboBox();
            DataTable data_table = data_base.Select("SELECT CONCAT(Imya_sotrydnika,' ',Familiya_sotrydnika,' ',Otchestvo_sotrydnika) FROM `sotrydnik` WHERE 1");
            collection = new ObservableCollection<object>();
            foreach (DataRow row in data_table.Rows)
            {
                collection.Add(row.ItemArray[0]);
            }
            sotrudnik.ItemsSource = collection;


            ComboBox group = new ComboBox();
            data_table = data_base.Select("SELECT group_name FROM `groups` WHERE 1");
            collection = new ObservableCollection<object>();
            foreach (DataRow row in data_table.Rows)
            {
                collection.Add(row.ItemArray[0]);
            }
            group.ItemsSource = collection;


            panel.Children.Add(Name);
            panel.Children.Add(Email);
            panel.Children.Add(password);
            panel.Children.Add(password1);
            panel.Children.Add(sotrudnik);
            panel.Children.Add(group);


            contentDialog.Content = panel;
            contentDialog.CloseButtonText = "Отмена";
            contentDialog.PrimaryButtonText = "Сохранить";
            contentDialog.IsPrimaryButtonEnabled = false;
            contentDialog.PrimaryButtonClick += async (send,arg) =>
            {
                if(password1.Password != password.Password)
                {
                   await config.Alert("Пароль не совподает", "Ошибка");
                }

                if(data_base.Select("SELECT * FROM `users` WHERE users.user_login = '" + Name.Text.Trim() + "'").Rows.Count == 0)
                {
                    await config.Alert("Логин существует", "ошибка");
                }

                string[] FIO_DataBase = sotrudnik.SelectedItem.ToString().Split(' ');
                data_base.Insert("INSERT INTO `users` (`id_user`, `id_group`, `id_employee`, `last_name`, `first_name`, `mid_name`, `user_login`, `user_email`, `user_password`) VALUES(NULL, '" + (group.SelectedIndex + 1) + "', '" + (sotrudnik.SelectedIndex + 1) + "', '" + FIO_DataBase[1] + "', '" + FIO_DataBase[2] + "', '" + FIO_DataBase[2] + "', '" + Name.Text.Trim() + "', '" + Email.Text.Trim() + "', '" + config.Hash(password.Password) + "')");

            };
            await contentDialog.ShowAsync();
        }

        private async void Delete_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new ContentDialog();
            dialog.Title = "Вы действительно хотите удалить этого пользователя?";
            dialog.PrimaryButtonText = "Удалить";
            dialog.PrimaryButtonClick += (a, b) =>
            {
                Database database = new Database();
                string sql = "DELETE FROM `users` WHERE users.id_user = '" + index + "'; UPDATE `tokens` SET `deactivated` = '1' WHERE `tokens`.`id_user` = '" + index + "'";
                database.Select(sql);
                GetList();
            };
            dialog.CloseButtonText = "Отменить";
            await dialog.ShowAsync();
        }

        private async void edit_Click(object sender, RoutedEventArgs e)
        {
            StackPanel panel = new StackPanel();
            PasswordBox password = new PasswordBox();
            password.PlaceholderText = "Пароль";
            password.HorizontalAlignment = HorizontalAlignment.Stretch;

            PasswordBox password1 = new PasswordBox();
            password1.PlaceholderText = "Подтверждения пароля";
            password1.HorizontalAlignment = HorizontalAlignment.Stretch;

            TextBox Email = new TextBox();
            Email.PlaceholderText = "Почта";
            Email.HorizontalAlignment = HorizontalAlignment.Stretch;


            TextBox Name = new TextBox();
            Name.IsEnabled = false;
            Database name = new Database();
            var tablename = name.Select("SELECT user_login FROM `users` WHERE id_user = " + index);
            Name.Text = tablename.Rows[0].ItemArray[0].ToString();
            Name.HorizontalAlignment = HorizontalAlignment.Stretch;

            TextBox date_name = new TextBox();
            date_name.IsEnabled = false;
            Database FIO_DataBase = new Database();
            var tableFIO_DataBase = FIO_DataBase.Select("SELECT CONCAT(last_name,' ',first_name,' ',mid_name) FROM `users` WHERE id_user = " + index);
            date_name.Text = tableFIO_DataBase.Rows[0].ItemArray[0].ToString();
            date_name.HorizontalAlignment = HorizontalAlignment.Stretch;


            ComboBox namegroup = new ComboBox();
            namegroup.Header = "Группа";
            namegroup.SelectedIndex = 0;
            Database goups = new Database();
            var tablegroups = goups.Select("SELECT CONCAT(groups.group_name)  FROM `groups` WHERE 1");
            var collection = new ObservableCollection<object>();
            foreach (DataRow row in tablegroups.Rows)
            {
                collection.Add(row.ItemArray[0]);
            }
            namegroup.ItemsSource = collection;

            panel.Children.Add(password);
            panel.Children.Add(password1);
            panel.Children.Add(Email);
            panel.Children.Add(Name);
            panel.Children.Add(date_name);
            panel.Children.Add(namegroup);

            var dialog = new ContentDialog();
            dialog.Content = panel;
            dialog.PrimaryButtonText = "Изменить";
            dialog.PrimaryButtonClick += async (a, b) =>
            {
                if (password.Password != password1.Password)
                {
                    MessageDialog message = new MessageDialog("Пароли не совпадают");
                    await message.ShowAsync();
                    return;
                }
                if (Email.Text == "")
                {
                    MessageDialog message = new MessageDialog("Поле с почтой пустое");
                    await message.ShowAsync();
                    return;
                }
                Database database = new Database();
                config config = new config();
                string sql = "UPDATE `users` SET id_group = '" + (namegroup.SelectedIndex + 1) + "',`user_email`= '" + Email.Text + "',`user_password`= '" + config.Hash(password.Password) + "' WHERE id_user = " + index;
                database.Select(sql);
                GetList();
            };
            dialog.CloseButtonText = "Отменить";
            await dialog.ShowAsync();
        }
    }
}

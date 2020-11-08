using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VD50_1_18_OAIP_MonakhovKM_PR3.Assets
{
    class Database : config
    {
        // Метод произведения выборки из базы данных (бд), принимающий всебя SQL-запрос
        public DataTable Select(string sql)
        {
            // Открытие подключения к серверу бд
            connection.Open();
            // Отправка SQL-запроса на сервер бд с информацией о подключении
            MySqlCommand command = new MySqlCommand(sql, connection);
            // Выполнение команды на сервере
            MySqlDataReader reader = command.ExecuteReader();
            // Создание таблицы, которая будет принимать в себя полученные данные из выборки
            DataTable dt = new DataTable();
            // Загрузка в таблицу данных из выборки
            dt.Load(reader);
            // Закрытие подключения к серверу бд
            connection.Close();
            // Возвращение таблицы
            return dt;
        }
        public void Insert(string sql)
        {
            connection.Open();
            MySqlCommand command = new MySqlCommand(sql, connection);
            // Выполнение команды на сервере без записи в переменную
            command.ExecuteReader();
            connection.Close();
        }
    }
}
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace End
{
    public partial class Login : System.Web.UI.Page
    {
        public string str = "", password = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string question = "SELECT Password FROM Users WHERE Username=" + "'" + Request.Form["username"] + "'";
                DataTable dt = Helper.ExecuteDataTable("db.mdf", question);
                if (dt.Rows.Count == 0)
                {
                    // No rows, 0 results.
                    str = "Username not found";
                    return;
                }

                password = dt.Rows[0][dt.Columns["Password"]].ToString().Trim();
                string attempt = Request.Form["password"];
                if (attempt.Equals(password))
                {
                    // Correct Username & password
                    Session["Username"] = Request.Form["Username"];
                }
                else
                    str = "Incorrect password";
            }


        }
        public class Helper
        {
            public static SqlConnection ConnectToDb(string fileName)
            {
                string path = HttpContext.Current.Server.MapPath("App_Data/") + fileName;
                string connString = @"Data Source=.\SQLEXPRESS;AttachDbFileName=" + path + ";Integrated Security=True;User Instance=True";
                SqlConnection conn = new SqlConnection(connString);
                return conn;
            }

            public static void DoQuery(string fileName, string sql)
            {
                SqlConnection conn = ConnectToDb(fileName);
                conn.Open();
                SqlCommand com = new SqlCommand(sql, conn);
                com.ExecuteNonQuery();
                conn.Close();
            }


            public static bool IsExist(string fileName, string sql)
            {

                SqlConnection conn = ConnectToDb(fileName);
                conn.Open();
                SqlCommand com = new SqlCommand(sql, conn);
                SqlDataReader data = com.ExecuteReader();

                bool found = Convert.ToBoolean(data.Read());
                conn.Close();
                return found;

            }

            public static DataTable ExecuteDataTable(string fileName, string sql)
            {
                SqlConnection conn = ConnectToDb(fileName);
                conn.Open();

                DataTable dt = new DataTable();

                SqlDataAdapter tableAdapter = new SqlDataAdapter(sql, conn);
                tableAdapter.Fill(dt);
                return dt;
            }

        }
    }
}
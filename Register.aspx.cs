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
    public partial class Register : System.Web.UI.Page
    {
        public string str = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                // Form was submitted successfully
                updateDb();
            }
        }

        private void updateDb()
        {
            string username = "'" + Request.Form["username"] + "'";
            string password = "'" + Request.Form["password"] + "'";
            string firstName = "'" + Request.Form["Firstname"] + "'";
            string lastName = "'" + Request.Form["Lastname"] + "'";
            string email = "'" + Request.Form["Email"] + "'";
            
            int day = int.Parse(Request.Form["Day"]);
            int month = int.Parse(Request.Form["Month"]);
            int year = int.Parse(Request.Form["Year"]);
            
            string prefix = (int.Parse(Request.Form["Prefix"])).ToString();
            string phone = Request.Form["Phone"];
            string gender = "'" + (Request.Form["Gender"].Contains("Male") ? "True" : "False") + "'";
            string basketBall = "'" + Request.Form["Hobbies"].Contains("Basketball").ToString() + "'";
            string footBall = "'" + Request.Form["Hobbies"].Contains("Football").ToString() + "'";
            string dancing = "'" + Request.Form["Hobbies"].Contains("Dancing").ToString() + "'";
            string computers = "'" + Request.Form["Hobbies"].Contains("Computers").ToString() + "'";

            DataTable dt = Helper.ExecuteDataTable("db.mdf", "SELECT * FROM Users WHERE Username = " + username);
            if (dt.Rows.Count > 0)
            {
                // Username is already in the system
                str = "Username already at the server, pick another";
                return;
            }
            // Create a new username
            string question = "INSERT INTO Users (Username, Password, Email, Firstname, Lastname, Prefix, Phone, Day, Month, Year, Gender, Basketball, Football, Dancing, Computers)";
            question += " VALUES(" + username + "," + password + "," + email + ", " + firstName + ", " + lastName + ", " + prefix + ", " + phone + ", " + day + ", " + month + ", " + year + ", " + gender + ", " + basketBall + ", " + footBall + ", " + dancing + ", " + computers + ")";
            dt = Helper.ExecuteDataTable("db.mdf", question);
            if (dt.Rows.Count == 0)
            {
                str = "Register completed successfully";
            }

            updateSession(username.Trim('\''));
        }

        private void updateSession(string username)
        {
            Session["Username"] = username;
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
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
    public partial class Update : System.Web.UI.Page
    {
        public string showForm = "", result =  "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                // There is a username
                createForm();
                if (Request.Form["submit"] != null)
                {
                    updateDb();
                }
            }
            else
            {
                //  There isn't a username
                showForm = "<h1 style='color : Red;'>You have to be logged in to preform this action</h1>";
                showForm += "<br />";
                showForm += "<a href ='Login.aspx' style='color : Black'>Login</a>";
            }
        }

        protected void createForm()
        {
            // Header
            showForm = "<h1 style='color :Red;'>Hello " + Session["Username"] + " !</h1><br />";
            showForm += "<form runat='server' method='post' onsubmit='return testForm()'>";
            
            // Table definition
            showForm += "<table style='border : 1px solid black; font-family : FangSong; text-align : center; color : Navy;'>";
            
            // First row category selection
            showForm += "<tr>";
            showForm += "<th>Change Password:<input type='checkbox' name='Changes' value='Password'/></th>";
            showForm += "<th>Change Email:<input type='checkbox' name='Changes' value='Email'/></th>";
            showForm += "<th>Change Hobbies:<input type='checkbox' name='Changes' value='Hobbies'/></th>";
            showForm += "</tr>";
            showForm += "<tr>";
            
            // Password
            showForm += "<th class='cellStyle'>Enter new password:<br />Password:<input type='text' id='Password' name='Password'/><br/>Confirm:<input type='text' id='confirmPassword'/></th>";
            showForm += "<th class='cellStyle'>Enter new Email address:<br/><input type='text' id='Email' name='Email'/></th>";

            // Hobbies
            showForm += "<th class='cellStyle'>Re-Choose Your Hobbies:<br />";
            showForm += "<input type='checkbox' value='Football' name='Hobbies'/>Football";
            showForm += "<input type='checkbox' value ='Basketball' name='Hobbies'/>Basketball<br />";
            showForm += "<input type='checkbox' value='Dancing' name='Hobbies'/>Dancing";
            showForm += "<input type='checkbox' value='Computers' name='Hobbies'/>Computers</th></tr>";


            showForm += "<tr><th colspan='3'></th></tr>";
            // Second row category selection
            showForm += "<tr>";
            showForm += "<th>Change Phone:<input type='checkbox' name='Changes' value='Phone'/></th>";
            showForm += "<th>Change First Name:<input type='checkbox' name='Changes' value='FirstName'/></th>";
            showForm += "<th>Change Last Name:<input type='checkbox' name='Changes' value='LastName'/></th>";


            showForm += "</tr>";
            // Phone number
            showForm += "<tr>";
            showForm += "<th class='cellStyle'>Enter New Phone number:<br/>";
            showForm += "<select name='Prefix' id='Prefix'>";
            showForm += "<option value='prefix'>Prefix</option>";
            showForm += "<option value='050'>050</option>";
            showForm += "<option value='052'>052</option>";
            showForm += "<option value='053'>053</option>";
            showForm += "<option value='054'>054</option>";
            showForm += "<option value='055'>055</option>";
            showForm += "<option value='058'>058</option>";
            showForm += "</select>";
            showForm += "<input type='text' id='Phone' name='Phone'/></th>";

            // First name
            showForm += "<th class = 'cellStyle'>Enter New First name:<br>";
            showForm += "<input type='text' id='firstName' name='firstName'/></th>";

            // Last name
            showForm += "<th class = 'cellStyle'>Enter New Last name:<br>";
            showForm += "<input type='text' id='lastName' name='lastName'/></th>";
            showForm += "</tr>";
            
           // Third row category selection
            showForm += "<tr>";
            showForm += "<th class='cellStyle'>Change Username:<input type='checkbox' name='Changes' value='UserName'/></th>";
            showForm += "<th class='cellStyle'></th><th class='cellStyle'>Change Birthday:<input type='checkbox' name='Changes' value='Birthday'/></th></tr>";

            // Username
            showForm += "<tr>";
            showForm += "<th class='cellStyle'>Enter new username:<br /><input type='text' name='Username' id='Username'/></th><th class='cellStyle'></th>";
            // Birthday
            showForm += "<th class='cellStyle'>Enter Birthday:<br/>";
            showForm += "<select name='Day' id='Day'>";
            showForm += "<option value='Day'>Day</option>";
            showForm += "<option value='1'>1</option>";
            showForm += "<option value='2'>2</option>";
            showForm += "<option value='3'>3</option>";
            showForm += "<option value='4'>4</option>";
            showForm += "<option value='5'>5</option>";
            showForm += "<option value='6'>6</option>";
            showForm += "<option value='7'>7</option>";
            showForm += "<option value='8'>8</option>";
            showForm += "<option value='9'>9</option>";
            showForm += "<option value='10'>10</option>";
            showForm += "<option value='11'>11</option>";
            showForm += "<option value='12'>12</option>";
            showForm += "<option value='13'>13</option>";
            showForm += "<option value='14'>14</option>";
            showForm += "<option value='15'>15</option>";
            showForm += "<option value='16'>16</option>";
            showForm += "<option value='17'>17</option>";
            showForm += "<option value='18'>18</option>";
            showForm += "<option value='19'>19</option>";
            showForm += "<option value='20'>20</option>";
            showForm += "<option value='21'>21</option>";
            showForm += "<option value='22'>22</option>";
            showForm += "<option value='23'>23</option>";
            showForm += "<option value='24'>24</option>";
            showForm += "<option value='25'>25</option>";
            showForm += "<option value='26'>26</option>";
            showForm += "<option value='27'>27</option>";
            showForm += "<option value='28'>28</option>";
            showForm += "<option value='29'>29</option>";
            showForm += "<option value='30'>30</option>";
            showForm += "<option value='31'>31</option>";
            showForm += "</select>";

            showForm += "<select id='Month' name='Month'>";
            showForm += "<option value='Month'>Month</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option><option value='11'>11</option><option value ='12'>12</option>";
            showForm += "</select>";
            showForm += "<input type='text' width='200' id='Year' name='Year'/></th></tr>";

            showForm += "</table><br />";
            showForm += "<input type='submit' name='submit' id='submit' value='Update details'/>";
            showForm += "</form>";
        }

        protected void updateDb()
        {
            string changes = Request.Form["Changes"];
            string finalQuestion = "UPDATE Users SET ";



            string passwordQuesion = changes.Contains("Password") ? ("Password=" + "'" + Request.Form["Password"].ToString() + "'") : "";
            finalQuestion += passwordQuesion;
            string emailQuestion = changes.Contains("Email") ? ("Email=" + "'" + Request.Form["Email"].ToString() + "'") : "";
            finalQuestion += emailQuestion == "" ? "" : (finalQuestion == "UPDATE Users SET " ? "" : ", ") + emailQuestion;
            
            
            string hobbiesQuestion;

            string basketBall = "", footBall = "", dancing = "", computers = "";
            if(changes.Contains("Hobbies"))
            {
                if (Request.Form["Hobbies"] != null)
                {
                    basketBall = "Basketball=" + "'" + Request.Form["Hobbies"].Contains("Basketball").ToString() + "'";
                    footBall = ", Football=" + "'" + Request.Form["Hobbies"].Contains("Football").ToString() + "'";
                    dancing = ", Dancing=" + "'" + Request.Form["Hobbies"].Contains("Dancing").ToString() + "'";
                    computers = ", Computers=" + "'" + Request.Form["Hobbies"].Contains("Computers").ToString() + "'";
                }
                
            }

            hobbiesQuestion = basketBall + footBall + dancing + computers;
            finalQuestion += hobbiesQuestion == "" ? "" : (finalQuestion == "UPDATE Users SET " ? "" : ", ") + hobbiesQuestion;

            int prefix = 0, phone = 0;
            string prefixStr = "", phoneStr = "";
            string prefixQuestion = "", phoneQuestion = "";
            if (changes.Contains("Phone"))
            {
                prefix = int.Parse(Request.Form["Prefix"].ToString());
                prefixStr = prefix.ToString();
                prefixQuestion = "Prefix =" + prefixStr;


                phone = int.Parse(Request.Form["Phone"].ToString());
                phoneStr = phone.ToString();
                phoneQuestion = "Phone =" + phoneStr;
            }
            finalQuestion += prefixQuestion == "" ? "" : (finalQuestion == "UPDATE Users SET " ? "" : ", ") + prefixQuestion;
            finalQuestion += phoneQuestion == "" ? "" : (finalQuestion == "UPDATE Users SET " ? "" : ", ") + phoneQuestion;

            string firstName = "", firstNameQuestion = "" ;
            if (changes.Contains("FirstName"))
            {
                firstName = Request.Form["firstname"].ToString();
                firstNameQuestion = "Firstname=" + "'" + firstName + "'";
            }
            finalQuestion += firstNameQuestion == "" ? "" : (finalQuestion == "UPDATE Users SET " ? "" : ", ") + firstNameQuestion;

            string lastName = "", lastNameQuestion = "";
            if (changes.Contains("LastName"))
            {
                lastName = Request.Form["lastname"].ToString();
                lastNameQuestion = "Lastname=" + "'" + lastName + "'";
            }
            finalQuestion += lastNameQuestion == "" ? "" : (finalQuestion == "UPDATE Users SET " ? "" : ", ") + lastNameQuestion;

            string username = "", usernameQuestion = "";
            if (changes.Contains("UserName"))
            {
                username = Request.Form["Username"];
                usernameQuestion = "Username=" + "'" + username + "'";
            }

            finalQuestion += usernameQuestion == "" ? "" : (finalQuestion == "UPDATE Users SET " ? "" : ", ") + usernameQuestion;
            
            string dayStr = "", monthStr = "", yearStr = "", birthdayQuestion = "";
            if (changes.Contains("Birthday"))
            {
                dayStr = Request.Form["Day"].ToString();
                monthStr = Request.Form["Month"].ToString();
                yearStr = Request.Form["Year"].ToString();
                birthdayQuestion = "Day=" + dayStr + ", Month=" + monthStr + ", Year=" + yearStr;
            }


            finalQuestion += birthdayQuestion == "" ? "" : (finalQuestion == "UPDATE Users SET " ? "" : ", ") + birthdayQuestion;
            finalQuestion += " WHERE Username=" + "'" + Session["Username"].ToString() + "'";
            DataTable dt;

            bool changeAdmins = false;
            string currentUserName = Session["Username"].ToString();
            dt = Helper.ExecuteDataTable("db.mdf", "SELECT * FROM Admins WHERE Username=" + "'" + currentUserName + "'");
            changeAdmins = dt.Rows.Count > 0; // Test if current user is an admin

            if(changes.Contains("UserName"))
            {
                dt = Helper.ExecuteDataTable("db.mdf", "SELECT * FROM Users WHERE Username= " + "'" + username + "'");
                if(dt.Rows.Count != 0)
                {
                    // Username already exists
                    result = "Username is caught, choose another";
                    return;
                }

                if (changeAdmins)
                {
                    dt = Helper.ExecuteDataTable("db.mdf", "UPDATE Admins SET Username=" + "'" + username + "'" + " WHERE Username=" + "'" + currentUserName + "'");
                    if (dt.Rows.Count != 0)
                    {
                        // Unknown Error
                        result = "Unknown Error";
                        return;
                    }
                }
            }

            dt = Helper.ExecuteDataTable("db.mdf", finalQuestion);

            if (dt.Rows.Count == 0)
            {
                // Change completed successfully
                result = "<h1 style='color : Red'>Update completed</h1>";
                if (changes.Contains("UserName"))
                {
                    // Change session to the new username
                    Session["Username"] = username;
                }
            }

            else
            {
                result = "Unknown Error";
            }
        }
    }
}
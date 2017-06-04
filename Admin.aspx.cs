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
    public partial class Admin : System.Web.UI.Page
    {
        public string result = "", str = "", question = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                // There is a logged-in user
                DataTable dt = Helper.ExecuteDataTable("db.mdf", "SELECT * FROM Admins WHERE Username=" + "'" + Session["Username"] + "'");
                if (dt.Rows.Count > 0)
                {
                    admin();
                }
                else
                {
                    notAdmin();
                }
            }
            else
            {
                notAdmin();
            }

        }

        protected void notAdmin()
        {
            result = "<h1 style='color : Red; font-size : 300%;'>You are not allowed to see this page</h1>";
            result += "<a href='HomePage.aspx'>Return to HomePage</a>";
        }
        protected void admin()
        {
            result = "<h1 style='color : Red; font-size : 200%'>Insert database question:</h1><br />";
            result += "<form runat='server' method='post' onsubmit='return testForm()'>";

            result += "<select name='category1' id='category1' onchange='changeInputMethod(this.id)'>";
            result += "<option>Category</option>";
            result += "<option value='Username'>Username</option>";
            result += "<option value='Password'>Password</option>";
            result += "<option value='Email'>Email</option>";
            result += "<option value='Firstname'>Firstname</option>";
            result += "<option value='Lastname'>Lastname</option>";
            result += "<option value='Prefix'>Prefix</option>";
            result += "<option value='Phone'>Phone</option>";
            result += "<option value='Day'>Day</option>";
            result += "<option value='Month'>Month</option>";
            result += "<option value='Year'>Year</option>";
            result += "<option value='Gender'>Gender</option>";
            result += "<option value='Basketball'>Basketball</option>";
            result += "<option value='Football'>Football</option>";
            result += "<option value='Dancing'>Dancing</option>";
            result += "<option value='Computers'>Computers</option>";
            result += "</select>";

            result += "<input type='text' id='firstCategoryValue' name='firstCategoryValue' />";
            result += "<br />";
            result += "Or<input type ='radio' value='Or' name='condition' checked='checked'/>";
            result += "And<input type='radio' value = 'And' name = 'condition'/>";
            result += "<br />";

            result += "<select name='category2' id='category2' onchange='changeInputMethod(this.id)'>";
            result += "<option>Category</option>";
            result += "<option value='Username'>Username</option>";
            result += "<option value='Password'>Password</option>";
            result += "<option value='Email'>Email</option>";
            result += "<option value='Firstname'>Firstname</option>";
            result += "<option value='Lastname'>Lastname</option>";
            result += "<option value='Prefix'>Prefix</option>";
            result += "<option value='Phone'>Phone</option>";
            result += "<option value='Day'>Day</option>";
            result += "<option value='Month'>Month</option>";
            result += "<option value='Year'>Year</option>";
            result += "<option value='Gender'>Gender</option>";
            result += "<option value='Basketball'>Basketball</option>";
            result += "<option value='Football'>Football</option>";
            result += "<option value='Dancing'>Dancing</option>";
            result += "<option value='Computers'>Computers</option>";
            result += "</select>";

            result += "<input type='text' id='secondCategoryValue' name='secondCategoryValue'/>";
            result += "<br />";

            result += "<br /><input type='submit' name='submit'/>";

            doQuestion();
        }
        protected void doQuestion()
        {
            if (Request.Form["submit"] != null)
            {
                // The admin asked a valid question
                // If the question involves a number - day, month, year, prefix or phone.
                // Or a boolean argument - Gender, Basketball, Football, Dancing or computers. Treat it like a string.

                string condition = Request.Form["condition"]; // No need to put quatation marks around the question;
                
                string firstValue = Request.Form["firstCategoryValue"];
                string secondValue = Request.Form["secondCategoryValue"];
                
                bool changeFirst = true;
                bool changeSecond = true;

                string firstCategory = Request.Form["category1"];
                string secondCategory = Request.Form["category2"];

                string [] integerConditions = {"Day", "Month", "Year", "Prefix", "Phone"};
                for (int i = 0; i < integerConditions.Length; i++)
                {
                    if(firstCategory.Equals(integerConditions[i]))
                    {
                        changeFirst = false;
                        // Dealing with prefix:
                        firstValue = (int.Parse(firstValue)).ToString();
                    }

                    if (secondCategory.Equals(integerConditions[i]))
                    {
                        changeSecond = false;
                        // Dealing with prefix:
                        secondValue = (int.Parse(secondValue)).ToString();
                    }
                }
                
                // Putting quatations if needed
                if (changeFirst)
                    firstValue = "'" + firstValue + "'";
                if (changeSecond)
                    secondValue = "'" + secondValue + "'";

                question = "SELECT * FROM Users WHERE " + firstCategory + "=" + firstValue;
                question += " " + Request.Form["condition"] + " " + secondCategory + "=" + secondValue;
                DataTable dt = Helper.ExecuteDataTable("db.mdf", question);
                str = "<table style = 'border : 1px solid black;'>";
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    str += "<th style = 'color : Yellow; background-color : Green;'><b>" + dt.Columns[i] + "</b></th>";
                }
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    str += "<tr>";
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        str += "<td style='border : 1px double Red;'>" + dt.Rows[i][dt.Columns[j]] + "</td>";
                    }
                    str += "</tr>";
                }
                str += "</table>";
            }
        }
    }
}
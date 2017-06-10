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
    public partial class Home : System.Web.UI.MasterPage
    {
        public string current = "";
        public string adminLink = "";
        public string updateDetails = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            // Testing for a connected user
            if (Session["Username"] != null)
            {
                current = "Hello <b>" +Session["Username"].ToString() + "!</b>";
                DataTable dt = Helper.ExecuteDataTable("db.mdf", "SELECT * FROM Admins WHERE Username=" + "'" + Session["Username"] + "'");
                if (dt.Rows.Count > 0)
                {
                    // User is an admin
                    adminLink = "<a href='Admin.aspx'>Managment Page - Admins Only!</a>";
                }
                else
                {
                    // User is not an admin, do nothing
                    adminLink = "";
                }
                if (dt.Rows.Count == 0)
                    updateDetails = "<a style='color : yellow;' href='Update.aspx'>Update details</a><br />";
                else
                    updateDetails = ""; // Admin doesn't have update details page
            }
            else
            {
                current = "Hello <b>Guest!</b>";
                updateDetails = "";
            }
            
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace End
{
    public partial class Home : System.Web.UI.MasterPage
    {
        public string current = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            // Testing for a connected user
            if (Session["Username"] != null)
            {
                current = "Hello <b>" +Session["Username"].ToString() + "!</b>";
            }
            else
            {
                current = "Hello <b>Guest!</b>";
            }

        }
    }
}
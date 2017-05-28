using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace End
{
    public partial class MultipicationBoard : System.Web.UI.Page
    {
        public string tableStr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                tableStr = "<table class ='MultipicationBoardTable'>"; // Opening tag
                this.initTable(); // Initiate table
                tableStr += "</table>"; // Closing table tag
            }
        }
        protected void initTable()
        {
            int num = int.Parse(Request.Form["num"]);
            for (int i = 1; i <= num; i++)
            {
                tableStr += "<tr class = 'MultipicationBoardRow'>";
                for (int j = 1; j <= num; j++)
                {
                    if ((i * j) % 3 == 0)
                    {
                        if ((i * j) % 5 == 0)
                        {
                            tableStr += "<td class = 'MultipicationBoardCell' style = 'background-color : Green;'>" + i * j + "</td>"; // Devides in 15
                        }
                        else
                            tableStr += "<td class = 'MultipicationBoardCell' style = 'background-color : Yellow;'>" + i * j + "</td>"; // Devides in 3 only
                    }

                    else if ((i * j) % 5 == 0)
                        tableStr += "<td class = 'MultipicationBoardCell' style = 'background-color : Aqua;'>" + i * j + "</td>";// Divides in 5 only
                    else
                        tableStr += "<td class = 'MultipicationBoardCell'>" + i * j + "</td>";
                }
                tableStr += "</tr>";
            }
        }
    }
}
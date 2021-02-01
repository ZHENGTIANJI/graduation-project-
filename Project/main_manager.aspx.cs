using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 首页 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btbookstock_Click(object sender, EventArgs e)
    {
        Response.Redirect("stockmanagement/bookstock.aspx");

    }
}
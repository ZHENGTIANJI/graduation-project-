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
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("stockmanagement/journalstock.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("stockmanagement/datastock.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("stockmanagement/paperstock.aspx");
    }
    protected void delete_Click(object sender, EventArgs e)
    {
        Response.Redirect("delete.aspx");
    }
    protected void statistics_Click(object sender, EventArgs e)
    {
        Response.Redirect("statistics.aspx");
    }
}
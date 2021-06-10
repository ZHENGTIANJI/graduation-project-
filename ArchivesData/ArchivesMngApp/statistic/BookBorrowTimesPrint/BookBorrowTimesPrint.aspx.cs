using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class managers_statistic_BookBorrowTimesPrint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql;
        sql = Session["sqlBBT"].ToString();
        SqlDataSource1.SelectCommand = sql;
    }
}
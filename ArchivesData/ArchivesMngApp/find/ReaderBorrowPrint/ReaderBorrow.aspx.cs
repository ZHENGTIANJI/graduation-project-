using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class managers_find_ReaderBorrow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql;
        if (Session["sqlRB"] != null)
        {
            sql = Session["sqlRB"].ToString();
            SqlDataSource1.SelectCommand = sql;
        }
    }
}
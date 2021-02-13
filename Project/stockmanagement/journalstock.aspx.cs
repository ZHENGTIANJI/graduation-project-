using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class stockmanagement_journalstock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btok_Click(object sender, EventArgs e)
    {

    }
    protected void btclear_Click(object sender, EventArgs e)
    {
        txtname.Text = "";
        txtQR.Text = "";
        txtaddress.Text = "";
        txtpubdt.Text = "";
        txtprice.Text = "";
        txtorgan.Text = "";
        txtstockdt.Text = "";
        txtcn.Text = "";
        txtlocation.Text = "";
        txtformat.Text = "";
        txtnumberofpage.Text = "";
        txtnote.Text = "";
        txtoffname.Text = "";
    }
}
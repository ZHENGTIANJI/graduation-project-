using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void del_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlCommand cmd = cnn.CreateCommand();
        cmd.CommandText = "delete from table paper where QR_code='" +txtQR.Text+ "'";
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
    }
}
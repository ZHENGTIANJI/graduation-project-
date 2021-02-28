using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class 统计分析_bookstatistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet dst1=new DataSet();
        DataSet dst2 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select count(*) as totalnumber from book", cnn);
        adpt.Fill(dst1);
        number.Text = dst1.Tables[0].Rows[0]["totalnumber"].ToString();
        SqlDataAdapter adptn = new SqlDataAdapter("select btname,number from book_type", cnn);
        adptn.Fill(dst2);
        GridView1.DataSource = dst2.Tables[0];
        GridView1.DataBind();
    }
}
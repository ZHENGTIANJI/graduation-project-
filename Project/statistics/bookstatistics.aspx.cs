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
        totalnumber();
        typenumber();
    }
    protected void totalnumber()
    {
        DataSet dst1 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select count(*) as totalnumber from book", cnn);
        adpt.Fill(dst1);
        number.Text = dst1.Tables[0].Rows[0]["totalnumber"].ToString();
    }
    protected void typenumber()
    {
        DataSet dst1 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptn = new SqlDataAdapter("select btname,number from book_type", cnn);
        adptn.Fill(dst1);
        GridView1.DataSource = dst1.Tables[0];
        GridView1.DataBind();
    }
    protected void majornumber()
    {
        DataSet dst1 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptn = new SqlDataAdapter("select mname from major", cnn);
        adptn.Fill(dst1);
        int i;
        for(i=0;i<dst1.Tables[0].Rows.Count;i++){
            DataSet dst = new DataSet();
            SqlDataAdapter adptn = new SqlDataAdapter("select count(major) from major", cnn);
        }
        String name[];
        GridView1.DataSource = dst1.Tables[0];
        GridView1.DataBind();
    }
}
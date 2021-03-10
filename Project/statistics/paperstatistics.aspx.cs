using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class 统计分析_paperstatistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        totalnumber();
        typenumber();
        majornumber();
    }
    protected void totalnumber()
    {
        DataSet dst1 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select count(*) as totalnumber from paper", cnn);
        adpt.Fill(dst1);
        papernumber.Text = dst1.Tables[0].Rows[0]["totalnumber"].ToString();
    }
    protected void typenumber()
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        dst2.Tables.Add(new DataTable());
        dst2.Tables[0].Columns.Add("ptname");
        dst2.Tables[0].Columns.Add("number");
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptn = new SqlDataAdapter("select ptname from paper_type", cnn);
        adptn.Fill(dst1);
        dst2.Clear();
        int i;
        for (i = 0; i < dst1.Tables[0].Rows.Count; i++)
        {
            DataSet dst = new DataSet();
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(ptname) as ptnumber from paper left join paper_type on paper.paper_type_id=paper_type.ptid where ptname='" + dst1.Tables[0].Rows[i]["ptname"].ToString() + "'", cnn);
            adptmn.Fill(dst);

            int a = dst.Tables[0].Rows.Count;
            DataRow row = dst2.Tables[0].NewRow();
            row["ptname"] = dst1.Tables[0].Rows[i]["ptname"].ToString();
            row["number"] = dst.Tables[0].Rows[0]["ptnumber"].ToString();
            dst2.Tables[0].Rows.InsertAt(row, i);
        }
        GridView1.DataSource = dst2.Tables[0];
        GridView1.DataBind();
    }
    protected void majornumber()
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        dst2.Tables.Add(new DataTable());
        dst2.Tables[0].Columns.Add("mname");
        dst2.Tables[0].Columns.Add("number");
        ; SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptn = new SqlDataAdapter("select mname from major", cnn);
        adptn.Fill(dst1);
        dst2.Clear();
        int i;
        for (i = 0; i < dst1.Tables[0].Rows.Count; i++)
        {
            DataSet dst = new DataSet();
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(mname) as mnumber from paper left join major on paper.major_id=major.mid where mname='" + dst1.Tables[0].Rows[i]["mname"].ToString() + "'", cnn);
            adptmn.Fill(dst);

            int a = dst.Tables[0].Rows.Count;
            DataRow row = dst2.Tables[0].NewRow();
            row["mname"] = dst1.Tables[0].Rows[i]["mname"].ToString();
            row["number"] = dst.Tables[0].Rows[0]["mnumber"].ToString();
            dst2.Tables[0].Rows.InsertAt(row, i);
        }
        GridView2.DataSource = dst2.Tables[0];
        GridView2.DataBind();
    }
}
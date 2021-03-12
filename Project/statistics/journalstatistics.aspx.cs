using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class 统计分析_journalstatistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null || (int)Session["uid"] != 0)
        {
            Response.Redirect("../login.aspx");
        }
        totalnumber();
        typenumber();
        majornumber();
        chart();
    }
    protected void totalnumber()
    {
        DataSet dst1 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select count(*) as totalnumber from journal", cnn);
        adpt.Fill(dst1);
        journalnumber.Text = dst1.Tables[0].Rows[0]["totalnumber"].ToString();
    }
    protected void typenumber()
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        dst2.Tables.Add(new DataTable());
        dst2.Tables[0].Columns.Add("jtname");
        dst2.Tables[0].Columns.Add("number");
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptn = new SqlDataAdapter("select jtname from journal_type", cnn);
        adptn.Fill(dst1);
        dst2.Clear();
        int i;
        for (i = 0; i < dst1.Tables[0].Rows.Count; i++)
        {
            DataSet dst = new DataSet();
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(jtname) as jtnumber from journal left join journal_type on journal.journal_type_id=journal_type.jtid where jtname='" + dst1.Tables[0].Rows[i]["jtname"].ToString() + "'", cnn);
            adptmn.Fill(dst);

            int a = dst.Tables[0].Rows.Count;
            DataRow row = dst2.Tables[0].NewRow();
            row["jtname"] = dst1.Tables[0].Rows[i]["jtname"].ToString();
            row["number"] = dst.Tables[0].Rows[0]["jtnumber"].ToString();
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
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(mname) as number from journal left join major on journal.major_id=major.mid where mname='" + dst1.Tables[0].Rows[i]["mname"].ToString() + "'", cnn);
            adptmn.Fill(dst);

            int a = dst.Tables[0].Rows.Count;
            DataRow row = dst2.Tables[0].NewRow();
            row["mname"] = dst1.Tables[0].Rows[i]["mname"].ToString();
            row["number"] = dst.Tables[0].Rows[0]["number"].ToString();
            dst2.Tables[0].Rows.InsertAt(row, i);
        }
        GridView2.DataSource = dst2.Tables[0];
        GridView2.DataBind();
    }
    protected void chart()
    {
        List<int> Hdop = new List<int> { 1, 2, 3, 4, 5, 6, 7 };//x轴
        List<int> Vdop = new List<int> { 1, 2, 3, 4, 5, 6, 7 };//y轴 可以是时间各种
        Chart1.Series[0]["PieLabelStyle"] = "Outside";//将文字移到外侧
        Chart1.Series[0]["PieLineColor"] = "Black";//绘制黑色的连线。
        Chart1.Series[0].Points.DataBindXY(Hdop, Vdop);
    }
}
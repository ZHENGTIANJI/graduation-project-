using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;

public partial class 统计分析_datastatistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_class"] == null || Session["user_class"] == "")
        {
            Response.Redirect("../../login.aspx");
        }
        totalnumber();
        typenumber();
        majornumber();
        yearnumber();
        //user.Text = "当前用户:" + Session["name"].ToString();
    }
    protected void totalnumber()
    {
        DataSet dst1 = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adpt = new SqlDataAdapter("select count(*) as totalnumber from data", cnn);
        adpt.Fill(dst1);
        Label2.Text = dst1.Tables[0].Rows[0]["totalnumber"].ToString();
    }
    protected void typenumber()
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        dst2.Tables.Add(new DataTable());
        dst2.Tables[0].Columns.Add("dtname");
        dst2.Tables[0].Columns.Add("number");
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adptn = new SqlDataAdapter("select dtname from data_type", cnn);
        adptn.Fill(dst1);
        dst2.Clear();
        int i;
        List<String> Hdop = new List<String>();//x轴
        List<int> Vdop = new List<int>();//y轴 可以是时间各种
        for (i = 0; i < dst1.Tables[0].Rows.Count; i++)
        {
            DataSet dst = new DataSet();
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(dtname) as dtnumber from data left join data_type on data.data_type_id=data_type.dtid where dtname='" + dst1.Tables[0].Rows[i]["dtname"].ToString() + "'", cnn);
            adptmn.Fill(dst);

            int a = dst.Tables[0].Rows.Count;
            DataRow row = dst2.Tables[0].NewRow();
            row["dtname"] = dst1.Tables[0].Rows[i]["dtname"].ToString();
            row["number"] = dst.Tables[0].Rows[0]["dtnumber"].ToString();
            Hdop.Add(dst1.Tables[0].Rows[i]["dtname"].ToString());
            Vdop.Add((int)dst.Tables[0].Rows[0]["dtnumber"]);
            dst2.Tables[0].Rows.InsertAt(row, i);
        }
        GridView1.DataSource = dst2.Tables[0];
        GridView1.DataBind();
        Chart1.Series[0]["PieLabelStyle"] = "Outside";//将文字移到外侧
        Chart1.Series[0]["PieLineColor"] = "Black";//绘制黑色的连线。
        Chart1.Series[0].Points.DataBindXY(Hdop, Vdop);
        this.Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
    }
    protected void majornumber()
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        dst2.Tables.Add(new DataTable());
        dst2.Tables[0].Columns.Add("mname");
        dst2.Tables[0].Columns.Add("number");
        ; SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adptn = new SqlDataAdapter("select mname from major", cnn);
        adptn.Fill(dst1);
        dst2.Clear();
        int i;
        List<String> Hdop = new List<String>();//x轴
        List<int> Vdop = new List<int>();//y轴 可以是时间各种
        for (i = 0; i < dst1.Tables[0].Rows.Count; i++)
        {
            DataSet dst = new DataSet();
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(mname) as number from data left join major on data.major_id=major.mid where mname='" + dst1.Tables[0].Rows[i]["mname"].ToString() + "'", cnn);
            adptmn.Fill(dst);

            int a = dst.Tables[0].Rows.Count;
            DataRow row = dst2.Tables[0].NewRow();
            row["mname"] = dst1.Tables[0].Rows[i]["mname"].ToString();
            row["number"] = dst.Tables[0].Rows[0]["number"].ToString();
            Hdop.Add(dst1.Tables[0].Rows[i]["mname"].ToString());
            Vdop.Add((int)dst.Tables[0].Rows[0]["number"]);
            dst2.Tables[0].Rows.InsertAt(row, i);
        }
        GridView2.DataSource = dst2.Tables[0];
        GridView2.DataBind();
        Chart2.Series[0]["PieLabelStyle"] = "Outside";//将文字移到外侧
        Chart2.Series[0]["PieLineColor"] = "Black";//绘制黑色的连线。
        Chart2.Series[0].Points.DataBindXY(Hdop, Vdop);
        this.Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
    }
    protected void yearnumber()
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        dst2.Tables.Add(new DataTable());
        dst2.Tables[0].Columns.Add("year");
        dst2.Tables[0].Columns.Add("s_number");
        ; SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        dst2.Clear();
        int n;
        string dt = DateTime.Now.ToString("yyyy");
        int now = Convert.ToInt32(dt);
        List<String> Hdop = new List<String>();//x轴
        List<int> Vdop = new List<int>();//y轴 可以是时间各种
        for (n = 2000; n < now + 1; n++)
        {
            DataSet dst = new DataSet();
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(*) as s_number from data where stock_dt>='" + n.ToString() + "-1-1' and stock_dt<'" + (n + 1).ToString() + "-1-1'", cnn);
            adptmn.Fill(dst);
            Hdop.Add(n.ToString());
            Vdop.Add((int)dst.Tables[0].Rows[0]["s_number"]);
            int a = dst.Tables[0].Rows.Count;
            DataRow row = dst2.Tables[0].NewRow();
            row["year"] = n.ToString();
            row["s_number"] = dst.Tables[0].Rows[0]["s_number"].ToString() + "册";
            dst2.Tables[0].Rows.InsertAt(row, n - 2000);
        }
        GridView3.DataSource = dst2.Tables[0];
        GridView3.DataBind();
        Chart3.Series[0].Color = Color.Black;
        Chart3.Series[0].MarkerColor = Color.Black;
        Chart3.Series[0].BorderWidth = 1;
        Chart3.Series[0].MarkerBorderWidth = 3;
        Chart3.Series[0].MarkerSize = 6;
        Chart3.Series[0].MarkerStyle = MarkerStyle.Circle;
        Chart3.ChartAreas[0].AxisX.Title = "年份(年)";
        Chart3.ChartAreas[0].AxisY.Title = "数目(册)";
        Chart3.Series[0]["PieLabelStyle"] = "Outside";//将文字移到外侧
        Chart3.Series[0]["PieLineColor"] = "Black";//绘制黑色的连线。
        Chart3.Series[0].Points.DataBindXY(Hdop, Vdop);
    }
    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("../login1.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;


public partial class 统计分析_bookstatistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null || (int)Session["uid"] != 0)
        {
            Response.Redirect("../login1.aspx");
        }
        totalnumber();
        typenumber();
        majornumber();
        
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
        DataSet dst2 = new DataSet();
        dst2.Tables.Add(new DataTable());
        dst2.Tables[0].Columns.Add("btname");
        dst2.Tables[0].Columns.Add("number");
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptn = new SqlDataAdapter("select btname from book_type", cnn);
        adptn.Fill(dst1);
        dst2.Clear();
        int i;
        List<String> Hdop = new List<String>();//x轴
        List<int> Vdop = new List<int>();//y轴 可以是时间各种
        for (i = 0; i < dst1.Tables[0].Rows.Count; i++)
        {
            DataSet dst = new DataSet();
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(btname) as btnumber from book left join book_type on book.book_type_id=book_type.btid where btname='" + dst1.Tables[0].Rows[i]["btname"].ToString() + "'", cnn);
            adptmn.Fill(dst);

            int a = dst.Tables[0].Rows.Count;
            DataRow row = dst2.Tables[0].NewRow();
            row["btname"] = dst1.Tables[0].Rows[i]["btname"].ToString();
            row["number"] = dst.Tables[0].Rows[0]["btnumber"].ToString();
            Hdop.Add(dst1.Tables[0].Rows[i]["btname"].ToString()); 
            Vdop.Add((int)dst.Tables[0].Rows[0]["btnumber"]);
            dst2.Tables[0].Rows.InsertAt(row, i);
        }
        GridView1.DataSource = dst2.Tables[0];
        GridView1.DataBind();
        Chart1.Series[0]["PieLabelStyle"] = "Outside";//将文字移到外侧
        Chart1.Series[0]["PieLineColor"] = "Black";//绘制黑色的连线。
        Chart1.Series[0].Points.DataBindXY(Hdop, Vdop);
    }
    protected void majornumber()
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        dst2.Tables.Add(new DataTable());
        dst2.Tables[0].Columns.Add("mname");
        dst2.Tables[0].Columns.Add("mnumber");
;       SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptn = new SqlDataAdapter("select mname from major", cnn);
        adptn.Fill(dst1);
        dst2.Clear();
        int i;
        List<String> Hdop = new List<String>();//x轴
        List<int> Vdop = new List<int>();//y轴 可以是时间各种
        for(i=0;i<dst1.Tables[0].Rows.Count;i++){
            DataSet dst = new DataSet();
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(mname) as mnumber from book left join major on book.major_type_id=major.mid where mname='" + dst1.Tables[0].Rows[i]["mname"].ToString() + "'", cnn);
            adptmn.Fill(dst);
            Hdop.Add(dst1.Tables[0].Rows[i]["mname"].ToString());
            Vdop.Add((int)dst.Tables[0].Rows[0]["mnumber"]);
            int a=dst.Tables[0].Rows.Count;
            DataRow row = dst2.Tables[0].NewRow();
            row["mname"] = dst1.Tables[0].Rows[i]["mname"].ToString();
            row["mnumber"] = dst.Tables[0].Rows[0]["mnumber"].ToString();
            dst2.Tables[0].Rows.InsertAt(row,i);
        }
        GridView2.DataSource = dst2.Tables[0];
        GridView2.DataBind();
        Chart2.Series[0]["PieLabelStyle"] = "Outside";//将文字移到外侧
        Chart2.Series[0]["PieLineColor"] = "Black";//绘制黑色的连线。
        Chart2.Series[0].Points.DataBindXY(Hdop, Vdop);
    }
}
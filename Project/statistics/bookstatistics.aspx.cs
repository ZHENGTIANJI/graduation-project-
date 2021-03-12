﻿using System;
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
        for (i = 0; i < dst1.Tables[0].Rows.Count; i++)
        {
            DataSet dst = new DataSet();
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(btname) as btnumber from book left join book_type on book.book_type_id=book_type.btid where btname='" + dst1.Tables[0].Rows[i]["btname"].ToString() + "'", cnn);
            adptmn.Fill(dst);

            int a = dst.Tables[0].Rows.Count;
            DataRow row = dst2.Tables[0].NewRow();
            row["btname"] = dst1.Tables[0].Rows[i]["btname"].ToString();
            row["number"] = dst.Tables[0].Rows[0]["btnumber"].ToString();
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
        dst2.Tables[0].Columns.Add("mnumber");
;       SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptn = new SqlDataAdapter("select mname from major", cnn);
        adptn.Fill(dst1);
        dst2.Clear();
        int i;
        for(i=0;i<dst1.Tables[0].Rows.Count;i++){
            DataSet dst = new DataSet();
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(mname) as mnumber from book left join major on book.major_type_id=major.mid where mname='" + dst1.Tables[0].Rows[i]["mname"].ToString() + "'", cnn);
            adptmn.Fill(dst);

            int a=dst.Tables[0].Rows.Count;
            DataRow row = dst2.Tables[0].NewRow();
            row["mname"] = dst1.Tables[0].Rows[i]["mname"].ToString();
            row["mnumber"] = dst.Tables[0].Rows[0]["mnumber"].ToString();
            dst2.Tables[0].Rows.InsertAt(row,i);
        }
        GridView2.DataSource = dst2.Tables[0];
        GridView2.DataBind();
    }
    protected void chart()
    {
        Chart1.Series.Clear();
        Series s1 = new Series();
        s1.Name = "序列名";
        Chart1.Series.Add(s1);
        List<int> Hdop = new List<int> { 1, 2, 3, 4, 5, 6, 7 };//x轴
        List<int> Vdop = new List<int> { 1, 2, 3, 4, 5, 6, 7 };//y轴 可以是时间各种
        Chart1.Series["序列名"].Points.DataBindXY(Hdop, Vdop);
    }
}
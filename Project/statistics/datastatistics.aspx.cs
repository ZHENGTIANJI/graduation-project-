﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class 统计分析_datastatistics : System.Web.UI.Page
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
    }
    protected void totalnumber()
    {
        DataSet dst1 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select count(*) as totalnumber from data", cnn);
        adpt.Fill(dst1);
        datanumber.Text = dst1.Tables[0].Rows[0]["totalnumber"].ToString();
    }
    protected void typenumber()
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        dst2.Tables.Add(new DataTable());
        dst2.Tables[0].Columns.Add("dtname");
        dst2.Tables[0].Columns.Add("number");
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptn = new SqlDataAdapter("select dtname from data_type", cnn);
        adptn.Fill(dst1);
        dst2.Clear();
        int i;
        for (i = 0; i < dst1.Tables[0].Rows.Count; i++)
        {
            DataSet dst = new DataSet();
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(dtname) as dtnumber from data left join data_type on data.data_type_id=data_type.dtid where dtname='" + dst1.Tables[0].Rows[i]["dtname"].ToString() + "'", cnn);
            adptmn.Fill(dst);

            int a = dst.Tables[0].Rows.Count;
            DataRow row = dst2.Tables[0].NewRow();
            row["dtname"] = dst1.Tables[0].Rows[i]["dtname"].ToString();
            row["number"] = dst.Tables[0].Rows[0]["dtnumber"].ToString();
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
            SqlDataAdapter adptmn = new SqlDataAdapter("select count(mname) as number from data left join major on data.major_id=major.mid where mname='" + dst1.Tables[0].Rows[i]["mname"].ToString() + "'", cnn);
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
}
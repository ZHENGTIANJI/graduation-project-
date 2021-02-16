﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class QueryAndModify_paperQueryAndModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    void ExecuteQuery()
    {
        String strmajor = majortype.SelectedItem.Text.ToString();
        String strpapertype = papertype.SelectedItem.Text.ToString();
        String strpapername = papername.Text.ToString().Trim();

        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [dabian_dt], [xuezhi], [format],[write_dt],[zhicheng],[adviser], [location], [stock_dt], [number], [name], [ptname], [mname], [QR_code], [class_number],[shenhe],[direction], [author], [status], [note], [lname] FROM [paper] left join paper_type on paper.paper_type_id=paper_type.ptid left join major on paper.major_id=major.mid left join language on data.language=language.lid where name like '%" + strpapername + "%' and mname like '%" + strmajor + "%' and ptname like '%" + strpapertype + "%'", cnn);
        adpt.Fill(dst);
        GridView1.DataSource = dst.Tables[0];
        GridView1.DataBind();
    }
    protected void query_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }
    protected void btok_Click(object sender, EventArgs e)
    {

    }
}
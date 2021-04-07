﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class stockmanagement_datastock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["class"] == null || (int)Session["class"] != 0)
        {
            Response.Redirect("../login1.aspx");
        }
        user.Text = "当前用户:" + Session["name"].ToString();
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        DataSet dst5 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptbt = new SqlDataAdapter("select dtid from data_type where dtname='" + dt.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptnum = new SqlDataAdapter("select number from data where name='" + txtname.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptbt.Fill(dst1);
        adptmajor.Fill(dst2);

        adptlanguage.Fill(dst4);
        adptnum.Fill(dst5);
        int dtid = (int)dst1.Tables[0].Rows[0]["dtid"];
        String majorid = dst2.Tables[0].Rows[0]["mid"].ToString();
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        int num;
        if (dst5.Tables[0].Rows.Count > 0)
        {
            num = (int)dst5.Tables[0].Rows[0]["number"] + 1;
            cmd.CommandText = "update data set number='" + num + "' where name='" + txtname.Text + "'";
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }
        else
        {
            num = 1;
        }
        if (txtname.Text == "" || txtQR.Text == "" )
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('资料名称和二维码编码不能为空！');", true);
        }
        else
        {
            String stockdt = DateTime.Now.ToString("yyyy-MM-dd");
            cmd.CommandText = "INSERT INTO data(name, data_type_id, major_id, QR_code, unit, compile_dt, author, stock_dt, location, class_number, status, number, format, number_of_page,language,note) VALUES ('" + txtname.Text + "'," + dtid + "," + majorid + ",'" + txtQR.Text + "','" + txtunit.Text + "','" + write_year.Text+"-"+write_month.Text+"-"+write_day.Text + "','" + txtauthor.Text + "','" + stockdt + "','" + txtlocation.Text + "','" + txtcn.Text + "','库存'," + num + ",'" + txtformat.Text + "','" + txtnumberofpage.Text + "'," + lid + ",'" + txtnote.Text + "')";
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('保存成功！');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('请输入正确的日期格式或页数！');", true);
            }
            
        }
        
    }
    protected void btclear_Click(object sender, EventArgs e)
    {
        txtname.Text = "";
        txtQR.Text = "";
        txtunit.Text = "";
        write_year.Text = "";
        write_month.Text = "";
        write_day.Text = "";
        txtauthor.Text = "";
        txtlocation.Text = "";
        txtcn.Text = "";
        txtformat.Text = "";
        txtnumberofpage.Text = "";
        txtnote.Text = "";
    }
}
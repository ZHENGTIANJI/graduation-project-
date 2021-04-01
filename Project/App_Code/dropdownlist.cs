using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Class1 的摘要说明
/// </summary>
public class dropdownlist : System.Web.UI.Page
{
    public dropdownlist()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public void setmajordropdownlist(DropDownList dp)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select mname from major",cnn);
        ListItem mt = new ListItem();
        mt.Value = "全部";
        mt.Text = "全部";
        dp.Items.Add(mt);
        adpt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            ListItem mt1 = new ListItem();
            mt1.Value = dst.Tables[0].Rows[i][0].ToString();
            mt1.Text = dst.Tables[0].Rows[i][0].ToString();
            dp.Items.Add(mt1);
        }
    }
    public void setbooktypedropdownlist(DropDownList dp)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select btname from book_type", cnn);
        ListItem mt = new ListItem();
        mt.Value = "全部";
        mt.Text = "全部";
        dp.Items.Add(mt);
        adpt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            ListItem mt1 = new ListItem();
            mt1.Value = dst.Tables[0].Rows[i][0].ToString();
            mt1.Text = dst.Tables[0].Rows[i][0].ToString();
            dp.Items.Add(mt1);
        }
    }
    public void setdatatypedropdownlist(DropDownList dp)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select dtname from data_type", cnn);
        ListItem mt = new ListItem();
        mt.Value = "全部";
        mt.Text = "全部";
        dp.Items.Add(mt);
        adpt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            ListItem mt1 = new ListItem();
            mt1.Value = dst.Tables[0].Rows[i][0].ToString();
            mt1.Text = dst.Tables[0].Rows[i][0].ToString();
            dp.Items.Add(mt1);
        }
    }
    public void setjournaltypedropdownlist(DropDownList dp)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select jtname from journal_type", cnn);
        ListItem mt = new ListItem();
        mt.Value = "全部";
        mt.Text = "全部";
        dp.Items.Add(mt);
        adpt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            ListItem mt1 = new ListItem();
            mt1.Value = dst.Tables[0].Rows[i][0].ToString();
            mt1.Text = dst.Tables[0].Rows[i][0].ToString();
            dp.Items.Add(mt1);
        }
    }
    public void setpapertypedropdownlist(DropDownList dp)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select ptname from paper_type", cnn);
        ListItem mt = new ListItem();
        mt.Value = "全部";
        mt.Text = "全部";
        dp.Items.Add(mt);
        adpt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            ListItem mt1 = new ListItem();
            mt1.Value = dst.Tables[0].Rows[i][0].ToString();
            mt1.Text = dst.Tables[0].Rows[i][0].ToString();
            dp.Items.Add(mt1);
        }
    }
}
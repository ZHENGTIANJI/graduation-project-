using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class delete_datadelete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["class"] == null || (int)Session["class"] != 0)
        {
            Response.Redirect("../login1.aspx");
        }
        user.Text = "当前用户:" + Session["name"].ToString();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        ExecuteQuery();
        ExecuteQuery2();
        
    }
    void ExecuteQuery()
    {   
        if(TextBox1.Text.ToString()!=""){
            DataSet dst = new DataSet();
            SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [compile_dt], [unit], [format], [location], [stock_dt], [number], [name], [dtname], [mname], [QR_code], [class_number], [author], [status], [note], [lname] FROM [data] left join data_type on data.data_type_id=data_type.dtid left join major on data.major_id=major.mid left join language on data.language=language.lid where is_delete=0 and name like '%"+TextBox1.Text.ToString()+"%'", cnn);
            adpt.Fill(dst);
            if (dst.Tables[0].Rows.Count == 0)
            {
                DataRow row = dst.Tables[0].NewRow();
                for (int j = 0; j < GridView1.Columns.Count - 1; j++)
                {
                    row[j] = DBNull.Value;
                }
                dst.Tables[0].Rows.Add(row);
            }
            GridView1.DataSource = dst.Tables[0];
            GridView1.DataBind();
        }
        else if (day.Text == "" || month.Text == "" || year.Text == "")
        {
            // ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('日期不得为空！');", true);
            DataSet dst = new DataSet();
            SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [compile_dt], [unit], [format], [location], [stock_dt], [number], [name], [dtname], [mname], [QR_code], [class_number], [author], [status], [note], [lname] FROM [data] left join data_type on data.data_type_id=data_type.dtid left join major on data.major_id=major.mid left join language on data.language=language.lid where is_delete=0", cnn);
            adpt.Fill(dst);
            if (dst.Tables[0].Rows.Count == 0)
            {
                DataRow row = dst.Tables[0].NewRow();
                for (int j = 0; j < GridView1.Columns.Count - 1; j++)
                {
                    row[j] = DBNull.Value;
                }
                dst.Tables[0].Rows.Add(row);
            }
            GridView1.DataSource = dst.Tables[0];
            GridView1.DataBind();
        }
        else
        {
            String strday = day.Text.ToString();
            String strmonth = month.Text.ToString();
            String stryear = year.Text.ToString();
            String date = stryear + "-" + strmonth + "-" + strday;
            try
            {
                DataSet dst = new DataSet();
                SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
                SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [compile_dt], [unit], [format], [location], [stock_dt], [number], [name], [dtname], [mname], [QR_code], [class_number], [author], [status], [note], [lname] FROM [data] left join data_type on data.data_type_id=data_type.dtid left join major on data.major_id=major.mid left join language on data.language=language.lid where stock_dt<'" + date + "' and is_delete=0", cnn);
                adpt.Fill(dst);
                if (dst.Tables[0].Rows.Count == 0)
                {
                    DataRow row = dst.Tables[0].NewRow();
                    for (int j = 0; j < GridView1.Columns.Count - 1; j++)
                    {
                        row[j] = DBNull.Value;
                    }
                    dst.Tables[0].Rows.Add(row);
                }
                GridView1.DataSource = dst.Tables[0];
                GridView1.DataBind();
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert(请填写正确的日期格式！');", true);
            }
           
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (GridView1.Rows[0].Cells[0].Text.ToString() != GridView1.Rows[0].Cells[2].Text.ToString() && GridView1.Rows[0].Cells[2].Text.ToString() != GridView1.Rows[0].Cells[1].Text.ToString())
        {
            SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
            SqlCommand cmd = cnn.CreateCommand();
            int num = e.RowIndex;
            int dataid = Convert.ToInt32(GridView1.Rows[num].Cells[16].Text.ToString());
            try
            {
                cmd.CommandText = "update data set is_delete='" + 1 + "' where id=" + dataid + "";
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                ExecuteQuery();
                ExecuteQuery2();
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('剔旧失败！');", true);
            }
        }
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (GridView1.Rows[0].Cells[0].Text.ToString() != GridView1.Rows[0].Cells[1].Text.ToString() && GridView1.Rows[0].Cells[2].Text.ToString() != GridView1.Rows[0].Cells[1].Text.ToString())
        {
            SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
            SqlCommand cmd = cnn.CreateCommand();
            int num = e.RowIndex;
            int dataid = Convert.ToInt32(GridView2.Rows[num].Cells[16].Text.ToString());
            try
            {
                cmd.CommandText = "update data set is_delete='" + 0 + "' where id=" + dataid + "";
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                ExecuteQuery();
                ExecuteQuery2();
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('还原失败！');", true);
            }
        }
    }
    protected void GridViewHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        ExecuteQuery();
    }
    protected void Button_search_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }
    protected void lb_firstpage_Click(object sender, EventArgs e)
    {
        this.GridView1.PageIndex = 0;
        ExecuteQuery();
    }
    protected void lb_previouspage_Click(object sender, EventArgs e)
    {
        if (this.GridView1.PageIndex > 0)
        {
            this.GridView1.PageIndex--;
            ExecuteQuery();
        }
    }
    protected void lb_nextpage_Click(object sender, EventArgs e)
    {
        if (this.GridView1.PageIndex < this.GridView1.PageCount)
        {
            this.GridView1.PageIndex++;
            ExecuteQuery();
        }
    }
    protected void lb_lastpage_Click(object sender, EventArgs e)
    {
        this.GridView1.PageIndex = this.GridView1.PageCount;
        ExecuteQuery();
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }
    /////
    void ExecuteQuery2()
    {
        DataSet dst1 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt1 = new SqlDataAdapter("SELECT [id],[number_of_page], [compile_dt], [unit], [format], [location], [stock_dt], [number], [name], [dtname], [mname], [QR_code], [class_number], [author], [status], [note], [lname] FROM [data] left join data_type on data.data_type_id=data_type.dtid left join major on data.major_id=major.mid left join language on data.language=language.lid where is_delete=1 and name like '%"+TextBox2.Text.ToString()+"%'", cnn);
        adpt1.Fill(dst1);
        if (dst1.Tables[0].Rows.Count == 0)
        {
            DataRow row = dst1.Tables[0].NewRow();
            for (int j = 0; j < GridView1.Columns.Count - 1; j++)
            {
                row[j] = DBNull.Value;
            }
            dst1.Tables[0].Rows.Add(row);
        }
        GridView2.DataSource = dst1.Tables[0];
        GridView2.DataBind();
    }
    protected void GridViewHistory_PageIndexChanging2(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        ExecuteQuery2();
    }
    protected void Button_search_Click2(object sender, EventArgs e)
    {
        ExecuteQuery2();
    }
    protected void lb_firstpage_Click2(object sender, EventArgs e)
    {
        this.GridView2.PageIndex = 0;
        ExecuteQuery2();
    }
    protected void lb_previouspage_Click2(object sender, EventArgs e)
    {
        if (this.GridView2.PageIndex > 0)
        {
            this.GridView2.PageIndex--;
            ExecuteQuery2();
        }
    }
    protected void lb_nextpage_Click2(object sender, EventArgs e)
    {
        if (this.GridView2.PageIndex < this.GridView2.PageCount)
        {
            this.GridView2.PageIndex++;
            ExecuteQuery2();
        }
    }
    protected void lb_lastpage_Click2(object sender, EventArgs e)
    {
        this.GridView2.PageIndex = this.GridView2.PageCount;
        ExecuteQuery2();
    }
    protected void btok2_Click(object sender, EventArgs e)
    {
        ExecuteQuery2();
    }
    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("../login1.aspx");
    }
}
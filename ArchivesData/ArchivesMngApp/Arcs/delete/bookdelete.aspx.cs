using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class delete_bookdelete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_class"] == null || Session["user_class"] == "")
        {
            Response.Redirect("../../login.aspx");
        }
        GridView1.RowStyle.Wrap = false;
        GridView2.RowStyle.Wrap = false;
        //user.Text = "当前用户:" + Session["name"].ToString();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        ExecuteQuery();
        ExecuteQuery2();
        
    }
    void ExecuteQuery()
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        if(TextBox1.Text.ToString()!=""){
            DataSet dst = new DataSet();
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [book_number], [CD], [format], [location], [stock_dt], [teacher], [number], [name], [btname], [mname], [QR_code], [publisher], [publish_dt], [author], [price], [status], [note], [lname], [bitname] FROM [book] left join book_type on book.book_type_id=book_type.btid left join major on book.major_type_id=major.mid left join language on book.language=language.lid left join binding_type on book.binding_type_id=binding_type.bitid where is_delete=0 and name like '%"+TextBox1.Text.ToString()+"%'", cnn);
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
            
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [book_number], [CD], [format], [location], [stock_dt], [teacher], [number], [name], [btname], [mname], [QR_code], [publisher], [publish_dt], [author], [price], [status], [note], [lname], [bitname] FROM [book] left join book_type on book.book_type_id=book_type.btid left join major on book.major_type_id=major.mid left join language on book.language=language.lid left join binding_type on book.binding_type_id=binding_type.bitid where is_delete=0", cnn);
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
                SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [book_number], [CD], [format], [location], [stock_dt], [teacher], [number], [name], [btname], [mname], [QR_code], [publisher], [publish_dt], [author], [price], [status], [note], [lname], [bitname] FROM [book] left join book_type on book.book_type_id=book_type.btid left join major on book.major_type_id=major.mid left join language on book.language=language.lid left join binding_type on book.binding_type_id=binding_type.bitid where stock_dt<='" + date + "'", cnn);
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
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('请输入正确的日期格式！');", true);
            }
            
        }
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (GridView2.Rows[0].Cells[0].Text.ToString() != GridView2.Rows[0].Cells[1].Text.ToString() && GridView2.Rows[0].Cells[1].Text.ToString() != GridView2.Rows[0].Cells[2].Text.ToString())
        {
            SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
            SqlCommand cmd = cnn.CreateCommand();

            int num = e.RowIndex;
            int bookid = Convert.ToInt32(GridView2.Rows[num].Cells[20].Text.ToString());
            try
            {
                cmd.CommandText = "update book set is_delete='" + 0 + "' where id=" + bookid + "";
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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (GridView1.Rows[0].Cells[0].Text.ToString() != GridView1.Rows[0].Cells[1].Text.ToString() && GridView1.Rows[0].Cells[1].Text.ToString() != GridView1.Rows[0].Cells[2].Text.ToString())
        {
            SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
            SqlCommand cmd = cnn.CreateCommand();

            int num = e.RowIndex;
            int bookid = Convert.ToInt32(GridView1.Rows[num].Cells[20].Text.ToString());
            try
            {
                cmd.CommandText = "update book set is_delete='" + 1 + "' where id=" + bookid + "";
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
    //////////////
    void ExecuteQuery2()
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        DataSet dst1 = new DataSet();
        SqlDataAdapter adpt1 = new SqlDataAdapter("SELECT [id],[number_of_page], [book_number], [CD], [format], [location], [stock_dt], [teacher], [number], [name], [btname], [mname], [QR_code], [publisher], [publish_dt], [author], [price], [status], [note], [lname], [bitname] FROM [book] left join book_type on book.book_type_id=book_type.btid left join major on book.major_type_id=major.mid left join language on book.language=language.lid left join binding_type on book.binding_type_id=binding_type.bitid where is_delete=1 and name like '%"+TextBox2.Text.ToString()+"%'", cnn);
        adpt1.Fill(dst1);
        if (dst1.Tables[0].Rows.Count == 0)
        {
            DataRow row = dst1.Tables[0].NewRow();
            for (int j = 0; j < GridView2.Columns.Count - 1; j++)
            {
                row[j] = DBNull.Value;
            }
            dst1.Tables[0].Rows.Add(row);
        }
        GridView2.DataSource = dst1.Tables[0];
        GridView2.DataBind(); ;
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class managers_borrow_reserve : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        Refresh(); //reserve表过期信息的状态标记为2
        string books = "select QR_code,name from book union select QR_code,name from journal union select QR_code,name from paper union select QR_code,name from data";
        string sql = "select reserve.id,no,users.name,borrow_type.name,reserve.QR_code,books.name,reserve_time,deadline,case status when 0 then '未借出' when 1 then '已借出' when 2 then '过期' end status from reserve left join users on users.id=no left join borrow_type on borrow_type.id=reserve_type_id left join ("+books+") books on books.QR_code=reserve.QR_code order by status desc,reserve_time desc";
        SqlDataSource1.SelectCommand = sql;
        if (!IsPostBack)
            Session["sqlRE"] = SqlDataSource1.SelectCommand;
        
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int id = GridView1.PageIndex*GridView1.PageSize+e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = id.ToString();
        }
        if(e.Row.RowType==DataControlRowType.DataRow)
        {
            switch (e.Row.Cells[8].Text)
            {
                case "未借出": e.Row.ForeColor = System.Drawing.Color.Blue;
                    break;
                case "已借出": e.Row.ForeColor = System.Drawing.Color.Black;
                    break;
                case "过期":break;
            }
        }
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        string books = "select QR_code,name from book union select QR_code,name from journal union select QR_code,name from paper union select QR_code,name from data";
        string sql = "select reserve.id,no,users.name,borrow_type.name,reserve.QR_code,books.name,reserve_time,deadline,case status when 0 then '未借出' when 1 then '已借出' when 2 then '过期' end status from reserve left join users on users.id=no left join borrow_type on borrow_type.id=reserve_type_id left join (" + books + ") books on books.QR_code=reserve.QR_code where ";
        string cond = "";

        if(rbn.Checked)
        {
            cond = " users.name ";
        }
        else if(rbno.Checked)
        {
            cond = " no ";
        }
        else
        {
            cond = " reserve.QR_code ";
        }

        sql = sql + cond + " like '%" + txtcond.Text.Trim() + "%' order by status desc,reserve_time desc";
        SqlDataSource1.SelectCommand = sql;
        Session["sqlRE"] = SqlDataSource1.SelectCommand;
    }
    protected void btovertime_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cnn.Open();

        string sql = "delete reserve where deadline<GETDATE()";
        cmd.CommandText = sql;
        cmd.ExecuteNonQuery();

        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除成功！');", true);
        GridView1.DataBind();
    }


    protected void btstatus_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cnn.Open();

        string sql = "delete reserve where status=1";
        cmd.CommandText = sql;
        cmd.ExecuteNonQuery();

        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除成功！');", true);
        GridView1.DataBind();
    }
    protected void btprint_Click(object sender, EventArgs e)
    {
        //Session["sqlRE"] = SqlDataSource1.SelectCommand;
        Response.Redirect("reservePrint/reservePrint.aspx");
    }
    protected void dpselect_SelectedIndexChanged(object sender, EventArgs e)
    {
        string books = "select QR_code,name from book union select QR_code,name from journal union select QR_code,name from paper union select QR_code,name from data";
        string sql = "select reserve.id,no,users.name,borrow_type.name,reserve.QR_code,books.name,reserve_time,deadline,case status when 0 then '未借出' when 1 then '已借出' when 2 then '过期' end status from reserve left join users on users.id=no left join borrow_type on borrow_type.id=reserve_type_id left join (" + books + ") books on books.QR_code=reserve.QR_code ";
        sql += " where 1=1";
        if(dpselect.SelectedItem.Value=="1")//筛选已处理预约信息
        {
            sql += " and status=1";
        }
        if (dpselect.SelectedItem.Value == "2")//筛选过期预约信息
        {
            sql += " and status=2";
        }
        if (dpselect.SelectedItem.Value == "3")//筛选未处理预约信息
        {
            sql += " and status=0";
        }
        SqlDataSource1.SelectCommand = sql+" order by reserve_time desc";
        Session["sqlRE"] = SqlDataSource1.SelectCommand;
    }

    //reserve表过期信息的状态标记为2
    private void Refresh()
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        cnn.Open();
        SqlCommand cmd = new SqlCommand("update reserve set status=2 where GETDATE()>deadline", cnn);
        cmd.ExecuteNonQuery();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}
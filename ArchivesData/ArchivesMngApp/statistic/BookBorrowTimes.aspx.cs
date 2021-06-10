using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class managers_statistic_BookBorrowTimes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql2 = "select borrow_type.name,COUNT(*) num from borrow left join borrow_type on borrow_type.id=borrow_type_id group by borrow_type.name order by num desc";
        SqlDataSource2.SelectCommand = sql2;
        if (!IsPostBack)
        {
            txts.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txte.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txts1.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txte1.Text = DateTime.Now.ToString("yyyy-MM-dd");
            string sql = "select borrow.QR_code,name,COUNT(*) num from borrow left join (select QR_code,name from book union select QR_code,name from paper union select QR_code,name from journal union select QR_code,name from data) books on books.QR_code=borrow.QR_code group by borrow.QR_code,name order by num desc,QR_code";
            SqlDataSource1.SelectCommand = sql;  
            Session["sqlBBT"] = sql;           
            Session["sqlBBT2"] = sql2;
        }      
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int id = GridView1.PageIndex*GridView1.PageSize+e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = id.ToString();
        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int id = GridView1.PageIndex * GridView1.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = id.ToString();
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        this.MultiView1.ActiveViewIndex = 0;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        this.MultiView1.ActiveViewIndex = 1;
    }
    protected void btprint_Click(object sender, EventArgs e)
    {
        Response.Redirect("BookBorrowTimesPrint/BookBorrowTimesPrint.aspx");
    }
    protected void btprint2_Click(object sender, EventArgs e)
    {
        Response.Redirect("BBT2Print/BBT2Print.aspx");
    }
    protected void btselect_Click(object sender, EventArgs e)
    {
        string bty = dpbty.SelectedItem.Value == "0" ? "" : dpbty.SelectedItem.Value;
        string sql = "select borrow.QR_code,name,COUNT(*) num from borrow left join (select QR_code,name,1 type from book union select QR_code,name,3 type from paper union select QR_code,name,2 type from journal union select QR_code,name,4 type from data) books on books.QR_code=borrow.QR_code where type like '%"+bty+"%' ";
        sql+=" and name like '%"+txtbn.Text.Trim().Replace(' ','%')+"%'";

        if ((txts.Text.Trim() != "" || txte.Text.Trim() != "")&&(IsDate(txts.Text.Trim())&&IsDate(txte.Text.Trim())))
            sql += " and borrow_dt between CONVERT(varchar(50),'" + txts.Text.Trim() + "',23)and CONVERT(varchar(50),'" + txte.Text.Trim() + "',23)";
        //if (!IsDate(txts.Text.Trim()) || !IsDate(txte.Text.Trim()))
        //    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('日期格式有误！');", true);

        sql += " group by borrow.QR_code,name,type order by num desc,QR_code";
        SqlDataSource1.SelectCommand = sql;
        Session["sqlBBT"] = sql;
       
    }

     public static bool IsDate(string StrSource)
    {
        return Regex.IsMatch(StrSource, @"^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-9]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$");
    }
     protected void btselect1_Click(object sender, EventArgs e)
     {
         string sql = "select borrow_type.name,COUNT(*) num from borrow left join borrow_type on borrow_type.id=borrow_type_id ";
         if ((txts1.Text.Trim() != "" || txte1.Text.Trim() != "") && (IsDate(txts1.Text.Trim()) && IsDate(txte1.Text.Trim())))
             sql += " where borrow_dt between CONVERT(varchar(50),'" + txts1.Text.Trim() + "',23)and CONVERT(varchar(50),'" + txte1.Text.Trim() + "',23)";
         sql += " group by borrow_type.name order by num desc";
         SqlDataSource2.SelectCommand = sql;
         Session["sqlBBT2"] = sql;
     }
     protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
     {
         GridView1.PageIndex = e.NewPageIndex;
         SqlDataSource1.SelectCommand = Session["sqlBBT"].ToString();
     }
}
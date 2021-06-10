using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class managers_statistic_unreturn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql = "select borrow.QR_code,books.name,borrow_dt,deadline,users.id,users.name,major.mname from (select * from borrow where is_return=0) borrow left join users on users.id=borrower_id left join major on major.mid=users.major left join (select QR_code,name from book union select QR_code,name from paper union select QR_code,name from journal union select QR_code,name from data) books on books.QR_code=borrow.QR_code order by borrow_dt desc";
            SqlDataSource1.SelectCommand = sql;
            Session["sqlUR"] = sql;

            lbtotall.Text = "共" + GridView1.Rows.Count.ToString() + "条记录";
        }
    }
    protected void btprint_Click(object sender, EventArgs e)
    {
        Response.Redirect("unreturnPrint/unreturnPrint.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string deadline = e.Row.Cells[3].Text;
            if (DateTime.Compare(DateTime.Parse(deadline), DateTime.Now) < 0)
            {
                e.Row.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
    protected void dpcond_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql="";
        if (dpcond.SelectedItem.Value == "0")//全部
            sql = "select borrow.QR_code,books.name,borrow_dt,deadline,users.id,users.name,major.mname from (select * from borrow where is_return=0) borrow left join users on users.id=borrower_id left join major on major.mid=users.major left join (select QR_code,name from book union select QR_code,name from paper union select QR_code,name from journal union select QR_code,name from data) books on books.QR_code=borrow.QR_code  order by borrow_dt desc";
        else if (dpcond.SelectedItem.Value == "1")//超期
            sql = "select borrow.QR_code,books.name,borrow_dt,deadline,users.id,users.name,major.mname from (select * from borrow where is_return=0) borrow left join users on users.id=borrower_id left join major on major.mid=users.major left join (select QR_code,name from book union select QR_code,name from paper union select QR_code,name from journal union select QR_code,name from data) books on books.QR_code=borrow.QR_code where deadline<GETDATE() order by borrow_dt desc";
        else//正常
            sql = "select borrow.QR_code,books.name,borrow_dt,deadline,users.id,users.name,major.mname from (select * from borrow where is_return=0) borrow left join users on users.id=borrower_id left join major on major.mid=users.major left join (select QR_code,name from book union select QR_code,name from paper union select QR_code,name from journal union select QR_code,name from data) books on books.QR_code=borrow.QR_code where deadline>=GETDATE() order by borrow_dt desc";
        SqlDataSource1.SelectCommand = sql;
        GridView1.DataBind();
        Session["sqlUR"] = sql;
        lbtotall.Text = "共" + GridView1.Rows.Count.ToString() + "条记录";
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        SqlDataSource1.SelectCommand = Session["sqlUR"].ToString();
    }
}
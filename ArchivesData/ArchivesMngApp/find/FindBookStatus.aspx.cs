using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class find_FindBookStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            Session["sql"]=SqlDataSource1.SelectCommand;
    }
    protected void btfind_Click(object sender, EventArgs e)
    {
        string type = "";
        string allbooks = "select id,QR_code,name,status from book union select id,QR_code,name,status from journal union select id,QR_code,name,status from paper union select id,QR_code,name,status from data";
        string borrow = "select QR_code,borrower_id,borrow_dt,deadline from borrow where is_return=0 union select QR_code,no,reserve_time,deadline from reserve where status=0";
        
        switch (dpbtype.SelectedItem.Value)
        {
            case "0": type = "allbooks";
                break;
            case "1": type = "book";
                break;
            case "2": type = "journal";
                break;
            case "3": type = "paper";
                break;
            case "4": type = "data";
                break;
            default:
                break;
        }

        string sql="";
        if(dpbtype.SelectedItem.Value=="0")
            sql = "select " + type + ".id," + type + ".name," + type + ".QR_code," + type + ".status,borrower_id,users.name,borrow_dt,deadline from  (" + allbooks + ") " + type + " left join ("+borrow+") borrow on " + type + ".QR_code=borrow.QR_code left join users on users.id=borrower_id  ";
        else
            sql = "select " + type + ".id," + type + ".name," + type + ".QR_code," + type + ".status,borrower_id,users.name,borrow_dt,deadline from " + type + " left join (" + borrow + ") borrow on " + type + ".QR_code=borrow.QR_code left join users on users.id=borrower_id ";

        if(txtQR.Text.Trim()!="")
        {
            sql = "select " + type + ".id," + type + ".name," + type + ".QR_code," + type + ".status,borrower_id,users.name,borrow_dt,deadline from  (" + allbooks + ") " + type + " left join (" + borrow + ") borrow on " + type + ".QR_code=borrow.QR_code left join users on users.id=borrower_id ";
            sql += " where "+type+".QR_code ='"+txtQR.Text.Trim()+"'";
        }
        else
        {
            sql += " where "+type+".name like '%" + txtn.Text.Trim().Replace(' ','%') + "%'";
        }
        SqlDataSource1.SelectCommand = sql+"order by status desc,QR_code";

        Session["sql"] = SqlDataSource1.SelectCommand;
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
            switch(e.Row.Cells[3].Text)
            {
                case "0": e.Row.Cells[3].Text = "库存";
                    e.Row.ForeColor = System.Drawing.Color.Black;
                    break;
                case "1": e.Row.Cells[3].Text = "预约";
                    break;
                case "2": e.Row.Cells[3].Text = "借出";
                    e.Row.ForeColor = System.Drawing.Color.Blue;
                    break;
            }
        }
    }
    protected void btprint_Click(object sender, EventArgs e)
    {
        Response.Redirect("StatusPrint/StatusPrint.aspx");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        SqlDataSource1.SelectCommand = Session["sql"].ToString();
        //GridView1.DataBind();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class users_reserve : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GvBind();
    }
    private void GvBind()
    {
        string conn = rbc.Checked ? "=" : "!=";
        string sql = "select reserve.id,reserve.QR_code,books.name,borrow_type.name,reserve_time,deadline,case status when 0 then '未借出' when 1 then '已借出' when 2 then '过期' end status from reserve left join borrow_type on borrow_type.id=reserve_type_id left join (select QR_code,name from book union select QR_code,name from paper union select QR_code,name from journal union select QR_code,name from data) books on books.QR_code=reserve.QR_code where no='" + Session["id"].ToString() + "' and status" + conn + "0 order by reserve_time desc";
        SqlDataSource2.SelectCommand = sql;
        GridView1.DataBind();
    }
   
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int id = GridView1.PageIndex*GridView1.PageSize+e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = id.ToString();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GvBind();
    }
    protected void btprint_Click(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
        GvBind();
        ExportGridViewForUTF8(GridView1, DateTime.Now.ToShortDateString() + ".xls");
        GridView1.AllowPaging = true;
        GvBind();
    }
    private void ExportGridViewForUTF8(GridView GridView, string filename)
    {

        string attachment = "attachment; filename=" + filename;

        Response.ClearContent();
        Response.Buffer = true;
        Response.Write("<meta http-equiv=Content-Type; content=text/html;charset=UTF-8>");
        Response.AddHeader("content-disposition", attachment);

        Response.Charset = "UTF-8";
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-8");
        Response.ContentType = "application/ms-excel";
        System.IO.StringWriter sw = new System.IO.StringWriter();

        HtmlTextWriter htw = new HtmlTextWriter(sw);
        GridView.RenderControl(htw);

        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }

}
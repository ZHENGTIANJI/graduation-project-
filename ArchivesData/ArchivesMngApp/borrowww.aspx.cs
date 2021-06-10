using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class borrowww : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if(!IsPostBack)
        //{
            GvBind();
        //}
    }
    private void GvBind()
    {
        int is_return = rbc.Checked ? 0 : 1;
        string sql = "select ROW_NUMBER() over (order by borrow_dt desc) as row_id,borrow.QR_code,books.name,borrow_type.name,borrow_dt, return_dt, case is_return when 0 then '未归还' when '1' then '已归还' end is_return, deadline from borrow left join borrow_type on borrow_type_id=borrow_type.id left join (select QR_code,name from book union select QR_code,name from paper union select QR_code,name from journal union select QR_code,name from data) books on books.QR_code=borrow.QR_code where borrower_id='" + Session["id"].ToString() + "' and is_return='"+is_return+"'";
        SqlDataSource1.SelectCommand = sql;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GvBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.Cells[7].Text != "&nbsp;")
        {
            string deadline = e.Row.Cells[7].Text;
            if (DateTime.Compare(DateTime.Parse(deadline), DateTime.Now) < 0 && e.Row.Cells[6].Text == "未归还")
            {
                e.Row.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
    protected void btselect_Click(object sender, EventArgs e)
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
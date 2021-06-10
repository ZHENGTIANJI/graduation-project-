using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class find_FindReaderBorrow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if(!IsPostBack)
           Session["sqlRB"] = SqlDataSource1.SelectCommand;
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
            //区分已还未还信息
            switch (e.Row.Cells[3].Text)
            {
                case "未还": e.Row.ForeColor = System.Drawing.Color.Blue;
                    break;
                case "已还": break;
            }
            //标记超期未还信息
            string deadline = e.Row.Cells[7].Text;
            if ( e.Row.Cells[3].Text=="未还"&& DateTime.Compare(DateTime.Parse(deadline),DateTime.Now)<0)
            {
                e.Row.ForeColor = System.Drawing.Color.Red;
            }           
        }
    }
    protected void btprint_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReaderBorrowPrint/ReaderBorrow.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        txtid.Text = ((LinkButton)sender).CommandArgument.ToString();

        string source = "select name,QR_code,1 type from book union select name,QR_code,2 type from journal union select name,QR_code,3 type from paper union select name,QR_code,4 type from data";
        string sql = "select borrow.id,source.name,source.QR_code,case is_return when 0 then '未还' when 1 then '已还' end is_return,borrower_id,users.name,borrow_dt,deadline from borrow left join (" + source + ") source on borrow.QR_code=source.QR_code left join users on users.id=borrower_id where borrower_id='" + txtid.Text.Trim() + "'";
        SqlDataSource1.SelectCommand = sql + " order by borrow_dt desc";
        Session["sqlRB"] = SqlDataSource1.SelectCommand;

        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter(sql + " and is_return=0", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        txtunreturn.Text = ds.Tables[0].Rows.Count.ToString();

        int ovretime_num = 0;
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            if (DateTime.Parse(ds.Tables[0].Rows[i]["deadline"].ToString()) < DateTime.Now)
            {
                ovretime_num++;
            }
        }
        txtovertime.Text = ovretime_num.ToString();
    }
    protected void btselect_Click(object sender, EventArgs e)
    {
        string sql = "select id,name,user_class.user_class,cn,mname from users left join user_class on utid=users.user_class left join major on major.mid=users.major left join campus on campus.cid=major.cid where name like '%" + txtn.Text.Trim() + "%'";
        SqlDataSource2.SelectCommand = sql;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        SqlDataSource1.SelectCommand = Session["sqlRB"].ToString();
        GridView1.DataBind();
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        string sql = "select id,name,user_class.user_class,cn,mname from users left join user_class on utid=users.user_class left join major on major.mid=users.major left join campus on campus.cid=major.cid where name like '%" + txtn.Text.Trim() + "%'";
        SqlDataSource2.SelectCommand = sql;
    }
}
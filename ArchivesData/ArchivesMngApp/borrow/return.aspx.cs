using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class managers_borrow_return : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtdate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        string borrower_id = FindUid(txtbid.Text.Trim());
        string books = "select QR_code,name from book union select QR_code,name from journal union select QR_code,name from paper union select QR_code,name from data";
        string sql = "select borrow.id,borrower_id,users.name,borrow.QR_code,books.name as bn,borrow_type.name as btn,borrow_dt,return_dt,case when DATEDIFF(DAY,deadline,return_dt)>0 then DATEDIFF(DAY,deadline,return_dt) else '0' end overdays from borrow left join borrow_type on borrow_type.id=borrow_type_id left join (" + books + ") books on books.QR_code=borrow.QR_code left join users on users.id=borrower_id where borrower_id='" + borrower_id + "' and ((is_return=1 and return_dt='" + DateTime.Now + "') or is_return=0) order by is_return desc,return_dt desc,borrow_dt desc";
        SqlDataSource2.SelectCommand = sql;
    }

    protected void btok_Click(object sender, EventArgs e)
    {
        string type = "",QR_code=txtbid.Text.Trim();
        string borrower_id = FindUid(QR_code);
        Session["borrower_id"] = borrower_id;
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adpt = new SqlDataAdapter("select * from (select QR_code,name,1 type from book union select QR_code,name,3 type from paper union select QR_code,name,2 type from journal union select QR_code,name,4 type from data) books where QR_code='" + txtbid.Text.Trim() + "'", cnn);
        DataSet dst = new DataSet();
        adpt.Fill(dst);

        if (dst.Tables[0].Rows.Count > 0)
        {
            type = dst.Tables[0].Rows[0]["type"].ToString();

            switch (type)
            {
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

            //检查borrow表是否有该条记录
            //SqlDataAdapter adp = new SqlDataAdapter("select * from borrow where borrower_id='" + borrower_id + "' and QR_code='" + QR_code + "' and is_return=0 ", cnn);
            //DataSet ds = new DataSet();
            //adp.Fill(ds);

            if (borrower_id != "")
            {
                SqlCommand cmd = new SqlCommand();
                cnn.Open();
                SqlTransaction tr = cnn.BeginTransaction();
                cmd.Connection = cnn;
                cmd.Transaction = tr;

                try
                {
                    cmd.CommandText = "update borrow set return_dt='" + txtdate.Text + "',is_return=1 where borrower_id='" + borrower_id + "' and QR_code='" + QR_code + "' and is_return=0";
                    cmd.ExecuteNonQuery();

                    cmd.CommandText = "update " + type + " set " + type + ".status=0 where QR_code='" + txtbid.Text.Trim() + "'";
                    cmd.ExecuteNonQuery();

                    tr.Commit();
               
                    GridView1.DataBind();

                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('还书成功！');", true);
                }
                catch
                {
                    tr.Rollback();
                }

                cnn.Close();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该资源未被借出！');", true);
            }
        }
        else
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该资源不存在！');", true);
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int id = GridView1.PageIndex * GridView1.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = id.ToString();
        }

        //超期图书标红
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.Cells[8].Text!="&nbsp;")
        {
            if (Convert.ToInt32(e.Row.Cells[8].Text)>0)
            {
                e.Row.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    //根据所还图书查找借书人账号
    private string FindUid(string bid)
    {
        string uid = "";
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select borrower_id from borrow where QR_code='"+bid+"' and is_return=0", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        if(ds.Tables[0].Rows.Count>0)
        {
            uid = ds.Tables[0].Rows[0]["borrower_id"].ToString();
        }
        return uid;
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        string books = "select QR_code,name from book union select QR_code,name from journal union select QR_code,name from paper union select QR_code,name from data";
        string sql = "select borrow.id,borrower_id,users.name,borrow.QR_code,books.name as bn,borrow_type.name as btn,borrow_dt,return_dt,case when DATEDIFF(DAY,deadline,return_dt)>0 then DATEDIFF(DAY,deadline,return_dt) else '0' end overdays from borrow left join borrow_type on borrow_type.id=borrow_type_id left join (" + books + ") books on books.QR_code=borrow.QR_code left join users on users.id=borrower_id where borrower_id='" + Session["borrower_id"].ToString() + "' and ((is_return=1 and return_dt='" + DateTime.Now + "') or is_return=0) order by is_return desc,return_dt desc,borrow_dt desc";
        SqlDataSource2.SelectCommand = sql;
    }
}
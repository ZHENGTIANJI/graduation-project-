using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class managers_borrow_borrow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        txtdate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        BorrowGv();
        ReserveGv();
    }

    private void BorrowGv()
    {
        string books = "select QR_code,name from book union select QR_code,name from journal union select QR_code,name from paper union select QR_code,name from data";
        string sql = "select borrow.id,users.name,borrow_dt,borrow.QR_code,books.name as bn,borrow_type.name as btn,deadline from borrow left join borrow_type on borrow_type.id=borrow_type_id left join users on users.id=borrower_id left join (" + books + ") books on books.QR_code=borrow.QR_code where borrower_id='" + txtid.Text.Trim() + "' and is_return=0 order by borrow_dt desc";
        SqlDataSource2.SelectCommand = sql;
        GridView1.DataBind();
        Session["BorrowSelect"] = sql;
    }

    private void ReserveGv()
    {
        string books = "select QR_code,name from book union select QR_code,name from journal union select QR_code,name from paper union select QR_code,name from data";
        string sql = "select reserve.id,users.name,reserve_time,reserve.QR_code,books.name as bn,borrow_type.name as btn,deadline from reserve left join borrow_type on borrow_type.id=reserve_type_id left join users on users.id=no left join ("+books+") books on books.QR_code=reserve.QR_code where reserve.no='"+txtid.Text.Trim()+"' and status=0 order by reserve_time desc";
        SqlDataSource4.SelectCommand = sql;
        GridView3.DataBind();
        Session["ReserveSelect"] = sql;
    }

    private void PersonGv()
    {
        string sql = "select id,name,user_class.user_class,cn,mname from users left join user_class on utid=users.user_class left join major on major.mid=users.major left join campus on campus.cid=major.cid where shenhe=1 and name like '%" + txtn.Text.Trim() + "%'";
        SqlDataSource3.SelectCommand = sql;
    }

    protected void btok_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        int number_limit, borrow_days, flag = 0;
        string type = "", utype = "", type_id = "";

        //取出用户类型
        SqlDataAdapter adp0 = new SqlDataAdapter("select * from users where id='" + txtid.Text.Trim() + "' and shenhe=1", cnn);
        DataSet ds0 = new DataSet();
        adp0.Fill(ds0);
        utype = ds0.Tables[0].Rows[0]["user_class"].ToString();

        //取出对应用户类型的借阅规则  
        SqlDataAdapter adp = new SqlDataAdapter("select * from user_class where utid='" + utype + "'", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        number_limit = Convert.ToInt32(ds.Tables[0].Rows[0]["number_limit"]);
        borrow_days = Convert.ToInt32(ds.Tables[0].Rows[0]["borrow_days"]);

        //判断借书达到上限  
        SqlDataAdapter adp1 = new SqlDataAdapter("select borrower_id,COUNT(*) num from borrow where is_return=0 group by borrower_id having borrower_id='" + txtid.Text.Trim() + "'", cnn);
        DataSet ds1 = new DataSet();
        adp1.Fill(ds1);

        if (ds1.Tables[0].Rows.Count > 0 && Convert.ToInt32(ds1.Tables[0].Rows[0]["num"]) > number_limit)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该用户借书达到上限，借阅失败');", true);
            flag = -1;
        }

        //判断是否有超期未还书
        if (flag != -1)
        {
            SqlDataAdapter adp2 = new SqlDataAdapter("select * from borrow where borrower_id='" + txtid.Text.Trim() + "' and is_return=0 and GETDATE()>deadline", cnn);
            DataSet ds2 = new DataSet();
            adp2.Fill(ds2);

            if (ds2.Tables[0].Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该用户存在超期图书，借阅失败！');", true);
                flag = -1;
            }
        }
        //找到所借资源类型，并判断是否剔旧
        if (flag != -1)
        {
            SqlDataAdapter adpt = new SqlDataAdapter("select * from (select QR_code,name,1 type,is_delete,status from book union select QR_code,name,3 type,is_delete,status from paper union select QR_code,name,2 type,is_delete,status from journal union select QR_code,name,4 type,is_delete,status from data) books where QR_code='" + txtbid.Text.Trim() + "'", cnn);
            DataSet dst = new DataSet();
            adpt.Fill(dst);
            //判断是否存在该书
            if (dst.Tables[0].Rows.Count > 0)
            {
                if (dst.Tables[0].Rows[0]["is_delete"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该资源已被剔旧，借阅失败！');", true);
                    flag = -1;
                }

                else
                {
                    //判断资源是否借出
                    if (dst.Tables[0].Rows[0]["status"].ToString() == "2")
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该资源已被借出，借阅失败！');", true);
                        flag = -1;
                    }
                    type_id = dst.Tables[0].Rows[0]["type"].ToString();

                    switch (type_id)
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

                    //判断该书是否被预约
                    if (flag != -1)
                    {
                        SqlDataAdapter adp3 = new SqlDataAdapter("select * from reserve where QR_code='" + txtbid.Text.Trim() + "' and GETDATE()<deadline and status=0", cnn);
                        DataSet ds3 = new DataSet();
                        adp3.Fill(ds3);

                        if (ds3.Tables[0].Rows.Count > 0 && ds3.Tables[0].Rows[0]["no"].ToString() == txtid.Text)//被该读者预约
                        {
                            SqlCommand cmd = new SqlCommand();
                            cmd.Connection = cnn;
                            cnn.Open();

                            cmd.CommandText = "update reserve set status=1 where id='" + ds3.Tables[0].Rows[0]["id"] + "'";
                            cmd.ExecuteNonQuery();

                            cnn.Close();
                        }

                        if (ds3.Tables[0].Rows.Count > 0 && ds3.Tables[0].Rows[0]["no"].ToString() != txtid.Text)//被其他读者预约
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该书已被其他读者预约，借阅失败！');", true);
                            flag = -1;
                        }
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('不存在该资源！');", true);
                flag = -1;
            }
        }
        #region
        //判断是否被借出，能扫码则证明该书存在，不需写
        //SqlDataAdapter adp4 = new SqlDataAdapter("select * from borrow where QR_code='" + txtbid.Text.Trim() + "' and is_return=0", cnn);
        //DataSet ds4 = new DataSet();
        //adp4.Fill(ds4);

        //if (ds4.Tables[0].Rows.Count > 0)
        //{
        //    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该书已借出，借阅失败！');", true);
        //    flag = -1;
        //}
        #endregion
        //满足借书条件
        if (flag == 0)
        {
            SqlCommand cmd = new SqlCommand();
            SqlTransaction trn;
            cmd.Connection = cnn;
            cnn.Open();
            trn = cnn.BeginTransaction();
            cmd.Transaction = trn;

            try
            {
                cmd.CommandText = "insert into borrow(borrower_id,QR_code,borrow_type_id,deadline) values('" +txtid.Text + "','" + txtbid.Text.Trim() + "'," + Convert.ToInt32(type_id) + ",CONVERT(varchar(10),DATEADD(DAY," + borrow_days + ",getdate()),120))";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "update " + type + " set " + type + ".status=2 where QR_code='" + txtbid.Text.Trim() + "'";
                cmd.ExecuteNonQuery();

                trn.Commit();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('借阅成功！');", true);
            }
            catch
            {
                trn.Rollback();
            }
            //cnn.Close();
        }
        BorrowGv();
        ReserveGv();
    }



    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int id = GridView1.PageIndex*GridView1.PageSize+e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = id.ToString();
        }
        //超期图书标红
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (DateTime.Compare(DateTime.Parse(e.Row.Cells[6].Text), DateTime.Now) < 0)
            {
                e.Row.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    protected void btfindp_Click(object sender, EventArgs e)
    {
        PersonGv();
    }

    protected void btselect_Click(object sender, EventArgs e)
    {
        txtid.Text = ((LinkButton)sender).CommandArgument.ToString();
        BorrowGv();
        ReserveGv();
    }

    //找用户类型
    private string FindUty(string id)
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select id,name,user_class from users where id='"+id+"'",cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        return ds.Tables[0].Rows[0]["user_class"].ToString();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        if (Session["BorrowSelect"]!=null)
            SqlDataSource2.SelectCommand = Session["BorrowSelect"].ToString();
        BorrowGv();
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        PersonGv();
    }
    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView3.PageIndex = e.NewPageIndex;
        if (Session["ReserveSelect"] != null)
            SqlDataSource4.SelectCommand = Session["ReserveSelect"].ToString();
        ReserveGv();
    }
    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int id = GridView3.PageIndex * GridView3.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = id.ToString();
        }
    }
}
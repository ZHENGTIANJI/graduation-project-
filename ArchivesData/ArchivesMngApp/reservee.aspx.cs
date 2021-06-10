using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class users_reservee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CondBind(dpcond);
            CondBind(dpcond0);
            CondBind(dpcond1);
            CondBind(dpcond2);
            CondBind(dpcond3);
            CondBind(dpcond4);
            MatchBind(dpmatch);
            MatchBind(dpmatch0);
            MatchBind(dpmatch1);
            MatchBind(dpmatch2);
            MatchBind(dpmatch3);
            MatchBind(dpmatch4);
            ConnectBind(dpconnect);
            ConnectBind(dpconnect0);
            ConnectBind(dpconnect1);
            ConnectBind(dpconnect2);
            ConnectBind(dpconnect3);

            Label1.Text = "日期格式如" + DateTime.Now.ToString("yyyy-MM-dd");

            GvBind();
        }
    }
    //绑定条件下拉框
    private void CondBind(DropDownList dpcondition)
    {
        dpcondition.Items.Clear();
        dpcondition.Items.Add(new ListItem("篇名", "name"));
        dpcondition.Items.Add(new ListItem("作者", "author"));
        dpcondition.Items.Add(new ListItem("机构", "publisher"));
    }

    //绑定匹配下拉框
    private void MatchBind(DropDownList dpmatchh)
    {
        dpmatchh.Items.Clear();
        dpmatchh.Items.Add(new ListItem("精确", "="));
        dpmatchh.Items.Add(new ListItem("模糊", "like"));
    }

    //绑定连接下拉框
    private void ConnectBind(DropDownList dp)
    {
        dp.Items.Clear();
        dp.Items.Add(new ListItem("且", "and"));
        dp.Items.Add(new ListItem("或", "or"));
    }

    protected void btplus_Click(object sender, EventArgs e)
    {
        Panel2.Visible = true;
    }
    protected void btplus0_Click(object sender, EventArgs e)
    {
        Panel3.Visible = true;
    }
    protected void btplus1_Click(object sender, EventArgs e)
    {
        Panel4.Visible = true;
    }
    protected void btplus2_Click(object sender, EventArgs e)
    {
        Panel5.Visible = true;
    }
    protected void btplus3_Click(object sender, EventArgs e)
    {
        Panel6.Visible = true;
    }
    protected void btminus1_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
    }
    protected void btminus2_Click(object sender, EventArgs e)
    {
        Panel3.Visible = false;
    }
    protected void btminus3_Click(object sender, EventArgs e)
    {
        Panel4.Visible = false;
    }
    protected void btminus4_Click(object sender, EventArgs e)
    {
        Panel5.Visible = false;
    }
    protected void btminus5_Click(object sender, EventArgs e)
    {
        Panel6.Visible = false;
    }

    protected void btfind_Click(object sender, EventArgs e)
    {
        string sqlb = "select QR_code,name,1 type,mname,publisher,author,publish_dt,language.lname,number,location,status from book left join major on major.mid=major_type_id left join language on language.lid=language where is_delete=0";
        string sqlj = "select QR_code,name,2 type,mname,office_name,'' author,publish_dt,language.lname,number,location,status from journal left join major on major.mid=major_id left join language on language.lid=language where is_delete=0";
        string sqlp = "select QR_code,name,3 type,mname,'' publisher,author,write_dt,language.lname,number,location,status from paper left join major on major.mid=major_id left join language on language.lid=language where is_delete=0 and shenhe='已审核'";
        string sqld = "select QR_code,name,4 type,mname,unit,author,compile_dt,language.lname,number,location,status from data left join major on major.mid=major_id left join language on language.lid=language where is_delete=0";
        string sql = "select QR_code,name,type,mname,publisher,author,publish_dt,lname,number,location,status from (" + sqlb + " union " + sqlj + " union " + sqlp + " union " + sqld + ") books";
        string cond = "";

        if (dpmatch.SelectedItem.Value == "=")
            cond += dpcond.SelectedItem.Value + "= '" + txtn.Text.Trim() + "' ";
        else
            cond += dpcond.SelectedItem.Value + " like '%" + txtn.Text.Trim().Replace(" ", "%") + "%' ";
        if (Panel2.Visible == true)
        {
            cond += dpconnect.SelectedItem.Value;
            if (dpmatch0.SelectedItem.Value == "=")
                cond += " " + dpcond0.SelectedItem.Value + "= '" + txtn0.Text.Trim() + "' ";
            else
                cond += " " + dpcond0.SelectedItem.Value + " like '%" + txtn0.Text.Trim().Replace(" ", "%") + "%' ";
        }
        if (Panel3.Visible == true)
        {
            cond += dpconnect0.SelectedItem.Value;
            if (dpmatch1.SelectedItem.Value == "=")
                cond += " " + dpcond1.SelectedItem.Value + "= '" + txtn1.Text.Trim() + "' ";
            else
                cond += " " + dpcond1.SelectedItem.Value + " like '%" + txtn1.Text.Trim().Replace(" ", "%") + "%' ";
        }
        if (Panel4.Visible == true)
        {
            cond += dpconnect1.SelectedItem.Value;
            if (dpmatch2.SelectedItem.Value == "=")
                cond += " " + dpcond2.SelectedItem.Value + "= '" + txtn2.Text.Trim() + "' ";
            else
                cond += " " + dpcond2.SelectedItem.Value + " like '%" + txtn2.Text.Trim().Replace(" ", "%") + "%' ";
        }
        if (Panel5.Visible == true)
        {
            cond += dpconnect2.SelectedItem.Value;
            if (dpmatch3.SelectedItem.Value == "=")
                cond += " " + dpcond3.SelectedItem.Value + "= '" + txtn3.Text.Trim() + "' ";
            else
                cond += " " + dpcond3.SelectedItem.Value + " like '%" + txtn3.Text.Trim().Replace(" ", "%") + "%' ";
        }
        if (Panel6.Visible == true)
        {
            cond += dpconnect3.SelectedItem.Value;
            if (dpmatch4.SelectedItem.Value == "=")
                cond += " " + dpcond4.SelectedItem.Value + "= '" + txtn4.Text.Trim() + "' ";
            else
                cond += " " + dpcond4.SelectedItem.Value + " like '%" + txtn4.Text.Trim().Replace(" ","%") + "%' ";
        }
        if (dpbty.SelectedItem.Value != "0")
            cond += " and type='" + dpbty.SelectedItem.Value + "'";
        if (dpmty.SelectedItem.Value != "0")
            cond += " and mname='" + dpmty.SelectedItem.Text + "'";

        if ((txts.Text.Trim() != "" || txte.Text.Trim() != "") && (IsDate(txts.Text.Trim()) && IsDate(txte.Text.Trim())))
            cond += " and publish_dt between CONVERT(varchar(50),'" + txts.Text.Trim() + "',23) and CONVERT(varchar(50),'" + txte.Text.Trim() + "',23)";

        sql += " where " + cond+" order by status";
        SqlDataSource3.SelectCommand = sql;
        Session["FindBookSql"] = sql;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            switch(e.Row.Cells[10].Text)
            {
                case "0": e.Row.Cells[10].Text = "库存";
                    break;
                case "1": e.Row.Cells[10].Text = "预约";
                    break;
                case "2": e.Row.Cells[10].Text = "借出";
                    break;
            }
            
            switch (e.Row.Cells[2].Text)
            {
                case "1": e.Row.Cells[2].Text = "图书";
                    break;
                case "2": e.Row.Cells[2].Text = "期刊";
                    break;
                case "3": e.Row.Cells[2].Text = "论文";
                    break;
                case "4": e.Row.Cells[2].Text = "其它资料";
                    break;
            }

            LinkButton btreserve = (LinkButton)e.Row.FindControl("btreserve");
            if (e.Row.Cells[10].Text == "库存")
                btreserve.Text = "预约";
            if (e.Row.Cells[10].Text == "借出")
                btreserve.Enabled = false;
            if (e.Row.Cells[10].Text == "预约")
            {
                if (IsReserve(e.Row.Cells[0].Text) == true)
                {
                    btreserve.Text = "取消预约";
                    btreserve.Enabled = true;
                }
                else
                    btreserve.Enabled = false;
            }
        }
    }

    public static bool IsDate(string StrSource)
    {
        return Regex.IsMatch(StrSource, @"^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-9]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$");
    }

    //判断预约表有该用户记录
    private bool IsReserve(string bid)
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select * from reserve where no='" + Session["id"].ToString() + "' and QR_code='" + bid + "' and status=0", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
            return true;
        else
            return false;
    }

    protected void btreserve_Click(object sender, EventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        

        if (((LinkButton)sender).CommandArgument.ToString() != "")
        {
            int number_limit;
            int real_number_limit = 0;
            int flag = 0;
            string type_id = row.Cells[2].Text, type = "";
            string QR_code = ((LinkButton)sender).CommandArgument.ToString();
            int reserve_days;
            int reserve_num;//预约数量上限（借书上限-以借数量）

            switch (type_id)
            {
                case "图书":
                    type = "book";
                    type_id = "1";
                    break;
                case "期刊":
                    type = "journal";
                    type_id = "2";
                    break;
                case "论文":
                    type = "paper";
                    type_id = "3";
                    break;
                case "其它资料":
                    type = "data";
                    type_id = "4";
                    break;
                default:
                    break;
            }
            SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
            //预约
            if (btn.Text == "预约")
            {
                //取出读者借阅书籍上限
                SqlDataAdapter adp = new SqlDataAdapter("select * from user_class where user_class='" + Session["user_class"] + "'", cnn);
                DataSet ds = new DataSet();
                adp.Fill(ds);

                number_limit = (int)ds.Tables[0].Rows[0]["number_limit"];
                reserve_days = (int)ds.Tables[0].Rows[0]["reserve_days"];

                //得到已借书数量
                SqlDataAdapter adp2 = new SqlDataAdapter("select borrower_id,COUNT(*) num from borrow where is_return=0 group by borrower_id having borrower_id='" + Session["id"] + "'", cnn);
                DataSet ds2 = new DataSet();
                adp2.Fill(ds2);

                if (ds2.Tables[0].Rows.Count > 0)
                    real_number_limit = (int)ds2.Tables[0].Rows[0][1];

                //预约数量
                reserve_num=number_limit-real_number_limit;

                //判断是否超出借书上限
                if (real_number_limit > number_limit)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('您借的书已达到上限，预约失败！');", true);
                    flag = -1;
                }

                //判断是否存在超期图书
                if (flag != -1)
                {
                    SqlDataAdapter adp3 = new SqlDataAdapter("select * from borrow where is_return=0 and GETDATE()>deadline and borrower_id='" + Session["id"] + "'", cnn);
                    DataSet ds3 = new DataSet();
                    adp3.Fill(ds3);

                    if (ds3.Tables[0].Rows.Count > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('您存在超期未还图书，预约失败！');", true);
                        flag = -1;

                    }
                }

                //判断预约数量是否达到上限
                SqlDataAdapter adp4 = new SqlDataAdapter("select * from reserve where no='"+Session["id"].ToString()+"' and status=0", cnn);
                DataSet ds4 = new DataSet();
                adp4.Fill(ds4);
                if (ds4.Tables[0].Rows.Count>=reserve_num)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('预约已达上限！');", true);
                    flag = -1;
                }

                //执行预约
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
                        cmd.CommandText = "insert reserve(no,reserve_type_id,QR_code,deadline) values('" + Session["id"].ToString() + "','" + type_id + "','" + QR_code + "','" + DateTime.Now.AddDays(reserve_days).ToString("yyyy-MM-dd") + "')";
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "update " + type + " set " + type + ".status=1 where QR_code='" + QR_code + "'";
                        cmd.ExecuteNonQuery();

                        trn.Commit();

                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('预约成功！');", true);
                    }
                    catch
                    {
                        trn.Rollback();
                    }
                }
            }
            //取消预约
            if (btn.Text == "取消预约")
            {
                if (IsReserve(QR_code))
                {
                    SqlCommand cmd = new SqlCommand();
                    SqlTransaction trn;
                    cmd.Connection = cnn;
                    cnn.Open();
                    trn = cnn.BeginTransaction();
                    cmd.Transaction = trn;

                    try
                    {
                        cmd.CommandText = "delete reserve where no='" + Session["id"].ToString() + "' and QR_code='" + QR_code + "'";
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = cmd.CommandText = "update " + type + " set " + type + ".status='0' where QR_code='" + QR_code + "'";
                        cmd.ExecuteNonQuery();

                        trn.Commit();

                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('取消预约成功！');", true);
                    }
                    catch
                    {
                        trn.Rollback();
                    }
                }
            }
            SqlDataSource3.SelectCommand = Session["FindBookSql"].ToString();
            GridView1.DataBind();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        SqlDataSource3.SelectCommand = Session["FindBookSql"].ToString();
    }

    private void GvBind()
    {
        string sqlb = "select QR_code,name,1 type,mname,publisher,author,publish_dt,language.lname,number,location,status from book left join major on major.mid=major_type_id left join language on language.lid=language where is_delete=0";
        string sqlj = "select QR_code,name,2 type,mname,office_name,'' author,publish_dt,language.lname,number,location,status from journal left join major on major.mid=major_id left join language on language.lid=language where is_delete=0";
        string sqlp = "select QR_code,name,3 type,mname,'' publisher,author,write_dt,language.lname,number,location,status from paper left join major on major.mid=major_id left join language on language.lid=language where is_delete=0 and shenhe='已审核'";
        string sqld = "select QR_code,name,4 type,mname,unit,author,compile_dt,language.lname,number,location,status from data left join major on major.mid=major_id left join language on language.lid=language where is_delete=0";
        string sql = "select reserve.QR_code,name,type,mname,publisher,author,publish_dt,lname,number,location,books.status from reserve left join (" + sqlb + " union " + sqlj + " union " + sqlp + " union " + sqld + ") books on reserve.QR_code=books.QR_code";
        SqlDataSource3.SelectCommand = sql + " where no='"+Session["id"].ToString()+"' and reserve.status=0 ";
        Session["FindBookSql"] = SqlDataSource3.SelectCommand;
        GridView1.DataBind();
    }

}
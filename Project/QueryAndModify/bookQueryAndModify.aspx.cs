using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class QueryAndModify_bookQueryAndModify :dropdownlist
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["class"] == null || (int)Session["class"] != 0)
        {
            Response.Redirect("../login1.aspx");
        }
        GridView1.Attributes.Add("style", "word-break:break-all;word-wrap:break-word"); 
        if (!IsPostBack)
        {
            
            String strmajor = "";
            String strbooktype = "";
            String strbookname = bookname.Text.ToString().Trim();
            DataSet dst = new DataSet();
            SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [book_number], [CD], [format], [location], [stock_dt], [teacher], [number], [name], [btname], [mname], [QR_code], [publisher], [publish_dt], [author], [price], case when [status]=0 then '库存' when [status]=0 then '预约' else '借出' end status, [note], [lname], [bitname] FROM [book] left join book_type on book.book_type_id=book_type.btid left join major on book.major_type_id=major.mid left join language on book.language=language.lid left join binding_type on book.binding_type_id=binding_type.bitid where is_delete=0 and name like '%" + strbookname + "%' and mname like '%" + strmajor + "%' and btname like '%" + strbooktype + "%'", cnn);
            
            adpt.Fill(dst);
            if (dst.Tables[0].Rows.Count == 0)
            {
                DataRow row = dst.Tables[0].NewRow();
                for (int j = 0; j < GridView1.Columns.Count - 1; j++)
                {
                    row[j] = DBNull.Value;
                }
                dst.Tables[0].Rows.Add(row);
            }
            GridView1.DataSource = dst.Tables[0];
            GridView1.DataBind();
            setmajordropdownlist(major);
            setbooktypedropdownlist(booktype);
        }
        user.Text = "当前用户:" + Session["name"].ToString();
    }
    protected void query_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int num = e.RowIndex;
        if (GridView1.Rows[0].Cells[0].Text.ToString() != GridView1.Rows[0].Cells[1].Text.ToString() && GridView1.Rows[0].Cells[1].Text.ToString() != GridView1.Rows[0].Cells[2].Text.ToString())
        {
            txtname.Text = GridView1.Rows[num].Cells[0].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[0].Text.ToString();
            bt.SelectedIndex = -1;
            bt.Items.FindByText(GridView1.Rows[num].Cells[1].Text.ToString()).Selected = true;
            txtbooknumber.Text = GridView1.Rows[num].Cells[2].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[2].Text.ToString();
            txtauthor.Text = GridView1.Rows[num].Cells[3].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[3].Text.ToString();
            stock_year.Text = GridView1.Rows[num].Cells[4].Text.ToString().Substring(0, 4);
            stock_month.Text = GridView1.Rows[num].Cells[4].Text.ToString().Substring(5, 2);
            stock_day.Text = GridView1.Rows[num].Cells[4].Text.ToString().Substring(8, 2);
            txtformat.Text = GridView1.Rows[num].Cells[5].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[5].Text.ToString();
            txtnumberofpage.Text = GridView1.Rows[num].Cells[6].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[6].Text.ToString();
            txtlocation.Text = GridView1.Rows[num].Cells[7].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[7].Text.ToString();
            CD.SelectedIndex = -1;
            CD.Items.FindByText(GridView1.Rows[num].Cells[8].Text.ToString()).Selected = true;
            status.SelectedIndex = -1;
            status.Items.FindByText(GridView1.Rows[num].Cells[9].Text.ToString()).Selected = true;
            txtteacher.Text = GridView1.Rows[num].Cells[10].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[10].Text.ToString();
            txtnumber.Text = GridView1.Rows[num].Cells[11].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[11].Text.ToString();
            major1.SelectedIndex = -1;
            major1.Items.FindByText(GridView1.Rows[num].Cells[12].Text.ToString()).Selected = true;
            txtQR.Text = GridView1.Rows[num].Cells[13].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[13].Text.ToString();
            language.SelectedIndex = -1;
            language.Items.FindByText(GridView1.Rows[num].Cells[14].Text.ToString()).Selected = true;
            txtpub.Text = GridView1.Rows[num].Cells[15].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[15].Text.ToString();
            pub_year.Text = GridView1.Rows[num].Cells[16].Text.ToString().Substring(0, 4);
            pub_month.Text = GridView1.Rows[num].Cells[16].Text.ToString().Substring(5, 2);
            pub_day.Text = GridView1.Rows[num].Cells[16].Text.ToString().Substring(8, 2);
            txtprice.Text = GridView1.Rows[num].Cells[17].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[17].Text.ToString();
            bindingtype.SelectedIndex = -1;
            bindingtype.Items.FindByText(GridView1.Rows[num].Cells[18].Text.ToString()).Selected = true;
            txtnote.Text = GridView1.Rows[num].Cells[19].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[19].Text.ToString();
            Session["bookid"] = GridView1.Rows[num].Cells[20].Text.ToString();
        }
    }
    void ExecuteQuery()
    {
        String strmajor=major.SelectedItem.Text.ToString();
        String strbooktype=booktype.SelectedItem.Text.ToString();
        String strbookname = bookname.Text.ToString().Trim();

        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        if (booktype.SelectedItem.Value == "全部"&&major.SelectedItem.Value=="全部")
        {
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [book_number], [CD], [format], [location], [stock_dt], [teacher], [number], [name], [btname], [mname], [QR_code], [publisher], [publish_dt], [author], [price], case when [status]=0 then '库存' when [status]=0 then '预约' else '借出' end status, [note], [lname], [bitname] FROM [book] left join book_type on book.book_type_id=book_type.btid left join major on book.major_type_id=major.mid left join language on book.language=language.lid left join binding_type on book.binding_type_id=binding_type.bitid where is_delete=0 and name like '%" + strbookname + "%' and mname like '%" + "" + "%' and btname like '%" + "" + "%'", cnn);
            adpt.Fill(dst);
        }
        else if (booktype.SelectedItem.Value == "全部")
        {
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [book_number], [CD], [format], [location], [stock_dt], [teacher], [number], [name], [btname], [mname], [QR_code], [publisher], [publish_dt], [author], [price], case when [status]=0 then '库存' when [status]=0 then '预约' else '借出' end status, [note], [lname], [bitname] FROM [book] left join book_type on book.book_type_id=book_type.btid left join major on book.major_type_id=major.mid left join language on book.language=language.lid left join binding_type on book.binding_type_id=binding_type.bitid where is_delete=0 and name like '%" + strbookname + "%' and mname like '%" + strmajor + "%' and btname like '%" + "" + "%'", cnn);
            adpt.Fill(dst);
        }
        else if(major.SelectedItem.Value=="全部")
        {
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [book_number], [CD], [format], [location], [stock_dt], [teacher], [number], [name], [btname], [mname], [QR_code], [publisher], [publish_dt], [author], [price], case when [status]=0 then '库存' when [status]=0 then '预约' else '借出' end status, [note], [lname], [bitname] FROM [book] left join book_type on book.book_type_id=book_type.btid left join major on book.major_type_id=major.mid left join language on book.language=language.lid left join binding_type on book.binding_type_id=binding_type.bitid where is_delete=0 and name like '%" + strbookname + "%' and mname like '%" + "" + "%' and btname like '%" + strbooktype + "%'", cnn);
            adpt.Fill(dst);
        }
        else{
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [book_number], [CD], [format], [location], [stock_dt], [teacher], [number], [name], [btname], [mname], [QR_code], [publisher], [publish_dt], [author], [price], case when [status]=0 then '库存' when [status]=0 then '预约' else '借出' end status, [note], [lname], [bitname] FROM [book] left join book_type on book.book_type_id=book_type.btid left join major on book.major_type_id=major.mid left join language on book.language=language.lid left join binding_type on book.binding_type_id=binding_type.bitid where is_delete=0 and name like '%" + strbookname + "%' and mname like '%" + strmajor + "%' and btname like '%" + strbooktype + "%'", cnn);
            adpt.Fill(dst);
        }
        if (dst.Tables[0].Rows.Count == 0)
        {
            DataRow row = dst.Tables[0].NewRow();
            for (int j = 0; j < GridView1.Columns.Count-1; j++)
            {
                row[j] = DBNull.Value;
            }
            dst.Tables[0].Rows.Add(row);
        }
        GridView1.DataSource=dst.Tables[0];
        GridView1.DataBind();
    }

    protected void btok_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptbt = new SqlDataAdapter("select btid from book_type where btname='"+bt.SelectedItem.Text+"'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major1.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptbindingtype = new SqlDataAdapter("select bitid from binding_type where bitname='" + bindingtype.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptbt.Fill(dst1);
        adptmajor.Fill(dst2);
        adptbindingtype.Fill(dst3);
        adptlanguage.Fill(dst4);
        int btid = (int)dst1.Tables[0].Rows[0]["btid"];
        String majorid = dst2.Tables[0].Rows[0]["mid"].ToString();
        int bitid = (int)dst3.Tables[0].Rows[0]["bitid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        int id = Convert.ToInt32(Session["bookid"]);
        string s = txtpub.Text.ToString();
        DataSet dstpub = new DataSet();
        SqlDataAdapter adptpub = new SqlDataAdapter("select count(*) from publisher where name='" + s + "'", cnn);
        adptpub.Fill(dstpub);
        string ss = dstpub.Tables[0].Rows[0][0].ToString();
        if (ss == "0")
        {
            cmd.CommandText = "insert into publisher(name) values('" + s + "')";
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

       try {
            int zt;
            if (status.SelectedItem.Value == "库存")
            {
                zt = 0;
            }
            else if (status.SelectedItem.Value == "预约")
            {
                zt = 1;
            }
            else
            {
                zt = 2;
            }
            String stockdt = stock_year.Text + "-" + stock_month.Text + "-" + stock_day.Text;
            String pubdt = pub_year.Text + "-" + stock_month.Text + "-" + pub_day.Text;
            cmd.CommandText = "update book set name='" + txtname.Text + "',book_type_id='"+btid+"',book_number='"+txtbooknumber.Text+"',major_type_id='"+majorid+"',QR_code='"+txtQR.Text+"',publisher='"+txtpub.Text+"',publish_dt='"+pubdt+"',author='"+txtauthor.Text+"',stock_dt='"+stockdt+"',teacher='"+txtteacher.Text+"',number='"+txtnumber.Text+"',CD='"+CD.SelectedItem.Text+"',location='"+txtlocation.Text+"',status="+zt+",format='"+txtformat.Text+"',price='"+int.Parse(txtprice.Text)+"',number_of_page='"+int.Parse(txtnumberofpage.Text)+"',binding_type_id='"+bitid+"',language='"+lid+"',note='"+txtnote.Text+"' where id='"+id+"'";
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('保存成功！');", true);
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('保存失败！');", true);
        }
       
        ExecuteQuery();
    }
    protected void GridViewHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        ExecuteQuery();
    }
    protected void Button_search_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }
    protected void lb_firstpage_Click(object sender, EventArgs e)
    {
        this.GridView1.PageIndex = 0;
        ExecuteQuery();
    }
    protected void lb_previouspage_Click(object sender, EventArgs e)
    {
        if (this.GridView1.PageIndex > 0)
        {
            this.GridView1.PageIndex--;
            ExecuteQuery();
        }
    }
    protected void lb_nextpage_Click(object sender, EventArgs e)
    {
        if (this.GridView1.PageIndex < this.GridView1.PageCount)
        {
            this.GridView1.PageIndex++;
            ExecuteQuery();
        }
    }
    protected void lb_lastpage_Click(object sender, EventArgs e)
    {
        this.GridView1.PageIndex = this.GridView1.PageCount;
        ExecuteQuery();
    }


    private void ToExcel(Control ctl, string FileName)
    {
        HttpContext.Current.Response.Charset = "UTF-8";
        HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.UTF8;
        HttpContext.Current.Response.ContentType = "application/ms-excel";
        HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" + "" + FileName);
        ctl.Page.EnableViewState = false;
        System.IO.StringWriter tw = new System.IO.StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(tw);
        ctl.RenderControl(hw);
        HttpContext.Current.Response.Write(tw.ToString());
        HttpContext.Current.Response.End();
    }
    protected void export_Click1(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count > 0)
        {
            //调用导出方法  
            GridView1.AllowPaging = false;
            GridView1.AllowSorting = false;
            ExecuteQuery();
            String dt = DateTime.Now.ToString("yyyy-MM-dd");
            ToExcel(GridView1, dt + ".xls");
            GridView1.AllowPaging = true;
            GridView1.AllowSorting = true;
            ExecuteQuery();
        }
        else
        {
            // obo.Common.MessageBox.Show(this, "没有数据可导出，请先查询数据!");
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        // Confirms that an HtmlForm control is rendered for
    }

    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("../login1.aspx");
    }
}
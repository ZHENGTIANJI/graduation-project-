using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class QueryAndModify_journalQueryAndModify : dropdownlist
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["class"] == null || (int)Session["class"] != 0)
        {
            Response.Redirect("../login1.aspx");
        }
        if (!IsPostBack)
        {
            String strmajor = "";
            String strjournaltype = "";
            String strjournalname = journalname.Text.ToString().Trim();

            DataSet dst = new DataSet();
            SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [office_name], [period_type],[period_number], [address],[format], [location], [stock_dt], [number], [name],[publish_dt], [jtname], [mname], [QR_code], [class_number],[organname], case when [status]=0 then '库存' when [status]=0 then '预约' else '借出' end status, [note], [lname],[gradename] FROM [journal] left join journal_grade on journal.gradeid=journal_grade.gid left join organization on journal.organizationid=organization.organid left join journal_type on journal.journal_type_id=journal_type.jtid left join major on journal.major_id=major.mid left join language on journal.language=language.lid where is_delete=0 and name like '%" + strjournalname + "%' and mname like '%" + strmajor + "%' and jtname like '%" + strjournaltype + "%'", cnn);
            
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
            setjournaltypedropdownlist(jt);
            setmajordropdownlist(mt);
        }
        user.Text = "当前用户:" + Session["name"].ToString();
    }
    void ExecuteQuery()
    {
        String strmajor = mt.SelectedItem.Text.ToString();
        String strjournaltype = jt.SelectedItem.Text.ToString();
        String strjournalname = journalname.Text.ToString().Trim();

        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        if(jt.SelectedItem.Value=="全部"&&mt.SelectedItem.Value=="全部"){
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [office_name], [period_type],[period_number], [address],[format], [location], [stock_dt], [number], [name],[publish_dt], [jtname], [mname], [QR_code], [class_number],[organname], case when [status]=0 then '库存' when [status]=0 then '预约' else '借出' end status, [note], [lname],[gradename] FROM [journal] left join journal_grade on journal.gradeid=journal_grade.gid left join organization on journal.organizationid=organization.organid left join journal_type on journal.journal_type_id=journal_type.jtid left join major on journal.major_id=major.mid left join language on journal.language=language.lid where is_delete=0 and name like '%" + strjournalname + "%' and mname like '%" + "" + "%' and jtname like '%" + "" + "%'", cnn);
            adpt.Fill(dst);
        }else if(jt.SelectedItem.Value=="全部"){
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [office_name], [period_type],[period_number], [address],[format], [location], [stock_dt], [number], [name],[publish_dt], [jtname], [mname], [QR_code], [class_number],[organname], case when [status]=0 then '库存' when [status]=0 then '预约' else '借出' end status, [note], [lname],[gradename] FROM [journal] left join journal_grade on journal.gradeid=journal_grade.gid left join organization on journal.organizationid=organization.organid left join journal_type on journal.journal_type_id=journal_type.jtid left join major on journal.major_id=major.mid left join language on journal.language=language.lid where is_delete=0 and name like '%" + strjournalname + "%' and mname like '%" + strmajor + "%' and jtname like '%" + "" + "%'", cnn);
            adpt.Fill(dst);
        }
        else if (mt.SelectedItem.Value == "全部")
        {
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [office_name], [period_type],[period_number], [address],[format], [location], [stock_dt], [number], [name],[publish_dt], [jtname], [mname], [QR_code], [class_number],[organname], case when [status]=0 then '库存' when [status]=0 then '预约' else '借出' end status, [note], [lname],[gradename] FROM [journal] left join journal_grade on journal.gradeid=journal_grade.gid left join organization on journal.organizationid=organization.organid left join journal_type on journal.journal_type_id=journal_type.jtid left join major on journal.major_id=major.mid left join language on journal.language=language.lid where is_delete=0 and name like '%" + strjournalname + "%' and mname like '%" + "" + "%' and jtname like '%" + strjournaltype + "%'", cnn);
            adpt.Fill(dst);
        }else{
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [office_name], [period_type],[period_number], [address],[format], [location], [stock_dt], [number], [name],[publish_dt], [jtname], [mname], [QR_code], [class_number],[organname], case when [status]=0 then '库存' when [status]=0 then '预约' else '借出' end status, [note], [lname],[gradename] FROM [journal] left join journal_grade on journal.gradeid=journal_grade.gid left join organization on journal.organizationid=organization.organid left join journal_type on journal.journal_type_id=journal_type.jtid left join major on journal.major_id=major.mid left join language on journal.language=language.lid where is_delete=0 and name like '%" + strjournalname + "%' and mname like '%" + strmajor + "%' and jtname like '%" + strjournaltype + "%'", cnn);
            adpt.Fill(dst);
        }
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
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        DataSet dst5 = new DataSet();

        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptdt = new SqlDataAdapter("select jtid from journal_type where jtname='" + journaltype.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptorgan = new SqlDataAdapter("select organid from organization where organname='" + organ.SelectedItem.Value + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptgrade = new SqlDataAdapter("select gid from journal_grade where gradename='" + grade.SelectedItem.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptdt.Fill(dst1);
        adptmajor.Fill(dst2);
        adptorgan.Fill(dst3);
        adptlanguage.Fill(dst4);
        adptgrade.Fill(dst5);
        int jtid = (int)dst1.Tables[0].Rows[0]["jtid"];
        String majorid = dst2.Tables[0].Rows[0]["mid"].ToString();
        int or = (int)dst3.Tables[0].Rows[0]["organid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        int gid = (int)dst5.Tables[0].Rows[0]["gid"];
        int id = Convert.ToInt32(Session["journalid"]);
        try
        {
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
            cmd.CommandText = "update journal set name='" + txtname.Text + "',organizationid='" + or + "',gradeid='" + gid + "',journal_type_id='" + jtid + "',major_id='" + majorid + "',QR_code='" + txtQR.Text + "',publish_dt='" + pubdt + "',office_name='" + txtoffname.Text + "',period_number='" + txtperiod.Text + "',period_type='" + periodtype.SelectedItem.Value + "',stock_dt='" + stockdt + "',class_number='" + txtcn.Text + "',number='" + txtnumber.Text + "',location='" + txtlocation.Text + "',status='" + zt + "',format='" + txtformat.Text + "',number_of_page='" + int.Parse(txtnumberofpage.Text) + "',language='" + lid + "',note='" + txtnote.Text + "',address='" + txtaddress.Text + "' where id='" + id + "'";
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
    protected void query_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int num = e.RowIndex;
        if (GridView1.Rows[0].Cells[0].Text.ToString() != GridView1.Rows[0].Cells[2].Text.ToString() && GridView1.Rows[0].Cells[2].Text.ToString() != GridView1.Rows[0].Cells[1].Text.ToString())
        {
            txtname.Text = GridView1.Rows[num].Cells[0].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[0].Text.ToString();
            journaltype.SelectedIndex = -1;
            journaltype.Items.FindByText(GridView1.Rows[num].Cells[1].Text.ToString()).Selected = true;
            grade.SelectedIndex = -1;
            grade.Items.FindByText(GridView1.Rows[num].Cells[2].Text.ToString()).Selected = true;
            major.SelectedIndex = -1;
            major.Items.FindByText(GridView1.Rows[num].Cells[3].Text.ToString()).Selected = true;
            txtQR.Text = GridView1.Rows[num].Cells[4].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[4].Text.ToString();
            pub_year.Text = GridView1.Rows[num].Cells[5].Text.ToString().Substring(0, 4);
            pub_month.Text = GridView1.Rows[num].Cells[5].Text.ToString().Substring(5, 2);
            pub_day.Text = GridView1.Rows[num].Cells[5].Text.ToString().Substring(8, 2);
            stock_year.Text = GridView1.Rows[num].Cells[6].Text.ToString().Substring(0, 4);
            stock_month.Text = GridView1.Rows[num].Cells[6].Text.ToString().Substring(5, 2);
            stock_day.Text = GridView1.Rows[num].Cells[6].Text.ToString().Substring(8, 2);
            periodtype.SelectedIndex = -1;
            periodtype.Items.FindByText(GridView1.Rows[num].Cells[7].Text.ToString()).Selected = true;
            txtoffname.Text = GridView1.Rows[num].Cells[8].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[8].Text.ToString();
            language.SelectedIndex = -1;
            language.Items.FindByText(GridView1.Rows[num].Cells[9].Text.ToString()).Selected = true;
            txtcn.Text = GridView1.Rows[num].Cells[10].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[10].Text.ToString();
            txtperiod.Text = GridView1.Rows[num].Cells[11].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[11].Text.ToString();
            status.SelectedIndex = -1;
            status.Items.FindByText(GridView1.Rows[num].Cells[12].Text.ToString()).Selected = true;
            organ.SelectedIndex = -1;
            organ.Items.FindByText(GridView1.Rows[num].Cells[13].Text.ToString()).Selected = true;
            txtlocation.Text = GridView1.Rows[num].Cells[14].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[14].Text.ToString();
            txtnumber.Text = GridView1.Rows[num].Cells[15].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[15].Text.ToString();
            txtaddress.Text = GridView1.Rows[num].Cells[16].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[16].Text.ToString();
            txtnumberofpage.Text = GridView1.Rows[num].Cells[17].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[17].Text.ToString();
            txtformat.Text = GridView1.Rows[num].Cells[18].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[18].Text.ToString();
            txtnote.Text = GridView1.Rows[num].Cells[19].Text.ToString() == "&nbsp;" ? "" : GridView1.Rows[num].Cells[19].Text.ToString();
            Session["journalid"] = GridView1.Rows[num].Cells[20].Text.ToString();
        }
        
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
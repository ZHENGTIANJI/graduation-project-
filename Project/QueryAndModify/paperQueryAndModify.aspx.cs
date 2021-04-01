using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class QueryAndModify_paperQueryAndModify : dropdownlist
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["uid"] == null || (int)Session["uid"] != 0)
        {
            Response.Redirect("../login1.aspx");
        }
        if (!IsPostBack)
        {
            String strmajor = "";
            String strpapertype = "";
            String strpapername = papername.Text.ToString().Trim();

            DataSet dst = new DataSet();
            SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [dabian_dt], [xuezhi], [format],[write_dt],[zhicheng],[adviser], [location], [stock_dt], [number], [name], [ptname], [mname], [QR_code], [class_number],[shenhe],[direction], [author], [status], [note], [lname] FROM [paper] left join paper_type on paper.paper_type_id=paper_type.ptid left join major on paper.major_id=major.mid left join language on paper.language=language.lid where is_delete=0 and name like '%" + strpapername + "%' and mname like '%" + strmajor + "%' and ptname like '%" + strpapertype + "%' and shenhe='已审核'", cnn);
            adpt.Fill(dst);
            GridView1.DataSource = dst.Tables[0];
            GridView1.DataBind();
            setpapertypedropdownlist(papertype);
            setmajordropdownlist(majortype);
        }
        
    }
    void ExecuteQuery()
    {
        String strmajor = majortype.SelectedItem.Text.ToString();
        String strpapertype = papertype.SelectedItem.Text.ToString();
        String strpapername = papername.Text.ToString().Trim();

        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        if(papertype.SelectedItem.Value=="全部"&&majortype.SelectedItem.Value=="全部"){
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [dabian_dt], [xuezhi], [format],[write_dt],[zhicheng],[adviser], [location], [stock_dt], [number], [name], [ptname], [mname], [QR_code], [class_number],[shenhe],[direction], [author], [status], [note], [lname] FROM [paper] left join paper_type on paper.paper_type_id=paper_type.ptid left join major on paper.major_id=major.mid left join language on paper.language=language.lid where is_delete=0 and name like '%" + strpapername + "%' and mname like '%" + "" + "%' and ptname like '%" + "" + "%' and shenhe='已审核'", cnn);
            adpt.Fill(dst);
        }else if(papertype.SelectedItem.Value=="全部"){
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [dabian_dt], [xuezhi], [format],[write_dt],[zhicheng],[adviser], [location], [stock_dt], [number], [name], [ptname], [mname], [QR_code], [class_number],[shenhe],[direction], [author], [status], [note], [lname] FROM [paper] left join paper_type on paper.paper_type_id=paper_type.ptid left join major on paper.major_id=major.mid left join language on paper.language=language.lid where is_delete=0 and name like '%" + strpapername + "%' and mname like '%" + strmajor + "%' and ptname like '%" + "" + "%' and shenhe='已审核'", cnn);
            adpt.Fill(dst);
        }
        else if (majortype.SelectedItem.Value == "全部")
        {
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [dabian_dt], [xuezhi], [format],[write_dt],[zhicheng],[adviser], [location], [stock_dt], [number], [name], [ptname], [mname], [QR_code], [class_number],[shenhe],[direction], [author], [status], [note], [lname] FROM [paper] left join paper_type on paper.paper_type_id=paper_type.ptid left join major on paper.major_id=major.mid left join language on paper.language=language.lid where is_delete=0 and name like '%" + strpapername + "%' and mname like '%" + "" + "%' and ptname like '%" + strpapertype + "%' and shenhe='已审核'", cnn);
            adpt.Fill(dst);

        }else{
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [dabian_dt], [xuezhi], [format],[write_dt],[zhicheng],[adviser], [location], [stock_dt], [number], [name], [ptname], [mname], [QR_code], [class_number],[shenhe],[direction], [author], [status], [note], [lname] FROM [paper] left join paper_type on paper.paper_type_id=paper_type.ptid left join major on paper.major_id=major.mid left join language on paper.language=language.lid where is_delete=0 and name like '%" + strpapername + "%' and mname like '%" + strmajor + "%' and ptname like '%" + strpapertype + "%' and shenhe='已审核'", cnn);
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
    protected void query_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        DataSet dst5 = new DataSet();

        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptdt = new SqlDataAdapter("select ptid from paper_type where ptname='" + pt.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + mj.SelectedItem.Text + "'", cnn);
        //SqlDataAdapter adptorgan = new SqlDataAdapter("select organid from organization where organname='" + organ.SelectedItem.Value + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        //SqlDataAdapter adptgrade = new SqlDataAdapter("select gid from journal_grade where gradename='" + grade.SelectedItem.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptdt.Fill(dst1);
        adptmajor.Fill(dst2);
        //adptorgan.Fill(dst3);
        adptlanguage.Fill(dst4);
        //adptgrade.Fill(dst5);
        int ptid = (int)dst1.Tables[0].Rows[0]["ptid"];
        String majorid = dst2.Tables[0].Rows[0]["mid"].ToString();
        //int or = (int)dst3.Tables[0].Rows[0]["organid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        //int gid = (int)dst5.Tables[0].Rows[0]["gid"];
        int id = Convert.ToInt32(Session["paperid"]);
        try
        {
            String stockdt = stock_year.Text + "-" + stock_month.Text + "-" + stock_day.Text;
            String writedt = write_year.Text + "-" + write_month.Text + "-" + write_day.Text;
            String dbdt = db_year.Text + "-" + db_month.Text + "-" + db_day.Text;
            cmd.CommandText = "update paper set name='" + txtname.Text + "',zhicheng='" + zhicheng.SelectedItem.Text + "',shenhe='" + shenhe.SelectedItem.Text + "',paper_type_id='" + ptid + "',major_id='" + majorid + "',QR_code='" + txtQR.Text + "',write_dt='" + writedt + "',xuezhi='" + xuezhi.SelectedItem.Text + "',dabian_dt='" + dbdt + "',adviser='" + txtadviser.Text + "',direction='" + txtdirection.Text + "',stock_dt='" + stockdt + "',class_number='" + txtcn.Text + "',number='" + txtnumber.Text + "',location='" + txtlocation.Text + "',status='" + status.SelectedItem.Text + "',format='" + txtformat.Text + "',number_of_page='" + int.Parse(txtnumberofpage.Text) + "',language='" + lid + "',note='" + txtnote.Text + "' where id='" + id + "'";
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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int num = e.RowIndex;
        if (GridView1.Rows[0].Cells[0].Text.ToString() != GridView1.Rows[0].Cells[2].Text.ToString() && GridView1.Rows[0].Cells[2].Text.ToString() != GridView1.Rows[0].Cells[1].Text.ToString())
        {
            txtname.Text = GridView1.Rows[num].Cells[0].Text.ToString();
            pt.SelectedIndex = -1;
            pt.Items.FindByText(GridView1.Rows[num].Cells[1].Text.ToString()).Selected = true;
            txtauthor.Text = GridView1.Rows[num].Cells[2].Text.ToString();
            xuezhi.SelectedIndex = -1;
            xuezhi.Items.FindByText(GridView1.Rows[num].Cells[3].Text.ToString()).Selected = true;
            mj.SelectedIndex = -1;
            mj.Items.FindByText(GridView1.Rows[num].Cells[4].Text.ToString()).Selected = true;
            txtdirection.Text = GridView1.Rows[num].Cells[5].Text.ToString();
            stock_year.Text = GridView1.Rows[num].Cells[6].Text.ToString().Substring(0, 4);
            stock_month.Text = GridView1.Rows[num].Cells[6].Text.ToString().Substring(5, 2);
            stock_day.Text = GridView1.Rows[num].Cells[6].Text.ToString().Substring(8, 2);
            txtQR.Text = GridView1.Rows[num].Cells[7].Text.ToString();
            txtlocation.Text = GridView1.Rows[num].Cells[8].Text.ToString();
            status.SelectedIndex = -1;
            status.Items.FindByText(GridView1.Rows[num].Cells[9].Text.ToString()).Selected = true;
            txtadviser.Text = GridView1.Rows[num].Cells[10].Text.ToString();
            zhicheng.SelectedIndex = -1;
            zhicheng.Items.FindByText(GridView1.Rows[num].Cells[11].Text.ToString()).Selected = true;
            db_year.Text = GridView1.Rows[num].Cells[12].Text.ToString().Substring(0, 4);
            db_month.Text = GridView1.Rows[num].Cells[12].Text.ToString().Substring(5, 2);
            db_day.Text = GridView1.Rows[num].Cells[12].Text.ToString().Substring(8, 2);
            txtcn.Text = GridView1.Rows[num].Cells[13].Text.ToString();
            shenhe.SelectedIndex = -1;
            shenhe.Items.FindByText(GridView1.Rows[num].Cells[14].Text.ToString()).Selected = true;
            write_year.Text = GridView1.Rows[num].Cells[15].Text.ToString().Substring(0, 4);
            write_month.Text = GridView1.Rows[num].Cells[15].Text.ToString().Substring(5, 2);
            write_day.Text = GridView1.Rows[num].Cells[15].Text.ToString().Substring(8, 2);
            language.SelectedIndex = -1;
            language.Items.FindByText(GridView1.Rows[num].Cells[16].Text.ToString()).Selected = true;
            txtformat.Text = GridView1.Rows[num].Cells[17].Text.ToString();
            txtnumberofpage.Text = GridView1.Rows[num].Cells[18].Text.ToString();
            txtnumber.Text = GridView1.Rows[num].Cells[19].Text.ToString();
            txtnote.Text = GridView1.Rows[num].Cells[20].Text.ToString();
            Session["paperid"] = GridView1.Rows[num].Cells[21].Text.ToString();
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
    protected void export_Click1(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count > 0)
        {
            //调用导出方法  
            GridView1.AllowPaging = false;
            GridView1.AllowSorting = false;
            ExecuteQuery();
            ToExcel(GridView1, DateTime.Now.ToShortDateString() + ".xls");
            GridView1.AllowPaging = true;
            GridView1.AllowSorting = true;
            ExecuteQuery();
        }
        else
        {
            // obo.Common.MessageBox.Show(this, "没有数据可导出，请先查询数据!");
        }
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
    public override void VerifyRenderingInServerForm(Control control)
    {
        // Confirms that an HtmlForm control is rendered for
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class QueryAndModify_dataQueryAndModify : dropdownlist
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
            String strdatatype = "";
            String strdataname = dataname.Text.ToString().Trim();
            DataSet dst = new DataSet();
            SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [compile_dt], [unit], [format], [location], [stock_dt], [number], [name], [dtname], [mname], [QR_code], [class_number], [author], [status], [note], [lname] FROM [data] left join data_type on data.data_type_id=data_type.dtid left join major on data.major_id=major.mid left join language on data.language=language.lid where is_delete=0 and name like '%" + strdataname + "%' and mname like '%" + strmajor + "%' and dtname like '%" + strdatatype + "%'", cnn);
            adpt.Fill(dst);
            GridView1.DataSource = dst.Tables[0];
            GridView1.DataBind();
            setmajordropdownlist(majortype);
            setdatatypedropdownlist(datatype);
        }
        user.Text = "当前用户:" + Session["name"].ToString();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int num = e.RowIndex;
        if (GridView1.Rows[0].Cells[0].Text.ToString() != GridView1.Rows[0].Cells[2].Text.ToString() && GridView1.Rows[0].Cells[2].Text.ToString() != GridView1.Rows[0].Cells[1].Text.ToString())
        {
            txtname.Text = GridView1.Rows[num].Cells[0].Text.ToString();
            dt.SelectedIndex = -1;
            dt.Items.FindByText(GridView1.Rows[num].Cells[1].Text.ToString()).Selected = true;
            txtQR.Text = GridView1.Rows[num].Cells[2].Text.ToString();
            txtunit.Text = GridView1.Rows[num].Cells[3].Text.ToString();
            stock_year.Text = GridView1.Rows[num].Cells[4].Text.ToString().Substring(0, 4);
            stock_month.Text = GridView1.Rows[num].Cells[4].Text.ToString().Substring(5, 2);
            stock_day.Text = GridView1.Rows[num].Cells[4].Text.ToString().Substring(8, 2);
            txtlocation.Text = GridView1.Rows[num].Cells[5].Text.ToString();
            txtnumber.Text = GridView1.Rows[num].Cells[6].Text.ToString();
            txtcn.Text = GridView1.Rows[num].Cells[7].Text.ToString();
            language.SelectedIndex = -1;
            language.Items.FindByText(GridView1.Rows[num].Cells[8].Text.ToString()).Selected = true;
            write_year.Text = GridView1.Rows[num].Cells[9].Text.ToString().Substring(0, 4);
            write_month.Text = GridView1.Rows[num].Cells[9].Text.ToString().Substring(5, 2);
            write_day.Text = GridView1.Rows[num].Cells[9].Text.ToString().Substring(8, 2);
            txtformat.Text = GridView1.Rows[num].Cells[10].Text.ToString();
            txtnumberofpage.Text = GridView1.Rows[num].Cells[11].Text.ToString();
            txtauthor.Text = GridView1.Rows[num].Cells[12].Text.ToString();
            major.SelectedIndex = -1;
            major.Items.FindByText(GridView1.Rows[num].Cells[13].Text.ToString()).Selected = true;
            status.SelectedIndex = -1;
            status.Items.FindByText(GridView1.Rows[num].Cells[14].Text.ToString()).Selected = true;
            txtnote.Text = GridView1.Rows[num].Cells[15].Text.ToString();
            Session["dataid"] = GridView1.Rows[num].Cells[16].Text.ToString();
        }
        
    }
    protected void query_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }
    void ExecuteQuery()
    {
        String strmajor = majortype.SelectedItem.Text.ToString();
        String strdatatype = datatype.SelectedItem.Text.ToString();
        String strdataname = dataname.Text.ToString().Trim();

        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        if(datatype.SelectedItem.Value=="全部"&&majortype.SelectedItem.Value=="全部"){
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [compile_dt], [unit], [format], [location], [stock_dt], [number], [name], [dtname], [mname], [QR_code], [class_number], [author], [status], [note], [lname] FROM [data] left join data_type on data.data_type_id=data_type.dtid left join major on data.major_id=major.mid left join language on data.language=language.lid where is_delete=0 and name like '%" + strdataname + "%' and mname like '%" + "" + "%' and dtname like '%" + "" + "%'", cnn);
            adpt.Fill(dst);
        }else if(datatype.SelectedItem.Value=="全部"){
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [compile_dt], [unit], [format], [location], [stock_dt], [number], [name], [dtname], [mname], [QR_code], [class_number], [author], [status], [note], [lname] FROM [data] left join data_type on data.data_type_id=data_type.dtid left join major on data.major_id=major.mid left join language on data.language=language.lid where is_delete=0 and name like '%" + strdataname + "%' and mname like '%" + strmajor + "%' and dtname like '%" + "" + "%'", cnn);
            adpt.Fill(dst);
        }
        else if (majortype.SelectedItem.Value == "全部")
        {
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [compile_dt], [unit], [format], [location], [stock_dt], [number], [name], [dtname], [mname], [QR_code], [class_number], [author], [status], [note], [lname] FROM [data] left join data_type on data.data_type_id=data_type.dtid left join major on data.major_id=major.mid left join language on data.language=language.lid where is_delete=0 and name like '%" + strdataname + "%' and mname like '%" + "" + "%' and dtname like '%" + strdatatype + "%'", cnn);
            adpt.Fill(dst);
        }else{
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [compile_dt], [unit], [format], [location], [stock_dt], [number], [name], [dtname], [mname], [QR_code], [class_number], [author], [status], [note], [lname] FROM [data] left join data_type on data.data_type_id=data_type.dtid left join major on data.major_id=major.mid left join language on data.language=language.lid where is_delete=0 and name like '%" + strdataname + "%' and mname like '%" + strmajor + "%' and dtname like '%" + strdatatype + "%'", cnn);
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
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptdt = new SqlDataAdapter("select dtid from data_type where dtname='" + dt.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptdt.Fill(dst1);
        adptmajor.Fill(dst2);
        adptlanguage.Fill(dst4);
        int dtid = (int)dst1.Tables[0].Rows[0]["dtid"];
        String majorid = dst2.Tables[0].Rows[0]["mid"].ToString();
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        int id = Convert.ToInt32(Session["dataid"]);
        try
        {
            String stockdt = stock_year.Text + "-" + stock_month.Text + "-" + stock_day.Text;
            String writekdt = write_year.Text + "-" + write_month.Text + "-" + write_day.Text;
            cmd.CommandText = "update data set name='" + txtname.Text + "',data_type_id='" + dtid + "',major_id='" + majorid + "',QR_code='" + txtQR.Text + "',unit='" + txtunit.Text + "',compile_dt='" + writekdt + "',author='" + txtauthor.Text + "',stock_dt='" + stockdt + "',class_number='" + txtcn.Text + "',number='" + txtnumber.Text + "',location='" + txtlocation.Text + "',status='" + status.SelectedItem.Text + "',format='" + txtformat.Text + "',number_of_page='" + int.Parse(txtnumberofpage.Text) + "',language='" + lid + "',note='" + txtnote.Text + "' where id='" + id + "'";
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
}
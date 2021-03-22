using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class QueryAndModify_paperQueryAndModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*if (Session["uid"] == null || (int)Session["uid"] != 0)
        {
            Response.Redirect("../login.aspx");
        }*/

        if (!IsPostBack)
        {
            /*ListItem pt = new ListItem();
            pt.Value = "全部";
            pt.Text = "全部";
            this.papertype.Items.Add(pt);
            ListItem major = new ListItem();
            major.Value = "全部";
            major.Text = "全部";
            this.majortype.Items.Add(major);*/
            DataSet dst = new DataSet();
            SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [dabian_dt], [xuezhi], [format],[write_dt],[zhicheng],[adviser], [location], [stock_dt], [number], [name], [ptname], [mname], [QR_code], [class_number],[shenhe],[direction], [author], [status], [note], [lname] FROM [paper] left join paper_type on paper.paper_type_id=paper_type.ptid left join major on paper.major_id=major.mid left join language on paper.language=language.lid where shenhe='待审核'", cnn);
            adpt.Fill(dst);
            GridView1.DataSource = dst.Tables[0];
            GridView1.DataBind();
        }

        
    }
    void ExecuteQuery()
    {
        String strmajor = majortype.SelectedItem.Text.ToString();
        String strpapertype = papertype.SelectedItem.Text.ToString();
        String strpapername = papername.Text.ToString().Trim();

        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [dabian_dt], [xuezhi], [format],[write_dt],[zhicheng],[adviser],  [stock_dt], [number], [name], [ptname], [mname],[shenhe],[direction], [author], [status], [note], [lname] FROM [paper] left join paper_type on paper.paper_type_id=paper_type.ptid left join major on paper.major_id=major.mid left join language on paper.language=language.lid where name like '%" + strpapername + "%' and mname like '%" + strmajor + "%' and ptname like '%" + strpapertype + "%' and shenhe='待审核'", cnn);
        adpt.Fill(dst);
        GridView1.DataSource = dst.Tables[0];
        GridView1.DataBind();
    }
    protected void query_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Session["paperid"] = GridView1.Rows[e.RowIndex].Cells[21].Text.ToString();

        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlCommand cmd = cnn.CreateCommand();
        int id = Convert.ToInt32(Session["paperid"]);
        try
        {
 	        TextBox tbqr = (TextBox)GridView1.Rows[e.RowIndex].Cells[0].FindControl("txtQR");
            TextBox tbcn = (TextBox)GridView1.Rows[e.RowIndex].Cells[8].FindControl("txtcn");
            TextBox tblocation = (TextBox)GridView1.Rows[e.RowIndex].Cells[13].FindControl("txtlocation");
            String QR = tbqr.Text.ToString();
            String cn = tbcn.Text.ToString();
            String location = tblocation.Text.ToString();
            cmd.CommandText = "update paper set QR_code='" + QR + "',class_number='" + cn + "',shenhe='" + "已审核" + "',location='" + location  + "' where id='" + id + "'";
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('审核失败！');", true);
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
}
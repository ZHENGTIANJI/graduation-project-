using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class stockmanagement_journalstock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["class"] == null || (int)Session["class"] != 0)
        {
            Response.Redirect("../login1.aspx");
        }
        user.Text = "当前用户:" + Session["name"].ToString();
        GridView1.RowStyle.Wrap = false;
        if (!IsPostBack)
        {
            ExecuteQuery();
        }
    }
    void ExecuteQuery()
    {
      
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [office_name], [period_type],[period_number], [address],[format], [location], [stock_dt], [number], [name],[publish_dt], [jtname], [mname], [QR_code], [class_number],[organname], [status], [note], [lname],[gradename] FROM [journal] left join journal_grade on journal.gradeid=journal_grade.gid left join organization on journal.organizationid=organization.organid left join journal_type on journal.journal_type_id=journal_type.jtid left join major on journal.major_id=major.mid left join language on journal.language=language.lid where is_delete=0 and stock_dt>='" + DateTime.Now.ToString("yyyy-MM-dd") + "'", cnn);
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
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        DataSet dst5 = new DataSet();
        DataSet dst6 = new DataSet();
        DataSet dst7 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptjt = new SqlDataAdapter("select jtid from journal_type where jtname='" + jt.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptjournalgrade = new SqlDataAdapter("select gid from journal_grade where gradename='" + grade.SelectedItem.Value + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptnum = new SqlDataAdapter("select number from journal where name='" + txtname.Text + "'", cnn);
        SqlDataAdapter adptorgan = new SqlDataAdapter("select organid from organization where organname='" + organ.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptgrade = new SqlDataAdapter("select gid from journal_grade where gradename='" + grade.SelectedItem.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptjt.Fill(dst1);
        adptmajor.Fill(dst2);
        adptjournalgrade.Fill(dst3);
        adptlanguage.Fill(dst4);
        adptnum.Fill(dst5);
        adptorgan.Fill(dst6);
        adptgrade.Fill(dst7);
        int jtid = (int)dst1.Tables[0].Rows[0]["jtid"];
        String majorid = dst2.Tables[0].Rows[0]["mid"].ToString();
        int grade1 = (int)dst3.Tables[0].Rows[0]["gid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        int organid = (int)dst6.Tables[0].Rows[0]["organid"];
        int gid = (int)dst7.Tables[0].Rows[0]["gid"];
        int num;
        if (dst5.Tables[0].Rows.Count > 0)
        {
            num = (int)dst5.Tables[0].Rows[0]["number"] + 1;
            cmd.CommandText = "update journal set number='" + num + "' where name='" + txtname.Text + "'";
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }
        else
        {
            num = 1;
        }
        if (txtname.Text == "" || txtQR.Text == "" )
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('期刊名称或二维码编码不能为空！');", true);
        }
        else
        {
            String stockdt = DateTime.Now.ToString("yyyy-MM-dd");
            cmd.CommandText = "INSERT INTO journal(name, journal_type_id, major_id, QR_code, publish_dt, office_name, period_number, stock_dt, location, class_number, status, number, format, number_of_page,language,note,organizationid,period_type,address,gradeid) VALUES ('" + txtname.Text + "'," + jtid + "," + majorid + ",'" + txtQR.Text + "','" + pub_year.Text+"-"+pub_month.Text+"-"+pub_day.Text + "','" + txtoffname.Text + "','" + txtpn.Text + "','" + stockdt + "','" + txtlocation.Text + "','" + txtcn.Text + "','库存'," + num + ",'" + txtformat.Text + "','" + txtnumberofpage.Text + "'," + lid + ",'" + txtnote.Text + "','" + organid  + "','" + period.SelectedItem.Value + "','" + txtaddress.Text + "','" + gid + "')";
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('保存成功！');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('请输入正确的日期格式或页数！');", true);
            }
            
            
            
        }
        ExecuteQuery();
        
    }
    protected void btclear_Click(object sender, EventArgs e)
    {
        txtname.Text = "";
        txtQR.Text = "";
        txtaddress.Text = "";
        pub_year.Text = "";
        pub_month.Text = "";
        pub_day.Text = "";
        txtprice.Text = "";
        txtcn.Text = "";
        txtlocation.Text = "";
        txtformat.Text = "";
        txtnumberofpage.Text = "";
        txtnote.Text = "";
        txtoffname.Text = "";
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
    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("../login1.aspx");
    }
}
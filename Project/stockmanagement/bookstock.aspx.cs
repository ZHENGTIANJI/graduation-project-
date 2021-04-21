using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class bookstock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["class"] == null || (int)Session["class"] != 0)
        {
            Response.Redirect("../login1.aspx");
        }
        GridView1.RowStyle.Wrap = false;
        if (!IsPostBack)
        {
            ExecuteQuery();
        }
        
        user.Text = "当前用户:" + Session["name"].ToString();
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        DataSet dst5 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptbt = new SqlDataAdapter("select btid from book_type where btname='"+bt.SelectedItem.Text+"'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major1.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptbindingtype = new SqlDataAdapter("select bitid from binding_type where bitname='" + bindingtype.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptnum = new SqlDataAdapter("select number from book where name='"+txtname.Text+"'", cnn);
        
        SqlCommand cmd = cnn.CreateCommand();
        adptbt.Fill(dst1);
        adptmajor.Fill(dst2);
        adptbindingtype.Fill(dst3);
        adptlanguage.Fill(dst4);
        adptnum.Fill(dst5);
        int btid = (int)dst1.Tables[0].Rows[0]["btid"];
        String majorid = dst2.Tables[0].Rows[0]["mid"].ToString();
        int bitid = (int)dst3.Tables[0].Rows[0]["bitid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        int num;
        if (dst5.Tables[0].Rows.Count > 0)
        {
            num = (int)dst5.Tables[0].Rows[0]["number"]+1;
            cmd.CommandText = "update book set number='" + num + "' where name='" + txtname.Text + "'";
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }
        else
        {
            num = 1;
        }
        /*string s=txtpub.Text.ToString();
        DataSet dstpub = new DataSet();
        SqlDataAdapter adptpub = new SqlDataAdapter("select count(*) from publisher where name='"+s+"'", cnn);
        adptpub.Fill(dstpub);
        string ss = dstpub.Tables[0].Rows[0][0].ToString();
        if (ss=="0")
        {
            cmd.CommandText = "insert into publisher(name) values('"+s+"')";
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }
        */
        if(txtname.Text==""||txtQR.Text==""){
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('图书名称或二维码不能为空！');", true);
        }else{
            String stockdt = DateTime.Now.ToString("yyyy-MM-dd");
            cmd.CommandText = "INSERT INTO book(name, book_type_id, major_type_id, QR_code, publisher, publish_dt, author, stock_dt, teacher, CD, location, book_number, status, number, format, price, number_of_page, binding_type_id,language,note) VALUES ('" + txtname.Text + "'," + btid + "," + majorid + ",'"+txtQR.Text+"','"+txtpub.Text.ToString()+"','"+pub_year.Text+"-"+pub_month.Text+"-"+pub_day.Text+"','"+txtauthor.Text+"','"+stockdt+"','"+txtteacher.Text+"','"+CD.SelectedItem.Text+"','"+txtlocation.Text+"','"+txtbooknumber.Text+"',0,"+num+",'"+txtformat.Text+"','"+txtprice.Text+"','"+txtnumberofpage.Text+"',"+bitid+","+lid+",'"+txtnote.Text+"')";
            try {
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
        pub_year.Text = "";
        pub_month.Text = "";
        pub_day.Text = "";
        txtprice.Text = "";
        txtauthor.Text = "";
        txtteacher.Text = "";
        txtlocation.Text = "";
        txtbooknumber.Text = "";
        txtformat.Text = "";
        txtnumberofpage.Text = "";
        txtnote.Text = "";

;    }
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
    void ExecuteQuery()
    {

        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");

        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [book_number], [CD], [format], [location], [stock_dt], [teacher], [number], [name], [btname], [mname], [QR_code], [publisher], [publish_dt], [author], [price], [status], [note], [lname], [bitname] FROM [book] left join book_type on book.book_type_id=book_type.btid left join major on book.major_type_id=major.mid left join language on book.language=language.lid left join binding_type on book.binding_type_id=binding_type.bitid where is_delete=0 and stock_dt>='" + DateTime.Now.ToString("yyyy-MM-dd") + "'", cnn);
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
    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("../login1.aspx");
    }
}
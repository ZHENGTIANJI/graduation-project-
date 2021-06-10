using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

public partial class managers_user_manage_insertt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Fill_dpc();
            Fill_dpclas();
            Fill_dpg();
            Fill_dpm();
           
            if(Request.QueryString["id"]!=null)
            {
                string id = Request.QueryString["id"];
                //页面显示数据
                SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
                SqlDataAdapter adp = new SqlDataAdapter("select psw,user_class,name,sex,cid,mid,grade,class,telephone,email from users left join major on major.mid=users.major where id='"+id+"'", cnn);
                DataSet ds = new DataSet();
                adp.Fill(ds);

                txtpsw.Text = ds.Tables[0].Rows[0]["psw"].ToString();
                txtn.Text = ds.Tables[0].Rows[0]["name"].ToString();
                txtid.Text = id;
                txtid.Enabled = false;
                txtphone.Text = ds.Tables[0].Rows[0]["telephone"].ToString();
                txtemail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                dpsex.SelectedItem.Text = ds.Tables[0].Rows[0]["sex"].ToString();
                dputy.SelectedValue = ds.Tables[0].Rows[0]["user_class"].ToString();
                //dputy.Enabled = false;
                dpc.SelectedValue = ds.Tables[0].Rows[0]["cid"].ToString();
                dpcla.SelectedValue = ds.Tables[0].Rows[0]["class"].ToString();
                dpg.SelectedValue = ds.Tables[0].Rows[0]["grade"].ToString();                
                dpm.SelectedValue = ds.Tables[0].Rows[0]["mid"].ToString();

            }
        }
    }
    protected void dpc_SelectedIndexChanged(object sender, EventArgs e)
    {
        Fill_dpm();
    }

    /// <summary>
    /// 向dropdownlist添加年级
    /// </summary>
    private void Fill_dpg()
    {
        ArrayList grade = new ArrayList();
        int year = Convert.ToInt32(DateTime.Now.Year.ToString());
        while (year >= 2000)
        {
            grade.Add(year + "级");
            year--;
        };
        dpg.DataSource = grade;
        dpg.DataBind();
        dpg.Items.Insert(0, "请选择");
        dpg.SelectedIndex = 0;
    }

    /// <summary>
    /// //向dropdownlist添加班级
    /// </summary>
    private void Fill_dpclas()
    {
        ArrayList clas = new ArrayList();
        for (int i = 1; i <= 10; i++)
        {
            clas.Add(i + "班");
        }
        dpcla.DataSource = clas;
        dpcla.DataBind();
        dpcla.Items.Insert(0, "请选择");
        dpcla.SelectedIndex = 0;
    }
    
    /// <summary>
    /// 向dropdownlist添加学院
    /// </summary>
    private void Fill_dpc()
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp0 = new SqlDataAdapter("select cid,cn from campus", cnn);
        DataTable dt = new DataTable();
        adp0.Fill(dt);
        dpc.Items.Clear();
        dpc.DataSource = dt;
        dpc.DataTextField = "cn";
        dpc.DataValueField = "cid";
        dpc.DataBind();
    }

    /// <summary>
    /// 向dropdownlist添加专业
    /// </summary>
    private void Fill_dpm()
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp1 = new SqlDataAdapter("select mid,mname from major where cid='" + dpc.SelectedValue + "'", cnn);
        DataTable dt1 = new DataTable();
        adp1.Fill(dt1);
        dpm.Items.Clear();
        dpm.DataSource = dt1;
        dpm.DataTextField = "mname";
        dpm.DataValueField = "mid";
        dpm.DataBind();
    }

    protected void btok_Click(object sender, EventArgs e)
    {
        if (txtemail.Text.Trim() != "" && txtid.Text.Trim() != "" && txtn.Text.Trim() != "" && txtphone.Text.Trim() != "" && txtpsw.Text.Trim() != "")
        {
            string id = txtid.Text, psw = txtpsw.Text, name = txtn.Text, email = txtemail.Text, telephone = txtphone.Text;
            string cla = dputy.SelectedItem.Value, sex = dpsex.SelectedItem.Text, campus = dpc.SelectedItem.Value, major = dpm.SelectedItem.Value, clas = dpcla.SelectedItem.Value, grade = dpg.SelectedItem.Value;
            clas = clas == "请选择" ? null : clas;
            grade = grade == "请选择" ? null : grade;

            SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cnn.Open();

            if (Request.QueryString["id"] == null)
            {
                if (!havethisid(id))
                {
                    cmd.CommandText = "insert into users(id,psw,user_class,name,sex,major,telephone,email,grade,class,shenhe) values('" + id + "','" + psw + "','" + cla + "','" + name + "','" + sex + "','" + major + "','" + telephone + "','" + email + "','" + grade + "','" + clas + "',1)";
                    cmd.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('增加成功！');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该用户已存在！');", true);
                }
            }
            else
            {
                cmd.CommandText = "update users set user_class='" + cla + "',psw='" + psw + "',name='" + name + "',sex='" + sex + "',major='" + major + "',telephone='" + telephone + "',email='" + email + "',grade='" + grade + "',class='" + clas + "' where id='" + id + "'";
                cmd.ExecuteNonQuery();

                Response.Redirect("edit.aspx");

            }
            cnn.Close();
        }
        else
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('请输入完整信息！');", true);
    }

    /// <summary>
    /// 判断是否存在该用户
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    private bool havethisid(string id)
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select * from users where id='" + id + "'", cnn);
        DataSet ds = new DataSet();

        adp.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
            return true;
        else
            return false;
    }
    protected void btcancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("edit.aspx");
    }
}
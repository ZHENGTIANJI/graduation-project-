using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;
using System.Data;

public partial class enrol : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            UtyBind();
            CBind();
            MBind();
            SexBind();
            
            //向dropdownlist添加年级
            ArrayList grade = new ArrayList();
            int year=Convert.ToInt32(DateTime.Now.Year.ToString());
            int YearS = year - 4;
            while(year>=YearS)
            {
                grade.Add(year + "级");
                year--;
            }
            dpg.DataSource = grade;
            dpg.DataBind();
            dpg.Items.Insert(0, "请选择");

            //向dropdownlist添加班级
            ArrayList clas=new ArrayList();
            for(int i=1;i<=10;i++)
            {
                clas.Add(i + "班");
            }
            dpclass.DataSource = clas;
            dpclass.DataBind();
            dpclass.Items.Insert(0, "请选择");
        }
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        string id = txtid.Text, psw = txtpsw.Text, name = txtn.Text, email = txtemail.Text, telephone = txtphone.Text;
        string cla = dput.SelectedItem.Value;
        if (IsComplete())
        {
            try
            {
                if (txtpsw.Text == txtpsw2.Text)
                {
                    SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cnn;
                    cnn.Open();

                    cmd.CommandText = "insert into users(id,psw,user_class,name,sex,major,grade,class,telephone,email) values('" + id + "','" + psw + "','" + cla + "','" + name + "','" + dpsex.SelectedItem.Text + "','" + dpm.SelectedItem.Value + "','" + dpg.SelectedItem.Text + "','" + dpclass.SelectedItem.Text + "','" + telephone + "','" + email + "')";
                    cmd.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('注册成功，等待管理员审核');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('两次输入密码不同！');", true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该用户名已存在！');", true);
            }
        }
        else
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('请输入完整信息！');", true);
    }
    //绑定用户类型
    private void UtyBind()
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select * from user_class where user_class!='管理员'", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        dput.DataSource = ds.Tables[0].DefaultView;
        dput.DataValueField = "utid";
        dput.DataTextField = "user_class";
        dput.DataBind();
    }

    //绑定学院
    private void CBind()
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select * from campus", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        dpc.DataSource = ds.Tables[0].DefaultView;
        dpc.DataValueField = "cid";
        dpc.DataTextField = "cn";
        dpc.DataBind();
    }

    //绑定专业
    private void MBind()
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select * from major where cid='"+dpc.SelectedItem.Value+"'", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        dpm.DataSource = ds.Tables[0].DefaultView;
        dpm.DataValueField = "mid";
        dpm.DataTextField = "mname";
        dpm.DataBind();
    }

    //绑定性别
    private void SexBind()
    {
        dpsex.Items.Clear();
        dpsex.Items.Add(new ListItem("男", "0"));
        dpsex.Items.Add(new ListItem("女", "1"));
    }

    protected void dpc_SelectedIndexChanged(object sender, EventArgs e)
    {
        MBind();
    }
    //判断输入信息是否完整
    private bool IsComplete()
    {
        if (txtemail.Text.Trim() == "" || txtid.Text.Trim() == "" || txtn.Text.Trim() == "" || txtphone.Text.Trim() == "" || txtpsw.Text.Trim() == "" || txtpsw2.Text.Trim() == "")
            return false;
        else
            return true;
    }
}
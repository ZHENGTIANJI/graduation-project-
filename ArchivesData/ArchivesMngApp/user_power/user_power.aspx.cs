using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class user_power_user_power : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LoadUtype();
            MakeMenu();
        }
    }

    //加载角色类型
    private void LoadUtype()
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select * from user_class", cnn);
        DataTable dt = new DataTable();
        adp.Fill(dt);

        dputy.DataSource = dt;
        dputy.DataTextField = "user_class";
        dputy.DataValueField = "utid";
        dputy.DataBind();
        dputy.Items.Insert(0, new ListItem("请选择", "0"));

    }

    //初始化菜单
    private void MakeMenu()
    {
        tvpower.Nodes.Clear();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select * from menus where pid='0'",cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        string id, name;
        for(int i=0;i<ds.Tables[0].Rows.Count;i++)
        {
            id = ds.Tables[0].Rows[i]["id"].ToString();
            name = ds.Tables[0].Rows[i]["name"].ToString();
            AddItems(id, name, tvpower.Nodes);
        }
    }
    private void AddItems(string id,string name,TreeNodeCollection col)
    {
        TreeNode tn = new TreeNode();
        tn.Value = id;
        tn.Text = name;
        tn.ShowCheckBox = true; 
        col.Add(tn);

        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select * from menus where pid='"+id+"'", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        for(int i=0;i<ds.Tables[0].Rows.Count;i++)
        {
            id = ds.Tables[0].Rows[i]["id"].ToString();
            name = ds.Tables[0].Rows[i]["name"].ToString();
            AddItems(id,name,tn.ChildNodes);
        }

    }

    //用户类型变化时，下方的权限自动打勾
    private void Refresh()
    {
        MakeMenu();
        if (dputy.SelectedItem.Value != "0")
        {
            SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
            SqlDataAdapter adp = new SqlDataAdapter("select * from user_power where utid='" + dputy.SelectedItem.Value + "'", cnn);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            string id;
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                id = ds.Tables[0].Rows[i]["fid"].ToString();
                TreeNode tn = FindNode(id, tvpower.Nodes);
                if (tn != null)
                    tn.Checked = true;
            }
        }
    }

    private TreeNode FindNode(string id,TreeNodeCollection col)
    {
        TreeNode tn=null;
        for(int i=0;i<col.Count;i++)
        {
            if (col[i].Value == id)
            {
                tn = col[i];
                break;
            }
            else
            {
                tn = FindNode(id,col[i].ChildNodes);
                if(tn!=null)//找到节点退出
                    break;
            }
        }
        return tn;
    }

    protected void btsave_Click(object sender, EventArgs e)
    {
        //删除某用户类别已有权限
        if (dputy.SelectedItem.Value != "0")
        {
            SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("delete user_power where utid='" + dputy.SelectedItem.Value + "'", cnn);
            cmd.ExecuteNonQuery();
            //将新设置权限存入权限表中
            SaveMenu(tvpower.Nodes);
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('修改成功！');", true);
        }
    }
    private void SaveMenu(TreeNodeCollection col)
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        for(int i=0;i<col.Count;i++)
        {
            if(col[i].Checked==true)
            {
                cmd.CommandText = "insert user_power(fid,utid) values('"+col[i].Value+"','"+dputy.SelectedItem.Value+"')";
                cmd.ExecuteNonQuery();
            }
           SaveMenu(col[i].ChildNodes);
        }
    }
    protected void dputy_SelectedIndexChanged(object sender, EventArgs e)
    {
        Refresh();
    }
}
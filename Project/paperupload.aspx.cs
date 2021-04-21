using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient; 
public partial class 首页 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["class"] == null||(int)Session["class"] !=1)
        {
            Response.Redirect("/login1.aspx");
        }
        user.Text = "当前用户:" + Session["name"].ToString();
        if(!IsPostBack){
            chushi();
            check();
        }
        last();
        
        
    }
    protected void check()
    {
        DataSet dst= new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [dabian_dt], [xuezhi], [format],[write_dt],[zhicheng],[adviser], [location], [stock_dt], [name], [ptname], [mname], [QR_code], [class_number],[shenhe],[direction], [author], [status], [note], [lname] FROM [paper] left join paper_type on paper.paper_type_id=paper_type.ptid left join major on paper.major_id=major.mid left join language on paper.language=language.lid where is_delete=0 and user_id='"+Session["id"].ToString()+"'", cnn);
        adpt.Fill(dst);
        if (dst.Tables[0].Rows.Count > 0)
        {
            papertype.SelectedIndex = -1;
            papertype.Items.FindByText(dst.Tables[0].Rows[0]["ptname"].ToString()).Selected = true;
            language.SelectedIndex = -1;
            language.Items.FindByText(dst.Tables[0].Rows[0]["lname"].ToString()).Selected = true;
            xuezhi.SelectedIndex = -1;
            xuezhi.Items.FindByText(dst.Tables[0].Rows[0]["xuezhi"].ToString()).Selected = true;
            zhicheng.SelectedIndex = -1;
            zhicheng.Items.FindByText(dst.Tables[0].Rows[0]["zhicheng"].ToString()).Selected = true;
            write_year.Text = Convert.ToDateTime(dst.Tables[0].Rows[0]["write_dt"]).ToString("yyyy-MM-dd").Substring(0,4);
            write_month.Text = Convert.ToDateTime(dst.Tables[0].Rows[0]["write_dt"]).ToString("yyyy-MM-dd").Substring(5, 2);
            write_day.Text = Convert.ToDateTime(dst.Tables[0].Rows[0]["write_dt"]).ToString("yyyy-MM-dd").Substring(8, 2);
            db_year.Text = Convert.ToDateTime(dst.Tables[0].Rows[0]["dabian_dt"]).ToString("yyyy-MM-dd").Substring(0, 4);
            db_month.Text = Convert.ToDateTime(dst.Tables[0].Rows[0]["dabian_dt"]).ToString("yyyy-MM-dd").Substring(5, 2);
            db_day.Text = Convert.ToDateTime(dst.Tables[0].Rows[0]["dabian_dt"]).ToString("yyyy-MM-dd").Substring(8, 2);
            txtname.Text = dst.Tables[0].Rows[0]["name"].ToString();
            txtdirection.Text = dst.Tables[0].Rows[0]["direction"].ToString();
            txtformat.Text = dst.Tables[0].Rows[0]["format"].ToString();
            txtnumberofpage.Text = dst.Tables[0].Rows[0]["number_of_page"].ToString();
            txtnote.Text = dst.Tables[0].Rows[0]["note"].ToString();
            txtadviser.Text = dst.Tables[0].Rows[0]["adviser"].ToString();
        }
    }
    protected void chushi()
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select ptname from paper_type", cnn);
        adpt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            ListItem mt1 = new ListItem();
            mt1.Value = dst.Tables[0].Rows[i][0].ToString();
            mt1.Text = dst.Tables[0].Rows[i][0].ToString();
            papertype.Items.Add(mt1);
        }
        DataSet dst1 = new DataSet();
        SqlDataAdapter adpt1 = new SqlDataAdapter("select lname from language", cnn);
        adpt1.Fill(dst1);
        for (int i = 0; i < dst1.Tables[0].Rows.Count; i++)
        {
            ListItem mt1 = new ListItem();
            mt1.Value = dst1.Tables[0].Rows[i][0].ToString();
            mt1.Text = dst1.Tables[0].Rows[i][0].ToString();
            language.Items.Add(mt1);
        }
        ListItem mt = new ListItem();
        mt.Value = "四年制";
        mt.Text = "四年制";
        xuezhi.Items.Add(mt);
        ListItem mt3 = new ListItem();
        mt3.Value = "三年制";
        mt3.Text = "三年制";
        xuezhi.Items.Add(mt3);
        ListItem mt2 = new ListItem();
        mt2.Value = "二年制";
        mt2.Text = "二年制";
        xuezhi.Items.Add(mt2);
        ListItem tt = new ListItem();
        tt.Value = "教授";
        tt.Text = "教授";
        xuezhi.Items.Add(tt);
        ListItem tt3 = new ListItem();
        tt3.Value = "副教授";
        tt3.Text = "副教授";
        xuezhi.Items.Add(tt3);
        ListItem tt2 = new ListItem();
        tt2.Value = "讲师";
        tt2.Text = "讲师";
        xuezhi.Items.Add(tt2);
    }
    protected void last()
    {
        DataSet dst1 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptpt = new SqlDataAdapter("select ptid from paper_type where ptname='" + papertype.SelectedItem.Text + "'", cnn);
        DataSet dst5 = new DataSet();
        adptpt.Fill(dst1);
        int ptid = (int)dst1.Tables[0].Rows[0]["ptid"];
        SqlDataAdapter adptnum = new SqlDataAdapter("select id from paper where user_id='" + Session["id"].ToString() + "' and paper_type_id=" + ptid + "", cnn);
        adptnum.Fill(dst5);
        if (dst5.Tables[0].Rows.Count > 0)
        {
            Session["pid"] = dst5.Tables[0].Rows[0]["id"].ToString();
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter("select file_name from file_att where paper_id=" + Convert.ToInt32(Session["pid"]) , cnn);
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string name = ds.Tables[0].Rows[0][0].ToString();
                LinkButton1.Text = "上次上传：" + name;
            }

        }
        
        
    }
    protected void upload_Click(object sender, EventArgs e)
    {
        int i = FileUpload1.FileName.ToString().LastIndexOf(".");
        String subname = FileUpload1.FileName.ToString().Substring(i + 1);
        if (subname == "pdf")
        {
            DataSet dst1 = new DataSet();
            DataSet dst2 = new DataSet();
            DataSet dst3 = new DataSet();
            DataSet dst4 = new DataSet();
            DataSet dst5 = new DataSet();
            SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
            SqlDataAdapter adptpt = new SqlDataAdapter("select ptid from paper_type where ptname='" + papertype.SelectedItem.Text + "'", cnn);
            //SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major.SelectedItem.Text + "'", cnn);
            //SqlDataAdapter adptbindingtype = new SqlDataAdapter("select bitid from binding_type where bitname='" + bindingtype.SelectedItem.Text + "'", cnn);
            SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
            SqlCommand cmd = cnn.CreateCommand();
            adptpt.Fill(dst1);
            //adptmajor.Fill(dst2);
            //adptbindingtype.Fill(dst3);
            adptlanguage.Fill(dst4);
            
            int ptid = (int)dst1.Tables[0].Rows[0]["ptid"];
            SqlDataAdapter adptnum = new SqlDataAdapter("select id from paper where user_id='" + Session["id"].ToString() + "' and paper_type_id=" + ptid + "", cnn);
            adptnum.Fill(dst5);
            
            String majorid = Session["majorid"].ToString();
            //int bitid = (int)dst3.Tables[0].Rows[0]["bitid"];
            int lid = (int)dst4.Tables[0].Rows[0]["lid"];
            int num;
            if (dst5.Tables[0].Rows.Count>0)
            {
                if (txtname.Text == "" || txtadviser.Text == "" || txtdirection.Text == "" || txtformat.Text == "" || txtnumberofpage.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('信息不得为空！');", true);
                }
                else
                {
                    string pid = dst5.Tables[0].Rows[0]["id"].ToString();
                    Session["pid"] = dst5.Tables[0].Rows[0]["id"].ToString();
                    String writedt = write_year.Text + "-" + write_month.Text + "-" + write_day.Text;
                    String dbdt = db_year.Text + "-" + db_month.Text + "-" + db_day.Text;
                    cmd.CommandText = "update paper set name='" + txtname.Text + "',zhicheng='" + zhicheng.SelectedItem.Text + "',write_dt='" + writedt + "',xuezhi='" + xuezhi.SelectedItem.Text + "',dabian_dt='" + dbdt + "',adviser='" + txtadviser.Text + "',direction='" + txtdirection.Text + "',format='" + txtformat.Text + "',number_of_page='" + int.Parse(txtnumberofpage.Text) + "',language='" + lid + "',note='" + txtnote.Text + "' where user_id='" + Session["id"].ToString() + "' and paper_type_id=" + Convert.ToInt32(ptid);
                    cnn.Open();
                    cmd.ExecuteNonQuery();
                    cnn.Close();
                    DataSet dst6 = new DataSet();
                    cmd.CommandText = "update file_att set file_name='" + FileUpload1.FileName.ToString() + "',file_size='" + FileUpload1.FileBytes.Length + "',uploaded_dt='" + DateTime.Now.ToString("yyyy-MM-dd") + "' where paper_id=" + Convert.ToInt32(Session["pid"]);
                    cnn.Open();
                    cmd.ExecuteNonQuery();
                    cnn.Close();
                    var path = Server.MapPath("/论文/" + FileUpload1.FileName.ToString());
                    try
                    {
                        FileUpload1.SaveAs(path);
                        LinkButton1.Text = "上次上传：" + FileUpload1.FileName.ToString();
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('上传成功！');", true);
                    }
                    catch
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('上传失败！');", true);
                    }
                }
                
            }
            else
            {
                num = 1;

                String stockdt = DateTime.Now.ToString("yyyy-MM-dd");
                if (txtname.Text == "" || txtadviser.Text == "" || txtdirection.Text == "" || txtformat.Text == "" || txtnumberofpage.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('信息不得为空！');", true);
                }
                else if (FileUpload1.FileName == "")
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('请上传论文！');", true);
                }
                else
                {
                    String writedt = write_year.Text + "-" + write_month.Text + "-" + write_day.Text;
                    String dbdt = db_year.Text + "-" + db_month.Text + "-" + db_day.Text;
                    String QR = "";
                    cmd.CommandText = "INSERT INTO paper(user_id,name, adviser,paper_type_id, major_id, QR_code, direction, write_dt, author, stock_dt, shenhe, dabian_dt, xuezhi, status, number, format, number_of_page,language,note,zhicheng) VALUES ('"+Session["id"].ToString()+"','" + txtname.Text + "','" + txtadviser.Text + "'," + ptid + "," + majorid + ",'" + QR + "','" + txtdirection.Text + "','" + writedt + "','" + Session["name"].ToString() + "','" + stockdt + "','" + "待审核" + "','" + dbdt + "','" + xuezhi.SelectedItem.Value + "'," + "0," + num + ",'" + txtformat.Text + "','" + txtnumberofpage.Text + "'," + lid + ",'" + txtnote.Text.ToString() + "','" + zhicheng.SelectedItem.Value + "')";
                    cnn.Open();
                    try
                    {
                        cmd.ExecuteNonQuery();
                        cnn.Close();
                        DataSet dst = new DataSet();
                        SqlDataAdapter adpt1 = new SqlDataAdapter("select id from paper where name='" + txtname.Text + "'", cnn);
                        adpt1.Fill(dst);
                        Session["paperid"] = (int)dst.Tables[0].Rows[0]["id"];
                        if (UpLoadFile())
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('上传成功！');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('上传失败！');", true);
                        }
                    }
                    catch
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('请输入正确的日期格式或页数！');", true);

                    }


                }
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('上传格式必须是pdf！');", true);

        }
        

    }
    public bool UpLoadFile()
    {
        int paperid = (int)Session["paperid"];
        string dt = DateTime.Now.ToString("yyyy-MM-dd");
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlCommand cmd = cnn.CreateCommand();
        int i = FileUpload1.FileName.ToString().LastIndexOf(".");
        String subname = FileUpload1.FileName.ToString().Substring(i+1);
        var path = Server.MapPath("/论文/" + FileUpload1.FileName.ToString());
        FileUpload1.SaveAs(path);
        cmd.CommandText = "INSERT INTO file_att(file_name,extension_name,file_size,uploaded_dt,paper_id) VALUES ('" + FileUpload1.FileName.ToString() + "','"+subname+"','" + FileUpload1.FileBytes.Length +  "','" + dt + "','" + paperid + "')";
        try
        { 
            cnn.Open();
            cmd.ExecuteNonQuery();
            return true;
        }
        catch
        {
            cmd.CommandText = "delete from paper where name='" + txtname.Text + "'";
            cmd.ExecuteNonQuery();
            return false;
        }
        finally
        {
            cnn.Close();
        }
    }
    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("login1.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select file_name from file_att where paper_id=" + Session["pid"] , cnn);
        adpt.Fill(dst);
        string name = dst.Tables[0].Rows[0][0].ToString();
        Response.Redirect("论文/" + name);
    }
} 
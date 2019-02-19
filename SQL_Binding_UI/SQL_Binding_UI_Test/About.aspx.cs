using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SQL_Binding_UI_Test
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                DropDownList2.Enabled = false;
                DropDownList1.DataSource = getData("spGetDepotNames", null);
                DropDownList1.DataTextField = "Username";
                DropDownList1.DataValueField = "Username";
                DropDownList1.DataBind();

                ListItem LIUser = new ListItem("----Select----", "-1");
                DropDownList1.Items.Insert(0, LIUser);

                ListItem LIDepot = new ListItem("----Select----", "-1");
                DropDownList2.Items.Insert(0, LIDepot);
            }
        }

        private DataSet getData(string Proc, SqlParameter Parameter) {
            string CS = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS)) {
                con.Open();
                SqlDataAdapter DA = new SqlDataAdapter(Proc, con);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (Parameter != null)
                {
                    DA.SelectCommand.Parameters.Add(Parameter);
                }
                DataSet DS = new DataSet();
                DA.Fill(DS);
                return DS;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "-1")
            {
                DropDownList2.SelectedIndex = 0;
                DropDownList2.Enabled = false;
            }
            else
            {
                DropDownList2.Enabled = true;
                SqlParameter Parameter = new SqlParameter("@username", DropDownList1.SelectedValue);
                DataSet DS_Received = getData("spGetDepotList", Parameter);
                //DropDownList2.DataSource = getData("spGetDepotList", Parameter);
                if (DS_Received.Tables[0].Rows.Count != 0)
                {
                    DropDownList2.DataSource = DS_Received;
                    DropDownList2.DataTextField = "Depot_name";
                    DropDownList2.DataValueField = "Depot_name";
                    DropDownList2.DataBind();
                }
                else {
                    
                    DropDownList2.Items.Clear();
                    DropDownList2.Items.Insert(0, "No Depot Alloted");
                    DropDownList2.SelectedIndex = 0;
                    DropDownList2.Enabled = false;
                }
                
            }
        }
    }
}
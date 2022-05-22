using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Web;
using System.Security.Permissions;

namespace Samples.AspNet.CS.Controls
{
    [AspNetHostingPermission(SecurityAction.Demand, Level = AspNetHostingPermissionLevel.Minimal)]
    public class CustomTextBoxOnTextChanged : System.Web.UI.WebControls.TextBox
    {
        private bool isDirty = false;

        protected override void OnTextChanged(System.EventArgs e)
        {
            // Call the base OnTextChanged method.
            base.OnTextChanged(e);

            // Change the dirty flag to True.
            isDirty = true;
        }
    }
}


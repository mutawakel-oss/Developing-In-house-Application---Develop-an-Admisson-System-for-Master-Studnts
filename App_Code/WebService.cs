using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections.Generic;
using System.Collections.Specialized;
/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] GetCompletionList(string prefixText, int count)
    {
        StringCollection list = (StringCollection)HttpContext.Current.Profile["SearchTerms"];
        List<string> suggestions = new List<string>();
        
        String[] myArr = new String[] { "RED", "orange", "yellow", "RED", "green", "blue", "RED", "indigo", "violet", "RED" };
        list.AddRange(myArr);

        foreach (string s in list)
        {
            if (s.StartsWith(prefixText))
            {
                suggestions.Add(s);
            }
        }
        return suggestions.ToArray();
    } 


    
}


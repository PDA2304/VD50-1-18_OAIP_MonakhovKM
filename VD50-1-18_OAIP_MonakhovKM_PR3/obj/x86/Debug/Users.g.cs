﻿#pragma checksum "C:\Users\isip_\Downloads\VD50-1-18_OAIP_MonakhovKM_PR3\VD50-1-18_OAIP_MonakhovKM_PR3\Users.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "C58C111B5380E7BA34E27B58C5FBC792"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VD50_1_18_OAIP_MonakhovKM_PR3
{
    partial class Users : 
        global::Windows.UI.Xaml.Controls.Page, 
        global::Windows.UI.Xaml.Markup.IComponentConnector,
        global::Windows.UI.Xaml.Markup.IComponentConnector2
    {
        /// <summary>
        /// Connect()
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.Windows.UI.Xaml.Build.Tasks"," 10.0.18362.1")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void Connect(int connectionId, object target)
        {
            switch(connectionId)
            {
            case 2: // Users.xaml line 12
                {
                    global::Windows.UI.Xaml.Controls.Grid element2 = (global::Windows.UI.Xaml.Controls.Grid)(target);
                    ((global::Windows.UI.Xaml.Controls.Grid)element2).LostFocus += this.Grid_LostFocus;
                }
                break;
            case 3: // Users.xaml line 18
                {
                    this.CommandBar = (global::Windows.UI.Xaml.Controls.CommandBar)(target);
                    ((global::Windows.UI.Xaml.Controls.CommandBar)this.CommandBar).Closing += this.CommandBar_Closing;
                }
                break;
            case 4: // Users.xaml line 27
                {
                    this.userList = (global::Microsoft.Toolkit.Uwp.UI.Controls.DataGrid)(target);
                    ((global::Microsoft.Toolkit.Uwp.UI.Controls.DataGrid)this.userList).SelectionChanged += this.userList_SelectionChanged;
                }
                break;
            case 5: // Users.xaml line 19
                {
                    this.Add = (global::Windows.UI.Xaml.Controls.AppBarButton)(target);
                    ((global::Windows.UI.Xaml.Controls.AppBarButton)this.Add).Click += this.Add_Click;
                }
                break;
            case 6: // Users.xaml line 20
                {
                    this.edit = (global::Windows.UI.Xaml.Controls.AppBarButton)(target);
                    ((global::Windows.UI.Xaml.Controls.AppBarButton)this.edit).Click += this.edit_Click;
                }
                break;
            case 7: // Users.xaml line 21
                {
                    this.Delete = (global::Windows.UI.Xaml.Controls.AppBarButton)(target);
                    ((global::Windows.UI.Xaml.Controls.AppBarButton)this.Delete).Click += this.Delete_Click;
                }
                break;
            case 8: // Users.xaml line 22
                {
                    global::Windows.UI.Xaml.Controls.AppBarButton element8 = (global::Windows.UI.Xaml.Controls.AppBarButton)(target);
                    ((global::Windows.UI.Xaml.Controls.AppBarButton)element8).Click += this.AppBarButton_Click;
                }
                break;
            default:
                break;
            }
            this._contentLoaded = true;
        }

        /// <summary>
        /// GetBindingConnector(int connectionId, object target)
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.Windows.UI.Xaml.Build.Tasks"," 10.0.18362.1")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public global::Windows.UI.Xaml.Markup.IComponentConnector GetBindingConnector(int connectionId, object target)
        {
            global::Windows.UI.Xaml.Markup.IComponentConnector returnValue = null;
            return returnValue;
        }
    }
}


//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TinTuc.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Comment
    {
        public int Id { get; set; }
        public Nullable<int> Id_Post { get; set; }
        public string NoiDung { get; set; }
        public Nullable<System.DateTime> NgayViet { get; set; }
        public string ButDanh { get; set; }
    
        public virtual Post Post { get; set; }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author LeThanhCong
 */
public class HtmlHelper {
    public static String hyperlink(String text, String url)
    {
        return "<a class=\"paging_link\" href=\""+url+"\">"+text+"</a>";
    }
    
    public static String label(String text)
    {
        return "<span class=\"paging_label\">"+text+"</span>";
    }
    
    
    public static String pager(String keyword, int pageindex, int gap,int totalpage)
    {
        String result = "";
        if(pageindex - gap > 1)
            result+= hyperlink("First", "?page=1&keyword=" + keyword);
        for (int i = gap; i > 0; i--) {
            int page = (pageindex -i);
            if(page>0)
            result+= hyperlink(page+"", "?page="+page+"&keyword=" + keyword);
        }
        
        result+= label(""+pageindex);
        
        for (int i = 1; i <= gap; i++) {
            int page = (pageindex+i);
            if(page<=totalpage)
            result+= hyperlink(page+"", "?page="+page+"&keyword=" + keyword);
        }
        
        if(pageindex+gap < totalpage)
            result+= hyperlink("Last", "?page="+totalpage+"&keyword=" + keyword);
        
        return result;
    }
}

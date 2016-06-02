package com.imau.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imau.dao.MessageDao;
import com.imau.model.Message;
import com.imau.model.User;
import com.imau.util.PageModel;

public class MessageServlet extends HttpServlet {
	
public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
	doPost(request, response);
}
	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
           String method=request.getParameter("method");
           if(method!=null){
        	   //留言
        	   if("save".equalsIgnoreCase(method)){
        		   this.isLogin(request,response);
        		   String title=request.getParameter("title");
        		   String content=request.getParameter("content");
        		   //如果留言内容有换行符，将替换为<br>
        		   if(content.indexOf("\n")!=-1){
        			   content=content.replaceAll("\n", "<br>");
        			   
        		   }
        		   User user=(User)request.getSession().getAttribute("user");
        		   Message message=new Message();
        		   message.setTitle(title);
        		   message.setContent(content);
        		   message.setCreateTime(new Date());
        		   message.setUser(user);
        		   MessageDao dao=new MessageDao();
        		   dao.saveMessage(message);
        		   request.getRequestDispatcher("MessageServlet?method=view").forward(request, response);
        		   
        		   
        		   
        		   
        		   
        		   
        	   }
        	   else if("view".equalsIgnoreCase(method)){
        		   String page = request.getParameter("currPage");
        		   int currPage = 1;
        		   int pageSize = 5;
        		   if(page!=null){
        			   currPage = Integer.parseInt(page);
        			   
        		   }
        		   MessageDao dao = new MessageDao();
        		   PageModel pageModel = dao.findPaging(currPage, pageSize);
        		   request.setAttribute("pageModel", pageModel);
        		   request.getRequestDispatcher("index.jsp").forward(request,response);
        	   }
           }
           else {
        	   request.getRequestDispatcher("index.jsp").forward(request, response);
           }

	}
	public void isLogin(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		if(request.getSession().getAttribute("user")==null){
			request.setAttribute("error", "对不起，您还没有登录！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

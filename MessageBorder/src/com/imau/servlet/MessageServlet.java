package com.imau.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imau.dao.MessageDao;
import com.imau.model.Message;
import com.imau.model.User;

public class MessageServlet extends HttpServlet {

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
        		   request.getRequestDispatcher("index.jsp").forward(request,response);
        		   
        		   
        		   
        		   
        		   
        		   
        	   }
           }

	}
	public void isLogin(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		if(request.getSession().getAttribute("user")==null){
			request.setAttribute("error", "对不起，您还没有登录！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

package com.imau.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.event.SaveOrUpdateEvent;

import com.imau.dao.MessageDao;
import com.imau.model.Message;
import com.imau.model.Revert;

public class ManagerServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
          this.isAdmin(request, response);//判断是否具有管理员权限
          String method = request.getParameter("method");//获取请求类型
          if("delete".equalsIgnoreCase(method)){
        	  String id = request.getParameter("id");
        	  if(id!=null){
        		  MessageDao dao = new MessageDao();
        		  dao.deleteMessage(Integer.parseInt(id));
        		  
        	  }
        	  request.getRequestDispatcher("MessageServlet?method=view").forward(request, response);
        	  
          }
          //回复留言
          else if("revert".equalsIgnoreCase(method)){
        	  //获取留言的Id号
        	  String msgId = request.getParameter("id");
        	  //实例化MessageDao
        	  MessageDao dao =new MessageDao();
        	  //加载留言
        	  Message message = dao.getMessage(Integer.valueOf(msgId));
        	  request.setAttribute("message", message);
        	  request.getRequestDispatcher("admin_revert.jsp").forward(request, response);
        	 
        	  
          }
          //保存回复信息
          else if("saveOrUpdateRevert".equalsIgnoreCase(method)){
        	  //获取留言的Id
        	  String msgId = request.getParameter("id");
        	  //获取回复的内容
        	  String content = request.getParameter("content");
        	  //换行
        	  if(content.indexOf("\n")!=-1){
        		  content = content.replace("\n", "<br>");
        	  }
        	  MessageDao dao =new MessageDao();
        	  Message message= dao.getMessage(Integer.valueOf(msgId));
        	  if(message!=null){
        		  Revert revert = message.getRevert();
        		  if(revert==null){
        			  revert = new Revert();
        		  }
        		  revert.setContent(content);
        		  revert.setRevertTime(new Date());
        		  message.setRevert(revert);
        		  //更新留言
        		  dao.saveMessage(message);
        		  
        		   
        	  }
        	  request.getRequestDispatcher("welcome.jsp").forward(request, response);
        	  
          }
          else{
        	  request.getRequestDispatcher("welcome.jsp").forward(request, response);
          }
      

	}
	public void isAdmin(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		if(request.getSession().getAttribute("admin")==null){
		request.setAttribute("error","对不起，你没有权限进行操作");
		request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	

}

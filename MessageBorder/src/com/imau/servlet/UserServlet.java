package com.imau.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imau.dao.UserDao;
import com.imau.model.Administrator;
import com.imau.model.User;

public class UserServlet extends HttpServlet {

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
            	if("guestReg".equalsIgnoreCase(method)){
            		String username=request.getParameter("username");
            		String password=request.getParameter("password");
            		String email=request.getParameter("email");
            		UserDao dao=new UserDao();
            		if(username!=null&&!username.isEmpty()){
            			if(dao.findUserByName(username)){
            				request.setAttribute("error", "您注册的用户名已经存在");
            	          System.out.println("您注册的用户名已经存在！");
            	          request.getRequestDispatcher("error.jsp").forward(request,response);
            			}
            			else{
            				User user=new User();
            				user.setUsername(username);
            				user.setPassword(password);
            				user.setEmail(email);
            				dao.saveUser(user);
            				request.getRequestDispatcher("index.jsp").forward(request, response);
            			}
            		}
            	}
            	else if("userLogin".equalsIgnoreCase(method)){
            		String username=request.getParameter("username");
            		String password=request.getParameter("password");
            		UserDao dao=new UserDao();
            		User user=dao.findUser(username, password);
            		if(user!=null){
            			if(user instanceof Administrator){
            				request.getSession().setAttribute("admin", user);
            				
            			}
            			request.getSession().setAttribute("user", user);
            			request.getRequestDispatcher("index.jsp").forward(request, response);
            		}
            		else{
            			request.setAttribute("error", "用户名或密码错误");
            			request.getRequestDispatcher("error.jsp").forward(request, response);
            		}
            	}
            	
            }   
	}

}

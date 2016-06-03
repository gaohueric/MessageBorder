package com.imau.dao;


import java.util.List;

import javax.servlet.SessionTrackingMode;

import org.hibernate.Query;
import org.hibernate.Session;
import com.imau.util.PageModel;
import com.imau.model.Message;
import com.imau.util.HibernateUtil;
import com.sun.jndi.url.ldaps.ldapsURLContextFactory;

public class MessageDao {
	public void saveMessage(Message message){
		Session session=null;
		try{
			session=HibernateUtil.getSession();
			session.beginTransaction();
			session.saveOrUpdate(message);
			session.getTransaction().commit();
		}
		catch(Exception e){
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		finally{
			HibernateUtil.closeSession(session);
			
		}
	}
	public List<Message> findAllMessage(){
		Session session = null;
		List<Message> list = null;
		try{
			session = HibernateUtil.getSession();
			session.beginTransaction();
			String hql = "from Message";
            list = session.createQuery(hql).list();
            session.getTransaction().commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		finally{
			HibernateUtil.closeSession(session);
		}
		return list;
	}
	public void getMessage(Integer id){
		Session session = null;
		Message message = null;
		try{
			session = HibernateUtil.getSession();//获取session
			session.beginTransaction();//开启事物
			message = (Message)session.get(Message.class,id);
			session.getTransaction().commit();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			HibernateUtil.closeSession(session);
		}
	}
	public void deleteMessage(Integer id){
		Session session = null;
		try{
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Message message = (Message)session.get(Message.class,id);
			session.delete(message);//删除留言
	        session.getTransaction().commit();
	        
			
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		finally{
			HibernateUtil.closeSession(session);
		}
	}

	/*
	 * 分页查询需要的方法 
	 * 查询总记录数
	 */
public int getTotalRecords(Session session){
	String hql="select count(*) from Message";
    Query query = session.createQuery(hql);
    Long totalRecords = (Long)query.uniqueResult();
    return totalRecords.intValue();
}
/*
 * 分页查询留言信息方法
 * currpage 查询当前页面是多少也
 * pageSize 每一页显示多少条记录
 */
public PageModel findPaging(int currPage,int pageSize){
	Session session = null;
	PageModel pageModel = null;
	try{
		session = HibernateUtil.getSession();
		session.beginTransaction();
		//HQL查询语句
		String hql = "from Message m order by m.createTime desc";
		List<Message> list = session.createQuery(hql).setFirstResult((currPage-1)*pageSize).setMaxResults(pageSize).list();
		pageModel = new PageModel(); 
		pageModel.setCurrPage(currPage); //设置当前页
		pageModel.setList(list); //设置结果集
		pageModel.setPageSize(pageSize);//设置每页记录数
		pageModel.setTotalRecords(getTotalRecords(session));//设置总记录数
		session.getTransaction().commit();//提交事物	
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		HibernateUtil.closeSession(session);
	}
	return pageModel;
}





}

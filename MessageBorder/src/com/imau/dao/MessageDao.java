package com.imau.dao;

import org.hibernate.Session;

import com.imau.model.Message;
import com.imau.util.HibernateUtil;

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

}

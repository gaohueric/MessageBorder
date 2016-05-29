package com.imau.util;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



public class HibernateUtil {
	private static SessionFactory factory=null;
	//实例化ThreadLocal对象
    private static final ThreadLocal<Session> threadLocal=new ThreadLocal<Session>();
    static {
    	try{
    		Configuration cfg=new Configuration().configure();
    		factory=cfg.buildSessionFactory();
    		
    	}
    	catch(HibernateException e){
    		e.printStackTrace();
    		
    	}
    }
    public static Session getSession(){
    	Session session=(Session)threadLocal.get();
    	if(session==null||!session.isOpen()){
    		if(factory==null){
    		rebulidSessionFactory();
    			
    		}
    		session=(factory!=null)?factory.openSession():null;
    		threadLocal.set(session);
    		
    	}
    	return session;
    	
    }
    public static SessionFactory getSessionFactory(){
    	return factory;
    }
    public static void closeSession(Session session){
    	 session=(Session)threadLocal.get();
    	 threadLocal.remove();
    	 if(session!=null){
    		 if(session.isOpen()){
    			 session.close();
    			 
    		 }
    	 }
    	
    }
    public static void rebulidSessionFactory(){
    	try{
    		Configuration cfg=new Configuration().configure();
    		factory=cfg.buildSessionFactory();
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    }
    
}

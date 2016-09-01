/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.Alumnos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author joseph
 */
public class AlumCtrl {
        public boolean guar(Alumnos obje)
    {
        boolean resp = false;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        try
        {
            em.persist(obje);
            tx.commit();
            resp = true;
        }
        catch(Exception ex)
        {
            tx.rollback();
        }
        em.close();
        emf.close();
        return resp;
    }
    
    public List<Alumnos> consTodo()
    {
        List<Alumnos> resp = new ArrayList<>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        try
        {
          TypedQuery<Alumnos> query =em.createNamedQuery("Alumnos.findAll", Alumnos.class);
           resp = query.getResultList();
        }
        catch(Exception ex)
        {
            
        }
        em.close();
        emf.close();
        return resp;
       
    }
     
    public Alumnos get(int empId)
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        Alumnos resp = null;
        
        try{
            resp = em.find(Alumnos.class, empId);
            
        }catch(Exception e){
            e.printStackTrace();
        }
        em.close();
        emf.close();
        return resp;
    }

}

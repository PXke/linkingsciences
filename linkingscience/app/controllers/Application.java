package controllers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import play.data.DynamicForm;
import play.data.Form;
import play.db.DB;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.about;
import views.html.createProject;
import views.html.index;
import views.html.project;
import views.html.register;
import views.html.signIn;
import views.html.team;
import views.html.testspage;
import views.html.user;


public class Application extends Controller {
  
	private static Connection ds = DB.getConnection();
	
    public static Result index() {
    	ResultSet rs=null;
    	String Nbuser ="APOCALYPSE";
    	String Nbproject ="APOCALYPSE";
    	try {
    		Statement stmt = ds.createStatement() ;
    		String query = "SELECT COUNT(*) FROM users;" ;
    		rs = stmt.executeQuery(query) ;
    		rs.next();
    		Nbuser = rs.getString(1);
    		query = "SELECT COUNT(*) FROM projects;" ;
    		rs = stmt.executeQuery(query) ;
    		rs.next();
    		Nbproject = rs.getString(1);
    		return ok(index.render(Nbuser,Nbproject));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return ok(index.render("9999","9999"));
    }
    
    public static Result sayHello() {
    	DynamicForm requestData = Form.form().bindFromRequest();
    	//
        String name = requestData.get("form");
      
        if(name.contains("forma"))
        {
        	 System.out.println("bite");
        	 name = requestData.get("username");
        	 System.out.println("value: " + name);
        	 
        	 if((name.compareTo("")==0)||(name.compareTo("username")==0))
        	 {
        		 return ok(register.render("username missing"));
        	 }
        	 else if(name.length()>31)
        	 {
        		 return  ok(register.render("username too long"));
        	 }
        	 return  ok(register.render("Tout est okay"));
        }
        else if(name.contains("formb"))
        {
        	return  ok(register.render("Tout est okay"));
        }
        else
        {
        	return ok(register.render("An Error Occured"));
        }
     
         
         // do what you want with the name variable
    }
    
    public static Result register(){
    	 return ok(register.render(""));
    }
    
    public static Result user() {
        return ok(user.render("quentinms", 5, "qms@kth.se"));
    }
    
    public static Result signIn() {
        return ok(signIn.render());
    }

    public static Result about(){
    	return ok(about.render());
    }
    
    public static Result createProject(){
    	return ok(createProject.render());
    }
    
    public static Result submitProject(){
    	return ok(createProject.render());
    }
	
	  public static Result team(){
    	return ok(team.render());
    }
	
	  public static Result project(){
    	return ok(project.render());
    }

      public static Result testspage(){
        return ok(testspage.render());
    }
  
}

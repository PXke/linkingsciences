package controllers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;
import static play.data.Form.*;
import play.*;
import play.mvc.*;
import play.db.*;
import play.data.*;

import views.html.*;



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
        String name = requestData.get("password");
        System.out.println(requestData.toString());
		return ok(index.render(name,"9999"));
         
         // do what you want with the name variable
    }
    
    public static Result register(){
    	 return ok(register.render());
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

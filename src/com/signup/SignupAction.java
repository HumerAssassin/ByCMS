package com.signup;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignupAction extends HttpServlet{

    private SignupService service;

    public SignupAction(){
        super();
    }

    public void destroy(){
        super.destroy();
    }

    /*
        Servlet的doGet方法，当表单的标签值方法等于get时，将调用此方法。
        param向服务器发送请求，接受服务器响应
        如果发生错误，调用ServletException，抛出IOException
     */
    public void doGet(HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException{

        this.doPost(request,response);

    }

    /*
        Servlet的doPost方法,当表单的标签值方法等于post时，将调用此方法。
        param向服务器发送请求，接受服务器响应
        如果发生错误，调用ServletException，抛出IOException
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        String path=request.getContextPath();

        String username=request.getParameter("username");
        String pswd=request.getParameter("pswd");

        List<Object> params=new ArrayList<Object>();
        params.add(username);
        params.add(pswd);
        boolean flag=service.signupUsers(params);
        if(flag){
            response.sendRedirect(path+"/userlogin.jsp");
        }

        out.flush();
        out.close();
    }

    /*
        初始化servlet
        如果发生错误则调用ServletException
     */
    public void init() throws ServletException{

        service=new SignupDao();

    }
}

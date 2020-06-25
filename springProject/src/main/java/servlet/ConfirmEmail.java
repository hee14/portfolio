package servlet;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LogonDao;


@WebServlet("/ConfirmEmail")
public class ConfirmEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConfirmEmail() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		System.out.println(email + "###");
		// Service 단 연결
		LogonDao service = LogonDao.getInstance();
		String str = null;
		try {
			str = service.confirmEmail(email);
			System.out.println(str + "@@@");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
					
		response.getWriter().print(str);
		
	}
}
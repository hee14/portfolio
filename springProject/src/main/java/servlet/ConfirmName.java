package servlet;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LogonDao;


@WebServlet("/confirmName")
public class ConfirmName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConfirmName() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		System.out.println(name + "###");
		// Service 단 연결
		LogonDao service = LogonDao.getInstance();
		String str = null;
		try {
			str = service.confirmName(name);
			System.out.println(str + "@@@");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
					
		response.getWriter().print(str);
		
	}
}
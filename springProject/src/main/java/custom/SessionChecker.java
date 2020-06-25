package custom;

import java.io.*;
import java.util.*;
import javax.servlet.http.*;

public class SessionChecker {
	public static int nowUser = 0;

	public void setSession(HttpSession session) {
		// 리스너 객체를 생성해서 이것도 세션에 같이 담는다. 리스너 라는 이름으로...
		session.setAttribute("listener", new CustomBindingListener());
	}

	public static void setNowUser(int x) {
		nowUser += x;
	}

	public int getNowUser() {
		return this.nowUser;
	}
}


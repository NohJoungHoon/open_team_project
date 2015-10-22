<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="hr";
	String pass="hr";
	
	String insert = "INSERT INTO member VALUES(member_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String gender = request.getParameter("gender");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String email = request.getParameter("email");
	
	//1. 접속 드라이버를 동적으로 메모리에 로딩한다.
	Class.forName(driver);
	
	//2.DriverManager로 부터 활성화된 Connection 객체를 얻는다.
	Connection conn = DriverManager.getConnection(url, user, pass);	
	
	//3. INSERT 쿼리를 발행하기 위해 활성화된 커넥션으로부터 PreparedStatement 객체를 얻는다.
	PreparedStatement pstmt = conn.prepareStatement(insert);
	
	//4. PreparedStatement의  플레이스홀더('?')로 지정된 실제 데이터를 설정한다.
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, password);
	pstmt.setString(4, gender);
	pstmt.setString(5, phone1 + "-" + phone2 + "-" + phone3);
	pstmt.setString(6, email);
	
	//5. 실제 DBMS 쿼리를 실행한다.
	pstmt.executeUpdate();
	
	//6. DB 작업에 사용한 객체를 닫는다.
	if(pstmt != null) { pstmt.close(); }
	if(conn != null) { pstmt.close(); }
	
	response.sendRedirect("memberList.jsp");
%>
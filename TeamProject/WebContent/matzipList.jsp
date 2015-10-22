<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,com.jsp.study.vo.*,java.util.*" %>
<%
   String driver="oracle.jdbc.driver.OracleDriver";
   String url="jdbc:oracle:thin:@localhost:1521:xe";
   /*String url="jdbc:oracle:thin:@211.110.33.69:1521:xe";*/
   String user="hr";
   String pass="hr";
         
   String select = "SELECT * FROM matzip";
   //1. DBMS 드라이버 정보를 로딩
   Class.forName(driver);
   
   //2. DriverManager로 부터 Connection 객체를 얻는다.
   Connection conn = DriverManager.getConnection(url, user, pass);
   
   //3. SELECT 쿼리를 발행하기 위해 PreparedStatement 객체를 얻는다.
   PreparedStatement pstmt = conn.prepareStatement(select);
   
   /*4. PreparedStatement 객체를 이용해 실제 DBMS 쿼리를 발행하고,
    *	그 결과로 SELECT 쿼리로 검색된 ResultSet 객체를 받는다.
    */
   ResultSet rs = pstmt.executeQuery();
   
   ArrayList<Matzip> matzipList = new ArrayList<Matzip>();
   
   /* ResultSet 객체는 가상의 테이블 형태로 구성되어 있어 최초에는 커서가 실제 데이터 이전을 가르키고 있다.
    * 반복문을 통해서 한행씩 이동하면서 ResultSet에 저장된 데이터를 읽어 오면 된다.
    */
	while(rs.next()) {
		
		String s_name = rs.getString("s_name");
		float point_x = rs.getFloat("point_x");
		float point_y = rs.getFloat("point_y");
		String loc = rs.getString("loc");
		String menu = rs.getString("menu");
		String pic1 = rs.getString("pic1");
		String pic2 = rs.getString("pic2");
		String pic3 = rs.getString("pic3");
		
	    Matzip matzip = new Matzip(s_name, point_x, point_y, loc, menu, pic1, pic2, pic3);
      
      	matzipList.add(matzip);
   }
   
   //5. DB 작업에 사용한 객체를 닫는다.
   if(rs != null) {rs.close();}
   if(pstmt != null) {pstmt.close();}
   if(conn != null) {conn.close();}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Member 관리</title>
		
		<style>
			table { 
				border-top: 1px dashed silver;
		      	border-bottom: 1px dashed silver;
		      	border-collapse: collapse;
		      	font-size: 13px;
		      	width: 700px;
		   	}
		   	
		   	th { 
		   		background-color: pink;
		      	text-align: left;
		    }
		   	
		   	tr { height: 25px; }
		   	
		   	td { border-top: 1px dashed silver;}
		   	
		   	#link { font-size: 13px;}
		</style>
		
	</head>
	
	<body>
	   <h3>■ 맛집 리스트 ■</h3>
		   <table>
		      <tr>
		         <th>상호명</th>
		         <th>x좌표</th>
		         <th>y좌표</th>
		         <th>지역</th>
		         <th>대표메뉴</th>
		         <th>그림1</th>
		         <th>그림2</th>
		      </tr>
		<%
		   for(int i = 0; i< matzipList.size(); i++) {
		%>
		      <tr>
		         <td><%= matzipList.get(i).getS_name() %></td>
		         <td><%= matzipList.get(i).getPoint_x() %></td>
		         <td><%= matzipList.get(i).getPoint_y() %></td>
		         <td><%= matzipList.get(i).getLoc() %></td>
		         <td><%= matzipList.get(i).getMenu() %></td>
		         <td><%= matzipList.get(i).getPic1() %></td>
		         <td><%= matzipList.get(i).getPic2() %></td>
		      </tr>
		<%         
		   }
		%>
		   </table><br/>
	</body>
</html>
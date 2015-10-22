<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,com.jsp.study.vo.*,java.util.*" %>
<%
   String driver="oracle.jdbc.driver.OracleDriver";
   /*String url="jdbc:oracle:thin:@localhost:1521:xe";*/
   String url="jdbc:oracle:thin:@211.110.33.69:1521:xe";
   String user="hr7";
   String pass="wjdgns88";
         
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
		<title>맛집 정보</title>
		<style>
		
		.box {
			display: inline-block;
		}

		</style>
	</head>
	
	<body>
	
		<table align = "center">
			<tr><td>
				<table>
					<tr align = "center">
						<td>
							오늘.. 
							<form action = "#" class = "box">
								<input type = "text" name = "find" value = "예 : 강남역" onfocus="this.value='';" />
								<input type = "submit" value = "찾기">
							</form>							
							<br/><br/><br/>
						</td>
					</tr>

					<tr>
						<td>
							<iframe src="sample_02.html" width = "1000px" height = "500px"></iframe>
							<!--<img src="C:\Users\Noh\Desktop\images\map.jpg">-->
						</td>
					</tr>

					<tr>
						<table align = "center">
							<tr>
								<h2 align = "center"><%= matzipList.get(0).getS_name()%></h2>
							</tr>

							<tr>
								<h4 align = "center">대표메뉴 : <%= matzipList.get(0).getMenu()%></h4>
							</tr>

							<tr>
								<td style="padding: 50px 100px;">
									<table class = "t_set">
										<tr>
											<td><img src="images\1.jpg"></td>
											<td>&nbsp;&nbsp;송년회, 어르신, 해장</td>
										</tr>
										
										<tr>
											<td><img src="images\2.jpg"></td>
											<td>&nbsp;&nbsp;숯불</td>
										</tr>
										
										<tr>
											<td><img src="images\3.jpg"></td>
											<td>&nbsp;&nbsp;오래된 맛집, 숨은 맛집</td>
										</tr>
										<tr>
											<td><img src="images\4.jpg"></td>
											<td>&nbsp;&nbsp;12:00 ~ 00:00</td>
										</tr>
									</table>
								</td>

								<td style="padding: 50px 100px;">
									<table class = "t_set">
										<tr>
											<td>AREA</td>
											<td>&nbsp;&nbsp;송년회, 어르신, 해장</td>
										</tr>
										
										<tr>
											<td>ADDRESS</td>
											<td>&nbsp;&nbsp;숯불</td>
										</tr>
										
										<tr>
											<td>TEL</td>
											<td>&nbsp;&nbsp;오래된 맛집, 숨은 맛집</td>
										</tr>
										
									</table>
								</td>	
							</tr>

							<tr>
								<td colspan = "2" align = "center">
									<br/><br/><h2>PHOTO</h2>
								</td>
							</tr>

							<tr>
								<td colspan = "2">
									<img src=".\images\<%= matzipList.get(0).getPic1()%>">
									<img src=".\images\<%= matzipList.get(0).getPic2()%>">
									<img src=".\images\<%= matzipList.get(0).getPic3()%>">
								</td>
							</tr>

						</table>
					</tr>
				</table>
			</td></tr>
		</table>
		
		<a href="matzipList.jsp" id="link">맛집정보리스트</a>
	</body>
</html>
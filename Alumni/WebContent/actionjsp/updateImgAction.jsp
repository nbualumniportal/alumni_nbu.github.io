<%@page import="org.rimpa.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="javax.swing.JFileChooser"%>
<%@page import="javax.swing.JOptionPane"%>
<%
	System.out.println(session);

	if (session.getAttribute("alumniID") == null) {
		response.sendRedirect("../jsp/alumniMain.jsp");
	} else {
		Connection connection = DBUtil.createConnection();
		int alumniID = (int) session.getAttribute("alumniID");
String query="Select registration_no from alumni.registration where alumniID=" + alumniID + ";";
System.out.println(query);
Statement stmt2 = connection.createStatement();
ResultSet rs2 = stmt2.executeQuery(query);
if (rs2.next()) {
	String regno=rs2.getString("registration_no");

		String queryimg1 = "Select imageID from alumni.alumni_image_mapper where alumniID=" + alumniID + ";";
		System.out.println(queryimg1);
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(queryimg1);
		if (rs.next()) {
	int imgId = rs.getInt("imageID");

	String q = "UPDATE alumni.img_upload set pic=" + "?" + "  where imgId=" + imgId + ";";
	System.out.println(q);
	PreparedStatement pstmt = connection.prepareStatement(q);
	JFileChooser jfc = new JFileChooser();
	jfc.showOpenDialog(null);
	File file = jfc.getSelectedFile();
	System.out.println("file=" + file);
	if(file==null)
	{
		out.println("<script>alert('Please select a picture!!!')</script>");
		out.println("<meta http-equiv='refresh' content='1;URL=../jsp/updateImg.jsp'>");
	}
	else
			{
				FileInputStream fis = new FileInputStream(file);
				pstmt.setBinaryStream(1, fis, fis.available());
				int qr = pstmt.executeUpdate();

				if (qr == 1) {
					File f=new File("../profileImg/"+regno+".png");
					f.delete();
					out.println("<script>alert('Image updated successfully!!!')</script>");
					out.println("<meta http-equiv='refresh' content='1;URL=../jsp/profileView.jsp'>");
				} else {
					out.println("<script>alert('Could not update your image!!!')</script>");
					out.println("<meta http-equiv='refresh' content='1;URL=../jsp/profileView.jsp'>");
				}

				pstmt.close();
				fis.close();
			}
		}
	
		stmt.close();
}
stmt2.close();
		if (connection != null) {
			connection.close();
		}
	}
%>
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
Connection connection = DBUtil.createConnection();
String query1="select max(alumniID) from alumni.registration;";
System.out.println(query1);
Statement stmt = connection.createStatement();
ResultSet rs = stmt.executeQuery(query1);
if (rs.next()) {
	int aId = rs.getInt("max(alumniID)");
String q="insert into img_upload(pic) value(?);";
PreparedStatement pstmt=connection.prepareStatement(q);
JFileChooser jfc=new JFileChooser();
jfc.showOpenDialog(null);
File file=jfc.getSelectedFile();
System.out.println("file="+file);
if(file==null)
{
	out.println("<script>alert('Please select a picture!!!')</script>");
	out.println("<meta http-equiv='refresh' content='1;URL=../jsp/addImg.jsp'>");
}
else
		{
FileInputStream fis=new FileInputStream(file);

pstmt.setBinaryStream(1,fis,fis.available());
int qr=pstmt.executeUpdate();
String q2="select max(imgId) from alumni.img_upload;";
System.out.println(q2);
Statement stmtIMapper = connection.createStatement();
ResultSet rsIMapper = stmtIMapper.executeQuery(q2);
if (rsIMapper.next()) {
	int ImageId = rsIMapper.getInt("max(imgId)");
	String q3 = "INSERT IGNORE INTO alumni.alumni_image_mapper (alumniID,imageID) VALUES ('" + aId
			+ "','" + ImageId + "');";
	System.out.println(q3);
	Statement stmtIMapper1 = connection.createStatement();
	int qr2 = stmtIMapper1.executeUpdate(q3);

if(qr2==1)
{
	out.println("<script>alert('Image uploaded successfully!!!')</script>"); 
	out.println("<meta http-equiv='refresh' content='1;URL=../jsp/alumniMain.jsp'>");
}
else
{
	out.println("<script>alert('Could not upload your image!!!')</script>"); 
	out.println("<meta http-equiv='refresh' content='1;URL=../jsp/addImg.jsp'>");
}
stmtIMapper1.close();
}
stmtIMapper.close();
pstmt.close(); 
fis.close();
}
}
stmt.close();
if (connection != null) {
	connection.close();
}

%>
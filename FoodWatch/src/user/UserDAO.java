package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt = null;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/FoodWatch?useUnicode=true&characterEncoding=UTF-8";
			String dbID = "root";
			String dbPassword = "0326";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// join 함수
	public int join(UserBean user) {
		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserPhoneNumber());
			pstmt.setString(6, user.getUserSex());
			pstmt.setInt(7, user.getUserType());
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	// login 함수
	public int login(String userId, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userId = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // �α��� ����
				} else {
					return 0; // ��й�ȣ�� Ʋ��
				}
			} return -1; // ���̵� Ʋ��
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ����
	}
	
	// 회원 정보 반환 함수
	public UserBean getUser(String userId) {
		String SQL = "SELECT * FROM user WHERE userId = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				UserBean userBean = new UserBean();
				userBean.setUserId(rs.getString(1));
				userBean.setUserPassword(rs.getString(2));
				userBean.setUserName(rs.getString(3));
				userBean.setUserEmail(rs.getString(4));
				userBean.setUserPhoneNumber(rs.getString(5));
				userBean.setUserSex(rs.getString(6));
				userBean.setUserType(rs.getInt(7));
				return userBean;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; // 해당 id 의 user가 없을 떄
	}
}

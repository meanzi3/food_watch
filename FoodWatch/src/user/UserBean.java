package user;

public class UserBean {
	
	private String userId;
	private String userPassword;
	private String userName;
	private String userEmail;
	private String userPhoneNumber;
	private String userSex;
	private Integer userType; // CUSTOMER(0) or OWNER(1)
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public Integer getUserType() {
		return userType;
	}
	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	
	public UserBean(String userId, String userPassword, String userName, String userEmail, String userPhoneNumber, String userSex,
			Integer userType) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhoneNumber = userPhoneNumber;
		this.userSex = userSex;
		this.userType = userType;
	}

	public UserBean() {
		
	}
}

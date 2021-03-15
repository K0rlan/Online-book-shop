package Model;

public class User {
	private int user_id;
	private String username;
	private String user_password;
	private String user_email;

	public User(){	}

	public User(int user_id, String username, String user_password, String email_id) {
		this.user_id = user_id;
		this.username = username;
		this.user_password = user_password;
		this.user_email = email_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getEmail() {
		return user_email;
	}

	public void setEmail(String email) {
		this.user_email = email;
	}

	@Override
	public String toString() {
		return "User{" +
				"user_id=" + user_id +
				", username='" + username + '\'' +
				", user_password='" + user_password + '\'' +
				", user_email='" + user_email + '\'' +
				'}';
	}
}

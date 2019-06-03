package shoppingsite;
public class Validation extends UserList{
	public static String Validate(String Username, String Password)
	{
//		if(Username.equals("USER") && Password.equals("PASSWORD"))
//			return "User";
		userList.put("USER","PASSWORD");
		if(Username.equals("ADMIN") && Password.equals("PASSWORD"))
		{
			return "Admin";	
		}
		else if(UserList.userList.get(Username)==null)
		{
			return "NoUser";
		}
		else if(UserList.userList.get(Username).equals(Password))
		{
			return "User";
		}
		else
		{
			return "No";			
		}
	}
	public static boolean addUser(String Username, String Password)
	{
		if(userList.get(Username)!=null)
		{
			return false;
		}
		else
		{
			userList.put(Username,  Password);
		}
		return true;
	}
}

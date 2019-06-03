package shoppingsite;

public class Crypter {
	public static String encrypt(String toCrypt, int random) 
	{
		char[] toCryptAray = toCrypt.toCharArray();
		for (int i = 0; i < toCryptAray.length; i++) 
		{
			toCryptAray[i] = (char) (toCryptAray[i] + random);
		}
		String Crypted = new String(toCryptAray);
		return Crypted;
	}
	
	public static String decrypt(String toDecrypt, String random_String) 
	{
		int random = Integer.parseInt(random_String);
		char[] toDecryptAray = toDecrypt.toCharArray();
		for (int i = 0; i < toDecryptAray.length; i++) 
		{
			toDecryptAray[i] = (char) (toDecryptAray[i] - random);
		}
		String Decrypted =  new String(toDecryptAray);
		return Decrypted;
	}
}

package utility;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.*;
public class AESHelper {
	private static byte[] key = {'w','a','l','a','n','g','g','o','s','t','p','a','y', 't', 'e', 'r'};
	
	
	public static String encrypt(String toEncrypt) {
		String encryptedString = "";
		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			encryptedString = Base64.encodeBase64String(cipher.doFinal(toEncrypt.getBytes()));
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return encryptedString;
	}
	public static String decrypt(String toDecrypt) {
		String decryptedString = "";
		try{
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
			final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			decryptedString = new String(cipher.doFinal(Base64.decodeBase64(toDecrypt)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return decryptedString;

	}

}
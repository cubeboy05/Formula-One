/**
 * Created by Karthik on 21/01/2016.
 */

//not having a register session thus this is just used one time(or as and when needed) to create log in credentials
public class PasswordHash {
    //hash the given string
    public static String hashPassword(String hashed){
        hashed = BCrypt.hashpw(hashed, BCrypt.gensalt());
        return hashed;
    }

    //check the given password
    public static boolean checkPassword(String unHashed, String hashed){
        return BCrypt.checkpw(unHashed, hashed);
    }

}

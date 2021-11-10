/**
 * @author rickybustillos 
 */
@isTest(seeAllData = true)
public class UserFixtureFactory {
    
    public static User getUser () {
        return [SELECT Name, Id FROM user LIMIT 1];
    }
}

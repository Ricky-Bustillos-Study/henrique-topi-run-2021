/**
 * @author rickybustillos 
 */
@isTest
 public class TopiRun2021FixtureFactory {
    
    public static String newProjectPayload () {
        return '{ "projectId": "01932190123", "externalId": ""01232139123812 }';
    }

    public static String newProjectErrorPayload () {
        return '{ "errorMessage": "Invalid Start Date" }';
    }

    public static TopiRun2021ErrorResponse newErrorResponse () {
        return new TopiRun2021ErrorResponse('Invalid Start Date');
    }

}

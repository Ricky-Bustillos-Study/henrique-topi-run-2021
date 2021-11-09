/**
 * @author rickybustillos 
 */
@isTest
 public class TopiRun2021FixtureFactory {

    public static TopiRun2021ProjectRequest newProjectRequest () {
        TopiRun2021ProjectRequest request = new TopiRun2021ProjectRequest();
        request.name = 'Test Project';
        request.code = '1';
        request.status = 'Iniciado';
        request.startDate = Datetime.now().date();
        request.endDate = Datetime.now().date().addDays(30);
        request.budget = 150500;
        return request;
    }
    
    public static String newProjectPayload () {
        return '{ "projectId": "01932190123", "externalId": "01232139123812" }';
    }

    public static String newProjectErrorPayload () {
        return '{ "errorMessage": "Invalid Start Date" }';
    }

    public static TopiRun2021ProjectResponse newProjectResponse () {
        return (TopiRun2021ProjectResponse) JSON.deserialize(newProjectPayload(), TopiRun2021ProjectResponse.class);
    }

    public static TopiRun2021ErrorResponse newErrorResponse () {
        return new TopiRun2021ErrorResponse('Invalid Start Date');
    }
}

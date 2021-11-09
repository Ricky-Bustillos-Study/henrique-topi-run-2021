/**
 * @author rickybustillos 
 */
@isTest
public class TopiRun2021ProjectOutboundServiceTest {
    
    @isTest
    public static void givenValidProjectWhenSyncProjectThenReturnResponsePayload() {
        
        String expectedResponsePayload = TopiRun2021FixtureFactory.newProjectPayload();

        TopiRun2021ProjectRequest request = TopiRun2021FixtureFactory.newProjectRequest();

        TopiRun2021ProjectOutboundService service = new TopiRun2021ProjectOutboundService();

        Test.setMock(HttpCalloutMock.class, new TopiRun2021ProjectHttpMock(expectedResponsePayload, 200));
        Test.startTest();

        HttpResponse response = service.putTopiRun2021Project(request);

        Test.stopTest();

        System.assertEquals(200, response.getStatusCode());
        System.assertEquals(expectedResponsePayload, response.getBody());
    }

    @isTest
    public static void givenValidProjectWhenSyncProjectWithErrorThenReturnResponseError() {

        String expectedResponsePayload = TopiRun2021FixtureFactory.newProjectErrorPayload();

        TopiRun2021ProjectRequest request = TopiRun2021FixtureFactory.newProjectRequest();

        TopiRun2021ProjectOutboundService service = new TopiRun2021ProjectOutboundService();

        Test.setMock(HttpCalloutMock.class, new TopiRun2021ProjectHttpMock(expectedResponsePayload, 400));
        Test.startTest();

        HttpResponse response = service.putTopiRun2021Project(request);

        Test.stopTest();
        
        System.assertEquals(expectedResponsePayload, response.getBody());
        System.assert(response.getStatusCode() != 200);
    }
}

/**
 * @author rickybustillos 
 */
public class TopiRun2021ProjectHttpMock implements HttpCalloutMock {
    
    Integer statusCode;
    String payload;

    public TopiRun2021ProjectHttpMock(String payload, Integer statusCode) {
        this.payload = payload;
        this.statusCode = statusCode;
    }

    public HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(this.statusCode);
        response.setBody(this.payload);

        return response;
    }
}

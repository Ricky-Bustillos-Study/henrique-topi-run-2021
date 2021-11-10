/**
 * @author rickybustillos 
 */
virtual public class TopiRun2021ProjectOutboundService {

    virtual public HttpResponse putTopiRun2021Project(TopiRun2021ProjectRequest project) {

        HttpRequest request = new HttpRequest();
        request.setMethod('PUT');
        request.setHeader('Content-Type', 'application/json');
        request.setEndpoint('https://run.mocky.io/v3/58d750c1-31bf-45ae-b361-bedecacf55a2');
        
        String requestPayload = JSON.serialize(project);
        request.setBody(requestPayload);

        Http http = new Http();
        HttpResponse response = http.send(request);

        return response;
    }
}

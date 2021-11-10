/**
 * @author rickybustillos
 */
public class ProjectTransformer {

  public TopiRun2021ProjectRequest toTopiRun2021Project(Project__c project) {

    TopiRun2021ProjectRequest topiRun2021Project = new TopiRun2021ProjectRequest();

    topiRun2021Project.name = project.Name;
    topiRun2021Project.code = project.Code__c;
    topiRun2021Project.status = project.Status__c;
    topiRun2021Project.startDate = project.StartDate__c;
    topiRun2021Project.endDate = project.EndDate__c;
    topiRun2021Project.budget = project.Budget__c;

    return topiRun2021Project;
  }
}

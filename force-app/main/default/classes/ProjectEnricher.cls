/**
 * @author rickybustillos
 */
public class ProjectEnricher {

	ProjectRepository repository;

	public ProjectEnricher() {
		this.repository = new ProjectRepository();
	}

	public Project__c withError(Project__c project, TopiRun2021ErrorResponse error) {

		project.SynchronizationStatus__c = 'Erro na sincronização de projetos';
		project.LastSyncDate__c = Datetime.now().date();
		project.ErrorMessage__c = error.errorMessage;

		this.repository.save(project);

		return project;
	}

	public Project__c withSuccessSyncStatus(Project__c project) {

		project.SynchronizationStatus__c = 'Integrado com sucesso';
		project.LastSyncDate__c = Datetime.now().date();
		project.ErrorMessage__c = '';

		this.repository.save(project);

		return project;
	}
}
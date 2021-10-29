/**
 * @author ercarval - topi
 */
public abstract class AbstractRepository {
    virtual public List<SObject> save(SObject entity) {
        return this.save(new List<SObject>{ entity });
    }

    virtual public List<SObject> save(List<SObject> entities) {

        upsert entities;

        return entities;
    }

    virtual public List<SObject> saveRelated(List<SObject> entities, String masterRecordId, String relatedFieldName) {

        // force error to test rollback
        // if ( true ) {
        //     throw new RepositoryException('Não vai rolar não');
        // }

        for ( SObject entity : entities ) {
            entity.put(relatedFieldName, masterRecordId);
        }

        return save(entities);
    }

    virtual public void remove(SObject entity) {
        this.remove(new List<SObject>{ entity });
    }

    virtual public void remove(List<SObject> entities) {
        delete entities;
    }
}
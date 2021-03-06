/**
 * @author rickybustillos 
 */
public class PickListInfoBuilder {

    public List<PickListInfo> toPickList(List<SObject> records, String labelFieldName, String valueFieldName) {

        List<PickListInfo> picklist = new List<PickListInfo>();

        for (SObject record : records) {
            picklist.add( buildPickList(record, labelFieldName, valueFieldName) );
        }

        return picklist;
    }

    private PickListInfo buildPickList (SObject record, String labelFieldName, String valueFieldName) {
        return new PickListInfo( 
            String.valueOf(record.get(labelFieldName)), 
            String.valueOf(record.get(valueFieldName))
        );
    }
}

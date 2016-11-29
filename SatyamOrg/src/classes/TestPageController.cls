public class TestPageController 
{
    public String getObjType() 
    {
        return String.valueOf(Account.sObjectType);
    }
    
    public RoleUtil.RoleNodeWrapper getRootNodeOfTree(Id roleOrUserId) 
    {
        return RoleUtil.getRootNodeOfUserTree(roleOrUserId);
    }

    public String getJsonString() 
    {
        String str = null;
        str = RoleUtil.getTreeJSON('00E90000000He0Z');
        return str; 
    }
  
    public String selectedValues {get; set;}

 /*
    public String getJsonString() {
        String str = null;
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartArray();
            gen.writeStartObject();
                gen.writeStringField('title', 'Item1');
                gen.writeStringField('key', 'I1');
            gen.writeEndObject();
            //{title: "Folder 2", isFolder: true, key: "F2",
            gen.writeStartObject();
                gen.writeStringField('title', 'Folder 2');
                gen.writeStringField('key', 'F 2');
                gen.writeBooleanField('isFolder', true);
                gen.writeFieldName('children');
                gen.writeStartArray();
                    //{title: "Sub-item 2.1", key: "I2.1"},
                    gen.writeStartObject();
                        gen.writeStringField('title', 'Sub Item 2.1');
                        gen.writeStringField('key', 'I 2.1');
                    gen.writeEndObject();
                    gen.writeStartObject();
                        gen.writeStringField('title', 'Sub Item 2.2');
                        gen.writeStringField('key', 'I 2.2');
                    gen.writeEndObject();
                gen.writeEndArray();
            gen.writeEndObject();
            //{title: "Item 3"}
            gen.writeStartObject();
                gen.writeStringField('title', 'Item 3');
                gen.writeStringField('key', 'I 3');
            gen.writeEndObject();
        gen.writeEndArray();
        str = gen.getAsString();
        return str; 
    }
*/
}
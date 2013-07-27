${package}

<#list imports as import>
    ${import}
</#list>

public class ${processName} extends ${extendingClass} {

private static Logger LOGGER = Logger.getLogger(${processName}.class);

<#list inputIdentifiers as inputIdentifier>
    private final String inputIdentifier${inputIdentifier} = "${inputIdentifier}";
</#list>

<#list outputIdentifiers as outputIdentifier>
    private final String outputIdentifier${outputIdentifier} = "${outputIdentifier}";
</#list>

@Override
public List<String> getInputIdentifiers() {
    List<String> identifierList = new ArrayList<String>();
    <#list inputIdentifiers as inputIdentifier>
        identifierList.add(${inputIdentifier});
    </#list>
        return identifierList;
    }

@Override
public List<String> getOutputIdentifiers() {
    List<String> identifierList = new ArrayList<String>();
      <#list outputIdentifiers as outputIdentifier>
         identifierList.add(${outputIdentifier});
      </#list>
                return identifierList;
    }

@Override
public Class<?> getInputDataType(String identifier) {
    <#list inputIdentifiers as inputIdentifier>
        if (identifier.equalsIgnoreCase(inputIdentifier${inputIdentifier})) {
        <#assign bindClass="${inputIdentifier}"+"TypeClass">
        return ${bindClass}.class;
    }
    </#list>
    return null;
}

@Override
public Class<?> getOutputDataType(String id) {
     <#list outputIdentifiers as outputIdentifier>
         if (identifier.equalsIgnoreCase(outputIdentifier${outputIdentifier})) {
         <#assign bindClass="${outputIdentifier}"+"TypeClass">
         return ${bindClass}.class;
     }
     </#list>
     return null;
}

@SuppressWarnings({ "unchecked" })
@Override
public Map<String, IData> run(Map<String, List<IData>> inputData) {

}

}

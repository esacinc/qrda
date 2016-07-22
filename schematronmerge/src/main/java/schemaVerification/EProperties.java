package schemaVerification;

import java.util.Properties;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Map;

public class EProperties extends Properties{


	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	public  EProperties () {

	}
	
	public synchronized void load(InputStream inStream) throws IOException{
		super.load( inStream);
		getGlobalVars();
		substituteVars();
		
	}
	 
	private void getGlobalVars(){
		Map<String, String> env = System.getenv();
		//System.out.println(env);
		for(String key: stringPropertyNames()){
			//System.out.println("Key = " +key);
			if (key.startsWith("$")) {
				
				String envVarName =  getProperty(key);
				String newProp =  envVarName .substring(1);
				String newValue = env.get(newProp);
				
				
				System.out.println("Found reference to global =>" + newValue);
				setProperty(newProp, newValue);
				
			}
			
		}
	}
	
	// Take the properties that refer to other properties and
	// resolve those references
	private void substituteVars(){
		
		for(String prop : stringPropertyNames()) {
			
			String oldValue = getProperty(prop);
			
			//System.out.println("Old Value for " + prop + " = " + oldValue);
			
			// Find all the vars to subsitute
			Set<String> subs = findVars(oldValue);
			
			String propValue = getProperty(prop);
			String newValue = propValue;
			
			
			// for each var to substitute
			for (String var : subs) {
				// replace the variable with the value
				
				newValue = getProperty(var);
				String toReplace = "\\$"+var;
                if (newValue != null)
                	propValue  = propValue.replaceAll(toReplace, newValue);		

			}
			propValue = propValue.replace("{", "").replace("}", "");
			setProperty(prop,propValue);
			
		}
	}


    // a a property can refer to another property
	// example  
	//   a=b
	//   c={a}d
	//
	//  a => b ; c => bd
	//
	private Set<String >findVars(String stringIn){
		// A Variable is defined as any string starting with the char '$' and ending with 
		// whitespace or another '$'
		// inside of '{' and '}'
		// examples: 
		//   {$a$b}  contains the variable $a and $b 
		//   {$a $b} contains the variable $a and $b 


		// step 1 - pick off the '{' '}'
		String regexBrackets = "\\{(\\s*\\$\\w+\\s*)*\\}";
		Pattern brackets = Pattern.compile(regexBrackets);
		Set<String> vars = new HashSet<String>();

		Matcher matchBrackets =  brackets.matcher(stringIn);

		while (matchBrackets.find()){
			String varGroup = matchBrackets.group();
			//System.out.println("found group " + varGroup);

			// step 2 - get rid of brackets
			varGroup = varGroup.replace("{","").replace("}", "");
			//System.out.println("After[" + varGroup + "]");

			// step 3 - split based on '$'
			String varRefs[] = varGroup.split("\\$");
			for (String v : varRefs){
				v = v.trim();
				if (v.length() > 0) vars.add(v);
			}

		}

		return (vars);
	}
}





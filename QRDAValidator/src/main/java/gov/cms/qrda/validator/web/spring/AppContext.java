package gov.cms.qrda.validator.web.spring;

import org.springframework.context.ApplicationContext;

public class AppContext {

    private static ApplicationContext ctx;

    /**
     * Injected from the class "ApplicationContextProvider" which is automatically
     * loaded during Spring-Initialization.
     */
    public static void setApplicationContext(ApplicationContext applicationContext) {
        ctx = applicationContext;
    }

    /**
     * Get access to the Spring ApplicationContext from everywhere in your Application.
     *
     * @return
     */
    public static ApplicationContext getApplicationContext() {
        return ctx;
    }
    
    
    public static Object getBean(String bean) {
    	return ctx.getBean(bean);
    }
    
    /**
     * Get the class loader of the Application
     * 
     * @return ClassLoader
     */
    public static ClassLoader getClassLoader() {
        return ctx.getParent() != null ? ctx.getParent().getClassLoader() : ctx.getClassLoader();
    }
} 

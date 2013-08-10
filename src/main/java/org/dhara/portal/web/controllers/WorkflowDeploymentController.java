package org.dhara.portal.web.controllers;

import org.dhara.portal.web.airavataClient.AiravataClientAPIService;
import org.dhara.portal.web.codegen.CodeGenService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: harsha
 * Date: 7/29/13
 * Time: 11:13 AM
 * To change this template use File | Settings | File Templates.
 */
public class WorkflowDeploymentController extends SimpleFormController {

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request,
                                                 HttpServletResponse response) throws Exception {
        String now = (new Date()).toString();
        String workflowId=request.getParameter("workflowId");
        ApplicationContext context= WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
        CodeGenService codeGenService=(CodeGenService) context.getBean("codeGenService");
        String s=codeGenService.getGeneratedClass(workflowId);
        return new ModelAndView("helloworld", "now", "abc");
    }


    protected Map<String,Object> referenceData(HttpServletRequest request) throws Exception {
        Map<String,Object> modelMap=new HashMap<String, Object>();
        return modelMap;
    }
}

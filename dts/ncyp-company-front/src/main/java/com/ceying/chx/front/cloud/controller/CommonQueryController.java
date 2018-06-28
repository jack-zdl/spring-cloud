package com.ceying.chx.front.cloud.controller;

import com.alibaba.fastjson.JSONObject;
//import BaseConstants;
//import org.apache.commons.io.IOUtils;
//import org.apache.commons.lang.ArrayUtils;
//import org.apache.commons.lang.StringUtils;
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.*;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 负责所有查询的接口，指那些左侧菜单栏
 * @version 1.0  2018-1-3
 * @author zhangdl
 *
 */
//@Controller
//@RequestMapping("/common")
public class CommonQueryController  { //implements BaseConstants
	
//	private static Map<String, List<String>> cache = new HashMap<String, List<String>>();
//
//	protected final Logger logger = Logger.getLogger(this.getClass());
//
//	public CommonQueryController(){
//
//	}
//
//	public static ComRowSet getViewConfigCustom(String queryuc,String viewlevel){
//		return RemoteService.getCommonQueryService().getViewConfigCustom(queryuc,viewlevel);
//	}
//
//	public static ComRowSet getInputConfig(String functionno,String viewlevel,String isdefault){
//		return RemoteService.getCommonQueryService().getSvcInterfaceData(functionno, viewlevel,isdefault);
//	}
//
//	public static ComRowSet getMidSearch(String type){
//		return RemoteService.getCommonQueryService().getMidSearchInfo(type);
//	}
//
//	/**
//	 * Ajax登录
//	 * 跳转由js来做
//	 *
//	 * @throws IOException
//	 * by yy  V0.1   2012-7-17
//	 */
//    @RequestMapping("/query.do")
//	public void query(HttpServletRequest request, HttpServletResponse resp)  throws IOException{
//
//    	resp.setContentType("text/html;charset=utf-8");
//        SysUserLogin currUser = (SysUserLogin) request.getSession().getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
//
//    	//Map<String, Object> params = this.getParamMap(request, true);
//    	ComSvcCaller params = initParams(request);
//    	String rows = request.getParameter("rows");
//		String page = request.getParameter("page");
//		String sidx = request.getParameter("sidx");
//		String sord = request.getParameter("sord");
//        String securitylevel = request.getParameter("securitylevel");
//        String pageType = request.getParameter("pageType");
//        boolean isSec=false;
//        if(((ENSecurityLevel.PART.getValue().equals(securitylevel))&& PageType.LISTPAGE.getValue().equals(pageType))
//                ||(ENSecurityLevel.ALL.getValue().equals(securitylevel)&&(PageType.LISTPAGE.getValue().equals(pageType)||PageType.DETAILPAGE.getValue().equals(pageType)))
//                ){
//            isSec=true;
//        }
//        String sumFieldColumn = request.getParameter("sumFieldColumn");
//
//        rows = rows!=null&&!"null".equals(rows)?rows:"50";
//		page = page!=null&&!"null".equals(page)?page:"1";
//		params.setProperty("countperpage",rows);
//		params.setProperty("currentpage",page);
//		params.setProperty("sortBy",sidx);
//		params.setProperty("sortDir",sord);
//        if (StringUtils.isNotBlank(sumFieldColumn)) {
//            params.setProperty("sumFieldColumn", sumFieldColumn);
//        }
//        params.addOrderBy(sidx, "desc".equals(sord) ? "0" : "1");
//
//        String queryType = request.getParameter("queryType");
//        try {
//            if ("1".equals(queryType)) {
//                // 不分页.
//                params.setProperty("needpageflag", "0");
//                // 不计算总记录数.
//                params.setProperty("needcountflag", "0");
//
//                ComRowSet rowSet = RemoteService.getCommonQueryService().query(params);
//
//                rowSet.setTreeInfo(request.getParameter("treeinfo"));
//                resp.getWriter().print(RuiUtil.rowSetToTree(rowSet, request.getParameter("treeLevel")));
//            }else if ("2".equals(queryType)) {
//                //分组grid
//                params.setProperty("needpageflag", "2");
//                params.setProperty("needcountflag", "2");
//
//                ComRowSet rowSet = RemoteService.getCommonQueryService().query(params);
//                String result = RuiUtil.rowSetToGridRui(WebHelper.getDisConversion(rowSet,null), "", rows, page,isSec);
//                resp.getWriter().print(result);
//            }else if("3".equals(queryType)){
//                //预警规则页面预警条件查询
//                ComRowSet rowSet = RemoteService.getWarningRuleService().query(params);
//                String result = RuiUtil.rowSetToGridRui(WebHelper.getDisConversion(rowSet, null), "", rows, page,isSec);
//                resp.getWriter().print(result);
//            }else{
//                ComRowSet set = null;
//                if (!StringUtils.isBlank(sumFieldColumn)) {
//                    params.setProperty("needsumflag", "1");
//                    set = RemoteService.getCommonQueryService().query(params);
//                    Object gridtetle = set.getVpo();
//                    if (gridtetle != null) {
//                        ArrayList list = new ArrayList();
//                        ArrayList list2 = new ArrayList();
//                        int listMap = 0;
//                        ComRowSet rowSet = WebHelper.getDisConversion(set, "DEFAULT");
//                        for (int map = rowSet.getRowCount(); listMap < map; ++listMap) {
//                            HashMap map1 = new HashMap();
//                            int j = 0;
//
//                            for (int m = rowSet.getColCount(); j < m; ++j) {
//                                String tmp = rowSet.getValue(listMap, j);
//                                if (tmp != null && tmp.indexOf("\t") > -1) {
//                                    tmp = tmp.replace("\t", "");
//                                }
//
//                                map1.put(rowSet.getTitle(j), tmp);
//                            }
//
//                            map1.put("dataRight", rowSet.getDataRight(listMap));
//                            list.add(map1);
//                        }
//                        if (gridtetle instanceof ArrayList) {
//                            list2 = (ArrayList) gridtetle;
//                        }
//                        HashMap var9 = new HashMap();
//                        int remainder = rowSet.getTotalRecords()%Integer.parseInt(rows);
//                        int total = rowSet.getTotalRecords()/Integer.parseInt(rows);
//                        var9.put("page", page);
//                        var9.put("totalpage", remainder==0?total:total+1);
//                        var9.put("rows", list);
//                        var9.put("total", Integer.valueOf(rowSet.getTotalRecords()));
//                        var9.put("sumFieldColumn", ((Map) list2.get(0)).get("sum") != null ? ((Map) list2.get(0)).get("sum") : "0.00");
//                        resp.getWriter().print(JsonParser.map2Json(var9));
//                    }
//                } else {
//                    set = RemoteService.getCommonQueryService().query(params);
//                    String result = RuiUtil.rowSetToGridRui(WebHelper.getDisConversion(set, null), "", rows, page, isSec);
//                    dealwithResult(result, resp);
//                }
//            }
//        }catch (Exception e){
//            MessageUtil.print(resp, ErrorCodeConstants.PUB0002, "查询出错");
//        }
//	}
//    /**
//     * 处理查询之后的结果集
//     *
//     * @param result
//     * @param resp
//     * @throws IOException
//     */
//    private void dealwithResult(String result, HttpServletResponse resp) throws IOException{
//    	//如果没有数据返回，则加入异常信息PUB0004，由页面进行判断并抛出异常信息
//    	JSONObject json = JSONObject.parseObject(result);
//    	if("0".equals(json.getString("total"))){
//    		json.put("msg", MessageUtil.format(ErrorCodeConstants.PUB0004, ""));
//    		resp.getWriter().print(json.toString());
//    	}else{
//    		resp.getWriter().print(result);
//    	}
//    }
//
//    @RequestMapping("/loginquery.do")
//   	public void loginQuery(HttpServletRequest request, HttpServletResponse resp) throws IOException{
//       	resp.setContentType("text/html;charset=utf-8");
//
//        ComSvcCaller params = new HsSvcCaller();
//        params.setFunctionNo(request.getParameter("uc"));
//        params.addOrderBy(request.getParameter("sortBy"), "desc".equals(request.getParameter("sortDir")) ? "0" : "1");
//        params.setPropObject(HsSvcCaller.CURRENTUSER, getCurrentUser(request));
//        params.setPropObject("userDtp", getUserserdtp(request));
//        params.setCountPerPage(getParamPagesize(request));
//        params.setCurrentPage(getParamCurrentPage(request));
//        params.setProperty("needdatarightflag", StringUtils.defaultIfEmpty(request.getParameter("needdatarightflag"), "1"));
//        //params.setProperty("rightviewflag", req.getParameter("rightviewflag"));//数据权限
//        setParamsByUC(request, params);
//        params.setProperty("paytyperole", "1");
//        params.setProperty("accounttyperole", "1");
//        params.setProperty("groupflag", "1");
//        String switchorgid = (String) request.getSession().getAttribute("switchorgid");
//        params.setProperty("switchorgid", switchorgid);
//
//        SysUserLogin sysUserLogin=(SysUserLogin)request.getSession().getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
//        params.setPropObject("sysUserLogin",sysUserLogin);
//
//        // 2015-04-29 liujn 将授权传递到后面
//        String authenticateduser = request.getParameter("authuser");
//        if (StringUtils.isNotBlank(authenticateduser)) {
//            params.setPropObject("authenticateduser", (AuthenticatedUser) request.getSession().getAttribute("authenticateduser"));
//        }
//        //TIANAN-7 2015-03-04 liujn 特殊处理下级组织
//        //2015-08-28 liujn 支持多个
//        String includeflag = "";
//        Enumeration enu = request.getParameterNames();
//        while (enu.hasMoreElements()) {
//            String key = enu.nextElement().toString();
//            if (key.contains("includeflag")) {
//                String value = request.getParameter(key);
//                if (value == null) {
//                    value = "";
//                }
//                key = key.split("_")[1];
//                //不为空的才处理
//                if (StringUtil.isNotNull(request.getParameter(key)) && StringUtil.isNotNull(value)) {
//                    includeflag += "," + value;
//                }
//            }
//        }
//
//        // 设置高级查询条件.
//        String propertys = request.getParameter("propertys");
//        String values = request.getParameter("values");
//        String conditions = request.getParameter("conditions");
//        if (StringUtils.isNotBlank(propertys) && StringUtils.isNotBlank(values) && StringUtils.isNotBlank(conditions)) {
//            String[] property = StringUtils.split(propertys, ",");
//            String[] value = StringUtils.split(values, ",");
//            String[] condition = StringUtils.split(conditions, ",");
//            for (int i = 0, n = property.length; i < n; i++) {
//                params.setPropObjectValues(property[i], new HsExprItem[] { new HsExprItem(property[i], condition[i], value[i], null) });
//                if (StringUtils.contains(property[i], "includeflag")) {
//                    HsExprItem[] items = (HsExprItem[]) params.getPropObject(value[i]);
//                    if (items != null) {
//                        String flagvalue = items[0].getValue();
//                        if (StringUtil.isNotNull(flagvalue)) {
//                            includeflag += "," + value[i];
//                        }
//                    }
//                }
//            }
//        }
//
//        if (StringUtils.isNotEmpty(includeflag)) {
//            params.setProperty("includeflag", includeflag.substring(1));
//        }
//
//       	String rows = request.getParameter("rows");
//   		String page = request.getParameter("page");
//   		String sidx = request.getParameter("sidx");
//   		String sord = request.getParameter("sord");
//   		rows = rows!=null&&!"null".equals(rows)?rows:"50";
//   		page = page!=null&&!"null".equals(page)?page:"1";
//   		params.setProperty("countperpage",rows);
//   		params.setProperty("currentpage",page);
//   		params.setProperty("sortBy",sidx);
//   		params.setProperty("sortDir",sord);
//           params.addOrderBy(sidx, "desc".equals(sord) ? "0" : "1");
//
//           String queryType = request.getParameter("queryType");
//
//           if ("1".equals(queryType)) {
//   			// 不分页.
//   			params.setProperty("needpageflag", "0");
//   			// 不计算总记录数.
//   			params.setProperty("needcountflag", "0");
//
//   			ComRowSet rowSet = RemoteService.getCommonQueryService().query(params);
//
//   			rowSet.setTreeInfo(request.getParameter("treeinfo"));
//   			resp.getWriter().print(RuiUtil.rowSetToTree(rowSet, request.getParameter("treeLevel")));
//   		}else if ("2".equals(queryType)) {
//   			//分组grid
//   			params.setProperty("needpageflag", "2");
//   			params.setProperty("needcountflag", "2");
//
//   			ComRowSet rowSet = RemoteService.getCommonQueryService().query(params);
//   	    	String result = RuiUtil.rowSetToGridRui(WebHelper.getDisConversion(rowSet,null), "", rows, page,false);
//   			resp.getWriter().print(result);
//   		}else{
//
//   	    	ComRowSet rowSet = RemoteService.getCommonQueryService().query(params);
//   	    	String result = RuiUtil.rowSetToGridRui(WebHelper.getDisConversion(rowSet,null), "", rows, page,false);
//   			resp.getWriter().print(result);
//   		}
//
//   	}
//
//    @RequestMapping("/fileDownload.do")
//    public void fileDownload(HttpServletRequest request, HttpServletResponse resp) throws Exception{
//        String ids = request.getParameter("ids");
//        CommonTransfer<Tblobstorage> context = new CommonTransfer<Tblobstorage>();
//        Map<String, Object> pros = new HashMap<String, Object>();
//        pros.put(REQUEST_RESCODE, "fileupload");
//        pros.put(REQUEST_OPCODE,"find");
//        pros.put("ids",ids);
//        context.setProperties(pros);
//        CommonTransfer<Tblobstorage> rtnContext  =  RemoteService.getBlobStorageService().action(context);
//
//        List<Map<String, Object>> storageList = (List<Map<String, Object>>) rtnContext.getProperties().get("accessoryList");
//
//        resp.setContentType("application/*;charset=UTF-8");
//        resp.setHeader("Pragma", "no-cache");
//        resp.setHeader("Cache-Control", "no-cache");
//        resp.setDateHeader("Expires", 0);
//        BufferedOutputStream out = null;
//        try {
//            resp.setHeader("Content-disposition",
//                    "attachment;filename=" + URLEncoder.encode((String) storageList.get(0).get("cfilename"), "UTF-8"));
//            out = new BufferedOutputStream(resp.getOutputStream());
//            IOUtils.write((byte[]) storageList.get(0).get("baccessory"), out);
//            out.flush();
//        }
//        catch (Exception e) {
//            throw new WebException(e);
//        }
//        finally {
//            IOUtils.closeQuietly(out);
//        }
//        //MessageUtil.print(resp, rtnContext.getProperties().get(ERR_CODE), rtnContext.getProperties().get(ERR_MSG));
//    }
//
//    /**
//	 * jsp查询
//	 * @throws IOException
//	 */
//    public static ComRowSet search(String queryuc,String[] fieldArray,String[] valueArray) throws IOException{
//    	ComSvcCaller params = new HsSvcCaller();
//    	if (!ArrayUtils.isEmpty(fieldArray) && !ArrayUtils.isEmpty(valueArray)) {
//			for (int i = 0; i < fieldArray.length; i++) {
//				if (StringUtils.isNotBlank(fieldArray[i])
//						&& StringUtils.isNotBlank(valueArray[i])) {
//					params.setProperty(fieldArray[i], valueArray[i]);
//				}
//			}
//		}
//    	params.setProperty("countperpage","100");
//        params.setFunctionNo(queryuc);
//    	ComRowSet rowSet = WebHelper.getDisConversion(RemoteService.getCommonQueryService().query(params),null);
//        return rowSet;
//	}
//
//
//    /**
//	 * jsp查询
//	 * @throws IOException
//	 */
//    public static String getSysparameterByPK(String sysname, String cclass,String item) throws IOException{
//        return RemoteService.getCommonQueryService().getSysparameterByPK(sysname, cclass, item);
//	}
//
//    @RequestMapping("/queryComboGrid.do")
//	public void exeComboGrid(HttpServletRequest req, HttpServletResponse resp) throws IOException{
//        ComRowSet rowSet = RemoteService.getCommonQueryService().getMidSearchInfo(req.getParameter("searchType"));
//        ComSvcCaller params = initParams(req);
//        params.setFunctionNo(rowSet.getValue(0, "C_FUNCTIONNO"));
//        //params.setPropObject(HsSvcCaller.CURRENTUSER, getCurrentUser());
//        //params.setCountPerPage(getParamPagesize());
//        //params.setCurrentPage(getParamCurrentPage());
//        params.setProperty("paytyperole", "1");
//        params.setProperty("accounttyperole", "1");
//        params.setProperty("groupflag", "1");
//
//        String rows = req.getParameter("rows");
//    	String page = req.getParameter("page");
//    	String sidx = req.getParameter("sidx");
//    	String sord = req.getParameter("sord");
//
//    	params.setProperty("countperpage",rows);
//    	params.setProperty("currentpage",page);
//    	params.setProperty("sortBy",sidx);
//    	params.setProperty("sortDir",sord);
//        params.addOrderBy(sidx, "desc".equals(sord) ? "0" : "1");
//
//        setParamsByUC(req, params);
//
//        ComRowSet comRowSet = RemoteService.getCommonQueryService().query(params);
//        resp.getWriter().print(RuiUtil.rowSetToGridRui(comRowSet,"",rows,page,false));
//
//    }
//
//    @RequestMapping("/queryDicOption.do")
//	public void getDicOption(HttpServletRequest req, HttpServletResponse resp) throws IOException{
//    	resp.setContentType("text/html;charset=utf-8");
//
//        String keyno = req.getParameter("keyno");
//        //允许的字典keyvalue，用于过滤字典下拉框，多个则以逗号隔开。例：1,2,3,4
//        String allowKeyValue = req.getParameter("allowkeyvalue");
//        resp.getWriter().print(RuiUtil.getDicOptionToJsonByKeyno(keyno, allowKeyValue));
//    }
//
//    @SuppressWarnings("rawtypes")
//    protected ComSvcCaller initParams(HttpServletRequest req) {
//        ComSvcCaller params = new HsSvcCaller();
//        params.setFunctionNo(req.getParameter("uc"));
//        params.addOrderBy(req.getParameter("sortBy"), "desc".equals(req.getParameter("sortDir")) ? "0" : "1");
//        params.setPropObject(HsSvcCaller.CURRENTUSER, getCurrentUser(req));
//        params.setPropObject("userDtp", getUserserdtp(req));
//        params.setCountPerPage(getParamPagesize(req));
//        params.setCurrentPage(getParamCurrentPage(req));
//        params.setProperty("needdatarightflag", StringUtils.defaultIfEmpty(req.getParameter("needdatarightflag"), "1"));
//        //params.setProperty("rightviewflag", req.getParameter("rightviewflag"));//数据权限
//        setParamsByUC(req, params);
//
//        params.setProperty("paytyperole", "1");
//        params.setProperty("accounttyperole", "1");
//        params.setProperty("groupflag", "1");
//
//		SysUserLogin currUser=(SysUserLogin)req.getSession().getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
//        params.setProperty("tenantid", currUser.getTenant_id().toString());
//        params.setProperty("switchorgid", currUser.getOrg_id());
//
//        SysUserLogin sysUserLogin=(SysUserLogin)req.getSession().getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
//        params.setPropObject("sysUserLogin",sysUserLogin);
//        // 2015-04-29 liujn 将授权传递到后面
//        String authenticateduser = req.getParameter("authuser");
//        if (StringUtils.isNotBlank(authenticateduser)) {
//            params.setPropObject("authenticateduser", (AuthenticatedUser) req.getSession().getAttribute("authenticateduser"));
//        }
//        //TIANAN-7 2015-03-04 liujn 特殊处理下级组织
//        //2015-08-28 liujn 支持多个
//        String includeflag = "";
//        Enumeration enu = req.getParameterNames();
//        while (enu.hasMoreElements()) {
//            String key = enu.nextElement().toString();
//            if (key.contains("includeflag")) {
//                String value = req.getParameter(key);
//                if (value == null) {
//                    value = "";
//                }
//                key = key.split("_")[1];
//                //不为空的才处理
//                if (StringUtil.isNotNull(req.getParameter(key)) && StringUtil.isNotNull(value)) {
//                    includeflag += "," + value;
//                }
//            }
//        }
//
//        // 设置高级查询条件.
//        String propertys = req.getParameter("propertys");
//        String values = req.getParameter("values");
//        String conditions = req.getParameter("conditions");
//        if (StringUtils.isNotBlank(propertys) && StringUtils.isNotBlank(values) && StringUtils.isNotBlank(conditions)) {
//            String[] property = StringUtils.split(propertys, ",");
//            String[] value = StringUtils.split(values, ",");
//            String[] condition = StringUtils.split(conditions, ",");
//            for (int i = 0, n = property.length; i < n; i++) {
//                params.setPropObjectValues(property[i], new HsExprItem[] { new HsExprItem(property[i], condition[i], value[i], null) });
//                if (StringUtils.contains(property[i], "includeflag")) {
//                    HsExprItem[] items = (HsExprItem[]) params.getPropObject(value[i]);
//                    if (items != null) {
//                        String flagvalue = items[0].getValue();
//                        if (StringUtil.isNotNull(flagvalue)) {
//                            includeflag += "," + value[i];
//                        }
//                    }
//                }
//            }
//        }
//
//        if (StringUtils.isNotEmpty(includeflag)) {
//            params.setProperty("includeflag", includeflag.substring(1));
//        }
//        return params;
//    }
//
//    protected String getParamPagesize(HttpServletRequest req) {
//        return StringUtils.defaultIfEmpty(req.getParameter("limit"), "50");
//    }
//
//    protected String getParamCurrentPage(HttpServletRequest req) {
//        return StringUtils.defaultIfEmpty(req.getParameter("pageNum"), "1");
//    }
//
//    protected void printOkMsg(HttpServletResponse resp ) {
//        print(resp, MsgEncoder.okMsg());
//    }
//
//    protected void printOkMsg(HttpServletResponse resp, String msg) {
//        print(resp, MsgEncoder.okMsg(msg));
//    }
//
//    protected void printErrMsg(HttpServletResponse resp) {
//        print(resp, MsgEncoder.errMsg());
//    }
//
//    protected void printErrMsg(HttpServletResponse resp, String msg) {
//        print(resp, MsgEncoder.errMsg(msg));
//    }
//
//    protected AuthenticatedUser getCurrentUser(HttpServletRequest req) {
//        return (AuthenticatedUser) req.getSession().getAttribute("authenticateduser");
//    }
//
//    protected Object getUserserdtp(HttpServletRequest req) {
//        return getCurrentUser(req);
//    }
//
//    protected void print(HttpServletResponse resp, Object value) {
//    	getWriter(resp).print(value);
//    }
//
//    protected void println(HttpServletResponse resp, Object value) {
//        getWriter(resp).println(value);
//    }
//
//	private PrintWriter getWriter(HttpServletResponse rep) {
//		PrintWriter writer = null;
//		rep.setContentType("text/html;charset=UTF-8");
//		try {
//			writer = rep.getWriter();
//		} catch (IOException e) {
//			throw new WebException("初始化数据输出流失败！");
//		}
//		return writer;
//	}
//
//
//    @SuppressWarnings("unchecked")
//	protected Map<String,Object> getParamMap(HttpServletRequest request, boolean addUserId){
//    	Enumeration<String> names = request.getParameterNames();
//		Map<String,Object> vmap=new HashMap<String,Object>(3);
//		while(names.hasMoreElements()){
//			String name=names.nextElement();
//			String[] values=request.getParameterValues(name);
//			if(values!=null){
//				if(values.length==1){
//					vmap.put(name, values[0]);
//				}
//				if(values.length>1){
//					vmap.put(name, values);
//				}
//			}
//		}
//		if(addUserId){
//			vmap.put("userId", request.getSession().getAttribute("user"));
//		}
//		return vmap;
//    }
//
//
//    protected void setParamsByUC(HttpServletRequest req, ComSvcCaller params) {
//        if (StringUtils.isNotBlank(params.getFunctionNo())) {
//            List<String> list = null;
//        	if(cache.containsKey(params.getFunctionNo())){
//        		list = cache.get(params.getFunctionNo());
//        	}else{
//        		list = RemoteService.getCommonQueryService().getInputProperty(params.getFunctionNo());//TemplateHelper.getInputProperty(params.getFunctionNo());
//        		cache.put(params.getFunctionNo(), list);
//        	}
//            for (int i = 0, n = list.size(); i < n; i++) {
//                String name = list.get(i);
//                String value = req.getParameter(name);
//                if (StringUtils.isNotBlank(value)) {
//                    params.setProperty(name, value);
//                }
//            }
//        }
//    }
//
//    /**
//	 * 获取urid
//	 * @throws IOException
//	 */
//    @RequestMapping("/getUUID.do")
//    public static void getUUID(HttpServletRequest request, HttpServletResponse resp) throws IOException{
//    	String urid = SequenceUtil.UUID();
//    	String result = "{\"page\":\"1\",\"rows\":[{\"urid\":\"" + urid + "\"}],\"total\":\"1\",\"totalpage\":\"1\"}";
//		resp.getWriter().print(result);
//	}
//    /**
//     * excel导出
//     *
//     * @param req
//     * @param resp
//     * @return
//     */
//    @RequestMapping("/exportExcel.do")
//    public String exportExcel(HttpServletRequest req, HttpServletResponse resp) {
//        try {
//            String uuid = (String) req.getSession().getAttribute("uuid");
//            if (StringUtils.isNotEmpty(uuid)) {
//                req.getSession().removeAttribute("uuid");
//                //printInfo("[你正在执行导出操作，请稍候再进行其他文件的导出!]");
//                return "none";
//            }
//            uuid = SequenceUtil.UUID();
//            req.getSession().setAttribute("uuid", uuid);
//            ComSvcCaller params = initParams(req);
//            String rows = req.getParameter("rows");
//            String page = req.getParameter("page");
//            String sidx = req.getParameter("sidx");
//            String sord = req.getParameter("sord");
//            //String sumFiledgroup = request.getParameter("sumfiledgroup");
//            String sumFieldColumn = req.getParameter("sumFieldColumn");
//            rows = rows != null && !"null".equals(rows) ? rows : "50";
//            page = page != null && !"null".equals(page) ? page : "1";
//            params.setProperty("countperpage", rows);
//            params.setProperty("currentpage", page);
//            params.setProperty("sortBy", sidx);
//            params.setProperty("sortDir", sord);
//            params.setFunctionNo(req.getParameter("uc"));
//            String exportFlag = req.getParameter("exportFlag");
//            params.setProperty("needpageflag", exportFlag);
//            String expspflag = req.getParameter("expspflag");
//            if (StringUtils.isNotBlank(sumFieldColumn)) {
//                // params.setProperty("sumFiledgroup", sumFiledgroup);
//                params.setProperty("sumFieldColumn", sumFieldColumn);
//            }
//            if (StringUtil.isNotNull(expspflag)) {
//                params.setProperty("needsumflag", expspflag);
//                params.setProperty("expspflag", expspflag);
//            }
//            StringBuilder title = new StringBuilder();
//            title.append(req.getParameter("title")).append("_");
//            title.append(DateUtil.formatDate(new Date(), "yyyyMMddHHmmss")).append(
//                    "_");
////            title.append(getCurrentUser().getUser().getCusername()).append(".xls");
//            title.append(params.getProperty("tenantid")).append(".xls");
//            //在这里获取系统参数：'导出所有'中单个文件保存的记录最大数量,如果没有配置该参数默认为0
//            int singleFileRecordSize = 0;
//            String singleFileRecordSizeStr = "";
//            int totalRecordSize = 0;
//            if ("0".equalsIgnoreCase(exportFlag)) {
//                singleFileRecordSizeStr = "20000";
//                //在这里获取当前需要导出的实际记录数量
//                ComRowSet rowSetPartTitle = RemoteService.getCommonQueryService().query(params);
//                totalRecordSize = rowSetPartTitle.getTotalRecords();
//                if (singleFileRecordSizeStr != null && !"".equals(singleFileRecordSizeStr)) {
//                    singleFileRecordSize = Integer.parseInt(singleFileRecordSizeStr);
//                }
//            }
//            if ("0".equalsIgnoreCase(exportFlag) && totalRecordSize > singleFileRecordSize) {
//                exportAllExcel(req, params, title.toString(), resp);
//            } else {
//                params.setProperty("needsumflag", "1");
//                ComRowSet set = RemoteService.getCommonQueryService().query(params);
//                Object gridtetle = set.getVpo();
//                if (gridtetle != null) {
//                    ArrayList list = new ArrayList();
//                    ArrayList list2 = new ArrayList();
//                    int listMap = 0;
//                    ComRowSet rowSet = WebHelper.getDisConversion(set, "DEFAULT");
//                    for (int map = rowSet.getRowCount(); listMap < map; ++listMap) {
//                        HashMap map1 = new HashMap();
//                        int j = 0;
//
//                        for (int m = rowSet.getColCount(); j < m; ++j) {
//                            String tmp = rowSet.getValue(listMap, j);
//                            if (tmp != null && tmp.indexOf("\t") > -1) {
//                                tmp = tmp.replace("\t", "");
//                            }
//
//                            map1.put(rowSet.getTitle(j), tmp);
//                        }
//
//                        map1.put("dataRight", rowSet.getDataRight(listMap));
//                        list.add(map1);
//                    }
//                    if (gridtetle instanceof ArrayList) {
//                        list2 = (ArrayList) gridtetle;
//                    }
//                    //ExcelHandle.writeExcel(resp, rowSet, "0", title.toString(), params,
//                          //  ((Map) list2.get(0)).get("sum") != null ? FString.valueOf(((Map) list2.get(0)).get("sum")) : "0.00", FString.valueOf(rowSet.getTotalRecords()));
//                }
//            }
//
//        } catch (BOException e) {
//
//        } finally {
//            req.getSession().removeAttribute("uuid");
//        }
//        return "none";
//    }
//
//    /**
//     * @param req
//     * @param params
//     * @param filename
//     * @param resp
//     * @return
//     */
//    protected String exportAllExcel(HttpServletRequest req, ComSvcCaller params, String filename, HttpServletResponse resp) {
//        AuthenticatedUser auuser = (AuthenticatedUser) params.getPropObject(HsSvcCaller.CURRENTUSER);
//        int perexportCount = 2000;
//        int fileCount = 0;
//        String path = CommonUtil.createFilePath(req);
//        params.setProperty("asycountflag", "1");
//        if (StringUtil.isNotNull(params.getProperty("expspflag"))) {
//            params.setProperty("asycountflag", "");
//        }
//        ComRowSet rowSetPartTitle = RemoteService.getCommonQueryService().query(params);
//        int totalCount = rowSetPartTitle.getTotalRecords();
//        params.setProperty("asycountflag", "");
//
//        if (totalCount > 100000) {
//            throw new WebException("请缩下查询范围,导出数据不能够大于100000条！");
//        }
//
//        int pageSize = totalCount / perexportCount;
//        int modCount = (totalCount % perexportCount) == 0 ? pageSize
//                : pageSize + 1;
//        CountDownLatch coutLatch = new CountDownLatch(modCount);
//        ExecutorService exeService = Executors.newFixedThreadPool(10);
//        try {
//            for (int index = 0; index < modCount; index++) {
//                fileCount++;
//                HsSvcCaller tempCaller = new HsSvcCaller();
//
//                BeanUtils.copyProperties(params, tempCaller);
//                if (params.getOrderBy() != null) {
//                    for (String[] str : params.getOrderBy()) {
//                        tempCaller.addOrderBy(str[0], str[1]);
//                    }
//                }
//                tempCaller.setWrapper((Map) BeanUtil.getPropertyValueByName(params, "wrapper"));
//                tempCaller.setCountPerPage(String.valueOf(perexportCount));
//                tempCaller.setCurrentPage(String.valueOf(index + 1));
//                // 分页
//                tempCaller.setProperty("needpageflag", "1");
//                // 不计算总记录
//                tempCaller.setProperty("needcountflag", "0");
//                RowSetToExcel doExcel = new RowSetToExcel(tempCaller, fileCount, path,
//                        coutLatch, req, auuser);
//                exeService.execute(doExcel);
//            }
//        } catch (Exception e) {
//            throw new WebException(e);
//        } finally {
//            try {
//                coutLatch.await();
//            } catch (InterruptedException e) {
//                throw new WebException(e);
//            }
//            exeService.shutdown();
//        }
//        return CommonUtil.downloadExcel(path, fileCount, filename, resp);
//    }
//    public static Map<String, List<String>> getCache() {
//        return cache;
//    }
//
//    public static void setCache(Map<String, List<String>> cache) {
//        CommonQueryController.cache = cache;
//    }
//
//    public static String getIndividuation(String CorecompanyId) throws IOException{
//        String securitylevel = ENSecurityLevel.NONE.getValue();
//        Map<String,Object> corecompanyIndividuations=RemoteService.getSysBaseDataCache().getCacheData(ENDataCacheKey.CORECOMPANYINDIVIDUATION);
//        if(corecompanyIndividuations!=null){
//            Map<String,Object> corecompanyIndividuation = (Map<String,Object>)corecompanyIndividuations.get(CorecompanyId);
//            if(corecompanyIndividuation != null){
//                securitylevel = (String)corecompanyIndividuation.get("securitylevel");
//            }
//        }
//        return securitylevel;
//    }
//    public static String getOrgCate(String orgId) throws IOException{
//
//        Map<String,Object> organizationall= RemoteService.getSysBaseDataCache().getCacheData(ENDataCacheKey.ORGANIZATIONAll);
//        Map<String,Object> organization= (Map<String,Object>)organizationall.get(orgId);
//        String org_cate = (String)organization.get("org_cate");
//        return org_cate;
//    }
//    public static String getSecurityLevel(String CorecompanyId,String orgId) throws IOException{
//        String securityLevel = ENSecurityLevel.NONE.getValue();//初始保密级别为1
//        String orgCate = getOrgCate(orgId);
//        if(orgCate.equals(OrgCodeEnum.BANKCATE.getValue())){//组织类型为融资提供方企业
//            securityLevel = getIndividuation(CorecompanyId);
//        }
//        return securityLevel;
//    }
//    public static String getQuoteTemplate(String orgId) throws IOException{
//        String quotetemplate = ENQuoteTemplate.REALRATE.getValue();
//        Map<String,Object> bankindividuations=RemoteService.getSysBaseDataCache().getCacheData(ENDataCacheKey.BANKINDIVIDUATION);
//        if(bankindividuations != null){
//            Map<String,Object> bankindividuation = (Map<String,Object>)bankindividuations.get(orgId);
//            if(bankindividuation != null){
//                quotetemplate =  (String)bankindividuation.get("quotetemplate");
//            }
//        }
//        return quotetemplate;
//    }
//
//    public static Map<String,Object> getOrganizationRelation(String CorecompanyId,String BankId) throws IOException{
//        Map<String,Object> organizationrelationall= RemoteService.getSysBaseDataCache().getCacheData(ENDataCacheKey.ORGANIZATIONRELATION);
//        Map<String,Object> organizationrelation= (Map<String,Object>)organizationrelationall.get(CorecompanyId+BankId);
//
//        return organizationrelation;//FString.valueOf(organizationrelation.get("extensiondate"));
//    }
//
//    /**
//     * 获取待签约信息
//     *
//     * @throws IOException
//     */
//    @RequestMapping("/getBase64SignInfo.do")
//    public void getBase64SignInfo(HttpServletRequest request, HttpServletResponse resp) throws IOException {
//        String signinfo = request.getParameter("signinfo");
//        if(signinfo!=null){
//            resp.setContentType("text/html;charset=utf-8");
//            Map<String, String> resultMap = new HashMap<String, String>();
//            resultMap.put("template", Base64.getEncoder().encodeToString(signinfo.getBytes()));
//            net.sf.json.JSONObject json = net.sf.json.JSONObject.fromObject(resultMap);
//            resp.getWriter().print(json.toString());
//        }
//    }
//
//    public static boolean getUserInfo(String userid,String roleCode) throws Exception{
//        boolean flag=RemoteService.getSysUserLoginAndOutService().getUserInfo(userid,roleCode);
//        return flag;
//    }
//
//    public static Map<String,Object> getOrgMap(String orgId) throws IOException{
//        Map<String,Object> organizationall= RemoteService.getSysBaseDataCache().getCacheData(ENDataCacheKey.ORGANIZATIONAll);
//        Map<String,Object> organization= (Map<String,Object>)organizationall.get(orgId);
//        return organization;
//    }
//
//    public static String getTROrderNumber(String orgId) throws Exception{
//        return RemoteService.getMyAccountService().getOrderNumber(orgId);
//    }

}

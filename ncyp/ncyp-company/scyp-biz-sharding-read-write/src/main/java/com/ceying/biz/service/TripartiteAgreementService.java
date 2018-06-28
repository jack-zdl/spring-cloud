package com.ceying.biz.service;

import com.ceying.biz.query.AccountsPayableQuoteQuery;
import com.ceying.biz.query.TripartiteAgreementDoneQuery;
import com.ceying.biz.query.TripartiteAgreementQuery;
import com.ceying.biz.query.TripartiteAgreementTaskQuery;
import com.ceying.common.base.CypRowSet;
import com.ceying.common.exception.ServiceException;
import com.ceying.common.util.response.BaseReturnResult;
import java.lang.reflect.InvocationTargetException;


public interface TripartiteAgreementService {
    /**
     * 新增方法校验类型
     */
    public final static int saveType = 1;

    public final static int LOADTYPE = 2;

    public final static int REJECTTYPE = 3;

    public final static int SUPPLIERCANCEL = 4;

    public final static int GATHERTYPE = 5;

    public final static int CALLFIRST = 6;

    public final static int CALLNOFIRST = 7;
    /****************************************************************/
    public final static int runningType = 1;

    public final static int dongType = 2;

    public final static int SYSTEMTYPE = 3;

    public final static String WORKFLOWSIGN = "agreement";
    CypRowSet<TripartiteAgreementQuery> listUsableAccountPayble(String orhId);
    CypRowSet<TripartiteAgreementQuery> listUsableAccountPayble();
    CypRowSet<AccountsPayableQuoteQuery> listUsableQuote(String id);
    CypRowSet<TripartiteAgreementQuery> listRunningTripartiteAgreement() throws InvocationTargetException, IllegalAccessException;
    CypRowSet<TripartiteAgreementDoneQuery> listDoneTripartiteAgreement() throws InvocationTargetException, IllegalAccessException;
    CypRowSet<TripartiteAgreementDoneQuery> getDoneTripartiteAgreement(String urid);
    CypRowSet<TripartiteAgreementTaskQuery> listDoneTaskTripartiteAgreement() ;
    BaseReturnResult orgbyparam(String urid) throws ServiceException;
    /*
     * @description 邀请菜单，查询总融资金额
     * @author mzq
     * @date 2018/6/5
     * @param [vo]
     * @return com.alibaba.fastjson.JSONObject
     */
    String sumFinancingamount(String opporgid,String ourorgid);
}

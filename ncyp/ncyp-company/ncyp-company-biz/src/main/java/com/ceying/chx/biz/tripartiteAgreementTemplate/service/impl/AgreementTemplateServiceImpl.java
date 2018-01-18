package com.ceying.chx.biz.tripartiteAgreementTemplate.service.impl;

import com.ceying.chx.common.constants.SysCodeEnum;
import com.ceying.chx.common.constants.TaTemplateEnum;
import com.ceying.chx.common.constants.UserConstant;
import com.ceying.chx.common.dao.triagreementtemp.TaTemplateOperationsDao;
import com.ceying.chx.common.dao.triagreementtemp.TripartiteagreementTemplateDao;
import com.ceying.chx.common.dto.SysUserLoginDto;
import com.ceying.chx.common.entity.triagreementtemp.TaTemplateOperations;
import com.ceying.chx.common.util.SequenceUtil;
import com.ceying.chx.common.util.response.RespJson;

import com.ceying.chx.common.utils.cfca.CfcaUtils;
import com.ceying.chx.common.utils.stringtools.FString;
import com.ceying.chx.biz.tripartiteAgreementTemplate.service.AgreementTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

/**
 * 功能说明: 三方协议模板<br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2018/1/2<br>
 * <br>
 */
@Service
public class AgreementTemplateServiceImpl implements AgreementTemplateService {
    /**
     * 待发布标识
     */
    private static final String BEFORESENDFLAG = "100";

    @Resource
    private TripartiteagreementTemplateDao agreementTemplateDao;

    @Resource
    private TaTemplateOperationsDao taTemplateOperationsDao;

    @Autowired
    private TransactionTemplate transactionTemplate;

    //三方协议模板新增
    @Override
    public
    RespJson agreementTemplateAdd(HttpServletRequest request, TripartiteagreementTemplate agreementTemplate) {
        //事物控制
        RespJson respJson = transactionTemplate.execute(new TransactionCallback<RespJson>() {
            @Override
            public RespJson doInTransaction(TransactionStatus transactionStatus) {
                RespJson respJson = doAdd(request, agreementTemplate);
                if (-1 == respJson.getResult()) {
                    transactionStatus.setRollbackOnly();
                }
                return respJson;
            }
        });
        return respJson;
    }

    //新增具体操作
    public RespJson doAdd(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate) {
        RespJson respJson=new RespJson();
        HttpSession session = request.getSession();
        TripartiteagreementTemplate TripartiteagreementTemplate = new TripartiteagreementTemplate();
        SysUserLoginDto currUser = (SysUserLoginDto) session.getAttribute(UserConstant.USER_LOGIN_SESSION); //得到session中的user对象
        String urid = SequenceUtil.UUID();
        String orgid = currUser.getOrgId();
        TripartiteagreementTemplate.setUrid(urid);
        TripartiteagreementTemplate.setTenantId(currUser.getTenantId()); //租户ID
        TripartiteagreementTemplate.setTatemplateCode(tripartiteagreementTemplate.getBankId() + tripartiteagreementTemplate.getCorecompanyId() + "1");
        TripartiteagreementTemplate.setTatemplateVersion(Integer.parseInt(SysCodeEnum.VERSION.getValue()));
        TripartiteagreementTemplate.setBankId(tripartiteagreementTemplate.getBankId());
        TripartiteagreementTemplate.setCorecompanyId(tripartiteagreementTemplate.getCorecompanyId());
        TripartiteagreementTemplate.setCreditLimit(Double.parseDouble("1")); //自定义的
        TripartiteagreementTemplate.setCreateby(currUser.getUserName());
        TripartiteagreementTemplate.setCreatedon(new Date());
        TripartiteagreementTemplate.setDescription(tripartiteagreementTemplate.getDescription());
        TripartiteagreementTemplate.setIsresourse(tripartiteagreementTemplate.getIsresourse());
        TripartiteagreementTemplate.setLastOperateflag(TaTemplateEnum.BEFORESEND.getName());
        TripartiteagreementTemplate.setIsactive("2");
        TripartiteagreementTemplate.setRowversion(Integer.valueOf(SysCodeEnum.VERSION.getValue()));
        TripartiteagreementTemplate.setTemplateContent(tripartiteagreementTemplate.getTemplateContent());

        //判断是否已有相同模板
        if (existTriAgreementTemp(tripartiteagreementTemplate.getBankId(), tripartiteagreementTemplate.getCorecompanyId())) {
            //已存在相同模板，无法新增
            respJson.setMsg("已存在相同模板，无法新增");
            respJson.setResult(-1);
            return respJson;
        } else {
            try {
                agreementTemplateDao.insertSelective(TripartiteagreementTemplate);
                TaTemplateOperations taTemplateOperations = getSimpleTaTemplateOperations(urid, currUser.getUserName(), orgid, TaTemplateEnum.BEFORESEND.getName());
                taTemplateOperations.setSignature("签名");//签名信息
                taTemplateOperations.setRelateoperateId("null"); //关联操作ID
                taTemplateOperations.setRowversion(Short.parseShort("1"));  //修改版本
                taTemplateOperations.setDescription("待发布");
                taTemplateOperationsDao.insertSelective(taTemplateOperations);
                respJson.setMsg("操作成功");
                respJson.setResult(1);
            } catch (Exception e) {
                e.printStackTrace();
                respJson.setMsg("操作失败");
                respJson.setResult(-1);
            }
        }
        return respJson;
    }

    //判断是否具有相同模板
    public boolean existTriAgreementTemp(String bankId, String corecompanyId) {
        TripartiteagreementTemplate template = new TripartiteagreementTemplate();
        template.setBankId(bankId);
        template.setCorecompanyId(corecompanyId);
        int count = agreementTemplateDao.selectForSame(template);
        if (count > 0) {
            return true;
        }
        return false;
    }

    /**
     * <p>得到简单的三方协议模板操作对象</p>
     * <p>提供给上面方法使用</p>
     *
     * @param tatemplateId 三方协议模板ID
     * @param operator     操作者ID
     * @param operateOrgid 操作组织ID
     * @param operateFlag  操作标识
     * @return
     */
    private TaTemplateOperations getSimpleTaTemplateOperations(String tatemplateId, String operator,
                                                               String operateOrgid, String operateFlag) {
        TaTemplateOperations taTemplateOperations = new TaTemplateOperations();//三方协议操作记录
        taTemplateOperations.setUrid(SequenceUtil.UUID());
        taTemplateOperations.setTatemplateId(tatemplateId);
        taTemplateOperations.setOperator(operator);  //操作员key 连接key的信息表
        taTemplateOperations.setOperateOrgId(operateOrgid); //操作组织ID
        taTemplateOperations.setOperateDate(new Date());
        taTemplateOperations.setOperateFlag(operateFlag);//发布  操作标志
        taTemplateOperations.setCreateby(operator);
        taTemplateOperations.setCreatedon(new Date());
        return taTemplateOperations;
    }

    //三方协议模板修改
    @Override
    public RespJson agreementTemplateEdit(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate) {
        //事物控制
        RespJson respJson = transactionTemplate.execute(new TransactionCallback<RespJson>() {
            @Override
            public RespJson doInTransaction(TransactionStatus transactionStatus) {
                RespJson respJson = doEdit(request, tripartiteagreementTemplate);
                if (-1 == respJson.getResult()) {
                    transactionStatus.setRollbackOnly();
                }
                return respJson;
            }
        });
        return respJson;
    }

    //修改具体操作
    public RespJson doEdit(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate) {
        RespJson respJson = new RespJson();
        HttpSession session = request.getSession();
        SysUserLoginDto currUser = (SysUserLoginDto) session.getAttribute(UserConstant.USER_LOGIN_SESSION);
        String id = tripartiteagreementTemplate.getUrid();//得到模板id
        TripartiteagreementTemplate TripartiteagreementTemplate = agreementTemplateDao.selectByPrimaryKey(id);
        String urid = SequenceUtil.UUID();
        String orgid = currUser.getOrgId();
        //撤销和否决标志
        //String arr[] ={"8101","8102","8103","8201","8202","8203"};
        List<String> list = new ArrayList<String>();
        list.add(TaTemplateEnum.BANKCANCEL.getName());
        list.add(TaTemplateEnum.BANKCHECKREJECT.getName());
        list.add(TaTemplateEnum.BANKAUDITINGREJECT.getName());
        list.add(TaTemplateEnum.CORECOMPANYHANDLEREJECT.getName());
        list.add(TaTemplateEnum.CORECOMPANYCHECKREJECT.getName());
        list.add(TaTemplateEnum.CORECOMPANYAUDITINGREJECT.getName());
        //审批完成后修改生成新的记录

        try {
            if ((TaTemplateEnum.CORECOMPANYAUDITINGAGREE.getName()).equalsIgnoreCase(TripartiteagreementTemplate.getLastOperateflag())) {
                TripartiteagreementTemplate.setUrid(urid);
                TripartiteagreementTemplate.setTatemplateVersion(TripartiteagreementTemplate.getTatemplateVersion()+1);
                TripartiteagreementTemplate.setIsactive("2");
                TripartiteagreementTemplate.setIsresourse(tripartiteagreementTemplate.getIsresourse());
                TripartiteagreementTemplate.setDescription(tripartiteagreementTemplate.getDescription());
                TripartiteagreementTemplate.setBankId(tripartiteagreementTemplate.getBankId());
                TripartiteagreementTemplate.setLastModifiedby(currUser.getUserName());
                TripartiteagreementTemplate.setTemplateContent(tripartiteagreementTemplate.getTemplateContent());
                TripartiteagreementTemplate.setLastModifiedon(new Date());
                TripartiteagreementTemplate.setRowversion(Short.parseShort("1"));
                TripartiteagreementTemplate.setLastOperateflag(TaTemplateEnum.BEFORESEND.getName());
                //保存模板修改
                agreementTemplateDao.insertSelective(TripartiteagreementTemplate);

                TaTemplateOperations taTemplateOperations = getSimpleTaTemplateOperations(urid, currUser.getUserName(), orgid, TaTemplateEnum.BEFORESEND.getName());
                taTemplateOperations.setSignature("签名");//签名信息
                taTemplateOperations.setRelateoperateId("null"); //关联操作ID
                taTemplateOperations.setRowversion(Short.parseShort("1"));  //修改版本
                taTemplateOperations.setDescription("待发布");
                //保存操作
                taTemplateOperationsDao.insertSelective(taTemplateOperations);
            } else if (list.contains(TripartiteagreementTemplate.getLastOperateflag())) {
                TripartiteagreementTemplate.setIsresourse(tripartiteagreementTemplate.getIsresourse());
                TripartiteagreementTemplate.setDescription(tripartiteagreementTemplate.getDescription());
                TripartiteagreementTemplate.setLastModifiedby(currUser.getUserName());
                TripartiteagreementTemplate.setTemplateContent(tripartiteagreementTemplate.getTemplateContent());
                TripartiteagreementTemplate.setLastModifiedon(new Date());
                TripartiteagreementTemplate.setRowversion(tripartiteagreementTemplate.getRowversion() + 1);
                TripartiteagreementTemplate.setLastOperateflag(TaTemplateEnum.BEFORESEND.getName());
                agreementTemplateDao.updateByPrimaryKeyWithBLOBs(TripartiteagreementTemplate);

                TaTemplateOperations taTemplateOperations = getSimpleTaTemplateOperations(tripartiteagreementTemplate.getUrid(), currUser.getUserName(), orgid, TaTemplateEnum.BEFORESEND.getName());
                taTemplateOperations.setSignature("签名");//签名信息
                taTemplateOperations.setRelateoperateId("null"); //关联操作ID
                taTemplateOperations.setRowversion(1);  //修改版本
                taTemplateOperations.setDescription("待发布");
                taTemplateOperationsDao.insertSelective(taTemplateOperations);
            } else if (!BEFORESENDFLAG.equals(TripartiteagreementTemplate.getLastOperateflag())) {
                respJson.setMsg("三方协议模板已经发布 无法编辑 修改异常");
                respJson.setResult(-1);
                return respJson;
            } else {
                TripartiteagreementTemplate.setBankId(tripartiteagreementTemplate.getBankId());
                TripartiteagreementTemplate.setCorecompanyId(tripartiteagreementTemplate.getCorecompanyId());
                TripartiteagreementTemplate.setIsresourse(tripartiteagreementTemplate.getIsresourse());
                TripartiteagreementTemplate.setIsactive(tripartiteagreementTemplate.getIsactive());
                TripartiteagreementTemplate.setDescription(tripartiteagreementTemplate.getDescription());
                TripartiteagreementTemplate.setLastModifiedby(currUser.getUserName());
                if (TripartiteagreementTemplate.getRowversion()!= tripartiteagreementTemplate.getRowversion()) {
                    respJson.setMsg("三方协议编辑异常 ： 修改版本异常");
                    respJson.setResult(-1);
                    return respJson;
                }
                TripartiteagreementTemplate.setLastModifiedon(new Date());
                TripartiteagreementTemplate.setRowversion(tripartiteagreementTemplate.getRowversion() + 1);//修改版本号
                TripartiteagreementTemplate.setTemplateContent(tripartiteagreementTemplate.getTemplateContent());
                agreementTemplateDao.updateByPrimaryKeyWithBLOBs(TripartiteagreementTemplate);
                respJson.setMsg("操作成功");
                respJson.setResult(1);
            }
            return respJson;
        } catch (Exception e) {
            e.printStackTrace();
            respJson.setMsg("操作失败");
            respJson.setResult(-1);
            return respJson;
        }
    }

    //三方协议模板删除
    @Override
    public RespJson agreementTemplateDel(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate) {
        //事物控制
        RespJson respJson = transactionTemplate.execute(new TransactionCallback<RespJson>() {
            @Override
            public RespJson doInTransaction(TransactionStatus transactionStatus) {
                RespJson respJson = doDel(request, tripartiteagreementTemplate);
                if (-1 == respJson.getResult()) {
                    transactionStatus.setRollbackOnly();
                }
                return respJson;
            }
        });
        return respJson;
    }

    //删除具体操作
    public RespJson doDel(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate) {
        RespJson respJson = new RespJson();
        String[] ids = tripartiteagreementTemplate.getUrid().split(",");
        try {
            for (String id : ids) {
                int count = taTemplateOperationsDao.deleteByTatemplateId(id);
                if (count > 0) {
                    agreementTemplateDao.deleteByPrimaryKey(id);
                } else {
                    respJson.setMsg("删除三方协议模板操作表异常，无法删除");
                    respJson.setResult(-1);
                    return respJson;
                }
            }
            respJson.setMsg("操作成功");
            respJson.setResult(1);
            return respJson;
        } catch (Exception e) {
            e.printStackTrace();
            respJson.setMsg("操作失败");
            respJson.setResult(-1);
            return respJson;
        }
    }

    //三方协议模板查询单条信息
    @Override
    public RespJson agreementTemplateSelectOne(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate) {
        RespJson respJson = new RespJson();
        try {
            TripartiteagreementTemplate dto = agreementTemplateDao.selectByPrimaryKey(tripartiteagreementTemplate.getUrid());
            respJson.setResult(1);
            respJson.setData(dto);
            respJson.setMsg("操作成功");
            return respJson;
        }catch (Exception e){
            e.printStackTrace();
            respJson.setMsg("操作失败");
            respJson.setResult(-1);
            return respJson;
        }
    }
    //三方协议模板查询多条信息
    @Override
    public RespJson agreementTemplateSelectList(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate) {
        RespJson respJson = new RespJson();
        try {
            List<TripartiteagreementTemplate> list = agreementTemplateDao.selectListBySelective(tripartiteagreementTemplate);
            respJson.setResult(1);
            respJson.setData(list);
            respJson.setMsg("操作成功");
            return respJson;
        }catch (Exception e){
            e.printStackTrace();
            respJson.setMsg("操作失败");
            respJson.setResult(-1);
            return respJson;
        }
    }

    /**
     * <p>三方协议模板发布功能</p>
     * <p>同时在三方模板操作表中记录一条记录</p>
     */
    @Override
    public RespJson agreementTemplateSend(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate) {
        //事物控制
        RespJson respJson = transactionTemplate.execute(new TransactionCallback<RespJson>() {
            @Override
            public RespJson doInTransaction(TransactionStatus transactionStatus) {
                RespJson respJson = doSend(request, tripartiteagreementTemplate);
                if (-1 == respJson.getResult()) {
                    transactionStatus.setRollbackOnly();
                }
                return respJson;
            }
        });
        return respJson;
    }
    //发布具体操作
    public RespJson doSend(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate) {
        RespJson respJson = new RespJson();
        HttpSession session = request.getSession();
        SysUserLoginDto currUser = (SysUserLoginDto) session.getAttribute(UserConstant.USER_LOGIN_SESSION);
        try {
            String[] urids = tripartiteagreementTemplate.getUrid().split(",");
            String userid = currUser.getUserId();
            String orgId = currUser.getOrgId();
            String sign = request.getParameter("signs");
            for (String urid : urids) {
                TripartiteagreementTemplate TripartiteagreementTemplate = agreementTemplateDao.selectByPrimaryKey(urid);
                if (TripartiteagreementTemplate == null) {
                    throw new Exception("数据异常，无法通过urid找到相应的交易单");
                }
                String signContext = Base64.getEncoder().encodeToString(TripartiteagreementTemplate.getTemplateContent());

                //待完成功能
                if (!CfcaUtils.getInstance().verifySM2P7DetachMsg(signContext.getBytes(), sign.getBytes())) {
                    throw new Exception("三方协议模板签名验签失败，送审无效！urid = " + urid);
                }

                if (FString.isNullOrEmpty(urid)) {
                    throw new Exception("数据异常，urid字段值非法（为空）！");
                }
                if (!(TaTemplateEnum.BEFORESEND.getName()).equals(TripartiteagreementTemplate.getLastOperateflag())){
                    throw new Exception("该三方协议模板已发布");
                }
                //发起工作流（待完成功能）

                //记录三方协议模板操作表
                TaTemplateOperations taTemplateOperations = getSimpleTaTemplateOperations(urid, userid, orgId, TaTemplateEnum.BANKSEND.getName());
                taTemplateOperations.setSignature("签名");//签名信息
                taTemplateOperations.setRelateoperateId("null"); //关联操作ID
                taTemplateOperations.setRowversion(1);  //修改版本
                taTemplateOperations.setDescription("发布");
                taTemplateOperationsDao.insertSelective(taTemplateOperations);
                TripartiteagreementTemplate.setLastModifiedby(userid);
                TripartiteagreementTemplate.setLastModifiedon(new Date());
                TripartiteagreementTemplate.setLastOperateflag(TaTemplateEnum.BANKSEND.getName());
                TripartiteagreementTemplate.setRowversion(TripartiteagreementTemplate.getRowversion() + 1);
                agreementTemplateDao.updateByPrimaryKeySelective(TripartiteagreementTemplate);
            }
            respJson.setMsg("操作成功");
            respJson.setResult(1);
            return respJson;
        } catch (Exception e) {
            e.printStackTrace();
            respJson.setMsg("操作失败");
            respJson.setResult(-1);
            return respJson;
        }
    }
}

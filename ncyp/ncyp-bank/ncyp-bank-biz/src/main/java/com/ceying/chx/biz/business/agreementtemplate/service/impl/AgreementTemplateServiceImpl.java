package com.ceying.chx.biz.business.agreementtemplate.service.impl;

import ch.qos.logback.classic.Logger;
import com.ceying.chx.biz.base.common.CommonSysUserLoginService;
import com.ceying.chx.biz.base.common.CommonSysUserService;
import com.ceying.chx.biz.base.common.CommonTaTemplateOperationService;
import com.ceying.chx.biz.base.common.CommonTripartiteAgreementTemplateService;
import com.ceying.chx.biz.business.agreementtemplate.service.AgreementTemplateService;
import com.ceying.chx.common.constants.SysCodeEnum;
import com.ceying.chx.common.constants.TaTemplateEnum;
import com.ceying.chx.common.constants.UserConstant;
import com.ceying.chx.common.dao.PosUserMapper;
import com.ceying.chx.common.dao.triagreementtemp.TaTemplateOperationsDao;
import com.ceying.chx.common.dao.triagreementtemp.TripartiteagreementTemplateDao;
import com.ceying.chx.common.dto.SysUserDto;
import com.ceying.chx.common.dto.SysUserLoginDto;
import com.ceying.chx.common.entity.LoginUserEntity;
import com.ceying.chx.common.entity.PosUserEntity;
import com.ceying.chx.common.entity.triagreementtemp.TaTemplateOperationsEntity;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplateEntity;
import com.ceying.chx.common.service.BaseService;
import com.ceying.chx.common.util.SequenceUtil;
import com.ceying.chx.common.util.log.LogContext;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import com.ceying.chx.common.utils.cfca.CfcaUtils;
import com.ceying.chx.common.utils.stringtools.FString;
import com.ceying.chx.common.vo.TripartiteagreementTemplateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.*;

/**
 * 功能说明: 三方协议模板<br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing <br>
 * 开发时间: 2018/1/2<br>
 */
@Validated
@Service
//@EnableCaching
public class AgreementTemplateServiceImpl extends BaseService implements AgreementTemplateService {

    /**
     * 待发布标识
     */
    private static final String BEFORESENDFLAG = "100";

    /**
     * value属性表示使用哪个缓存策略，缓存策略在ehcache.xml
     */
    public static final String DEMO_CACHE_NAME = "dictTypeCache";

    @Resource
    private
    PosUserMapper posUserMapper;

    @Resource
    private TripartiteagreementTemplateDao agreementTemplateDao;

    @Resource
    private TaTemplateOperationsDao taTemplateOperationsDao;

    @Autowired
    private TransactionTemplate transactionTemplate;

    @Resource
    private  CommonSysUserLoginService commonSysUserLoginServiceImpl;

    @Resource
    private  CommonTripartiteAgreementTemplateService commonTripartiteAgreementTemplateServiceImpl;

    @Resource
    private CommonTaTemplateOperationService commonTaTemplateOperationServiceImpl;

    @Resource
    private  CommonSysUserService commonSysUserService;


    @Override
    @Transactional(rollbackFor = Exception.class)
    public RespJson agreementTemplateAdd(HttpServletRequest request,
                                         @NotNull TripartiteagreementTemplateVO tripartiteagreementTemplateVO)
            throws Exception {
        TripartiteagreementTemplateEntity tripartiteagreementTemplateEntity = new TripartiteagreementTemplateEntity();
        RespJson respJson = null;
        respJson = checkAdd(tripartiteagreementTemplateVO);
        if(null != respJson){
           return  respJson;
        }
        try {
            SysUserLoginDto loginUserEntity = commonSysUserLoginServiceImpl.get(tripartiteagreementTemplateVO.getUserId());
            String urid = SequenceUtil.UUID();
            String orgid = loginUserEntity.getOrgId();//用户组织id
            tripartiteagreementTemplateEntity.setUrid(urid);
            tripartiteagreementTemplateEntity.setTenantId(String.valueOf(loginUserEntity.getTenantId())); //用户租户ID
            tripartiteagreementTemplateEntity.setTatemplateCode(tripartiteagreementTemplateVO.getBankId()
                    + tripartiteagreementTemplateVO.getCorecompanyId() + "1");
            tripartiteagreementTemplateEntity.setTatemplateVersion(Integer.parseInt(SysCodeEnum.VERSION.getValue()));
            tripartiteagreementTemplateEntity.setBankId(tripartiteagreementTemplateVO.getBankId());
            tripartiteagreementTemplateEntity.setCorecompanyId(tripartiteagreementTemplateVO.getCorecompanyId());
            tripartiteagreementTemplateEntity.setCreditLimit(BigDecimal.ONE); //自定义的
            tripartiteagreementTemplateEntity.setCreatedby(loginUserEntity.getUserId());//用户名称
            tripartiteagreementTemplateEntity.setCreatedon(new Date());
            tripartiteagreementTemplateEntity.setDescription(tripartiteagreementTemplateVO.getDescription());
            tripartiteagreementTemplateEntity.setIsresourse(tripartiteagreementTemplateVO.getIsresourse());
            tripartiteagreementTemplateEntity.setLastOperateflag(TaTemplateEnum.BEFORESEND.getName());
            tripartiteagreementTemplateEntity.setIsactive(SysCodeEnum.ISACTIVE.getValue());
            tripartiteagreementTemplateEntity.setRowversion(Integer.valueOf(SysCodeEnum.VERSION.getValue()));
            tripartiteagreementTemplateEntity.setTemplateContent(
                    tripartiteagreementTemplateVO.getTemplateContent().getBytes());
//            agreementTemplateDao.insertSelective(tripartiteagreementTemplateEntity);
            commonTripartiteAgreementTemplateServiceImpl.insert(tripartiteagreementTemplateEntity);
            TaTemplateOperationsEntity taTemplateOperations =
                    getSimpleTaTemplateOperations(urid, loginUserEntity.getUserName(),
                            orgid, TaTemplateEnum.BEFORESEND.getName());
            taTemplateOperations.setSignature("签名");//签名信息
            taTemplateOperations.setRelateoperateId("null"); //关联操作ID
            taTemplateOperations.setRowversion(Integer.valueOf(TaTemplateEnum.VERSION.getValue()));  //修改版本
            taTemplateOperations.setDescription("待发布");
            commonTaTemplateOperationServiceImpl.insert(taTemplateOperations);
        //    taTemplateOperationsDao.insertSelective(taTemplateOperations);
            List<TripartiteagreementTemplateEntity> list =
                    commonTripartiteAgreementTemplateServiceImpl.selectListByOrgId(orgid);
            respJson = RespJsonFactory.buildSuccess("操作成功");
        }catch (Exception e){
            log().error("新增三方协议模板失败");
            e.printStackTrace();
            respJson = RespJsonFactory.buildFailure("新增三方协议模板失败");
        }
        return respJson;
    }
     
     //三方协议模板修改
     @Override
     @Transactional(rollbackFor = Exception.class)
     public RespJson agreementTemplateEdit(HttpServletRequest request,
                                           TripartiteagreementTemplateVO tripartiteagreementTemplateVO) {
         RespJson respJson = new RespJson();
         String id = tripartiteagreementTemplateVO.getUrid();//得到模板id
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
             SysUserLoginDto loginUserEntity = commonSysUserLoginServiceImpl.get(tripartiteagreementTemplateVO.getUserId());
             TripartiteagreementTemplateEntity tripartiteagreementTemplateEntity =  commonTripartiteAgreementTemplateServiceImpl.get(id); //agreementTemplateDao.selectByPrimaryKey(id);
             String urid = SequenceUtil.UUID();
             String orgid = loginUserEntity.getOrgId();


             if ((TaTemplateEnum.CORECOMPANYAUDITINGAGREE.getName()).equalsIgnoreCase(tripartiteagreementTemplateEntity.getLastOperateflag())) {
                 tripartiteagreementTemplateEntity.setUrid(urid);
                 tripartiteagreementTemplateEntity.setTatemplateVersion(tripartiteagreementTemplateEntity.getTatemplateVersion()+1);
                 tripartiteagreementTemplateEntity.setIsactive("2");
                 tripartiteagreementTemplateEntity.setIsresourse(tripartiteagreementTemplateVO.getIsresourse());
                 tripartiteagreementTemplateEntity.setDescription(tripartiteagreementTemplateVO.getDescription());
                 tripartiteagreementTemplateEntity.setBankId(tripartiteagreementTemplateVO.getBankId());
                 tripartiteagreementTemplateEntity.setLastmodifiedby(loginUserEntity.getUserName());
                 tripartiteagreementTemplateEntity.setTemplateContent(tripartiteagreementTemplateVO.getTemplateContent().getBytes());
                 tripartiteagreementTemplateEntity.setLastmodifiedon(new Date());
                 tripartiteagreementTemplateEntity.setRowversion(Integer.valueOf(TaTemplateEnum.VERSION.getValue()));
                 tripartiteagreementTemplateEntity.setLastOperateflag(TaTemplateEnum.BEFORESEND.getName());
                 //保存模板修改
                 commonTripartiteAgreementTemplateServiceImpl.insert(tripartiteagreementTemplateEntity);

                // agreementTemplateDao.insertSelective(tripartiteagreementTemplateEntity);

                 TaTemplateOperationsEntity taTemplateOperations = getSimpleTaTemplateOperations(urid, loginUserEntity.getUserName(), orgid, TaTemplateEnum.BEFORESEND.getName());
                 taTemplateOperations.setSignature("签名");//签名信息
                 taTemplateOperations.setRelateoperateId("null"); //关联操作ID
                 taTemplateOperations.setRowversion(Integer.valueOf(TaTemplateEnum.VERSION.getValue()));  //修改版本
                 taTemplateOperations.setDescription("待发布");
                 commonTaTemplateOperationServiceImpl.insert(taTemplateOperations);
                 //保存操作
                // taTemplateOperationsDao.insertSelective(taTemplateOperations);
             } else if (list.contains(tripartiteagreementTemplateEntity.getLastOperateflag())) {
                 tripartiteagreementTemplateEntity.setIsresourse(tripartiteagreementTemplateVO.getIsresourse());
                 tripartiteagreementTemplateEntity.setDescription(tripartiteagreementTemplateVO.getDescription());
                 tripartiteagreementTemplateEntity.setLastmodifiedby(loginUserEntity.getUserName());
                 tripartiteagreementTemplateEntity.setTemplateContent(tripartiteagreementTemplateVO.getTemplateContent().getBytes());
                 tripartiteagreementTemplateEntity.setLastmodifiedon(new Date());
                 tripartiteagreementTemplateEntity.setRowversion(tripartiteagreementTemplateVO.getRowversion() + 1);
                 tripartiteagreementTemplateEntity.setLastOperateflag(TaTemplateEnum.BEFORESEND.getName());
                 commonTripartiteAgreementTemplateServiceImpl.update(tripartiteagreementTemplateEntity);
                // agreementTemplateDao.updateByPrimaryKeyWithBLOBs(tripartiteagreementTemplateEntity);

                 TaTemplateOperationsEntity taTemplateOperations = getSimpleTaTemplateOperations(tripartiteagreementTemplateEntity.getUrid(), loginUserEntity.getUserName(), orgid, TaTemplateEnum.BEFORESEND.getName());
                 taTemplateOperations.setSignature("签名");//签名信息
                 taTemplateOperations.setRelateoperateId("null"); //关联操作ID
                 taTemplateOperations.setRowversion(1);  //修改版本
                 taTemplateOperations.setDescription("待发布");
                 commonTaTemplateOperationServiceImpl.insert(taTemplateOperations);
               //  taTemplateOperationsDao.insertSelective(taTemplateOperations);
             } else if (!BEFORESENDFLAG.equals(tripartiteagreementTemplateEntity.getLastOperateflag())) {
                 respJson = RespJsonFactory.buildFailure("三方协议模板已经发布 无法编辑 修改异常");
                 return respJson;
             } else {
                 tripartiteagreementTemplateEntity.setBankId(tripartiteagreementTemplateVO.getBankId());
                 tripartiteagreementTemplateEntity.setCorecompanyId(tripartiteagreementTemplateVO.getCorecompanyId());
                 tripartiteagreementTemplateEntity.setIsresourse(tripartiteagreementTemplateVO.getIsresourse());
                 tripartiteagreementTemplateEntity.setIsactive(tripartiteagreementTemplateVO.getIsactive());
                 tripartiteagreementTemplateEntity.setDescription(tripartiteagreementTemplateVO.getDescription());
                 tripartiteagreementTemplateEntity.setLastmodifiedby(loginUserEntity.getUserName());
                 if (tripartiteagreementTemplateVO.getRowversion()!= tripartiteagreementTemplateEntity.getRowversion()) {
                     respJson = RespJsonFactory.buildFailure("三方协议编辑异常 ： 修改版本异常");
                     return respJson;
                 }
                 tripartiteagreementTemplateEntity.setLastmodifiedon(new Date());
                 tripartiteagreementTemplateEntity.setRowversion(tripartiteagreementTemplateEntity.getRowversion() + 1);//修改版本号
                 tripartiteagreementTemplateEntity.setTemplateContent(tripartiteagreementTemplateVO.getTemplateContent().getBytes());
                 commonTripartiteAgreementTemplateServiceImpl.update(tripartiteagreementTemplateEntity);
               //  agreementTemplateDao.updateByPrimaryKeyWithBLOBs(tripartiteagreementTemplateEntity);
                 respJson = RespJsonFactory.buildSuccess("操作成功");
             }
         } catch (Exception e) {
             log().error("三方协议模板修改异常");
             e.printStackTrace();
             respJson = RespJsonFactory.buildFailure("三方协议模板修改异常");
         }
         return respJson;
     }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public RespJson agreementTemplateDel(HttpServletRequest request, TripartiteagreementTemplateVO tripartiteagreementTemplateVo) {
        RespJson respJson = new RespJson();
        String[] ids = tripartiteagreementTemplateVo.getUrid().split(",");
        try {
            for (String id : ids) {
                int count = taTemplateOperationsDao.deleteByTatemplateId(id);
                if (count > 0) {
//                    agreementTemplateDao.deleteByPrimaryKey(id);
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


    /**
     * 校验新增三方协议模板
     * <p>只有银行才可以新增三方协议模板，默认就校验</p>
     * @param  tripartiteagreementTemplateVO
     * @return RespJson
     */
    public RespJson checkAdd( TripartiteagreementTemplateVO tripartiteagreementTemplateVO) {
        RespJson respJson = null;
        TripartiteagreementTemplateEntity tripartiteagreementTemplateEntity = new TripartiteagreementTemplateEntity();
        try{
            tripartiteagreementTemplateEntity.setCorecompanyId(tripartiteagreementTemplateVO.getCorecompanyId());
            tripartiteagreementTemplateEntity.setBankId(tripartiteagreementTemplateVO.getBankId());
            tripartiteagreementTemplateEntity.setBusinesstype(tripartiteagreementTemplateVO.getBusinesstype());
            List<TripartiteagreementTemplateEntity> list = commonTripartiteAgreementTemplateServiceImpl.list(tripartiteagreementTemplateEntity);
            if(!list.isEmpty()){
                return RespJsonFactory.buildFailure("新增三方协议模板失败,模板重复！");
            }
        }catch (Exception e){
            log().error("三方协议模板校验失败！");
            e.printStackTrace();
            respJson = RespJsonFactory.buildFailure("三方协议模板校验失败！");
        }
        return respJson;
    }

    //判断是否具有相同模板
    public boolean existTriAgreementTemp(String bankId, String corecompanyId) {
        TripartiteagreementTemplateEntity tripartiteagreementTemplateEntity = new TripartiteagreementTemplateEntity();
        tripartiteagreementTemplateEntity.setBankId(bankId);
        tripartiteagreementTemplateEntity.setCorecompanyId(corecompanyId);
        int count = agreementTemplateDao.selectForSame(tripartiteagreementTemplateEntity);
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
    private TaTemplateOperationsEntity getSimpleTaTemplateOperations(String tatemplateId, String operator, String operateOrgid, String operateFlag) {
                TaTemplateOperationsEntity taTemplateOperations = new TaTemplateOperationsEntity();//三方协议操作记录
                taTemplateOperations.setUrid(SequenceUtil.UUID());
                taTemplateOperations.setTatemplateId(tatemplateId);
                taTemplateOperations.setOperator(operator);  //操作员key 连接key的信息表
                taTemplateOperations.setOperateOrgId(operateOrgid); //操作组织ID
                taTemplateOperations.setOperateDate(new Date());
                taTemplateOperations.setOperateFlag(operateFlag);//发布  操作标志
                taTemplateOperations.setCreatedby(operator);
                taTemplateOperations.setCreatedon(new Date());
                return taTemplateOperations;
    }

    //三方协议模板查询单条信息
    @Override
    public RespJson agreementTemplateSelectOne(HttpServletRequest request, TripartiteagreementTemplateVO tripartiteagreementTemplateVo) {
        RespJson respJson = null;
        try {
//            TripartiteagreementTemplateEntity tripartiteagreementTemplate = commonTripartiteAgreementTemplateServiceImpl.selectListByOrgId(sysUserDto.getOrgId())//agreementTemplateDao.selectByPrimaryKey(tripartiteagreementTemplateVo.getUrid());
//            respJson =RespJsonFactory.buildSuccess("操作成功",tripartiteagreementTemplate);
            return respJson;
        }catch (Exception e){
            e.printStackTrace();
            respJson =RespJsonFactory.buildFailure("操作失败");
            return respJson;
        }
    }
    //三方协议模板查询多条信息
//    @Cacheable("dictTypeCache")
    @Override
    public RespJson agreementTemplateSelectList(HttpServletRequest request, SysUserDto sysUserDto) {
        RespJson respJson =null;
        Map<String,Object> param = new HashMap<String,Object>();
        System.out.println("----------------没有执行缓存----------------------");
        param.put("orgId",sysUserDto.getOrgId());
        try {
            List<TripartiteagreementTemplateEntity> list =commonTripartiteAgreementTemplateServiceImpl.selectListByOrgId(sysUserDto.getOrgId()); //agreementTemplateDao.selectListBySelective(param);
            int countTotal = commonTripartiteAgreementTemplateServiceImpl.totalCount(param);   //agreementTemplateDao.totalCount(param);
            respJson = RespJsonFactory.buildSuccess("操作成功",list,countTotal);
            return respJson;
        }catch (Exception e){
            e.printStackTrace();
            respJson = RespJsonFactory.buildFailure("操作失败");
            return respJson;
        }
    }

    /**
     * <p>三方协议模板发布功能</p>
     * <p>同时在三方模板操作表中记录一条记录</p>
     * @param request
     * @param tripartiteagreementTemplateVO
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public RespJson agreementTemplateSend(HttpServletRequest request, TripartiteagreementTemplateVO tripartiteagreementTemplateVO) {
        RespJson respJson = new RespJson();
        HttpSession session = request.getSession();
        SysUserLoginDto currUser = (SysUserLoginDto) session.getAttribute(UserConstant.USER_LOGIN_SESSION);
        try {
            String[] urids = tripartiteagreementTemplateVO.getUrid().split(",");
            String userid = currUser.getUserId();
            String orgId = currUser.getOrgId();
            String sign = request.getParameter("signs");
            for (String urid : urids) {
                TripartiteagreementTemplateEntity tripartiteagreementTemplate = agreementTemplateDao.selectByPrimaryKey(urid);
                if (tripartiteagreementTemplate == null) {
                    throw new Exception("数据异常，无法通过urid找到相应的交易单");
                }
                String signContext = Base64.getEncoder().encodeToString(tripartiteagreementTemplate.getTemplateContent());

                //待完成功能
                if (!CfcaUtils.getInstance().verifySM2P7DetachMsg(signContext.getBytes(), sign.getBytes())) {
                    throw new Exception("三方协议模板签名验签失败，送审无效！urid = " + urid);
                }

                if (FString.isNullOrEmpty(urid)) {
                    throw new Exception("数据异常，urid字段值非法（为空）！");
                }
                if (!(TaTemplateEnum.BEFORESEND.getName()).equals(tripartiteagreementTemplate.getLastOperateflag())){
                    throw new Exception("该三方协议模板已发布");
                }
                //发起工作流（待完成功能）

                //记录三方协议模板操作表
                TaTemplateOperationsEntity taTemplateOperations = getSimpleTaTemplateOperations(urid, userid, orgId, TaTemplateEnum.BANKSEND.getName());
                taTemplateOperations.setSignature("签名");//签名信息
                taTemplateOperations.setRelateoperateId("null"); //关联操作ID
                taTemplateOperations.setRowversion(1);  //修改版本
                taTemplateOperations.setDescription("发布");
                taTemplateOperationsDao.insertSelective(taTemplateOperations);
                tripartiteagreementTemplate.setLastmodifiedby(userid);
                tripartiteagreementTemplate.setLastmodifiedon(new Date());
                tripartiteagreementTemplate.setLastOperateflag(TaTemplateEnum.BANKSEND.getName());
                tripartiteagreementTemplate.setRowversion(tripartiteagreementTemplate.getRowversion() + 1);
                agreementTemplateDao.updateByPrimaryKeySelective(tripartiteagreementTemplate);
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

    //三方协议模板待审批信息查询
    @Override
//    @Cacheable("dictTypeCache")
    public RespJson agreementTemplateSelect(HttpServletRequest request, TripartiteagreementTemplateVO agreementTemplate) {
        RespJson respJson;
        try{
            System.out.println("没走缓存");
            SysUserDto sysUserDto = commonSysUserService.get(agreementTemplate.getUserId());
            List<TripartiteagreementTemplateEntity> list = commonTripartiteAgreementTemplateServiceImpl.selectListByOrgId(sysUserDto.getOrgId());   //agreementTemplateDao.selectBySelective(tripartiteagreementTemplateEntity);
            respJson = RespJsonFactory.buildSuccess(list.get(0));
        }catch (Exception e){
            e.printStackTrace();
            log().error("查询三方协议模板失败");
            respJson = RespJsonFactory.buildFailure("操作失败");
        }
        return respJson;
    }
}

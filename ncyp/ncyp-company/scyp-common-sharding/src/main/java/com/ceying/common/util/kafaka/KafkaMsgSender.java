package com.ceying.common.util.kafaka;

import com.ceying.common.constant.TopicConstants;
import com.ceying.common.util.bean.SpringUtil;
import com.ceying.common.util.vo.TripartiteAgreementAdressVO;
import com.ceying.eagleeye.common.producer.KafkaMsgProducer;
import org.springframework.stereotype.Component;

/**
 * 功能说明: kafka 消息推送<br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/5/15<br>
 * <br>
 */
@Component
public class KafkaMsgSender {
    /**
     *  将区块链存证 相关信息 发送到kafka 异步通知addition 工程执行
     * @param vo 消息实体
     */
    public void sendTripAgreeMsg(TripartiteAgreementAdressVO vo){
        sendMsg(vo,TopicConstants.CERTIFICATE);
    }

    /**
     * 应付账款 导入成功消息
     * @param vo 消息实体
     */
    public void sendPayableMsg(Object vo){
        sendMsg(vo,TopicConstants.PAYABLE);
    }

    /**
     * 向kafka推送 消息
     * @param vo 消息实体数据
     * @param type 消息类型
     */
    public void sendMsg(Object vo,String type){
        KafkaMsgProducer kafkaMsgProducer=SpringUtil.getBean(KafkaMsgProducer.class);
        kafkaMsgProducer.sendMessage(type,vo);
    }
}

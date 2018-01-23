package com.cyp.chx.rcenter.hessian.code;

import com.caucho.hessian.io.HessianOutput;
import com.cyp.chx.rcenter.hessian.bean.HessRequest;
import com.cyp.chx.rcenter.hessian.bean.HessResponse;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.MessageToByteEncoder;

import java.io.ByteArrayOutputStream;
import java.io.IOException;


/**
 * @Author：huanghaiyun
 * @Date:2017/12/7
 */
public class Encode extends MessageToByteEncoder {
    // header length.
    protected static final int HEADER_LENGTH = 16;
    protected static final int isTrue = 1;



    @Override
    public void encode(ChannelHandlerContext ctx, Object msg,ByteBuf  out) throws Exception {
//        ChannelBuffer buffer = new NettyBackedChannelBuffer(out);
        if (msg instanceof HessRequest) {
            encodeRequest(out,(HessRequest) msg);
        } else if (msg instanceof HessResponse) {
            encodeResponse(out,(HessResponse) msg);
        } else {
            throw new IllegalArgumentException("传入参数有误！"+msg.getClass());
        }

    }
    /**
     *  对request 进行编码
     * @param out
     * @param req
     * @throws Exception
     */
    private void encodeRequest(ByteBuf  out, HessRequest req) throws Exception {
        // header.
        byte[] header = new byte[HEADER_LENGTH];
        if (req.isTwoWay()){//第一个字节表示是否需要回复
            header[0] = isTrue;
        }
        if (req.isEvent()) {//第二字节表示是否是事件
            header[1] = isTrue;
        }
        header[2]=1;//第三字节表示是否是request
        //第四字节是status 在request 中才有效
        //5-12字节是 id
        Bytes.long2bytes(req.getId(), header, 4);
        byte[] body;
        ByteArrayOutputStream os=null;
        HessianOutput ho=null;
        try {
            os = new ByteArrayOutputStream();
            //Hessian的序列化输出
            ho = new HessianOutput(os);
            ho.writeString(req.getMethodName());
            ho.writeString(req.getPath());
            ho.writeObject(req.getParameterTypes());
            ho.writeObject(req.getParams());
            body = os.toByteArray();
        } catch (Exception e){
            throw e;
        } finally{
            if(ho!=null){
                ho.close();
            }
            if(os!=null){
                os.close();
            }
        }
        int len=body.length;
        //写入data数据长度
        Bytes.int2bytes(len, header, 12);
        out.readerIndex(0);
        out.writeBytes(header);
        out.writeBytes(body);
    }


    /**
     * 对response 进行解码
     * @param out
     * @param res
     * @throws Exception
     */
    private void encodeResponse(ByteBuf out, HessResponse res) throws Exception {
        // header.
        byte[] header = new byte[HEADER_LENGTH];

        if (res.isEvent()) {//第二字节表示是否是事件
            header[1] = isTrue;
        }
        if(res.isOk()){//errormsg 是空 表示status 是成功 的 20表示成功  参照dubbo
            header[3]=20;
        }
        Bytes.long2bytes(res.getId(), header, 4);

        ByteArrayOutputStream os=null;
        HessianOutput ho=null;
        byte[] body= new byte[0];
        try {
            os = new ByteArrayOutputStream();
            //Hessian的序列化输出
            ho = new HessianOutput(os);
            ho.writeObject(res.getResult());
            body = os.toByteArray();
        } catch (IOException e) {
            throw e;
        } finally {
            if(ho!=null){
                ho.close();
            }
            if(os!=null){
                os.close();
            }
        }
        int len=body.length;
        //写入data数据长度
        Bytes.int2bytes(len, header, 12);
        out.readerIndex(0);
        out.writeBytes(header);
        out.writeBytes(body);
    }


}

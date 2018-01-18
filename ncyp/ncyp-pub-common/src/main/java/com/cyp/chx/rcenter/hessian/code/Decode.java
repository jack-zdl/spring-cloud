package com.cyp.chx.rcenter.hessian.code;

import com.caucho.hessian.io.HessianInput;
import com.cyp.chx.rcenter.hessian.bean.HessRequest;
import com.cyp.chx.rcenter.hessian.bean.HessResponse;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;

import java.io.IOException;
import java.util.List;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/7
 */
public class Decode extends ByteToMessageDecoder {

    // header length.
    protected static final int HEADER_LENGTH = 16;

    @Override
    protected void decode(ChannelHandlerContext ctx, ByteBuf input, List<Object> out) throws Exception {
        Object msg;

        int saveReaderIndex;

        do {
            saveReaderIndex = input.readerIndex();
            try {
                msg = decodePacking( input);
            } catch (IOException e) {
                throw e;
            }
            if (msg == DecodeResult.NEED_MORE_INPUT) {
                input.readerIndex(saveReaderIndex);
                break;
            } else {
                //is it possible to go here ?
                if (saveReaderIndex == input.readerIndex()) {
                    throw new IOException("Decode without read data.");
                }
                if (msg != null) {
                    out.add(msg);
                }
            }
        } while (input.isReadable());
    }
    public Object decode(ByteBuf input) throws Exception {
        int readable = input.readableBytes();
        if (readable < HEADER_LENGTH) {
            return DecodeResult.NEED_MORE_INPUT;
        }
        byte[] header = new byte[ HEADER_LENGTH];
        input.readBytes(header);
        int len = Bytes.bytes2int(header, 12);
        int allLength = len + HEADER_LENGTH;
        if (readable < allLength) {
            return DecodeResult.NEED_MORE_INPUT;
        }
        byte isRequest= header[2];
        if(isRequest==1){//解析request
            long id = Bytes.bytes2long(header, 4);
            HessRequest req = new HessRequest(id);
            byte event =header[1];
            if(event==1){//事件
                //TODO
            }else{
                HessianInputStream is = new HessianInputStream(input);
                HessianInput in = new HessianInput(is);

                try {
                    req.setMethodName(in.readString());
                    req.setPath(in.readString());
                    req.setParameterTypes((Class<?>[]) in.readObject());
                    req.setParams((Object[]) in.readObject());
                } catch (IOException e) {
                    throw e;
                } finally {
                    in.close();
                    is.close();
                }
                return req;
            }
        }else{
            long id = Bytes.bytes2long(header, 4);
            HessResponse response=new HessResponse(id);
            byte status =header[3];
            HessianInputStream is = new HessianInputStream(input);
            HessianInput in = new HessianInput(is);

            try {
                if(status==20){
                    response.setOk(true);
                }else{
                    response.setOk(false);
                }
                response.setResult(in.readObject());
                return response;
            } catch (IOException e) {
                throw e;
            } finally {
                in.close();
                is.close();
            }
        }
        return null;
    }


    /**
     * 拆包粘包
     * @param buffer
     * @return
     * @throws Exception
     */
    public Object decodePacking(ByteBuf buffer) throws Exception {

        int save = buffer.readerIndex();
        Object result=null;
        do {
            Object obj =decode(buffer);
            if (DecodeResult.NEED_MORE_INPUT == obj) {
                buffer.readerIndex(save);
                break;
            } else {
                result=obj;
                save = buffer.readerIndex();
                break;
            }
        } while (buffer.isReadable());
        if (result==null) {
            return DecodeResult.NEED_MORE_INPUT;
        }
        return result;
    }
}

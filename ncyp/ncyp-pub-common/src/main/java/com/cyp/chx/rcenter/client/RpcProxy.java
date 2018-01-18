package com.cyp.chx.rcenter.client;


/**
 * @Author：huanghaiyun
 * @Date:2017/12/7
 */
public abstract class RpcProxy {
    @SuppressWarnings("unchecked")
    public <T> T create(final Class<?> interfaceClass) {
        return create(interfaceClass, "");
    }

    /**
     * 自定义 客户端获取数据的超时时间
     * @param interfaceClass
     * @param timeout
     * @param <T>
     * @return
     */
    @SuppressWarnings("unchecked")
    public <T> T create(final Class<?> interfaceClass,long timeout) {
        return create(interfaceClass, "");
    }
    @SuppressWarnings("unchecked")
    public <T> T create(final Class<?> interfaceClass, final String serviceVersion) {
        return null;
    }

    /**
     *  自定义 客户端获取数据的超时时间
     * @param interfaceClass
     * @param serviceVersion
     * @param timeout
     * @param <T>
     * @return
     */
    @SuppressWarnings("unchecked")
    public <T> T create(final Class<?> interfaceClass, final String serviceVersion,long timeout) {
        return null;
    }
}

package com.zhang.cloud.microservicesimpleconsumermovie.feign;

import com.zhang.cloud.microservicesimpleconsumermovie.entity.User;
import com.zhang.config.Configuration1;
import feign.Param;
import feign.RequestLine;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.*;

/**
 * 功能说明: 建立User的api调用feign的接口 <br>
 *     使用Configuration1类做的配置文件
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/11/30 7:31<br>
 * <br>
 */
@FeignClient(name = "microservice-provider-user",configuration = Configuration1.class)
public interface UserFeginClient {

    /**
     * 用来指明指向哪个url
     * GET 空格 具体的url地址
     * @param id
     * @return
     */
    @RequestLine("GET /simple/{id}")
    public User findById(@Param("id") Long id);  //2个坑  1 @GetMapping不支持 2 @PathVariable必须设置好值

}

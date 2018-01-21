package com.zhang.cloud.microservicesimpleconsumermovie.feign;

import com.zhang.cloud.microservicesimpleconsumermovie.entity.User;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.*;

/**
 * 功能说明: 建立User的api调用feign的接口 <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/11/30 7:31<br>
 * <br>
 */
@FeignClient("microservice-provider-user")
public interface UserFeginClient {

    /**
     * 用来指明指向哪个url
     * @param id
     * @return
     */
    @RequestMapping(value = "/simple/{id}",method = RequestMethod.GET)
    public User findById(@PathVariable("id") Long id);  //2个坑  1 @GetMapping不支持 2 @PathVariable必须设置好值


    @RequestMapping(value = "/user",method = RequestMethod.POST)
    public User postUser(User user);


    @RequestMapping(value = "/get-user",method = RequestMethod.GET) //坑  虽然你用的是get方式请求的的get方法，但是因为你的传输对象时对象，所以feign依旧采用post的方式传输
    public User getUser(User user);

    @RequestMapping(value = "/get-user",method = RequestMethod.GET) //坑  虽然你用的是get方式请求的的get方法，但是因为你的传输对象时对象，所以feign依旧采用post的方式传输
    public User getObjectUser(@RequestParam("id") long id,@RequestParam("username") String username); //可以将对象的属性一个一个的写出来
}

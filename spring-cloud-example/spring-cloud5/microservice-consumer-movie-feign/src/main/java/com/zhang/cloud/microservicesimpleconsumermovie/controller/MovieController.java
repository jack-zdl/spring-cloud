package com.zhang.cloud.microservicesimpleconsumermovie.controller;

import com.zhang.cloud.microservicesimpleconsumermovie.entity.User;
import com.zhang.cloud.microservicesimpleconsumermovie.feign.UserFeginClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * @author zhangdl
 * @version class v1.0
 * @date 2017/10/11 7:27
 */
@RestController
public
class MovieController {

    /**
     * 使用feign的方式调用api
     */
    @Autowired
    private
    UserFeginClient userFeginClient;
    /**
     * error
     *  1 must add 'http://'+param
     * @param id
     * @return
     */
    @GetMapping("/movie/{id}")
    public User findById(@PathVariable Long id){
        return this.userFeginClient.findById(id);
    }

    @GetMapping("/user")
    public User postUser(User user){
        return this.userFeginClient.postUser(user);
    }
    @GetMapping("/test")
    public String test(){
        return "1";
    }
}

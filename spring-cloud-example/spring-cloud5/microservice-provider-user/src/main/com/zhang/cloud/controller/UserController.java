package com.zhang.cloud.controller;

import com.netflix.appinfo.InstanceInfo;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import com.netflix.discovery.EurekaClient;
import com.zhang.cloud.entity.User;
import com.zhang.cloud.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.web.bind.annotation.*;

/**
 * @author zhangdl
 * @version class v1.0
 * @date 2017/10/10 8:32
 */
@RestController
public
class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EurekaClient eurekaClient;

    @Autowired
    private DiscoveryClient discoveryClient;

    @GetMapping("/simple/{id}")
    public User findById(@PathVariable Long id){
        return this.userRepository.findOne(id);
    }

    /**
     * 根据eureka的服务名称获取服务的url
     * @return
     */
    @GetMapping("/eureka-instance")
    public String serviceUrl(){
        InstanceInfo instanceInfo = this.eurekaClient.getNextServerFromEureka("MICROSERVICE-PROVIDER-USER",false);
        return instanceInfo.getHomePageUrl();
    }

    @GetMapping("/eureka-info")
    public ServiceInstance showInfo(){
        ServiceInstance serviceInstance = this.discoveryClient.getLocalServiceInstance();
        return serviceInstance;
    }

    @PostMapping("/user")
    public User postUser(@RequestBody User user){
        return user;
    }
}

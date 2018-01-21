package com.zhang.cloud.microservicesimpleconsumermovie.controller;

import com.zhang.cloud.microservicesimpleconsumermovie.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.jws.soap.SOAPBinding;
import java.net.URI;
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

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private LoadBalancerClient loadBalancerClient;

//    @Value("${user.userServicePath}")
//    private String userServicePath;
    /**
     * error
     *  1 must add 'http://'+param
     * @param id
     * @return
     */
    @GetMapping("/movie/{id}")
    public User findById(@PathVariable Long id){
        //http://localhost:7900/simple/
        ServiceInstance serviceInstance = this.loadBalancerClient.choose("MICROSERVICE-PROVIDER-USER");
        System.out.println("111"+serviceInstance.getHost()+":"+serviceInstance.getPort()+":"+serviceInstance.getServiceId());
        return this.restTemplate.getForObject("http://MICROSERVICE-PROVIDER-USER/simple/"+id, User.class);
        // 带有占位符的方式
//        return this.restTemplate.getForObject("http://MICROSERVICE-PROVIDER-USER/simple/{1}", User.class,id);

        //使用带有参数类型的方式
//        Map<String,Object> params = new HashMap<String,Object>();
//        params.put("name",id);
//        return this.restTemplate.getForObject("http://MICROSERVICE-PROVIDER-USER/simple/{name}", User.class,params);

        //使用post的形式
//       return this.restTemplate.postForObject("URL",id,User.class);
        // 使用返回资源的uri
//        URI responseURI = restTemplate.
    }

    @GetMapping("/test")
    public String test(){
        ServiceInstance serviceInstance = this.loadBalancerClient.choose("MICROSERVICE-PROVIDER-USER");
        System.out.println("111"+serviceInstance.getHost()+":"+serviceInstance.getPort()+":"+serviceInstance.getServiceId());
        ServiceInstance serviceInstance2 = this.loadBalancerClient.choose("MICROSERVICE-PROVIDER-USER2");
        System.out.println("222"+serviceInstance2.getHost()+":"+serviceInstance2.getPort()+":"+serviceInstance2.getServiceId());
        return "1";
    }
}

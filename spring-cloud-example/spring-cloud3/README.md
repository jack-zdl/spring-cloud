## spring-cloud3

### Eureka注册中心
```
 元数据 ： 主机名，IP,端口号，状态页，健康检查，其他的元数据可以用户通过eureka.instance.metadataMap进行注册。
 并且客服端可以访问到，但是并不会改变客服端行为，除非客服端知道这些元数据。
 改变eureka的instance ID
    eureka:
      instance:
        instanceId: ${spring.application.name}:${vcap.application.instance_id:${spring.application.instance_id:${random.value}}}
```

# spring-netty
学习spring netty的demo工程，讲述rpc的逻辑
## rpc总结：
```
  1 使用接口的方式，相互之间的调用。这个接口测试下来必须在自己工程下，这个接口必须文件夹层次相同。
  2 可以继承其他接口或者父类。
  3 以netty的方式。
```
## RabbitMQ 总结
```
 服务A ==== 服务B
   服务A需要完成1 主事物  2 发送消息
   服务B需要完成1 接受消息 2 从事物
   A
        1先想MQ中去发送预备消息，
        2MQ保存消息
        3MQ返回
        4执行主事物
        5发送消息MQ
        6MQ保存发送消息
   B 
        1MQ发送消息
        2执行从事物
        3向MQ发送消息
        
   A    
        1回调函数
 
 不管是本地消息表还是事务消息，都需要保证从事务执行且仅仅执行一次，exact once。如果失败，需要重试，但也不可能无限次的重试，
    当从事务最终失败的情况下，需要通知主业务回滚吗？但是此时，主事务已经提交，因此只能通过补偿，实现逻辑上的回滚，而当前时间点
    距主事务的提交已经有一定时间，回滚也可能失败。
 因此，最好是保证从事务逻辑上不会失败，万一失败，记录log并报警，人工介入。
```
netty学习
```
    
```
hession介绍
```

```

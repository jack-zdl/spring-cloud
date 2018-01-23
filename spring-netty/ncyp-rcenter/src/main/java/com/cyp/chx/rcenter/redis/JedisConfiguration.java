package com.cyp.chx.rcenter.redis;

import com.cyp.chx.rcenter.config.JedisConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.StringRedisTemplate;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @Author：huanghaiyun
 * @Date:2017/12/18
 */
@Configuration
public class JedisConfiguration {
    @Autowired
    private JedisConfig redisConfig;

    public JedisConnectionFactory convertJedisConnectionFactory() {
        JedisConnectionFactory jedisConnectionFactory = new JedisConnectionFactory();
        jedisConnectionFactory.setHostName(redisConfig.getHost());
        jedisConnectionFactory.setPort(redisConfig.getPort());
        jedisConnectionFactory.setPassword(redisConfig.getPassword());

        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxTotal(redisConfig.getMaxTotal());
        jedisPoolConfig.setMaxIdle(redisConfig.getMaxIdle());
        jedisPoolConfig.setMaxWaitMillis(redisConfig.getMaxWaitMillis());
        jedisPoolConfig.setTestOnBorrow(redisConfig.isTestOnBorrow());
        jedisPoolConfig.setTestOnReturn(redisConfig.isTestOnReturn());
        jedisPoolConfig.setTestWhileIdle(redisConfig.isTestWhileIdle());

        jedisConnectionFactory.setPoolConfig(jedisPoolConfig);
        jedisConnectionFactory.afterPropertiesSet();
        return jedisConnectionFactory;
    }

    @Bean(name = "redisTemplate")
    public StringRedisTemplate convertStringRedisTemplate() {
        StringRedisTemplate stringRedisTemplate = new StringRedisTemplate(convertJedisConnectionFactory());
        return stringRedisTemplate;
    }

}

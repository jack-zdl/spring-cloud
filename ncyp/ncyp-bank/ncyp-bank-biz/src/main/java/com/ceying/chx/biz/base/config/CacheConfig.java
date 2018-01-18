package com.ceying.chx.biz.base.config;


import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/17 23:13<br>
 */
//@Configuration
//@EnableCaching
public class CacheConfig {
//    @Bean
//    public
//    EhCacheCacheManager ehCacheCacheManager(EhCacheManagerFactoryBean bean){
//
//        System.out.println("CacheConfiguration.ehCacheCacheManager()");
//
//        return new EhCacheCacheManager(bean.getObject());
//
//    }



       /*

          *据shared与否的设置,

          * Spring分别通过CacheManager.create()

          *或new CacheManager()方式来创建一个ehcache基地.

          *

          *也说是说通过这个来设置cache的基地是这里的Spring独用,还是跟别的(如hibernate的Ehcache共享)

          *

          */

//    @Bean
//    public
//    EhCacheManagerFactoryBean ehCacheManagerFactoryBean(){
//
//        System.out.println("CacheConfiguration.ehCacheManagerFactoryBean()");
//
//        EhCacheManagerFactoryBean cacheManagerFactoryBean =new EhCacheManagerFactoryBean ();
//
//        cacheManagerFactoryBean.setConfigLocation (new ClassPathResource("config/ehcache-setting.xml"));
//
//        cacheManagerFactoryBean.setShared(true);
//
//        return cacheManagerFactoryBean;
//
//    }
}

package com.ceying.chx;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import com.netflix.hystrix.contrib.javanica.cache.annotation.CacheResult;

public class HelloController {

    @CacheResult(cacheKeyMethod = "")
    @HystrixCommand(fallbackMethod = "")
    public void get(){

    }

    public void getCache(){

    }
}

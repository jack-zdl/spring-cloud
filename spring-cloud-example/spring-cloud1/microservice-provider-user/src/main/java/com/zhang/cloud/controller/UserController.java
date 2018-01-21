package com.zhang.cloud.controller;

import com.zhang.cloud.entity.User;
import com.zhang.cloud.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

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

    @GetMapping("/simple/{id}")
    public
    User findById(@PathVariable Long id){
        return this.userRepository.findOne(id);
    }
}

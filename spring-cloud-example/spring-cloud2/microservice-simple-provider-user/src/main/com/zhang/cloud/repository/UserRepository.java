package com.zhang.cloud.repository;

import com.zhang.cloud.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author zhangdl
 * @version class v1.0
 * @date 2017/10/10 8:28
 */

@Repository
public interface UserRepository extends JpaRepository<User,Long>
{
}

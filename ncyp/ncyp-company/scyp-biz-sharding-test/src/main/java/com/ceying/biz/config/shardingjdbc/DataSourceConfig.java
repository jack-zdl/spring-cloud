package com.ceying.biz.config.shardingjdbc;


import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;

/***
 * 配置多个数据源
 * 
 * @author thinkstop
 *
 */
@Configuration
public class DataSourceConfig {


    @Bean(name = "primaryDataSource")
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource.primary")
    public DataSource primaryDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean(name = "secondaryDataSource")
    @ConfigurationProperties(prefix = "spring.datasource.secondary")
    public DataSource secondaryDataSource() {
        return DataSourceBuilder.create().build();
    }

//    @Bean(name = "otherSqlSessionFactory")
//    public SqlSessionFactory otherSqlSessionFactory(@Qualifier("secondaryDataSource") DataSource clusterDataSource) throws Exception {
//        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
//        sessionFactory.setDataSource(clusterDataSource);
//        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver()
//                .getResources(DataSourceConfig.MAPPER_LOCATION));
//        return sessionFactory.getObject();
//    }
//
//    @Bean(name = "agreementSqlSessionFactory")
//    public SqlSessionFactory agreementSqlSessionFactory(@Qualifier("primaryDataSource") DataSource clusterDataSource) throws Exception {
//        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
//        sessionFactory.setDataSource(clusterDataSource);
//        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver()
//                .getResources(DataSourceConfig.MAPPER_LOCATION));
//        return sessionFactory.getObject();
//    }

}

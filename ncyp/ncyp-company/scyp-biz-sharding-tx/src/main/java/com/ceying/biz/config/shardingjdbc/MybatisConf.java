package com.ceying.biz.config.shardingjdbc;

import com.ceying.biz.vo.AccountsPayableVo;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import tk.mybatis.mapper.autoconfigure.SpringBootVFS;

import javax.sql.DataSource;
import java.util.Arrays;

/**
 * mybatis的配置
 * 
 * @author donghuating
 *
 */
@Configuration
@MapperScan(basePackages = "com.ceying.biz.dao.*",sqlSessionTemplateRef = "sqlSessionTemplate")
public class MybatisConf {

    @Autowired
    private XbDataSource xbDataSource;

    /**
     * 获取sqlFactory
     * 
     * @return
     * @throws Exception
     */
    @Bean(name = "sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactoryBean() throws Exception {
        /**
         * sharding-jdbc 产生的DataSource
         */
        DataSource dataSource = xbDataSource.getShardingDataSource();
//        TransactionFactory transactionFactory = (TransactionFactory) new MyBatisMapperScannerConfig();
//        TransactionFactory transactionFactory = new JdbcTransactionFactory();
//
//        Environment environment = new Environment("development", transactionFactory, dataSource);
//        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration(
//                environment);
//        // Dao层包路径
//        configuration.addMappers(" com.ceying.biz.dao.*");
//        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(configuration);
//        return sqlSessionFactory;

        SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
        sessionFactoryBean.setDataSource(dataSource);
//        Class<?>[] list = new Class[]{AccountsPayableVo.class};
//        sessionFactoryBean.setTypeAliases(new Class[]{AccountsPayableVo.class});
        sessionFactoryBean.setVfs(SpringBootVFS.class);
        sessionFactoryBean.setTypeAliasesPackage("com.ceying.biz.vo;com.ceying.biz.dto;com.ceying.biz.query;com.ceying.biz.entity");
//        sessionFactoryBean.setTypeAliasesPackage("com.ceying.biz.query");
//        sessionFactoryBean.setTypeAliasesPackage("com.ceying.biz.entity");
        //添加XML目录
        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        try {
            sessionFactoryBean.setMapperLocations(resolver.getResources("classpath:mapping/*.xml"));
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }finally {
            SqlSessionFactory sqlSessionFactory = sessionFactoryBean.getObject();
            return sqlSessionFactory;
        }
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(@Qualifier("sqlSessionFactory")SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Bean
    public PlatformTransactionManager annotationDrivenTransactionManager() {
        return new DataSourceTransactionManager(xbDataSource.getShardingDataSource());
    }

}

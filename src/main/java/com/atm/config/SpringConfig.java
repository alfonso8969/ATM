package com.atm.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.lookup.JndiDataSourceLookup;
import org.springframework.lang.NonNull;

@ComponentScan(basePackages = {"com.atm.dao","com.atm.service"})
@Configuration
@PropertySource(value = {"classpath:jndi.properties"})
public class SpringConfig {
	
    @Value("${ref-jndi:#{null}}")
    @NonNull
    private String refData = "";

    @Bean
    public DataSource dataSource() {
        JndiDataSourceLookup dsLookup = new JndiDataSourceLookup();
        dsLookup.setResourceRef(true);
        return dsLookup.getDataSource(refData);
    }

    @Bean 
    public JdbcTemplate getTemplate(DataSource datasource) {
        if (datasource == null) {
            throw new IllegalArgumentException("DataSource cannot be null");
        }
        return new JdbcTemplate(datasource);
    }
}

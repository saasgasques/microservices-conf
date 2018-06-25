package org.northwind.application.config;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryConfiguration;
import io.springlets.data.jpa.repository.support.DetachableJpaRepositoryImpl;
import org.northwind.NorthwindApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 * = SpringDataJpaDetachableRepositoryConfiguration
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJpaRepositoryConfiguration
@Configuration
@EnableJpaRepositories(repositoryBaseClass = DetachableJpaRepositoryImpl.class, basePackageClasses = NorthwindApplication.class)
@EntityScan(basePackageClasses = NorthwindApplication.class)
public class SpringDataJpaDetachableRepositoryConfiguration {
}

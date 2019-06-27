package com.ap.mis.util;

import org.hibernate.Interceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class HibernateEventIntercepterRegistry {

	@Bean
	public Interceptor auditEntityInterceptor() {
		return new AuditModelInterceptor();

	}

}

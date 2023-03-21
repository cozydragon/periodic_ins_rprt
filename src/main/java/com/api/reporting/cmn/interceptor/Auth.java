package com.api.reporting.cmn.interceptor;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target(METHOD)
public @interface Auth {
	public enum Role {USER, USERMANGING, ADMIN}
	
	public Role role() default Role.USER;

}

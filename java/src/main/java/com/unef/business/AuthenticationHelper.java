package com.unef.business;

import java.security.Principal;
import java.util.Collection;

import org.springframework.context.ApplicationContext;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.unef.business.vo.AuthorizationData;

import flex.messaging.FlexContext;

/**
 * Created by IntelliJ IDEA. User: jettro Date: Jul 8, 2008 Time: 10:36:57 PM
 * Class used to interact with the spring context and do the actual
 * authentication.
 */
@Service("authenticationHelper")
@RemotingDestination(channels = { "my-amf" })
public class AuthenticationHelper {
	/**
	 * Checks if the current user is authenticated by evaluating the FlexContext
	 * 
	 * @return Boolean true if the current user is authenticated and false
	 *         elsewise
	 */
	@RemotingInclude
	public boolean principleIsAuthenticated() {
		Principal userPrincipal = FlexContext.getUserPrincipal();
		return userPrincipal != null;

	}

	/**
	 * Takes the username and password as provided and checks the validaty of
	 * the credentials. Spring security is used to check the credentielas and to
	 * return the authenticated principal with it's authorized roles. An
	 * exception is thrown if the authentication failes.
	 * 
	 * @param username
	 *            String containing the username of the principal to login
	 * @param password
	 *            String containing the password used to identify the current
	 *            user
	 * @return AuthorizationData object containing the name of the principal and
	 *         the authorized roles.
	 */
	@RemotingInclude
	public AuthorizationData authenticatePrincipal(String username,
			String password) {
		System.out.println("User: " + username + " Pass: " + password);
		try {
			ApplicationContext appContext = WebApplicationContextUtils
					.getWebApplicationContext(FlexContext.getServletConfig()
							.getServletContext());
			AuthenticationManager manager = (AuthenticationManager) appContext
					.getBean("authenticationManager");
			UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(
					username, password);

			Authentication authentication = manager
					.authenticate(usernamePasswordAuthenticationToken);
			SecurityContextHolder.getContext()
					.setAuthentication(authentication);

			Collection<GrantedAuthority> authority = SecurityContextHolder
					.getContext().getAuthentication().getAuthorities();

			//

			GrantedAuthority[] authorities = (GrantedAuthority[]) authority.toArray(new GrantedAuthorityImpl[authority.size()]);
			int numAuthorities = authorities.length;
			String[] grantedRoles = new String[numAuthorities];
			for (int counter = 0; counter < numAuthorities; counter++) {
				grantedRoles[counter] = authorities[counter].getAuthority();
			}

			String name = SecurityContextHolder.getContext()
					.getAuthentication().getName();
			AuthorizationData auth = new AuthorizationData(grantedRoles, name);
			for (String s : auth.getRoles()) {
				System.out.println("ROLE: " + s);
			}
			return auth;
		} catch (Exception e) {
			System.out.println("FUU: " + e.getMessage());
		}
		return null;
	}
}

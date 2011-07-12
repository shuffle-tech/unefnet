package com.unef.business;

import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.stereotype.Service;

@Service("myService")
@RemotingDestination(channels = { "my-amf" })
public class MyServiceImpl implements MyService {

	public MyServiceImpl() { }
    
	@RemotingInclude
	public String test() {
		return "Shuffle new World!! V2";
	}
	
	@RemotingInclude
	public Boolean isLoggedIn(){
		return false;
	}
	
}

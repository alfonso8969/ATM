package com.atm.util;

public enum Rol {

	CLIENT(Constants.CLIENT),
	ADMIN(Constants.ADMIN);
	
	private String rolType;
	
	Rol(String rol) {
		this.rolType = rol;
	}

	public String getRolType() {
		return rolType;
	}
}

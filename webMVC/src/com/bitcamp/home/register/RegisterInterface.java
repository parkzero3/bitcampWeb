package com.bitcamp.home.register;

public interface RegisterInterface {
	public void loginCheck(RegisterVO vo);
	public int registerInsert(RegisterVO vo);
	public void registerSelect(RegisterVO vo);
	public int idSearch(String userid);
}

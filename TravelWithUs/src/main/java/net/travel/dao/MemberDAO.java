package net.travel.dao;

import net.travel.dto.Member;

public interface MemberDAO {
	
	// Inquery ID is existed or not
	public Member InqueryID(String id);
	
	// Inquery If ID is existed, then according to ID, pw is correct or not.
	public Member InqueryPW(String id,String pw);
	
	// Get user's name.
	public String getUserName(String id);
	
	// Sign up User
	public void InsertNewUser(Member member);
		
}

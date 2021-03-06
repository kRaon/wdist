package com.wdist.biz.user.service;

import com.wdist.biz.user.vo.UserVO;

public interface UserService {
	public int insertAccount(UserVO vo);
	public int deleteAccount(String id);
	public int modifyAccount(UserVO vo);
	public int updateUserPwNull(UserVO vo);
	public Boolean checkId(String id);
	public UserVO getUser(String uid);
	public UserVO login(String id, String pw);
	public int modifyNewPwd(UserVO vo);
	public UserVO pwSearchUser(UserVO vo);
	public UserVO searchId(UserVO vo);

}

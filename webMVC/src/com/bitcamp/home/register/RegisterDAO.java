


package com.bitcamp.home.register;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBConnection;

public class RegisterDAO extends DBConnection implements RegisterInterface {

	
	//객체생성
	public static RegisterDAO getInstance() {
		
		return new RegisterDAO();
	}
	//회원가입
	@Override
	public int registerInsert(RegisterVO vo) {
		int cnt=0;
		try {
			getConn();
			String sql = "insert into register(no, userid, userpwd, username, gender, birth, "
					+ "tel, email, zipcode, addr, addrdetail, regdate ) "
					+ "values (a_sq.nextval, ?, ?, ?, ?, to_date(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getUserpwd());
			pstmt.setString(3, vo.getUsername());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getBirth());
			System.out.println(vo.getBirth());
			pstmt.setString(6, vo.getTel());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getZipcode());
			pstmt.setString(9, vo.getAddr());
			pstmt.setString(10, vo.getAddrDetail());
			
			cnt = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("ȸ������ ����..."+e.getMessage());
		}finally {
			getClose();
		}
		return cnt;
	}

	@Override
	public void registerSelect(RegisterVO vo) {
		try {
			getConn();
			String sql = "select userid, username, gender, to_char(birth, 'YYYY-MM-DD') birth, tel,"
					+ " email, zipcode, addr, addrdetail from register where userid=? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setUserid(rs.getString(1));
				vo.setUsername(rs.getString(2));
				//System.out.println(rs.getString(2));
				vo.setGender(rs.getString(3));
				vo.setBirth(rs.getString(4));
				vo.setTel(rs.getString(5));
				vo.setEmail(rs.getString(6));
				vo.setZipcode(rs.getString(7));
				vo.setAddr(rs.getString(8));
				vo.setAddrDetail(rs.getString(9));
			}
			
		}catch(Exception e) {
			System.out.println("ȸ�����ÿ����߻�--->"+e.getMessage());
			
		}finally {
			getClose();
		}

	}
	@Override
	public int idSearch(String userid) {
		int cnt = 0;
		try {
			getConn();
			String sql ="select count(userid) from register where userid=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
							
		}catch(Exception e) {
			System.out.println("���̵� �ߺ��˻� �����߻�..."+e.getMessage());
		}finally {
			getClose();
		}
		return cnt;
	}
	//우편번호 검색
	public List<ZipcodeVO> getZipcodeList(String doro) {
		List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
		try {
			getConn();
			String sql = "select zipcode, sido, sigungu, um, doro, b_num1, b_num2, building, dong "
					+ "from zipcodetbl where doro like ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+doro+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ZipcodeVO vo = new ZipcodeVO();
				vo.setZipcode(rs.getString(1));
				vo.setSido(rs.getString(2));
				vo.setSigungu(rs.getString(3));
				vo.setUm(rs.getString(4));
				vo.setDoro(rs.getString(5));
				vo.setB_num1(rs.getInt(6));
				vo.setB_num2(rs.getInt(7));
				vo.setBuilding(rs.getString(8));
				vo.setDong(rs.getString(9));
				list.add(vo);
			}
		}catch(Exception e) {
			System.out.println("�����ȣ �˻�����....(Ajax)"+e.getMessage());
		}finally {
			getClose();
		}
		return list;
		
		
		
	}

	@Override
	public void loginCheck(RegisterVO vo) {
		
		try {
				getConn();
				String sql = "select username from register where userid=? and userpwd=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getUserid());
				pstmt.setString(2, vo.getUserpwd());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo.setUsername(rs.getString(1));
					vo.setLogStatus("Y");
					//System.out.println("�α��ε�");
				}
			}catch(Exception e) {
				System.out.println("�α��� �����߻�");
			}finally {
				getClose();
			}
	}

	
	//비빈번호 체크
	public int passwordCheck(String userid, String userpwd) {
		int result=0;
		try {
			getConn();
			String sql = "select count(userid) from register where userid=? and userpwd=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		}catch(Exception e) {
			
		}finally {
			getClose();
		}
		
		return result;
		
	}
	
	//정보 수정
	public int registerUpdate(RegisterVO vo) {
		int result=0;
		try {
			getConn();
			String sql = "update register set gender=?, birth=to_date(?, 'YYYY-MM-DD'), tel=?, email=?, "
					+ "zipcode=?, addr=?, addrdetail=? where userid=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getGender());
			pstmt.setString(2, vo.getBirth());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getZipcode());
			pstmt.setString(6, vo.getAddr());
			pstmt.setString(7, vo.getAddrDetail());
			pstmt.setString(8, vo.getUserid());
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("ȸ������ ������ �����߻�.."+e.getMessage());
		}finally {
			getClose();
		}
		return result;
	}
	
	public void registerDelete(RegisterVO vo) {
		try {
			getConn();
			String sql = "delete from register where id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setUsername(null);
				vo.setLogStatus("N");
				//System.out.println("�α��ε�");
			}
			
			
		}catch(Exception e) {
			System.out.println("회원삭제중 에러발생"+e.getMessage());
		}finally {
			getClose();
		}
	}
	//회원탈퇴
	public int regLeaveRecord(String userid, String userpwd) {
		int cnt =0;
		try {
			getConn();
			String sql="delete from register where userid=? and userpwd=? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			
			cnt= pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("회원탈퇴 에러"+e.getMessage());
		}finally {
			getClose();
		}
		return cnt;
	}
}

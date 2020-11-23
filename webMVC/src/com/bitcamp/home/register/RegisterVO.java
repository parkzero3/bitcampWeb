package com.bitcamp.home.register;

public class RegisterVO {

	
		private int no;
		private String userid;
		private String userpwd;
		private String username;
		private String gender;
		
		private String birth;
		private String year;
		private String month;
		private String day;
		
		private String tel;
		private String tel1;
		private String tel2;
		private String tel3;
		
		private String email;
		private String zipcode;
		private String addr;
		private String addrDetail;
		
		private String regdate;
		
		//�α��� ��� ������ ���� N:���� Y:����
		private String logStatus="N";

		public int getNo() {
			return no;
		}

		public void setNo(int no) {
			this.no = no;
		}

		public String getUserid() {
			return userid;
		}

		public void setUserid(String userid) {
			this.userid = userid;
		}

		public String getUserpwd() {
			return userpwd;
		}

		public void setUserpwd(String userpwd) {
			this.userpwd = userpwd;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public String getBirth() {
			birth = year+"-"+month+"-"+day;
			return birth;
		}

		public void setBirth(String birth) {
			this.birth = birth;
			
			//��, ��, �Ϻи� 2020-10-30
			String birthSplit[] = birth.split("-");
			year = birthSplit[0];
			month = birthSplit[1];
			day = birthSplit[2];
		}

		public String getYear() {
			return year;
		}

		public void setYear(String year) {
			this.year = year;
		}

		public String getMonth() {
			return month;
		}

		public void setMonth(String month) {
			this.month = month;
		}

		public String getDay() {
			return day;
		}

		public void setDay(String day) {
			this.day = day;
		}

		public String getTel() {
			tel = tel1+"-"+tel2+"-"+tel3;
			return tel;
		}

		public void setTel(String tel) {
			this.tel = tel;
			String telCut[] = tel.split("-");
			tel1 = telCut[0];
			tel2 = telCut[1];
			tel3 = telCut[2];
			
		}

		public String getTel1() {
			return tel1;
		}

		public void setTel1(String tel1) {
			this.tel1 = tel1;
		}

		public String getTel2() {
			return tel2;
		}

		public void setTel2(String tel2) {
			this.tel2 = tel2;
		}

		public String getTel3() {
			return tel3;
		}

		public void setTel3(String tel3) {
			this.tel3 = tel3;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getZipcode() {
			return zipcode;
		}

		public void setZipcode(String zipcode) {
			this.zipcode = zipcode;
		}

		public String getAddr() {
			return addr;
		}

		public void setAddr(String addr) {
			this.addr = addr;
		}

		public String getAddrDetail() {
			return addrDetail;
		}

		public void setAddrDetail(String addrDetail) {
			this.addrDetail = addrDetail;
		}

		public String getRegdate() {
			return regdate;
		}

		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}

		public String getLogStatus() {
			return logStatus;
		}

		public void setLogStatus(String logStatus) {
			this.logStatus = logStatus;
		}

}

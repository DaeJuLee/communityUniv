package miniproject_jj;
	import java.util.Date;

	public class QnABoard {
		
		private int snum; //�й�
		private int id;
		private String pass;
		private int grade; //ȸ�����
		private String writer;
		private String email;

		private int bnum; //�۹�ȣ
		private String title;
	//	private String writer;
		private Date s_date; //�� �ۼ���
		private String content; //�� ����
		private int hits; //readcount
		private String bpass; //�� ���
		private String fileName; //���� �̸�
		private int fileSize; 
		private int re_step; //��� ���� 
		private int re_level; //��� ����
		private int ref; //�� ���۷���
		private String ip; //ip
		
		public int getSnum() {
			return snum;
		}
		public void setSnum(int snum) {
			this.snum = snum;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public int getGrade() {
			return grade;
		}
		public void setGrade(int grade) {
			this.grade = grade;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public int getBnum() {
			return bnum;
		}
		public void setBnum(int bnum) {
			this.bnum = bnum;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public Date getS_date() {
			return s_date;
		}
		public void setS_date(Date s_date) {
			this.s_date = s_date;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getHits() {
			return hits;
		}
		public void setHits(int hits) {
			this.hits = hits;
		}
		public String getBpass() {
			return bpass;
		}
		public void setBpass(String bpass) {
			this.bpass = bpass;
		}
		public String getFileName() {
			return fileName;
		}
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
		public int getFileSize() {
			return fileSize;
		}
		public void setFileSize(int fileSize) {
			this.fileSize = fileSize;
		}
		public int getRe_step() {
			return re_step;
		}
		public void setRe_step(int re_step) {
			this.re_step = re_step;
		}
		public int getRe_level() {
			return re_level;
		}
		public void setRe_level(int re_level) {
			this.re_level = re_level;
		}
		public int getRef() {
			return ref;
		}
		public void setRef(int ref) {
			this.ref = ref;
		}
		public String getIp() {
			return ip;
		}
		public void setIp(String ip) {
			this.ip = ip;
		}
	}
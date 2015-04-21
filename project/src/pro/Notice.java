package pro;

import java.util.Date;

public class Notice {
	
	private int bnum;
	private String title;
	private Date s_date;
	private String writer;
	private String content;
	private int hits;
	private int ref;
	
	
	public int getBnum() {		return bnum;	}
	public void setBnum(int bnum) {		this.bnum = bnum;	}
	
	public String getTitle() {		return title;	}
	public void setTitle(String title) {		this.title = title;	}
	
	public Date getS_date() {		return s_date;	}
	public void setS_date(Date s_date) {		this.s_date = s_date;	}
	
	public String getWriter() {		return writer;	}
	public void setWriter(String writer) {		this.writer = writer;	}
	
	public String getContent() {		return content;	}
	public void setContent(String content) {		this.content = content;	}
	
	public int getHits() {		return hits;	}
	public void setHits(int hits) {		this.hits = hits;	}
		
	public int getRef() {		return ref;	}
	public void setRef(int ref) {		this.ref = ref;	}
	
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<%
	BoardDao bd = BoardDao.getInstance();
	Board board = new Board();
	for (int i = 1; i < 154; i++) {
		board.setWriter("3조" + i);
		board.setTitle("아씨" + i);
		board.setContent("대박 넌 누구냐 헐 ~ " + i);
		board.setHits(0);
		board.setBpass("1");
		board.setRe2_step(0);
		board.setRe2_level(0);
		board.setIp(request.getRemoteAddr());	
		bd.insert(board);
	}
%>
입력 성공
</body>
</html>
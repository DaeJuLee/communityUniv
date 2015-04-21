<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
	%>
 <input type="text" name="post1" id="post1" value=""> - <input type="text" name="post2" id="post2" value="">
 <input type="button" onclick="openDaumPostcode()" value="우편번호 찾기" style="width:100px; height:20px; font-size:11px; background-color:#ECECEC"><br>
 <input type="text"name="addr1" id="addr" value="" title="행정기본주소" style="width:49%">
 <input type="text" name="addr2" id="addr2" value="" title="상세주소" style="width:49%">
 <input type="text" name="addr3" id="addr3" value="" title="참고항목" style="width:99%">
 <input type="text" name="jibeon" id="jibeon" value="" title="지번주소" style="width:99%">

 <script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
 <script>
     function openDaumPostcode() {
         new daum.Postcode({
             oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                 // 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
                 document.getElementById('post1').value = data.postcode1;
                 document.getElementById('post2').value = data.postcode2;
                 document.getElementById('addr').value = data.address1;
                 document.getElementById('addr3').value = data.address2;
                 document.getElementById('jibeon').value = data.relatedAddress;
                 document.getElementById('addr2').focus();
             }
         }).open();
     }
 </script> 
</body>
</html>
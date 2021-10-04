<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<!-- META DATA -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!--font-family-->
<link href="https://fonts.googleapis.com/css?family=Rufina:400,700"
	rel="stylesheet" />

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet" />

<!-- TITLE OF SITE -->
<title>PhotoGallery edit</title>

<!-- favicon img -->
<link rel="shortcut icon" type="image/icon" href="logo/favicon.png" />

<!--font-awesome.min.css-->
<link rel="stylesheet" href="css/font-awesome.min.css" />

<!--animate.css-->
<link rel="stylesheet" href="css/animate.css" />

<!--hover.css-->
<link rel="stylesheet" href="css/hover-min.css">

<!--datepicker.css-->
<link rel="stylesheet" href="css/datepicker.css">

<!--owl.carousel.css-->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css" />

<!-- range css-->
<link rel="stylesheet" href="css/jquery-ui.min.css" />

<!--bootstrap.min.css-->
<link rel="stylesheet" href="css/bootstrap.min.css" />

<!-- bootsnav -->
<link rel="stylesheet" href="css/bootsnav.css" />

<!--style.css-->
<link rel="stylesheet" href="css/style.css" />

<!--responsive.css-->
<link rel="stylesheet" href="css/responsive.css" />

<!--reviewboard.css-->
<link rel="stylesheet" href="css/reviewboard.css" />


<!-- 첨부파일 <file> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- summbernote -->
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


	<c:set var="pbnum" value="${requestScope.pbnum}"></c:set>
	<c:set var="pboard" value="${requestScope.pboard}"></c:set>

	<!-- form 시작 ---------->
	<div id="reveiwBoardListContainer">
		<h1>글 수정</h1>
		<form name="bbs" action="PboardEditOk.pg" method="POST"
			enctype="multipart/form-data">
			<input type="hidden" name="pbnum" size="40" value="${pboard.pbnum}">
			<table>
				<tr>
					<td width="20%" align="center">제목</td>
					<td width="80%" align="left"><input type="text" name="pbsubj"
						size="40" value="${pboard.pbsubj}"></td>
				</tr>
				<tr>
					<td width="20%" align="center">글쓴이</td>
					<td width="80%" align="left"><input type="text" name="mnic"
						size="40" value="${pboard.mnic}" readonly></td>
				</tr>
				<tr>
					<td width="20%" align="center">이메일</td>
					<td width="80%" align="left"><input type="text" name="email"
						size="40" value="${pboard.email}" readonly></td>
				</tr>
				<tr>
					<td width="20%" align="center">글내용</td>
					<td width="80%" align="left"><textarea rows="10" cols="60"
							name="pbcont" class="ckeditor" id="summernote">
                    	${pboard.pbcont}
                    	</textarea></td>
				</tr>
				<!-- 첨부파일 <file> 파일 id값 설정 -->
				<tr>
					<td width="20%" align="center">첨부파일</td>
					<td width="80%" align="left">${pboard.pfilename}
						(${pboard.pfilesize}bytes)<input type="file" id="pfilename"
						name="pfilename">
					</td>
				</tr>
				<tr>
					<td width="20%" align="center">미리보기</td>
					<td width="80%" align="left"><img id="preview" src=""
						width="300" alt=""></td>
				</tr>
				<!-- 첨부파일 <file> 미리보기 tr 추가-->
				<tr>
					<td colspan="2" align="center"><input type="button"
						value="수정하기" onclick="editCheck();" /> 
						<input type="reset" value="다시쓰기" /></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><a href="PboardList.pg">목록</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#pfilename').on("change", fileChange);
			$('#summernote').summernote({
				placeholder : '내용을 입력하세요',
				tabsize : 2,
				height : 300,
				minHeight : 300,
				maxHeight : 300,
			});
		})

		function fileChange(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview').attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			})
		}
		
		function editCheck() {
			alert("아무거나");
			if (!bbs.pbsubj.value) {
				alert("제목을 입력하세요");
				bbs.pbsubj.focus();
				return false;
			}
			if (!bbs.pbcont.value) {
				alert("글 내용을 입력하세요");
				bbs.pbcont.focus();
				return false;
			}
			if (!bbs.pfilename.value) {
				alert("이미지를 첨부하세요");
				bbs.pfilename.focus();
				return false;
			}
			document.bbs.submit();

		}

	</script>

</body>
</html>
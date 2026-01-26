<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴관리</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		// jstree 데이터 넣어주기
		var treeData = ${jsonString};
		$('#menuTree').jstree({
		    core: {
		      data: treeData,
		      check_callback:true
		    },
			themes: {
	            dots: false,
	            icons: true
	        }
		});

		// 노드 선택
		$("#menuTree").on("select_node.jstree", function(e, data){
			var node = data.node;

			$("#mngMenuForm #menuId").val(node.id == '공백' ? '' : node.id);
			$("#mngMenuForm #menuPid").val(node.original.parent == '#' ? '0' : node.original.parent);
			$("#mngMenuForm #menuNm").val(node.text);
			$('#mngMenuForm #parentName').val(node.parent == '#' ? 'ROOT' : $('#menuTree').jstree(true).get_node(node.parent).text);
			$("#mngMenuForm #menuIcon").val(node.original.menuIcon);
			$("#mngMenuForm #menuUrl").val(node.original.menuUrl);
			$("#mngMenuForm #menuDepth").val(node.original.menuDepth);
			$("#mngMenuForm #siteCode").val(node.original.siteCode);
			$("#mngMenuForm #menuOrdr").val(node.original.menuOrder);
			$("#mngMenuForm #useYn").val(node.original.useYn);
		});

		// 하위 메뉴 추가
	    $('#btnAdd').click(function(){
	        var tree = $('#menuTree').jstree(true);
	        var sel = tree.get_selected()[0];
	        var parentNode = tree.get_node(sel);
	        var depth = Number(parentNode.original.menuDepth) + 1;

	        if(!sel) {
	        	alert('부모 메뉴를 선택하세요');
	        	return
	        } else {
	        	tree.create_node(sel, { id:'공백', text:'새 메뉴', parent:sel, menuDepth:depth }, 'last');
		        tree.open_node(sel);
	        }
	    });
	});
</script>
</head>
<body class="menu-page">
		<div class="menu-container">
		    <h2>메뉴 관리</h2>
		    <div class="menu-layout">
		        <!-- LEFT : jstree -->
		        <div class="menu-tree-box">
				    <h3 class="box-title">메뉴 구조</h3>
				    <div id="menuTree" class="jstree-wrapper"></div>
				</div>
		        <!-- RIGHT : 메뉴 관리 -->
		        <div class="menu-info-box">
		            <h3>메뉴 정보</h3>
					<form id="mngMenuForm" name="mngMenuForm" method="post" class="form-cls">
						<div class="menu-form-grid">
				            <div class="form-row">
				                <label>메뉴 ID</label>
				                <input type="text" id="menuId" readonly>
				            </div>

				            <div class="form-row">
				                <label>메뉴 PID</label>
				                <input type="text" id="menuPid" readonly>
				            </div>

				            <div class="form-row">
				                <label>상위 메뉴</label>
				                <input type="text" id="parentName" readonly>
				            </div>

				            <div class="form-row">
				                <label>메뉴 깊이</label>
				                <input type="text" id="menuDepth" readonly>
				            </div>

				            <div class="form-row">
				                <label>메뉴명</label>
				                <input type="text" id="menuNm">
				            </div>
				            <div class="form-row">
				                <label>URL</label>
				                <input type="text" id="menuUrl">
				            </div>

				            <div class="form-row">
				                <label>메뉴아이콘</label>
				                <input type="text" id="menuIcon">
				            </div>

				            <div class="form-row">
				                <label>사이트코드</label>
				                <input type="text" id="siteCode">
				            </div>

				            <div class="form-row">
				                <label>정렬 순서</label>
				                <input type="text" id="menuOrdr">
				            </div>

				            <div class="form-row">
				                <label>사용유무</label>
				                <input type="text" id="useYn">
				            </div>
			            </div>
		            </form>
		            <div class="form-actions">
		                <button type="button" class="btn primary" id="btnAdd">하위 메뉴 추가</button>
		                <button type="button" class="btn secondary" id="btnSave">저장</button>
		                <button type="button" class="btn danger" id="btnDelete">삭제</button>
		            </div>
		        </div>

		    </div>
		</div>
</body>
</html>
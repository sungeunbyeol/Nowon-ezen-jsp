<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall_prodView.jsp -->
<%@ include file="mall_top.jsp" %>
<jsp:useBean id="proList" class="my.shop.mall.ProductList" scope="session" />
<jsp:setProperty property="pool" name="proList" value="<%=dbPool%>"/>
<%
		String pnum = request.getParameter("pnum");
		String select = request.getParameter("select");
		if (pnum==null || select==null || pnum.trim().equals("") || select.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
		
		ProductDTO pdto = proList.getProduct(Integer.parseInt(pnum), select);
		String upPath = request.getServletContext().getRealPath("/myshop/images");	
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
		
		if (pdto == null){%>
		<script type="text/javascript">
			alert("��ǰ�� �����ϴ�. �ٽ� ������ �ּ���!!")
			location.href="mall.jsp"
		</script>
<%		return;
		}%>
<script type="text/javascript">
	function goCart(){
		document.f2.action = "mall_cartAdd.jsp"
		document.f2.submit()
	}
	function goOrder(){
		
	}
</script>		
<div align="center">
	<table border="0" class="outline" width="100%">
		<tr class="m1">
			<td colspan="2" align="center">
				<b>[<%=pdto.getPname()%>] ��ǰ ����</b>
			</td>
		</tr>
		<tr>
			<td align="center" class="m3">
				<img src="<%=upPath%>/<%=pdto.getPimage()%>" width="200" height="200">
			</td>
			<td class="m3">
				<form name="f2" method="post">
					��ǰ��ȣ : <%=pdto.getPnum()%><br>
					��ǰ�̸� : <%=pdto.getPname()%><br>
					��ǰ���� : <font color="red"><%=df.format(pdto.getPrice())%></font>��<br>
					��ǰ����Ʈ : <font color="red"><%=pdto.getPoint()%></font>point<br>
					��ǰ���� : <input type="text" name="qty" size="3" value="1">��<br><br>
					<input type="hidden" name="pnum" value="<%=pnum%>"/>
					<input type="hidden" name="select" value="<%=select%>"/>
					<a href="javascript:goCart()">��ٱ���</a> |
					<a href="javascript:goOrder()">��ñ���</a> 
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="left">
				<b>��ǰ �� ����</b><br>
				<%=pdto.getPcontents()%>
			</td>
		</tr>
	</table>
</div>		
<%@ include file="mall_bottom.jsp"%>			
		
		
		
		
		
		
		
		
		
		
		
		
<%@include file="Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h3 align="center">Category Page</h3>

<form action="<c:url value="/UpdateCategory"/>" method="post">
<table align ="center">
<tr bgcolor="pink">
<td colspan="2"><center>Update Category</center></td>
</tr>
<tr bgcolor="grey">
	<td>Category ID</td>
	<td><input type="text" readonly id="catid" name="catid" value="${categoryInfo.categoryId}"/></td>
</tr>
<tr bgcolor="grey">
	<td>Category Name</td>
	<td><input type="text" id="catname" name="catname" value="${categoryInfo.categoryName}"/></td>
</tr>
	<td>Category Desc</td>
	<td><input type="text" id="catdesc" name="catdesc" value="${categoryInfo.categoryDesc}"/></td>
</tr>
<tr bgcolor="grey">
	<td colspan="2"><center>
	<input type="submit" value="Update"/>
	<input type="reset" value="RESET"/>
	</center></td>
</tr>
</table>
</form>

<table align="center">
	<tr>
		<td>Category ID</td>
		<td>Category Name</td>
		<td>Category Desc</td>
		<td>Operation</td>
	</tr>
	<c:forEach items="${listCategories}" var="category">
	<tr>
		<td>${category.categoryId}</td>
		<td>${category.categoryName}</td>
		<td>${category.categoryDesc}</td>
		<td>
		<a href="<c:url value="/updateCategory${category.categoryId}"/>">Update</a>/
		<a href="<c:url value="/deleteCategory/${category.categoryId}"/>">Delete</a>
		</td>
	</tr>
	</c:forEach>
	
</table>

<jsp:include page="Fotter.jsp"></jsp:include>
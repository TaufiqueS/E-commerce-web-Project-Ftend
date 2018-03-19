<jsp:include page="Header.jsp"></jsp:include>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h3 align="center">Supplier Page</h3>

<form action="<c:url value="/updateSupplier"/>" method="post">
<table align ="center">
<tr bgcolor="pink">
<td colspan="2"><center>Update Supplier</center></td>
</tr>
<tr bgcolor="grey">
	<td>Supplier ID</td>
	<td><input type="text" readonly id="supplierId" name="supplierId" value="${supplierInfo.supplierId}"/></td>
</tr>
<tr bgcolor="grey">
	<td>Supplier Name</td>
	<td><input type="text" id="supplierName" name="supplierName" value="${supplierInfo.supplierName}"/></td>
</tr>
	<td>Supplier MoblieNo:</td>
	<td><input type="text" id="supplierMob" name="supplierMob" value="${supplierInfo.supplierMob}"/></td>
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
		<td>Supplier ID</td>
		<td>Supplier Name</td>
		<td>Supplier MobNo </td>
		<td>Operation</td>
	</tr>
	<c:forEach items="${listSuppliers}" var="supplier">
	<tr>
		<td>${supplier.supplierId}</td>
		<td>${supplier.supplierName}</td>
		<td>${supplier.supplierMob}</td>
		<td>
		<a href="<c:url value="/updateSupplier${supplier.supplierId}"/>">Update</a>/
		<a href="<c:url value="/deleteSupplier${supplier.supplierId}"/>">Delete</a>
		</td>
	</tr>
	</c:forEach>
	
</table>

<jsp:include page="Fotter.jsp"></jsp:include>
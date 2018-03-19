<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
<h3 align="center">Supplier</h3>
<div class="table-responsive-sm">
<form  method="post" action="InsertSupplier">
<table class="table table-hover" align="center">
  <tr class="table-light">
    <td>Supplier Name</td>
    <td><input type="text" id="supplierName" name="supplierName" /></td>
  </tr>
  <tr class="table-light">
    <td>Supplier Contact</td>
    <td><input type="text" id="supplierMob" name="supplierMob" /></td>
  </tr>
  <tr>
  <td colspan="2" align="center"><button type="submit" class="btn btn-primary" >SUBMIT</button>
  <button type="reset" class="btn btn-primary"/>RESET</button>
  </td>
  </tr>
</table>
</form>
<table class="table table-hover" align="center">
	<thead>
	<tr class="table-success">
		<th>Supplier ID</th>
		<th>Supplier Name</th>
		<th>Contact</th>
		<th>Operation</th>
	</tr>
</thead>
<c:forEach items="${listSuppliers}" var="supplier">
<tr >
			<td>${supplier.supplierId}</td>
			<td>${supplier.supplierName}</td>
			<td>${supplier.supplierMob}</td>
			<td>
<a href="<c:url value="/updateSupplier${supplier.supplierId}"/>">Update</a>	
<a href="<c:url value="/deleteSupplier${supplier.supplierId}"/>">Delete</a>
			</td>
		</tr>

</c:forEach>
</table>
</div>
</div>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@attribute name="label" required="true" %>

<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-lg-9">
		<h2>${label}</h2>
		<ol class="breadcrumb">
			<c:forEach items="${breadcrumbTree.tree}" var="bread"
				varStatus="status">
				<c:choose>
					<c:when test="${!status.last}">
						<li><a href="${bread.url}">${bread.name}</a></li>
					</c:when>
					<c:otherwise>
						<li class="active"><strong>${label}</strong></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ol>
	</div>
</div>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
		

		<c:choose>
			<c:when test="${login.rol == 'alumno'}">
				<%@include file="alumnoMenu.jsp"%>
			</c:when>
			<c:when test="${login.rol == 'docente'}">
				<%@include file="docenteMenu.jsp"%>
			</c:when>
			<c:when test="${login.rol == 'administrador'}">
				<%@include file="adminMenu.jsp"%>
			</c:when>
		</c:choose>


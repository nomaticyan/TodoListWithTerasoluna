<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Todo List</title>
<!-- (1) -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/app/css/styles.css" type="text/css">
</head>
<body>
    <h1>Todo List</h1>
    <div id="todoForm">
            <!-- (1) -->
        <t:messagesPanel />
        <!-- (1) -->
        <form:form
           action="${pageContext.request.contextPath}/todo/create"
            method="post" modelAttribute="todoForm">
            <!-- (2) -->
            <form:input path="todoTitle" />
             <form:errors path="todoTitle" cssClass="text-error" /><!-- (2) -->
            <form:button>Create Todo</form:button>
        </form:form>
    </div>
    <hr />
    <div id="todoList">
        <ul>
            <!-- (3) -->
            <c:forEach items="${todos}" var="todo">
                <li><c:choose>
                        <c:when test="${todo.finished}"><!-- (4) -->
                            <span class="strike">
                            <!-- (5) -->
                            ${f:h(todo.todoTitle)}
                            </span>
                        </c:when>
                        <c:otherwise>
                            ${f:h(todo.todoTitle)}
                            <!-- (1) -->
                            <form:form
                                action="${pageContext.request.contextPath}/todo/finish"
                                method="post"
                                modelAttribute="todoForm"
                                cssStyle="display: inline-block;">
                                <!-- (2) -->
                                <form:hidden path="todoId"
                                    value="${f:h(todo.todoId)}" />
                                <form:button>Finish</form:button>
                            </form:form>
                         </c:otherwise>
                    </c:choose>
                    <!-- (1) -->
                    <form:form
                        action="${pageContext.request.contextPath}/todo/delete"
                        method="post" modelAttribute="todoForm"
                        cssStyle="display: inline-block;">
                        <!-- (2) -->
                        <form:hidden path="todoId"
                            value="${f:h(todo.todoId)}" />
                        <form:button>Delete</form:button>
                    </form:form></li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>
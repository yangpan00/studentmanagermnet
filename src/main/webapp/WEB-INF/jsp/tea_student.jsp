<%-- Created by IntelliJ IDEA. User: yangpan Date: 2023/6/15 Time: 14:09 To change this template use File | Settings |
  File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生管理</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <style>
        /* 全局样式 */
        * {
            padding: 0;
            margin: 0;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        h1,
        h2,
        h3 {
            color: #333;
        }

        h2 {
            margin: 19.92px 0;
        }

        h1 {
            margin: 21.44px 0;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        th {
            text-align: center;

        }

        /* 头部样式 */
        header {
            background-color: #f8f8f8;
            padding: 20px;
            text-align: center;
        }

        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        nav ul li {
            display: inline-block;
            margin-right: 10px;
        }

        nav ul li .box {
            display: flex;
            justify-content: center;
            align-items: center;
            width: fit-content;
            height: 30px;
            border-radius: 13px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        nav ul li .box:hover {
            background-color: #007bff;
        }

        nav ul li a {
            display: inline-block;
            padding: 10px;
            color: #333;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: #fff;
        }

        /* 内容样式 */
        main {
            flex: 1;
            padding: 20px;
        }

        .student-table {
            width: 100%;
            height: 50px;
            border-collapse: collapse;
            margin-bottom: 150px;
            text-align: center;
        }

        .student-table th,
        .student-table td {
            padding: 5px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .student-table th {
            background-color: #f8f8f8;
            font-weight: bold;
            text-align: center;
        }

        .edit-button,
        .delete-button {
            padding: 8px 12px;
            font-size: 14px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
            transition: transform 0.3s;
        }

        .edit-button:hover,
        .delete-button:hover {
            background-color: #0056b3;
            transform: scale(1.2);
        }

        /* 页脚样式 */
        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #f2f2f2;
            padding: 20px;
            box-sizing: border-box;
            text-align: center;
            font-size: 14px;
        }

        #box1 {
            background-color: #007bff
        }

        #box1 a {
            color: #fff;
        }

        .add-student-button {
            padding: 8px 12px;
            font-size: 14px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .add-student-button:hover {
            /* 设置鼠标悬停时的样式 */
            transform: scale(1.2);
            /* 缩放效果，可以根据需要调整缩放比例 */
        }

        .add-student-form {
            position: fixed;
            bottom: 45px;
            left: 0;
            width: 100%;
            background-color: #fff;
            padding: 20px;
            box-sizing: border-box;
            display: flex;
            justify-content: center;
            align-items: center;
        }


        .form-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .form-group {
            margin-right: 10px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-group button {
            background-color: #337ab7;
            color: #fff;
            border: none;
            padding: 5px 10px;
            font-size: 14px;
            cursor: pointer;
        }

        form {
            display: inline-block;
        }

        .search-input {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
            font-size: 14px;
            outline: none;
        }

        .search-input:hover {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .search-button {
            padding: 8px 12px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: transform 0.3s;
        }

        .search-button:hover {
            /* 设置鼠标悬停时的样式 */
            transform: scale(1.2);
            /* 缩放效果，可以根据需要调整缩放比例 */
        }

        .grade {
            justify-content: space-between;
            align-items: center;
            vertical-align: 3px;
            border: 1px solid #007bff;
            height: 30px;
            border-radius: 10px;
            outline: none;
            transition: transform 0.3s;


        }


        .grade:hover {
            transform: scale(1.2);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;

        }

        .left {
            display: flex;
            align-items: center;
        }

        .wenzi {
            display: inline-block;
            margin-right: 20px;
        }

        .search-box {
            display: flex;
            align-items: center;

        }

    </style>

<body>
<header>

    <h1>学生成绩管理系统</h1>
    <nav>
        <ul>

            <li>
                <div class="box" id="box1"><a href="/tea-student">学生管理</a></div>
            </li>
            <li>
                <div class="box"><a href="/tea-score">成绩管理</a></div>
            </li>
            <li>
                <div class="box"><a href="#">设置</a></div>
            </li>
            <li>
                <div class="box"><a href="/logout">退出</a></div>
            </li>
        </ul>
    </nav>
</header>
<main>

    <div class="content-header">
        <div class="left">
            <h2 class="wenzi">学生列表</h2>
            <form id="myForm" action="/tea-student" method="GET" >
                <select name="grade" class="grade"  onchange="submitForm()">
                    <option>请选择专业</option>
                    <option value="全部专业" <c:if test="${param.grade=='全部专业'}">selected</c:if>>全部专业
                    </option>
                    <option value="软件工程" <c:if test="${param.grade=='软件工程'}">selected</c:if>>软件工程
                    </option>
                    <option value="计算机科学与技术" <c:if test="${param.grade=='计算机科学与技术'}">selected</c:if>
                    >计算机科学与技术</option>
                    <option value="网络工程" <c:if test="${param.grade=='网络工程'}">selected</c:if>>网路工程
                    </option>
                    <option value="人工智能" <c:if test="${param.grade=='人工智能'}">selected</c:if>>人工智能
                    </option>
                    <option value="通信工程" <c:if test="${param.grade=='通信工程'}">selected</c:if>>通信工程
                    </option>
                </select>
            </form>
        </div>
        <form action="tea-student" method="post">
            <div class="search-box">
                <input type="text" name="studentName1" class="search-input" placeholder="搜索学生姓名" >
                <button class="search-button">搜索</button>
            </div>
        </form>

    </div>

    <script>
        function submitForm() {
            document.getElementById("myForm").submit();
        }
    </script>


    <table class="student-table">
        <thead>
        <tr>
            <th>学生学号</th>
            <th>学生名称</th>
            <th>所在专业班级</th>
            <th>JAVAEE</th>
            <th>响应式WEB开发</th>
            <th>数据库原理</th>
            <th>软工导论</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%--@elvariable id="studentlist" type="java.util.List<studentmanagermnet.model.AdStudent>"--%>
        <c:forEach items="${studentlist}" var="student">
            <tr>
                <td><span id="studentId-${student.id}">${student.studentId}</span></td>

                <td><span id="studentName-${student.id}">${student.studentName}</span></td>

                <td><span id="stuGrade-${student.id}">${student.stuGrade}</span></td>

                <td><span id="javaee-${student.id}">${student.javaee}</span></td>

                <td><span id="web-${student.id}">${student.web}</span></td>

                <td><span id="mysql-${student.id}">${student.mysql}</span></td>

                <td><span id="soft-${student.id}">${student.soft}</span></td>

                <td>
                    <button class="edit-button" onclick="editStudent(${student.id})"
                            style="display: inline-block">编辑</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</main>
<footer>
    版权信息 &copy; 小样肖恩2023
</footer>
</body>
<script>
    let msg = '${msg}'
    if (msg.length) {
        $.messager.alert("消息提醒", msg, "warning ");
    }
</script>

<script>
    function editStudent(id) {
        var javaeeElement = document.getElementById("javaee-" + id);
        var webElement = document.getElementById("web-" + id);
        var mysqlElement = document.getElementById("mysql-" + id);
        var softElement = document.getElementById("soft-" + id);

        var javaee = javaeeElement.innerText;
        var web = webElement.innerText;
        var mysql = mysqlElement.innerText;
        var soft = softElement.innerText;

        var javaeeInput = document.createElement("input");
        javaeeInput.type = "text";
        javaeeInput.value = javaee;

        var webInput = document.createElement("input");
        webInput.type = "text";
        webInput.value = web;

        var mysqlInput = document.createElement("input");
        mysqlInput.type = "text";
        mysqlInput.value = mysql;

        var softInput = document.createElement("input");
        softInput.type = "text";
        softInput.value = soft;

        javaeeElement.innerHTML = "";
        webElement.innerHTML = "";
        mysqlElement.innerHTML = "";
        softElement.innerHTML = "";

        javaeeElement.appendChild(javaeeInput);
        webElement.appendChild(webInput);
        mysqlElement.appendChild(mysqlInput);
        softElement.appendChild(softInput);

        javaeeInput.focus();

        javaeeInput.addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
                event.preventDefault();
                submitEdit(id);
            }
        });

        webInput.addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
                event.preventDefault();
                submitEdit(id);
            }
        });

        mysqlInput.addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
                event.preventDefault();
                submitEdit(id);
            }
        });

        softInput.addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
                event.preventDefault();
                submitEdit(id);
            }
        });
    }

    function submitEdit(id) {
        var javaeeInput = document.querySelector("#javaee-" + id + " input");
        var webInput = document.querySelector("#web-" + id + " input");
        var mysqlInput = document.querySelector("#mysql-" + id + " input");
        var softInput = document.querySelector("#soft-" + id + " input");

        var javaee = javaeeInput.value;
        var web = webInput.value;
        var mysql = mysqlInput.value;
        var soft = softInput.value;

        var data = new FormData();
        data.append("id", id);
        data.append("javaee", javaee);
        data.append("web", web);
        data.append("mysql", mysql);
        data.append("soft", soft);

        fetch("/tea-student?act=edit", {
            method: 'post',
            body: data,
        }).then(resp => resp.text()).then(resp => {
            console.log(resp);
        });

        // 提交后，将输入框的值显示回去
        var javaeeElement = document.getElementById("javaee-" + id);
        var webElement = document.getElementById("web-" + id);
        var mysqlElement = document.getElementById("mysql-" + id);
        var softElement = document.getElementById("soft-" + id);


        //创建新的<span>元素来显示编辑后的值
        var newjavaeeElement = document.createElement("span");
        newjavaeeElement.id = "javaee-" + id;
        newjavaeeElement.textContent = javaee;

        var newwebElement = document.createElement("span");
        newwebElement.id = "web-" + id;
        newwebElement.textContent = web;

        var newmysqlElement = document.createElement("span");
        newmysqlElement.id = "mysql-" + id;
        newmysqlElement.textContent = mysql;

        var newsoftElement = document.createElement("span");
        newsoftElement.id = "soft-" + id;
        newsoftElement.textContent = soft;

        javaeeElement.parentNode.replaceChild(newjavaeeElement, javaeeElement);
        webElement.parentNode.replaceChild(newwebElement, webElement);
        mysqlElement.parentNode.replaceChild(newmysqlElement, mysqlElement);
        softElement.parentNode.replaceChild(newsoftElement, softElement);

        $.messager.alert("消息提醒", "编辑成功", "warning");
    }
</script>
<script>
    window.onload = function() {
        var trs = document.querySelectorAll("tr");
        var prevTr = null;

        for (var i = 0; i < trs.length; i++) {
            trs[i].addEventListener("click", function() {
                if (prevTr !== null) {
                    prevTr.style.backgroundColor = "";
                    var prevTds = prevTr.querySelectorAll("td");
                    for (var j = 0; j < prevTds.length; j++) {
                        prevTds[j].style.backgroundColor = "";
                    }
                }

                this.style.backgroundColor = " #f2f2f2";
                var tds = this.querySelectorAll("td");
                for (var j = 0; j < tds.length; j++) {
                    tds[j].style.backgroundColor = " #f2f2f2";
                }

                prevTr = this;
            });
        }
    };
</script>


</html>
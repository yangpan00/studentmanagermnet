<%--
  Created by IntelliJ IDEA.
  User: yangpan
  Date: 2023/6/15
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>课程管理</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <style>
        /* 全局样式 */

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

        a {
            color: #007bff;
            text-decoration: none;
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
            overflow: auto;
            /* 添加滚动条 */
            height: 100vh;
            /* 设置固定高度，使其可以滚动 */
        }

        .student-table {
            width: 100%;
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


        .add-course-form {
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

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .search-box {
            display: flex;
            align-items: center;
        }

        .search-input {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
            font-size: 14px;
            outline: none;
        }
        .search-input:hover{
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

    </style>

<body>
<header>

    <h1>学生成绩管理系统</h1>
    <nav>
        <ul>
            <li>
                <div class="box"><a href="/admin-teacher">教师管理</a></div>
            </li>
            <li>
                <div class="box"><a href="/admin-student">学生管理</a></div>
            </li>
            <li>
                <div class="box" id="box1"><a href="/course">课程管理</a></div>
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
        <h2>课程列表</h2>
        <form action="course" method="get">
            <div class="search-box">
                <input type="text"  class="search-input" name="courseName1" placeholder="搜索课程">
                <button class="search-button">搜索</button>
            </div>
        </form>
    </div>

    <table class="student-table">
        <thead>
        <tr>
            <th>课程名称</th>
            <th>授课老师</th>
            <th>上课班级</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${courselist}" var="course">
            <tr>
                <td><span id="courseName-${course.getId()}">${course.getCourseName()}</span></td>
                <td><span id="teacher-${course.getId()}">${course.getTeacher()}</span></td>
                <td><span id="grade-${course.getId()}">${course.getGrade()}</span></td>
                <td>
                    <button class="edit-button" onclick="editCourse(${course.getId()})"
                            style="display: inline-block">编辑</button>
                    <form action="/course" method="post" style="display: inline-block">
                        <input type="hidden" name="courseId" value="${course.getId()}" style="display:none">
                        <input type="hidden" name="act" value="delete" style="display:none">
                        <button class="delete-button" style="display: block">删除</button>
                    </form>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

</main>
<div class="add-course-form">
    <form id="addform" action="/course" method="post">
        <div class="form-row">
            <div class="form-group">
                <label for="course-name">课程名称:
                    <input type="text" id="course-name" name="courseName" required>
                </label>

            </div>

            <div class="form-group">
                <label for="teacher">授课老师:
                    <input type="text" id="teacher" name="teacher" required>
                </label>
            </div>

            <div class="form-group">
                <label for="class">上课班级:
                    <input type="text" id="class" name="grade" required></label>
            </div>
            <button class="add-student-button" name="act" value="add">添加课程</button>

        </div>
    </form>
</div>
<footer>
    版权信息 &copy; 小样肖恩2023
</footer>
<script>
    let msg = '${msg}'
    if (msg.length) {
        $.messager.alert("消息提醒", msg, "warning ");
    }
</script>

<script>
    function editCourse(courseId) {
        var courseNameElement = document.getElementById("courseName-" + courseId);
        var teacherElement = document.getElementById("teacher-" + courseId);
        var gradeElement = document.getElementById("grade-" + courseId);

        var courseName = courseNameElement.innerText;
        var teacher = teacherElement.innerText;
        var grade = gradeElement.innerText;

        var courseNameInput = document.createElement("input");
        courseNameInput.type = "text";
        courseNameInput.value = courseName;

        var teacherInput = document.createElement("input");
        teacherInput.type = "text";
        teacherInput.value = teacher;

        var gradeInput = document.createElement("input");
        gradeInput.type = "text";
        gradeInput.value = grade;

        courseNameElement.innerHTML = "";
        teacherElement.innerHTML = "";
        gradeElement.innerHTML = "";

        courseNameElement.appendChild(courseNameInput);
        teacherElement.appendChild(teacherInput);
        gradeElement.appendChild(gradeInput);

        courseNameInput.focus();

        courseNameInput.addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
                event.preventDefault();
                submitEdit(courseId);
            }
        });

        teacherInput.addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
                event.preventDefault();
                submitEdit(courseId);
            }
        });

        gradeInput.addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
                event.preventDefault();
                submitEdit(courseId);
            }
        });
    }

    function submitEdit(courseId) {
        var courseNameInput = document.querySelector("#courseName-" + courseId + " input");
        var teacherInput = document.querySelector("#teacher-" + courseId + " input");
        var gradeInput = document.querySelector("#grade-" + courseId + " input");

        var courseName = courseNameInput.value;
        var teacher = teacherInput.value;
        var grade = gradeInput.value;


        var data = new FormData();
        data.append("courseId", courseId);
        data.append("courseName", courseName);
        data.append("teacher", teacher);
        data.append("grade", grade);
        fetch("/course?act=edit", {
            method: 'post',
            body: data,
        }).then(resp => resp.text()).then(resp => {
            console.log(resp);
        })


        // 提交后，将输入框的值显示回去
        var courseNameElement = document.getElementById("courseName-" + courseId);
        var teacherElement = document.getElementById("teacher-" + courseId);
        var gradeElement = document.getElementById("grade-" + courseId);


        // 创建新的<span>元素来显示编辑后的值
        var newCourseNameElement = document.createElement("span");
        newCourseNameElement.id = "courseName-" + courseId;
        newCourseNameElement.textContent = courseName;

        var newTeacherElement = document.createElement("span");
        newTeacherElement.id = "teacher-" + courseId;
        newTeacherElement.textContent = teacher;

        var newGradeElement = document.createElement("span");
        newGradeElement.id = "grade-" + courseId;
        newGradeElement.textContent = grade;

        // 替换输入框元素
        courseNameElement.parentNode.replaceChild(newCourseNameElement, courseNameElement);
        teacherElement.parentNode.replaceChild(newTeacherElement, teacherElement);
        gradeElement.parentNode.replaceChild(newGradeElement, gradeElement);
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

                this.style.backgroundColor = "#f2f2f2";
                var tds = this.querySelectorAll("td");
                for (var j = 0; j < tds.length; j++) {
                    tds[j].style.backgroundColor = "#f2f2f2";
                }

                prevTr = this;
            });
        }
    };
</script>
</body>

</html>
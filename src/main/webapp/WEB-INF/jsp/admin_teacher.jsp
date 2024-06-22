<%-- Created by IntelliJ IDEA. User: yangpan Date: 2023/6/15 Time: 14:09 To change this template use File | Settings |
  File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>教师管理</title>
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

    .add-teacher-form {
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
    .left{
      display: flex;
      align-items: center;
    }
    .list{
      display: inline-block;
      margin-right: 20px;
    }
  </style>

<body>
<header>

  <h1>学生成绩管理系统</h1>
  <nav>
    <ul>
      <li>
        <div class="box" id="box1"><a href="#">教师管理</a></div>
      </li>
      <li>
        <div class="box"><a href="/admin-student">学生管理</a></div>
      </li>
      <li>
        <div class="box"><a href="/course">课程管理</a></div>
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
      <h2 class="list">教师列表</h2>
      <form id="importForm" action="/admin-teacher?act=import" method="post" enctype="multipart/form-data">
        <input type="file" id="file" name="file" hidden>
        <button  type="button" class="search-button"  onclick="document.getElementById('file').click()">导入</button>
      </form>

      <script>
        document.getElementById('file').addEventListener('change', function() {
          document.getElementById('importForm').submit();
        });
      </script>

    </div>

   <form action="/admin-teacher" method="get">
      <div class="search-box">
        <input type="text" name="teacherName1" class="search-input" placeholder="搜索教师姓名">
        <button class="search-button">搜索</button>
      </div>
    </form>
  </div>

  <table class="student-table">
    <thead>
    <tr>
      <th>教师编号</th>
      <th>教师名称</th>
      <th>联系电话</th>
      <th>登录密码</th>
      <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${teacherlist}" var="teacher">
      <tr>
        <td><span id="teacherId-${teacher.getId()}">${teacher.getTeacherId()}</span></td>
        <td><span id="teacherName-${teacher.getId()}">${teacher.getTeacherName()}</span></td>
        <td><span id="phone-${teacher.getId()}">${teacher.getPhone()}</span></td>
        <td><span id="psd-${teacher.getId()}">${teacher.getPsd()}</span></td>
        <td>
          <button class="edit-button" onclick="editTeacher(${teacher.getId()})"
                  style="display: inline-block">编辑</button>
          <form action="/admin-teacher" method="post" style="display: inline-block">
            <input type="hidden" name="id" value="${teacher.getId()}" style="display:none">
            <input type="hidden" name="act" value="delete" style="display:none">
            <button class="delete-button" style="display: block">删除</button>
          </form>
        </td>
      </tr>
    </c:forEach>

    </tbody>
  </table>
  <div class="add-teacher-form">
    <form id="addform" action="/admin-teacher" method="post">
      <div class="form-row">
        <div class="form-group">
          <label for="teacher-Id">教师编号:
            <input type="text" id="teacher-Id" name="teacherId" required>
          </label>

        </div>

        <div class="form-group">
          <label for="teacher-Name">教师名称:
            <input type="text" id="teacher-Name" name="teacherName" required>
          </label>
        </div>

        <div class="form-group">
          <label for="phone">联系电话:
            <input type="text" id="phone" name="phone" required></label>
        </div>

        <div class="form-group">
          <label for="psd">登录密码:
            <input type="text" id="psd" name="psd" required></label>
        </div>
        <button class="add-student-button" name="act" value="add">添加教师</button>
      </div>
    </form>
  </div>
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
  function editTeacher(id) {
    var teacherIdElement = document.getElementById("teacherId-" + id);
    var teacherNameElement = document.getElementById("teacherName-" + id);
    var phoneElement = document.getElementById("phone-" + id);
    var psdElement = document.getElementById("psd-" + id);

    var TeacherId = teacherIdElement.innerText;
    var teacherName = teacherNameElement.innerText;
    var phone = phoneElement.innerText;
    var psd = psdElement.innerText;

    var teacherIdInput = document.createElement("input");
    teacherIdInput.type = "text";
    teacherIdInput.value = TeacherId;

    var teacherNameInput = document.createElement("input");
    teacherNameInput.type = "text";
    teacherNameInput.value = teacherName;

    var phoneInput = document.createElement("input");
    phoneInput.type = "text";
    phoneInput.value = phone;

    var psdInput = document.createElement("input");
    psdInput.type = "text";
    psdInput.value = psd;

    teacherIdElement.innerHTML = "";
    teacherNameElement.innerHTML = "";
    phoneElement.innerHTML = "";
    psdElement.innerHTML = "";

    teacherIdElement.appendChild(teacherIdInput);
    teacherNameElement.appendChild(teacherNameInput);
    phoneElement.appendChild(phoneInput);
    psdElement.appendChild(psdInput);

    teacherIdInput.focus();

    teacherIdInput.addEventListener("keydown", function (event) {
      if (event.key === "Enter") {
        event.preventDefault();
        submitEdit(id);
      }
    });

    teacherNameInput.addEventListener("keydown", function (event) {
      if (event.key === "Enter") {
        event.preventDefault();
        submitEdit(id);
      }
    });

    phoneInput.addEventListener("keydown", function (event) {
      if (event.key === "Enter") {
        event.preventDefault();
        submitEdit(id);
      }
    });

    psdInput.addEventListener("keydown", function (event) {
      if (event.key === "Enter") {
        event.preventDefault();
        submitEdit(id);
      }
    });
  }

  function submitEdit(id) {
    var teacherIdInput = document.querySelector("#teacherId-" + id + " input");
    var teacherNameInput = document.querySelector("#teacherName-" + id + " input");
    var phoneInput = document.querySelector("#phone-" + id + " input");
    var psdInput = document.querySelector("#psd-" + id + " input");

    var teacherId = teacherIdInput.value;
    var teacherName = teacherNameInput.value;
    var phone = phoneInput.value;
    var psd = psdInput.value;

    var data = new FormData();
    data.append("id", id);
    data.append("teacherId", teacherId);
    data.append("teacherName", teacherName);
    data.append("phone", phone);
    data.append("psd", psd);

    fetch("/admin-teacher?act=edit", {
      method: 'post',
      body: data,
    }).then(resp => resp.text()).then(resp => {
      console.log(resp);
    });

    // 提交后，将输入框的值显示回去
    var teacherIdElement = document.getElementById("teacherId-" + id);
    var teacherNameElement = document.getElementById("teacherName-" + id);
    var phoneElement = document.getElementById("phone-" + id);
    var psdElement = document.getElementById("psd-" + id);


    //创建新的<span>元素来显示编辑后的值
    var newTeacherIdElement = document.createElement("span");
    newTeacherIdElement.id = "teacherId-" + id;
    newTeacherIdElement.textContent = teacherId;

    var newTeacherNameElement = document.createElement("span");
    newTeacherNameElement.id = "teacherName-" + id;
    newTeacherNameElement.textContent = teacherName;

    var newPhoneElement = document.createElement("span");
    newPhoneElement.id = "phone-" + id;
    newPhoneElement.textContent = phone;

    var newPsdElement = document.createElement("span");
    newPsdElement.id = "psd-" + id;
    newPsdElement.textContent = psd;

    teacherIdElement.parentNode.replaceChild(newTeacherIdElement, teacherIdElement);
    teacherNameElement.parentNode.replaceChild(newTeacherNameElement, teacherNameElement);
    phoneElement.parentNode.replaceChild(newPhoneElement, phoneElement);
    psdElement.parentNode.replaceChild(newPsdElement, psdElement);

    $.messager.alert("消息提醒", "编辑成功", "warning");
  }
</script>
<script>
  window.onload = function () {
    var trs = document.querySelectorAll("tr");
    var prevTr = null;

    for (var i = 0; i < trs.length; i++) {
      trs[i].addEventListener("click", function () {
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
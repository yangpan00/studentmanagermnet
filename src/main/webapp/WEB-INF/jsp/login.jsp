<%--
  Created by IntelliJ IDEA.
  User: yangpan
  Date: 2023/6/14
  Time: 09:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
        }


        h2 {
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .submit {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .checkBox {
            /* width: 80px; */
            height: 30px;
            font-size: 20px;
            /* display: inline-block; */
            letter-spacing: 3px;
            border: 0px solid #ccc;
            /* 其他样式 */
            background: linear-gradient(to right, red, orange, green, blue, violet);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            /* 其他样式 */
            margin-bottom: 5px;

        }

        .box {
            position: relative;
            margin: auto;
            display: flex;
            margin-top: calc(50vh - 240px);
            /* margin-top: 100px; */
            background-color: rgb(47, 109, 233);
            width: 800px;
            height: 480px;
            border-radius: 5px;
            transition: transform 0.3s;


        }

        .container {
            position: absolute;
            left: 490px;
            top: 10px;
            width: 300px;
            margin: 0 auto;

            background-color: #f1f1f1;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.9);
        }

        .box:hover {
            box-shadow: 0 0 10px rgba(0, 0, 0, 2.9);
            transform: scale(1.1);

        }

        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }

            to {
                transform: rotate(360deg);
            }
        }

        .img {
            width: 300px;
            height: 300px;
            margin-right: 20px;
        }
        .box:hover .img{
            animation: rotate 3s linear 3;
        }
    </style>

</head>

<body>
<div class="box">
    <div style="display: flex; margin: 100px;">
        <img src="/图层1.png" alt="Image" class="img" style="border-radius: 50%">
    </div>
    <div class="container">
        <h2>用户登录</h2>
        <form action="login" method="POST">
            <label for="username">用户名:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required>

            <label for="role">角色:</label>
            <select id="role" name="role">
                <option value="1">老师</option>
                <option value="2">管理员</option>
            </select>

            <label class="check" for="check" style="display: inline;">验证码:</label>
            <button class="checkBox" type="button" onclick="change()">xxxx</button>

            <input id="checkFlag" name="checkFlag" type="hidden" value="0">
            <input style="margin-bottom: 20px;" id="check" type="text" value="">

            <input class="submit" type="button" value="登录" onclick="validateCaptcha()">
        </form>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.addEventListener("keydown", function (event) {
            event = event || window.event;
            if (event.key === "Enter" || event.keyCode === 13) {
                var loginButton = document.querySelector(".submit");
                loginButton.click();
            }
        });
    });
</script>


<script>
    var checkRandom = document.querySelector('.checkBox')
    var checkInput = document.querySelector('#check')

    function generateRandomCode() {
        var codeLength = 4; // 验证码长度
        var codeChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"; // 验证码字符集

        var code = "";
        for (var i = 0; i < codeLength; i++) {
            var charIndex = Math.floor(Math.random() * codeChars.length);
            var char = codeChars.charAt(charIndex);
            code += char;
        }

        return code;
    }
    var generatedCode = generateRandomCode();

    checkRandom.textContent = generatedCode

    function change() {
        generatedCode = generateRandomCode();
        checkRandom.textContent = generatedCode;
        // console.log(generatedCode)
    }

    // console.log(generatedCode);
    // 验证输入与生成验证码是否相同
    var checkFlag = document.querySelector('#checkFlag');
    function validateCaptcha() {
        // console.log('login')
        // console.log(checkInput.value)
        if (checkInput.value == generatedCode) {
            checkFlag.value = 1;
            checkFlag.textContent = checkFlag.value;
            console.log(checkFlag.value)

        } else {
            checkFlag.value = 0;
            checkFlag.textContent = checkFlag.value;
            console.log(checkFlag.value)
        }
        var data = $("form").serialize();
        $.ajax({
            type: "post",
            url: "/login",
            data,
            dataType: "json",
            success: function (msg) {
                if (msg.status == 200) {
                    //登录成功
                    if (document.getElementById("role").value == 1) {
                        window.location.href = "/tea-student";
                    } else {
                        window.location.href = "/admin-teacher";
                    }
                }
                else {
                    $.messager.alert('消息提醒', msg.msg, "warning");

                }
            }
        })
    }

</script>

</body>


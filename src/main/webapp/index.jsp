<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<style>


    body {
        background: #eee !important;
    }

    .wrapper {
        margin-top: 80px;
        margin-bottom: 80px;
    }

    .form-signin {
        max-width: 255px;
        padding: 15px 35px 45px;
        margin: 100px auto;
        background-color: #fff;
        border: 1px solid rgba(0,0,0,0.1);}




    * {
        box-sizing: border-box;
    }

    input {
        width: 180px;
        height: 35px;
        box-sizing: border-box;
        border: 2px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
        background-color: white;
        background-position: 10px 10px;
        background-repeat: no-repeat;
        padding: 12px 20px 12px 40px;
        -webkit-transition: width 0.4s ease-in-out; /*safari icin*/
        transition: width 0.4s ease-in-out;
    }

    .button {
        background-color: #002147; /* Green */
        border: none;
        color: white;
        padding: 8px 20px;
        text-align: center;
        border-radius: 4px;
        text-decoration: none;
        display: inline-block;
        font-size: 12px;
        margin: 4px 2px;
        cursor: pointer;
        -webkit-transition-duration: 0.4s;
        transition-duration: 0.4s;
    }

    .button2:hover {
        box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
    }










</style>

<div class="wrapper">
<form action="/getUser" method="post" class="form-signin" >
    <aside>
    <h2>GİRİŞ YAPIN</h2>
    </aside>
    <input type="text" name="uname" placeholder="Kullanıcı adı">
    <input type="password" name="pass" placeholder="Şifre">
    <input type="submit" class="button button2" value="GİRİŞ YAP">
</form>
</div>
</body>
</html>


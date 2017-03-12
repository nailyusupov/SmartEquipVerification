<%-- 
    Document   : index
    Created on : Mar 12, 2017, 2:02:06 PM
    Author     : nyusu131
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SmartEquip Verify</title>
    </head>
    <body>
        <form method="POST" action="${pageContext.request.contextPath}/verify">
        <fieldset style="width: 350px;">
            <legend>Verify:</legend>
            <input id="question" style="background: rgba(0,0,0,0); border: none; width: 100%; font-size: 12pt;" disabled>
            <label for="answer" style="font-size: 12pt; color: #7e7e7e;">Your answer:</label>
            <input name="answer" style="width: 50px;">
            <input type="submit">
        </fieldset>
        <input type="hidden" name="question" id="question-hidden">
        <input type="hidden" name="signature" id="signature">
        </form>
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/generate",
                    dataType: "json",
                    success: function (data) {
                        $("#signature").val(data.signature);
                        $("#question").val(data.question);
                        $("#question-hidden").val(data.question);
                    }
                });
            });
        </script>
    </body>
</html>

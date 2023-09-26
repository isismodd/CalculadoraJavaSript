<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Calculadora</h1>
    <form method="post" action="calculadora.jsp">
        Valor 1: <input type="text" name="valor1"><br>
        Valor 2: <input type="text" name="valor2"><br>
        Operação:
        <select name="operacao">
            <option value="soma">Soma (+)</option>
            <option value="subtracao">Subtração (-)</option>
            <option value="multiplicacao">Multiplicação (*)</option>
            <option value="divisao">Divisão (/)</option>
        </select><br>
        <input type="submit" value="Calcular">
    </form>
    
    <%
    try{
    String valor1Str = request.getParameter("valor1");
    String valor2Str = request.getParameter("valor2");
    String operacao = request.getParameter("operacao");
    
    if (valor1Str != null && valor2Str != null) {
        double valor1 = Double.parseDouble(valor1Str);
        double valor2 = Double.parseDouble(valor2Str);
        double resultado = 0;
        
        if (operacao.equals("soma")) {
            resultado = valor1 + valor2;
        } else if (operacao.equals("subtracao")) {
            resultado = valor1 - valor2;
        } else if (operacao.equals("multiplicacao")) {
            resultado = valor1 * valor2;
        } else if (operacao.equals("divisao")) {
            if (valor2 != 0) {
                resultado = valor1 / valor2;
            } else {
                out.println("Erro: Divisão por zero não é permitida.");
            }
        } 
        out.println("Resultado: " + resultado);
    }
    } catch (NumberFormatException e) {
        out.println("Erro: Valores inválidos. Certifique-se de inserir apenas números.");
    } 
    %>
</body>
</html>
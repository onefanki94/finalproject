<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>

<div class="chart">
        <div class="haruDailyChart">차트영역
            <canvas id="haruDailyChartView"></canvas>
        </div>
        <div class="monthDailyChart">차트영역
            <canvas id="monthDailyChartView"></canvas>
        </div>
        </div>
</body>
</html>
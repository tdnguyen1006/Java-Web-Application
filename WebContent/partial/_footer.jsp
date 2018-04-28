<div class="container-fluid">
	<hr>
	<div class="container footer">
		<div class="col-sm-4"></div>
		<div class="col-sm-4"></div>
		<div class="col-sm-4"></div>
		<p>&copy; 2017</p>
	</div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap-3.3.7/js/bootstrap.js"></script>
<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/script.js"></script>

<script>
    $(document).ready(function(){
      var date_input=$('input[name="date"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'dd/mm/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
</script>
</body>
</html>

function refreshCode() {
	$.ajax({
		url: getCaptchaUrl,
		type: 'POST',
		success: function(newImgSrc) {
			var resultArray = newImgSrc.split("|");
			$(".refreshCode").attr("src", resultArray[0]);
			$("#reg-ver-cd-1").val(resultArray[1]);
		}
	});
}
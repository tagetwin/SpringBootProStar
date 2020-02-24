/*

 *  Cross Site Request Forgery (CSRF)

 *  protected CSRF for ajax Jquery

 */

(function($) {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$.ajaxSetup({
       beforeSend: function(xhr) {
	   xhr.setRequestHeader(header, token);
          }
    });
})(jQuery);

//logout
function logout(){
	$('#logout_Form').submit();
	alert('로그아웃되었습니다.');
}
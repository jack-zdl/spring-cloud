$(function(){
	$('.login_wrap').css({'width':$(window).width(),'height':$(window).height()});
$('.bottom_color').css('bottom',($(window).height()-550)/2);
$(window).resize(function(){
    $('.login_wrap').css({'width':$(window).width(),'height':$(window).height()});
    $('.bottom_color').css('bottom',($(window).height()-550)/2);
});
	
});


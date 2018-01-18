$(function(){
    $('.body_wrap').outerHeight($(window).height()-$('nav').outerHeight());
    $('.tab_way li').bind('click',function(){
        $('.tab_way li').removeClass('active');
        $(this).addClass('active');
        if($(this).index() == 0){
            $('.tab_one').show();
            $('.tab_two').hide();
        }else{
            $('.tab_one').hide();
            $('.tab_two').show();
        }
    })
})

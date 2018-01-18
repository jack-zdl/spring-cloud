$(function () {
    $('.card_wrap').bind('mouseenter',function () {
        $(this).find('.fa').show();
    }).bind('mouseleave',function () {
        $(this).find('.fa').hide();
    })
})

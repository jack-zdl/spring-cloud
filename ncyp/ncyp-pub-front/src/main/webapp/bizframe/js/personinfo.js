$(function () {

    //头部点击出现操作菜单
    $('.user_info .fa-caret-square-o-down,.operate_btn .person_center span,.operate_btn .fa-commenting-o').bind('click', function (ev) {
        var ev = ev || window.event;
        $('i.fa-caret-up').hide();
        $('.btn_list').hide();
        $(this).parent('li,div').find('i.fa-caret-up').show();
        $(this).parent('li,div').find('.btn_list').show();
        ev.stopPropagation();
    })
    $('.user_info .btn_list,.operate_btn .btn_list').bind('mouseleave', function () {
        $(this).hide();
        $(this).parent('li,div').find('i.fa-caret-up').hide();
    })
    $('body').bind('click', function () {
        $('i.fa-caret-up').hide();
        $('.btn_list').hide();
    })
    $('.user_name').outerHeight($(window).outerHeight() - $('.top_block').outerHeight() - 10);
    $('.detail_info').outerWidth($(window).outerWidth() - $('.user_name').outerWidth() - 15)
    $('.window_mask').css({'height': $(window).height(), 'width': $(window).width()});
    $('body,.main-container').css({'width': $(window).width(), 'overflow': 'auto'});
    /*点击修改信息*/
    $('.name_wrap .edit span').bind('click', function () {
        var val = $(this).parent().parent('li').children('div').eq(1).html();
        val = $.trim(val);
        /*保存当前用户名*/
        $("#oldUserName").val(val);
        $(this).parent().parent('li').children('div').eq(1).html('<input id="username" name="username" value="' + val + '" />');
        $(this).hide();
        $(this).siblings('button').show();
    })
    $('.rate_wrap .edit span').bind('click', function () {
        var val = $(this).parent().parent('li').children('div').eq(1).html();
        val = $.trim(val);
        /*保存当前用户名*/
        $("#oldRate").val(val);
        $(this).parent().parent('li').children('div').eq(1).html('<input id="rate" name="rate" value="' + val + '" />');
        $(this).hide();
        $(this).siblings('button').show();
    })

    $('.security_wrap .edit span').bind('click', function () {
        var val = $(this).parent().parent('li').children('div').eq(1).html();
        val = $.trim(val);
        $("#oldSecurity").val(val);
        if (val == "明码") val = "1";
        else if (val == "局部保密") val = "2";
        else if (val == "全部保密") val = "3";
        $(this).parent().parent('li').children('div').eq(1).html('<input type="radio" name="security" value="1" checked="checked"/> 明码 <input type="radio" name="security" value="2"/> 局部保密 <input type="radio" name="security" value="3"/> 全部保密');
        $(this).hide();
        $(":radio[name='security'][value='" + val + "']").prop("checked", "checked");
        $(this).siblings('button').show();
    })
    $('.template_wrap .edit span').bind('click', function () {
        var val = $(this).parent().parent('li').children('div').eq(1).html();
        val = $.trim(val);
        $("#oldTemplate").val(val);
        if (val == "基准上浮") val = "1";
        else if (val == "实际利率") val = "2";
        else if (val == "月息") val = "3";
        $(this).parent().parent('li').children('div').eq(1).html('<input type="radio" name="template" value="1"/> 基准上浮 <input type="radio" name="template" value="2"/> 实际利率 <input type="radio" name="template" value="3"/> 月息');
        $(this).hide();
        $(":radio[name='template'][value='" + val + "']").prop("checked", "checked");
        $(this).siblings('button').show();
    })
    $('.sex_wrap .edit span').bind('click', function () {
        var val = $(this).parent().parent('li').children('div').eq(1).html();
        val = $.trim(val);
        $(this).parent().parent('li').children('div').eq(1).html('<select><option value="男">男</option><option value="女">女</option></select>');
        $(this).hide();
        $(this).siblings('button').show();
    })
    $('.tel_wrap .edit span').bind('click', function () {
        $('.edit_tel').css({
            'top': ($(window).outerHeight() - $('.edit_tel').outerHeight()) / 4,
            'left': ($(window).width() - $('.edit_tel').outerWidth()) / 2
        });
        $('#mobile').val('');
        $('#verifycode').val('');
        $('.window_mask').show();
        $('.edit_tel').show();
    })
    $('.password_wrap .edit span').bind('click', function () {
        $('.edit_password').css({
            'top': ($(window).outerHeight() - $('.edit_password').outerHeight()) / 2,
            'left': ($(window).width() - $('.edit_password').outerWidth()) / 2
        })
        $('#oldPwd').val('');
        $('#newPwd').val('');
        $('#rptPwd').val('');
        $("#rptPwdMsg").addClass('hidden');
        $('.window_mask').show();
        $('.edit_password').show();
    })
    /*取消修改信息*/
    $('.name_wrap  button.btn-default').bind('click', function () {
        var val = $(this).parent().parent('li').children('div').eq(1).find('input').val();
        $(this).parent().parent('li').children('div').eq(1).html(val);
        $(this).hide();
        $(this).siblings('button').hide();
        $(this).siblings('span').show();
    })
    $('.rate_wrap  button.btn-default').bind('click', function () {
        var val = $(this).parent().parent('li').children('div').eq(1).find('input').val();
        $(this).parent().parent('li').children('div').eq(1).html(val);
        $(this).hide();
        $(this).siblings('button').hide();
        $(this).siblings('span').show();
    })
    $('.sex_wrap  button.btn-default').bind('click', function () {
        var val = $(this).parent().parent('li').children('div').eq(1).find('select').val();
        $(this).parent().parent('li').children('div').eq(1).html(val);
        $(this).hide();
        $(this).siblings('button').hide();
        $(this).siblings('span').show();
    })
    $('.security_wrap  button.btn-default').bind('click', function () {
        var val = $(this).parent().parent('li').children('div').eq(1).find('select').val();
        $(this).parent().parent('li').children('div').eq(1).html(val);
        $(this).hide();
        $(this).siblings('button').hide();
        $(this).siblings('span').show();
    })
    $('.template_wrap  button.btn-default').bind('click', function () {
        var val = $(this).parent().parent('li').children('div').eq(1).find('select').val();
        $(this).parent().parent('li').children('div').eq(1).html(val);
        $(this).hide();
        $(this).siblings('button').hide();
        $(this).siblings('span').show();
    })
    $('.edit_tel p i').bind('click', function () {
        $('.window_mask').hide();
        $('.edit_tel').hide();
    })
    $('.edit_password p i').bind('click', function () {
        $('.window_mask').hide();
        $('.edit_password').hide();
    })
})

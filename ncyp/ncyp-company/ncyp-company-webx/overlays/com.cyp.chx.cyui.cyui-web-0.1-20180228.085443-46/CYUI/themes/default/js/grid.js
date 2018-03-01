/**
 * Created by H on 2016/11/24.
 */
$(function(){
    //样式js
    //$('.page-content').height($(window).height()-$('.grid_operate').outerHeight()-40);
    //遮罩和高级搜索框
    $('.win_mask').css({'width':$(window).outerWidth(),'height':$(window).outerHeight()});
    $('.win_search').css({'top':($(window).outerHeight()-400)/2,'left':($(window).outerWidth()-750)/2});

    //弹出关闭高级搜索框
    $('.super_search').bind('click',function(){
        $('.win_search').fadeIn();
        $('.win_mask').show();
    })
    $('.close_win').bind('click',function(){
        closeSearch();
    })
    //新增的iframe
    //$('.win_add').css({'height':$(window).height()});
    //取得项目的头部地址
    function getRootPath_web() {
        //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
        var curWwwPath = window.document.location.href;
        //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        //获取主机地址，如： http://localhost:8083
        var localhostPaht = curWwwPath.substring(0, pos);
        //获取带"/"的项目名，如：/uimcardprj
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return (localhostPaht + projectName);
    }
    //点击隐藏按钮组
    $('.btn_group i,.other_btn').bind('click',function(){
        $('.other_btn').slideToggle('fast');
    })
})
//关闭搜索框函数
function closeSearch(){
    $('.win_search').hide();
    $('.win_mask').hide();
}
$(function(){
    //样式js
    $('.work_block').width($('body').width()-590);
    $('.ad_block').width($('body').width()-590);
    $('.task_list').height($(window).height());
    $('.work_block').height($(window).height()-$('.ad_block').height()-10);

    // if(navigator.userAgent.indexOf('MSIE 8.0') != -1 || navigator.userAgent.indexOf('MSIE 7.0') != -1){
    //     $('.task_list').height(400);
    //     $('.work_block').height(400);
    // }
    //页面刚加载选中第一个li的页面地址
    window.frames['work_block_win'].location.href = getRootPath_web()+ $('.task_nav li').eq(0).attr('page-href');
    //左侧点击切换页面
    $('.task_nav').delegate('li','click',function(){
        var src=$('.task_nav').find('.active').find('span').find('img').attr("src")+"";
        src=src.substring(0,src.length-7)+"(g).png";
        if($(this).hasClass("active")){

        }else {
            $('.task_nav').find('.active').find('span').find('img').attr("src", src);
        }
        $('.task_nav li').removeClass('active');

        $(this).addClass('active');
        var page_href = $(this).attr('page-href');
        if(page_href != ''){
            window.frames['work_block_win'].location.href = getRootPath_web()+page_href;
        }
    })
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
    //关闭头部广告
    $('.ad_block span.close_ad').bind('click',function(){
        $(this).parent('.ad_block').remove();  
        $('.work_block').width($('body').width()-590);
        $('.ad_block').width($('body').width()-590);
        $('.task_list').height($(window).height());
        $('.work_block').height($(window).height()-10);
       
    })
})

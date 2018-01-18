$(function(){
    //*样式js
    var iframeHeight = $(window).height()-100;
    var workspaceUrl = getRootPath_web()+'/bizframe/jsp/workspace.jsp';
    var menuUrl = getRootPath_web()+'/common/menu.jsp';
    
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
    
    $('.main-iframe').height(iframeHeight);
    $('.main-iframe').width($(window).width());
    //头部点击出现操作菜单
    $('.user_info .fa-caret-square-o-down,.operate_btn .person_center span,.operate_btn .fa-commenting-o').bind('click',function(ev){
        var ev = ev || window.event;
        $('i.fa-caret-up').hide();
        $('.btn_list').hide();
        $(this).parent('li,div').find('i.fa-caret-up').show();
        $(this).parent('li,div').find('.btn_list').show();
        ev.stopPropagation();
    })
    $('.user_info .btn_list,.operate_btn .btn_list').bind('mouseleave',function(){
        $(this).hide();
        $(this).parent('li,div').find('i.fa-caret-up').hide();
    })
    $('body').bind('click',function(){
        $('i.fa-caret-up').hide();
        $('.btn_list').hide();
    })
     //点击菜单
    $('.page_nav').delegate('li','click',function(){
        var tab_index = $(this).attr('index');
        var isCreate =  $(this).attr('create');
        var src=$('.page_nav').find('.active').find('div').find('img').attr("src")+"";
        src=src.substring(0,src.length-7)+"(g).png";
        if($(this).hasClass("active")){

        }else{
            $('.page_nav').find('.active').find('div').find('img').attr("src",src);
        }

        $('.page_nav li').removeClass('active');
        $(this).addClass('active');
        $(this).attr('create','true');
        $('div.main-container').hide();
        if(isCreate){
           $('div.main-container').children('iframe').each(function(){
                if($(this).attr('index') == tab_index){
                       $(this).parent('div.main-container').show();
                }
           })                    
        }else{
           $('body').append('<div class="main-container"><iframe class="main-iframe"  index="'+ tab_index +'"  frameborder="no" src="'+menuUrl+'"></iframe></div>');                
        }  
        $('.main-iframe').height(iframeHeight);
        $('.main-iframe').width($(window).width());           
    })
    //移入菜单出现移除图标
    $('.page_nav').delegate('li','mouseenter',function(){
         $(this).find('i.fa-minus-circle').show();
     })
    //移出菜单去掉移除图标
    $('.page_nav').delegate('li','mouseleave',function(){
        $(this).find('i.fa-minus-circle').hide();
     })
     //遮罩高度
    $('.other_menu_wrap').height(iframeHeight);

     //隐藏更多菜单
    $('.add_menu').click(function(){
        $('.other_menu').slideToggle('fast');
        $('.other_menu_wrap').toggle();
    })
    $('.other_menu').mouseleave(function(){
        $('.other_menu').slideUp('fast');
        $('.other_menu_wrap').hide();
     });
    //*操作js
     //点击菜单的移除按钮 移除当前菜单
    $('.page_nav').delegate('li i.fa-minus-circle','click',function(ev){
        var ev = ev || window.event;
        var tab_index = $(this).parent('li').attr('index');
        if($(this).parent('li').hasClass('active')){
            $('.page_nav').children('li').eq(0).addClass('active');
            $('div.main-container').eq(0).show();
        }
        $('div.main-container').children('iframe').each(function(){
            if($(this).attr('index') == tab_index){
                   $(this).parent('div.main-container').remove();
            }
        })
        $(this).parent('li').remove();
        $('.main-iframe').height(iframeHeight);
        $('.main-iframe').width($(window).width());
        ev.stopPropagation();
    })
    //点击其他菜单新增到菜单栏目
         $('.other_menu ul li').bind('click',function(){
             var meun_title = $(this).find('p').html();
             var meun_img = $(this).find('img').attr('src');
             var num = $('.page_nav').children('li').length;
             var isHas = false;
             var index = $(this).attr('index');
             $('.page_nav').find('li p').each(function(){
                 if($(this).html() == meun_title){
                    isHas = true;

                    var tab_index = $(this).parent('li').attr('index');
                    var isCreate =  $(this).parent('li').attr('create');

                     var src=$('.page_nav').find('.active').find('div').find('img').attr("src")+"";
                     src=src.substring(0,src.length-7)+"(g).png";
                     $('.page_nav').find('.active').find('div').find('img').attr("src",src);

                    $('.page_nav li').removeClass('active');
                    $(this).parent('li').addClass('active');
                     if($(this).parent('li').hasClass("active")){
                         var src=$('.page_nav').find('.active').find('div').find('img').attr("src")+"";
                         src=src.substring(0,src.length-7)+"(w).png";
                         $('.page_nav').find('.active').find('div').find('img').attr("src",src);

                     }else{
                         var src=$('.page_nav').find('.active').find('div').find('img').attr("src")+"";
                         src=src.substring(0,src.length-7)+"(g).png";
                         $('.page_nav').find('.active').find('div').find('img').attr("src",src);

                     }
                    $(this).parent('li').attr('create','true');
                    $('div.main-container').hide();
                    if(isCreate){
                       $('div.main-container').children('iframe').each(function(){
                            if($(this).attr('index') == tab_index){
                                   $(this).parent('div.main-container').show();
                            }
                       })
                    }else{
                       $('body').append('<div class="main-container"><iframe class="main-iframe"  index="'+ tab_index +'"  frameborder="no" src="'+menuUrl+'"></iframe></div>');
                    }
                    $('.main-iframe').height(iframeHeight);
                    $('.main-iframe').width($(window).width());

                    $('.other_menu').slideToggle('fast');
                    $('.other_menu_wrap').toggle();
                     return false;
                 }
             })
             if(!isHas){
                 if(num<8){
                     meun_img=meun_img.substring(0,meun_img.length-7)+"(g).png";
                     $('.page_nav').append(' <li index="'+index+'" class="dianji"><div style="width: 32px;"><img src="'+meun_img+'" ></div> <p style="text-align: center">'+meun_title+'</p><i class="fa fa-minus-circle dis" aria-hidden="true"></i></li> ');
                 }else{
                     meun_img=meun_img.substring(0,meun_img.length-7)+"(g).png";
                     $('.page_nav').children('li').eq(7).remove();
                     $('.page_nav').append(' <li index="'+index+'" class="dianji"><div style="width: 32px;"><img src="'+meun_img+'" ></div> <p style="text-align: center">'+meun_title+'</p><i class="fa fa-minus-circle dis" aria-hidden="true"></i></li> ');
                 }
             }
         })
})

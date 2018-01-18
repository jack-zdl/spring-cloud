/**
 * Created by H on 2016/11/24.
 */
$(function(){
    var rootPath = getRootPath_web();
    var menuUrl = '/front/menu/queryNavBar.do';
    //样式js
    var panelHeight = $(window).height()-10;

    $('.nav_list_wrap').height(panelHeight);
    $('.nav_container').height(panelHeight);
    $('body').height(panelHeight);
    $('.nav_container').width($('body').width()-200);


    //点击左侧的导航
    var iframe = $('.nav_container');
    $('.nav_list').delegate('span','click',function(){
        $('.nav_list li li').removeClass('active');
        $('.nav_list span').removeClass('active');
        $(this).addClass('active');
        var page_href = $(this).parent('li').attr('page-href');
        if(page_href != ''){
            window.frames['main_iframe'].location.href = rootPath+page_href;
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
    //加载导航栏
    var index = $(window.parent.document).find('.page_nav li.active').attr('index');

    $.ajax({
        url:menuUrl,
        type:'post',
        dataType:'json',
        cache:false,
        data:{'menuCode':index},
        success: function(data){
            var nav_list = $('.nav_list');
            var colNum = 0;
            data = data.data;
            setNav(data,nav_list);
            function setNav(data,obj){
                for(var i=0;i<data.length;i++){
                    var $li;
                    if(!data[i].attribute2){
                        // $li = $('<li page-href="'+data[i].attribute1+'" ><span>'+data[i].name+'</span></li>');
                        $li = $('<li page-href="'+data[i].attribute1+'"><span>'+data[i].name+'</span></li>');
                    }else{
                        colNum++;
                        colNum = colNum % 5;
                        $li = $('<li page-href="'+data[i].attribute1+'" ><span><img src="'+rootPath+'/bizframe/image/img/'+data[i].attribute2+'" alt="">'+data[i].name+'</span></li>');
                        // $li = $('<li page-href="'+data[i].attribute1+'"><span><i class="'+data[i].attribute2+'  col'+colNum+'" aria-hidden="true"></i>'+data[i].name+'</span></li>');
                    }
                    if(data[i].children){
                        var $ul = $('<ul></ul>');
                        setNav(data[i].children,$ul)
                        $ul.appendTo($li);
                    }
                    $li.appendTo(obj);
                }
            }
            nav_list.children('li').css({'margin':'8px 0','line-height':'26px'});
            nav_list.find('i').parent('span').css({'font-size':'15px'});
            nav_list.find('li').each(function(){
                if($(this).attr('page-href')!=''){
                    $(this).children('span').addClass('active');
                    window.frames['main_iframe'].location.href = rootPath+$(this).attr('page-href');
                    return false;
                }
            })
        },
        error: function(){
            alert('数据请求异常!');
        }
    })


    //设置默认显示的页面
    //影藏菜单
    $('.closeMenu').bind('click',function(){
        $(this).parents('.nav_list_wrap').hide();
        $('.nav_container').outerWidth($('body').width() - 30);
        $('.openMenu').show();
    });
    //展开菜单
    $('.openMenu').bind('click',function(){
        $('.nav_list_wrap').show();
        $('.nav_container').outerWidth($('body').width() - 200);
        $('.openMenu').hide();
    });
})
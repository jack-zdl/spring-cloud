/**
 * Created by H on 2016/11/30.
 */
$(function(){
    //��ʽjs
    $('.tree_wrap').height($(window).height()-$('.grid_operate').outerHeight()-23);

    $('.toggle_tree').css({'top':($('.tree_wrap').height()-60)/2+'px'});
    $('.tree_wrap').css({'right':(0-$('.tree_wrap').outerWidth())+'px'});

    $('.tree_block').css({'height':$('.tree_wrap').height()});

    //���Ӱ�ػ�չ���Ҳ���
    $('.toggle_tree').bind('click',function(){
        var timer = null;
        var dis = parseInt($('.tree_wrap').css('right'));
       if(dis<0){
           $('.toggle_tree').html('收<br/>起');
           timer = setInterval(function(){
               dis = dis+10;
               if(dis >= 0){
                   dis = 0;
                   clearInterval(timer);
               }
               $('.tree_wrap').css({'right':dis});
           },5)
       }else{
           $('.toggle_tree').html('展<br/>开');
           timer = setInterval(function(){
               dis = dis-10;
               if(dis <= (0-$('.tree_wrap').outerWidth())){
                   dis = (0-$('.tree_wrap').outerWidth());
                   clearInterval(timer);
               }
               $('.tree_wrap').css({'right':dis});
           },5)
       }

    });
    //ȡ����Ŀ��ͷ����ַ
    function getRootPath_web() {
        //��ȡ��ǰ��ַ���磺 http://localhost:8083/uimcardprj/share/meun.jsp
        var curWwwPath = window.document.location.href;
        //��ȡ�����ַ֮���Ŀ¼���磺 uimcardprj/share/meun.jsp
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        //��ȡ�����ַ���磺 http://localhost:8083
        var localhostPaht = curWwwPath.substring(0, pos);
        //��ȡ��"/"����Ŀ���磺/uimcardprj
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return (localhostPaht + projectName);
    }

})

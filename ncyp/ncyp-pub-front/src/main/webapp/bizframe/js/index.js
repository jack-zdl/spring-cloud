$(function(){
// $('#myCarousel').carousel({
//    interval: 5000
// })
/*样式js*/
$('body').width($(window).width());
/*核心功能*/
$('.detail_img img[for=detail_1]').show();

var timer = setInterval(function(){
  //移除从下往上的效果
  $('.detail_img img').eq(0).removeClass('show_frist');
  $('.detail_img img').eq(0).css('visibility','visible');

  var num = $('.each_detail ul li span.active').parent('li').index() + 1;
  num = num % 6;
  $('.each_detail ul li span').removeClass('active');
  $('.each_detail ul li').eq(num).find('span').addClass('active');
  $('.detail_img img').fadeOut();
  $('.detail_img img[for=detail_'+(num+1)+']').fadeIn();
},4000)

$('.each_detail ul li span').bind('click',function(){
   clearInterval(timer);
   var num = $(this).parent('li').index() + 1;
   showImage(num);
   $('.each_detail ul li span').removeClass('active');
   $(this).addClass('active');    
})
$('.each_detail ul li span').bind('mouseover',function(){
    clearInterval(timer);
})
$('.each_detail ul li span').bind('mouseout',function(){
     timer = setInterval(function(){
        var num = $('.each_detail ul li span.active').parent('li').index() + 1;
        num = num % 6;
        $('.each_detail ul li span').removeClass('active');
        $('.each_detail ul li').eq(num).find('span').addClass('active');
        $('.detail_img img').fadeOut();
        $('.detail_img img[for=detail_'+(num+1)+']').fadeIn();
     },4000)
})
function showImage(num) {
   $('.detail_img img').fadeOut();
   $('.detail_img img[for=detail_'+num+']').fadeIn();
}

/*自定义事件监听*/
// function addEventHandler(target,type,func){ 
//     if(target.addEventListener){ 
//        target.addEventListener(type, func, false); 
//     }else if(target.attachEvent){ 
//        target.attachEvent("on" + type, func); 
//     }else{ 
//        target["on" + type] = func; 
//     } 
// } 
/*鼠标滚轮方向判定*/
// var scrollFunc=function(e){ 
//     var e = e || window.event; 
//     var isUp = true;
//     if(e.wheelDelta){//IE/Opera/Chrome up:正  down:负
//         if(e.wheelDelta < 0){
//           isUp = false;
//         } 
//     }else if(e.detail){//Firefox  up:负  down:正
//          if(e.detail > 0){
//           isUp = false;
//         }
//     } 
//     var top = $(window).scrollTop();
//     if(isUp){
//        if(top <= 100){
//           $('.fix_column').css('backgroundColor','rgba(255,255,255,'+((top/100)*0.9)+')');
//        } 
//     }else{
//        if(top <= 100){
//           $('.fix_column').css('backgroundColor','rgba(255,255,255,'+((top/100)*0.9)+')');
//        }
//     }
// } 
// /*滚轮事件的兼容处理*/
// if(document.addEventListener){ 
//     document.addEventListener('DOMMouseScroll',scrollFunc,false); 
// }
// window.onmousewheel=document.onmousewheel=scrollFunc;
var bottom_register = true;
var app_download = true;
var detail = true;
var example = true;
$(window).scroll(function(){
    var top = $(window).scrollTop();

    if(top <= 200){
       $('.fix_column').css('backgroundColor','rgba(255,255,255,'+(top/200)+')');
    }
    if(top > 100){
    	 $('.fix_column').css('color','#333333');
       $('.fix_column i').addClass('text-info');
       $('.fix_column .login_btn').css('borderColor','#333333');
    }else{
    	 $('.fix_column').css('color','white');
       $('.fix_column i').removeClass('text-info');
       $('.fix_column .login_btn').css('borderColor','white');
    }
    if(top >= 300 && detail){
         $('.detail_img img').eq(0).addClass('show_frist');
         $('.each_detail li').eq(0).css({'animation':'filpInX  1s ease-out','visibility': 'visible'}); 
         setTimeout(function(){
         	$('.each_detail li').eq(1).css({'animation':'filpInX  1s ease-out','visibility': 'visible'});  
         },500)
         setTimeout(function(){
         	$('.each_detail li').eq(2).css({'animation':'filpInX  1s ease-out','visibility': 'visible'});      
         },700)
         setTimeout(function(){
         	$('.each_detail li').eq(3).css({'animation':'filpInX  1s ease-out','visibility': 'visible'});     
         },900)
         setTimeout(function(){
         	$('.each_detail li').eq(4).css({'animation':'filpInX  1s ease-out','visibility': 'visible'});    
         },1100)
         setTimeout(function(){
         	$('.each_detail li').eq(5).css({'animation':'filpInX  1s ease-out','visibility': 'visible'});   
         },1300)  
         detail = false;
    }
    if(top >= 600 && example){
         $('.example_list li').eq(0).css({'animation':'filpInX  1s ease-out','visibility': 'visible'}); 
         setTimeout(function(){
         	$('.example_list li').eq(1).css({'animation':'filpInX  1s ease-out','visibility': 'visible'});  
         },500)
         setTimeout(function(){
         	$('.example_list li').eq(2).css({'animation':'filpInX  1s ease-out','visibility': 'visible'});      
         },700)
         setTimeout(function(){
         	$('.example_list li').eq(3).css({'animation':'filpInX  1s ease-out','visibility': 'visible'});     
         },900)
         setTimeout(function(){
         	$('.example_list li').eq(4).css({'animation':'filpInX  1s ease-out','visibility': 'visible'});    
         },1100)
         setTimeout(function(){
         	$('.example_list li').eq(5).css({'animation':'filpInX  1s ease-out','visibility': 'visible'});   
         },1300) 
         setTimeout(function(){
         	$('.example_list li').eq(6).css({'animation':'filpInX  1s ease-out','visibility': 'visible'});   
         },1500)
         setTimeout(function(){
         	$('.example_list li').eq(7).css({'animation':'filpInX  1s ease-out','visibility': 'visible'});   
         },1700)
         example = false;
   }
   if(top >= 1200 && app_download){
      $('.android').css({'animation':'fadeInLeft 1s ease-out','visibility': 'visible'});
      $('.code').css({'animation':'fadeInUp 1s ease-out','visibility': 'visible'});
      $('.iphone').css({'animation':'fadeInRight 1s ease-out','visibility': 'visible'});
      app_download = false;
   }
   if(top >= 1400 &&  bottom_register){
         $('.bottom_register .des').css({'animation':'fadeInRight 1s ease-out','visibility': 'visible'});
         $('.bottom_register h3').css({'animation':'fadeInLeft 1s ease-out','visibility': 'visible'});      
         bottom_register = false;
   }
})
})

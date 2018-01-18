$(function(){
	setStyle();
	function setStyle(){
		//固定住bank_list的宽度,防止出现滚动条
		$('.menu_bar').width($('.bank_list').width());
		$('.bank_list').width($('.bank_list').width());	
		//设置卡片宽度
		$('.bank').width(($('.bank_list').width()-60)/4);
		//设置内部容器的宽�?
		$('.inner_wrap').width($('.bank').length * ($('.bank').width()+20));
		//设置卡片高度
		$('.bank').height($('.bank').width()*357/215);
		//给最外层加一点高度以显示阴影
		$('.bank_list').height($('.bank').height()+5);
		//卡片各个高度
		$('.total_money').height($('.bank').height() * 0.26);
		$('.card_id').height($('.bank').height() * 0.375);
		$('.function').height($('.bank').height() * 0.31);
		//设置金钱的行�?
		$('.total_money').css('lineHeight',($('.total_money').height()-20)+'px');
        
        $('.function').each(function(){
        	$(this).find('.function_inner').width($(this).find('.function_block').length * $(this).width());
        	if($(this).find('.function_block').length < 2){
        		$(this).siblings('.control').remove();
        	}
        })

		$('.function_block').width($('.function').width());

		$('.prev,.next').css('top',($('.bank').height()-$('.prev').height())/2);
	}

	$(window).resize(function(){
		setStyle();
	})

	$('.prev,.next').bind('mouseenter',function(){
		if($(this).attr('class') == 'prev'){
	        $('.prev').attr('src','../images/left-on.png');
		}else{
	        $('.next').attr('src','../images/right-on.png');
		}
	})
	$('.prev,.next').bind('mouseleave',function(){
		if($(this).attr('class') == 'prev'){
	        $('.prev').attr('src','../images/left.png');
		}else{
	        $('.next').attr('src','../images/right.png');
		}
	})

	/*移动银行列表*/
	var num = Math.ceil($('.bank').length / 4) - 1;
    var c = 1;
 
	$('.next').bind('click',function(){	
	    $('.prev').show();	
        $('.inner_wrap').css('left',(- $('.bank_list').width() - 20)*c);
    	c++;
        if(c > num){
        	$('.next').hide();
        }else{
        	$('.next').show();
        }		
	})
	$('.prev').bind('click',function(){
		$('.next').show();	
		$('.inner_wrap').css('left',(parseInt($('.inner_wrap').css('left'))+$('.bank_list').width() + 20));
    	c--;
        if(c <= 1){
        	$('.prev').hide();
        }else{
        	$('.prev').show();
        }	
	})
	/*移动功能菜单*/
	var num = Math.ceil($('.bank').length / 4) - 1;
    var c = 1;
 
	$('.left').bind('click',function(){	
		    var inner = $(this).parent('.control').siblings('.function').find('.function_inner');
		    var point = $(this).siblings('.middle').find('span');
	        var w = $(this).parent('.control').siblings('.function').width();
	        var block_num = inner.find('.function_block').length;	        	
		    var l =  parseInt(inner.css('left'));
		    var count = Math.abs(l/w) - 1;
		    if(l < 0){
	        	inner.css('left',l+w);
                point.removeClass('hover');
                point.eq(count).addClass('hover');
             }
	})
	$('.right').bind('click',function(){
		    var inner = $(this).parent('.control').siblings('.function').find('.function_inner');
		    var point = $(this).siblings('.middle').find('span');
		    var w = $(this).parent('.control').siblings('.function').width();
        	var block_num = inner.find('.function_block').length;
        	var MinL = - (block_num  - 1) * w;
        	var l = parseInt(inner.css('left'));
        	var count = Math.abs(l/w) + 1;
        	if(l > MinL){
        	    inner.css('left',l-w)    
        	    point.removeClass('hover');
                point.eq(count).addClass('hover'); 		
        	}
	})

})
$(function(){
	var maxNum = $(".max-invite-num").html();
	$(".add-more").on("click",addMore);
	function addMore(){
		var nowNum = $(".member-wrap").length;
		var idName = "mobile" + (nowNum+1);
		if (nowNum == maxNum-1) {
			var str = '<div class="member-wrap">';
				str += '<input type="text" class="member-info" placeholder="手机号码" id=idName name="mobiles"/>';
				str += '<a class="input-clear" href="javascript:void(0);">';
				str += '<i class="fa fa-times-circle" aria-hidden="true"></i>';
				str += '</a></div>';
			$(str).insertBefore($(".add-more")).hide().slideDown(300);
			$(".add-more").hide();
		} else if ( nowNum < maxNum-1 ) {
			var str = '<div class="member-wrap">';
				str += '<input type="text" class="member-info" placeholder="手机号码" id=idName name="mobiles"/>';
				str += '<a class="input-clear" href="javascript:void(0);">';
				str += '<i class="fa fa-times-circle" aria-hidden="true"></i>';
				str += '</a></div>';
			$(str).insertBefore($(".add-more")).hide().slideDown(300);
		}
	}

	$(".member-form").on("focus",".member-info",inputFocus)
					 .on("blur",".member-info",inputBlur)
					 .on("keyup",".member-info",inputChange);
	$(".member-form").on("mousedown",".input-clear",inputClear);

	function inputFocus(){
		$(this).parents(".member-wrap").css("border-color","#29e");
		if($(this).val() !== ""){
			$(this).next().show();
		}
		if ($(this).data("errorTips") === "show") {
			$(this).parents(".member-wrap").next().remove();
			$(this).data("errorTips","hide");
		}
	}
	function inputBlur(){
		var $parentWrap = $(this).parents(".member-wrap");
		if ($(this).val() === "") {
			$parentWrap.css("border-color","#d9d9d9");
		} else if ( !$(this).val().match(/^1[3|4|5|8][0-9]\d{4,8}$/) && !$(this).val().match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)) {
			// 判断输入格式是否正确
			$(this).data("errorTips","show");
			$parentWrap.css("border-color","#f44");
			$('<p class="error-tip">请输入正确的手机号码或邮箱地址</p>').insertAfter($(this).parents(".member-wrap"));
		} else {
			$parentWrap.css("border-color","#d9d9d9");
		}
		$(this).next().hide();
	}
	function inputChange(){
		if ($(this).val() !== "") {
			$(this).next().show();
		} else {
			$(this).next().hide();
		}
	}
	function inputClear(){
		$(this).prev().val("");
		$(this).hide();
	}

    $("a.copy").zclip({
        path:getRootPath_web() + '/RUI/plugins/jquery/jquery-zclip-master/ZeroClipboard.swf',
        copy:function(){
            var val = $('.invite-code').find('span').eq(0).html()+' '+ $('.invite-code').find('span').eq(1).html()+' '+$('.register-addr .title').html()+' '+$('.register-addr a').html()+' '+$('.invite-tips').html();
            return val;
        },
        afterCopy: function(){
            alert('复制成功！');
        }
    });

    var  flashTips = flashChecker();
    $('.other-invite-method .text-danger').html(flashTips);
    function flashChecker() {
        var hasFlash = 0;
        var flashVersion = 0;
        var isIE = /*@cc_on!@*/0;
        var message = '';
        if (isIE) {
            var swf = new ActiveXObject('ShockwaveFlash.ShockwaveFlash');
            if (swf) {
                hasFlash = 1;
                VSwf = swf.GetVariable("$version");
                flashVersion = parseInt(VSwf.split(" ")[1].split(",")[0]);
            }
        } else {
            if (navigator.plugins && navigator.plugins.length > 0) {
                var swf = navigator.plugins["Shockwave Flash"];
                if (swf) {
                    hasFlash = 1;
                    var words = swf.description.split(" ");
                    for (var i = 0; i < words.length; ++i) {
                        if (isNaN(parseInt(words[i]))) continue;
                        flashVersion = parseInt(words[i]);
                    }
                }
            }
        }
        if(hasFlash){
            var browser = window.navigator.userAgent;
            var browserV = '';
            if(browser.indexOf('Chrome/')!= -1){
                browser = browser.substring(browser.indexOf('Chrome/')+7);
                browserV = parseInt(browser.substring(0,browser.indexOf('.')));
                if(browserV > 51 && flashVersion < 23){
                    message = '(flash版本过低，无法实现文件上传!更新地址:https://get2.adobe.com/cn/flashplayer)';
                }
            }
        }else{
            message = '(未安装flash，无法实现文件上传!安装地址:https://get2.adobe.com/cn/flashplayer)';
        }
        return message;
    }
});
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */
;(function($, undefined) {
	$.widget("RUI.RCombo", {
		options : {
			 /***
             * 表格数据请求地址
             * @name RCombo#dataUrl
             * @type String
             * @default " "
             * @example
             * 无
             */
			dataUrl:'',
			 /***
             * 设置下拉列表的静态数据
             * @name RCombo#staticData
             * @type String
             * @default " "
             * @example
             * 无
             */
			staticData:'',
			 /***
             * 设置隐藏值
             * @name RCombo#valueField
             * @type String
             * @default null
             * @example
             * 无
             */
			valueField:null,
			 /***
             * 设置显示的值
             * @name RCombo#displayField
             * @type String
             * @default null
             * @example
             * 无
             */
			displayField:null,
			 /***
             * 是否显示下拉点击图标
             * @name RCombo#icon
             * @type Boolean
             * @default true
             * @example
             * 无
             */
			icon: true,
			 /***
             * 是否为只读
             * @name RCombo#readonly
             * @type Boolean
             * @default false
             * @example
             * 无
             */
			readonly:false,
			 /***
             * 是否多选
             * @name RCombo#multiSelect
             * @type Boolean
             * @default false
             * @example
             * 无
             */
			multiSelect: false,
			 /***
             * 是否显示必填提示符号
             * @name RCombo#showTips
             * @type Boolean
             * @default false
             * @example
             * 无
             */
			showTips: false,
			 /***
             * 表格为可编辑grid中的combo
             * @name RCombo#ifEditGrid
             * @type Boolean
             * @default false
             * @example
             * 无
             */
			ifEditGrid: false,
			 /***
             * 设置前置事件
             * @name RCombo#beforeSelect
             * @type Function
             * @default null
             * @example
             * 无
             */
			beforeSelect:null,
			 /***
             * 设置后置事件
             * @name RCombo#afterSelect
             * @type Function
             * @default null
             * @example
             * 无
             */
			afterSelect:null,
			 /***
             * 是否启用浏览器缓存
             * @name RCombo#isCache
             * @type Boolean
             * @default false
             * @example
             * 无
             */
			isCache:false
		},
		/***
         * 全局ID
         */
		ID:'',
		/***
         * 存储前置事件函数
         */
		paramFn:null,
		/***
         * 用于存储后置事件函数
         */
		afterFn:null,
		/***
         * 多选时已经选中的选项的隐藏值
         */
		checkVal:[],
		/***
         * 多选时已经选中的选项的显示值
         */
		checkText:[],
		/***
         * 请求地址的参数
         */
		setparam:{},
		/***
         * 用于再次点击输入框是否给checkVal再加值？？？
         */
		ifsetVal:true,
		_create: function() {
			var ME = this;
		},
		_init: function() {
			var ME = this;
			var id = ME.element.context.id;
			var checkstr = $('#'+id).attr('check');
			var isDisabled;

			

			if(checkstr == undefined){
				checkstr = '';
			}
			ME.ID = id+'_wrap';


			//在可编辑grid中有可能会重复创建下拉列表，所以在创建前先删除原先创建的
			$('ul[for="'+ME.ID+'"]').remove();

			$('#'+id).wrap('<div id="'+id+'_wrap" style="width:100%;position:relative;"></div>');
			if(ME.options.readonly == false){
				isDisabled ='';
			}else{
				isDisabled ='disabled';
			}

			var	span_obj = $('<span class="combo_text"><input '+isDisabled+' type="text" placeholder="请选择..."></span>');

			if(ME.options.icon == true){
				span_obj.append($('<span></span>'));
			}
			$('#'+ME.ID).append(span_obj);

			var ul_obj = $('<ul for="'+ME.ID+'" class="item_list item_display"></ul>');
			$('body').append(ul_obj);

			if(ME.options.multiSelect == true){
				$('#'+ME.ID).append('<input type="hidden" class="hid_val" name="'+$('#'+id).attr('name')+'" check="'+checkstr+'"/>');
				$('#'+id).removeAttr('name');
			}
			if(ME.options.showTips == true){
				var check = $('#'+id).attr('check');
				var checkArr = check.split(',');
				var arr = [];
				for(var k=0;k<checkArr.length;k++){
					arr = checkArr[k].split(':');
					if(arr[0] == 'required'){
						$('#'+ME.ID).prepend('<span class="tips">*</span>')
					}
				}
				$('#'+ME.ID+' span.tips').parent('div').css('outline','none');
			}
			ME.checkText = [];
			ME.checkVal = [];

			ME.inputToCollapse();
			ME.mouseToCollapse();
			ME.clickOtherToHideTable();	  
			if(ME.options.beforeSelect){
				this.paramFn = ME.options.beforeSelect;
			}
			if(ME.options.afterSelect){
				this.afterFn = ME.options.afterSelect;
			}
			if(ME.options.readonly == true){
				$('#'+id+' .combo_text').css('background-color','#EEEEEE');
			}else{
				$('#'+id+' .combo_text').css('background-color','white');
			}
		},
		/**
        功能：获取数据
         */
		getData:function(){
			var ME = this;
			var param = [];
			var stext;
			var sid;
			
			if(!$.isEmptyObject(ME.setparam)){
				param = [];
				param[0] = {};
				for(var key in ME.setparam){
					param[0][key] = ME.setparam[key];
				}
			}
			if(ME.paramFn != null){
				 param = ME.paramFn();
				if(param[1]){
					ME.options.valueField = param[1][0];
					ME.options.displayField = param[1][1];
				}
			}
			if (ME.options.dataUrl != ''){
				var strparam = '';
				for(var attr in param[0]){
					strparam += attr +'='+ param[0][attr]+'&';
				}
				var url = ME.options.dataUrl+'?'+strparam;
				var cacheData = window.sessionStorage.getItem(url);
				if(cacheData && ME.options.isCache){
					cacheData = JSON.parse(cacheData);
					ME.setSelectItem(cacheData);
					ME.setUlItem(cacheData);
				}else{
					$.ajax({
						url: ME.options.dataUrl,
						type: 'POST',
						async: false,
						data: param[0],
						dataType:'JSON',
						cache:false,
						success: function (data) {
							if(data) {
								ME.setSelectItem(data);
								ME.setUlItem(data);
							}
							var kn;
							if(this.data){
								kn = this.url + '?'+this.data+'&';
							}else{
								kn = this.url + '?'
							}
							var str = JSON.stringify(data);

							window.sessionStorage[kn] = str;
						},
						error: function () {

						}
					})
				}
			}else{
				var data = ME.options.staticData;
				if(!this.isJson(data)){
					data = JSON.parse(data.replace(/'/g, '"'));
				}
				ME.setSelectItem(data);
				ME.setUlItem(data);
			}
		},
		/**
        功能：判断是否为json
        参数：要进行校验的对象
         */
		isJson: function(obj){
		  var isjson = typeof(obj) == "object";
		  return isjson;
		},
		/**
        功能：设置隐藏的select
        参数：请求来的数据
         */
		setSelectItem: function(data){
			var ME  = this;
			var id = ME.element.context.id;
			var val = ME.options.valueField;
			var text = ME.options.displayField;
			var html = '';

			for(var i=0;i<data.length;i++){
				var str = ''
				for(var k=0;k<ME.checkVal.length;k++){
					if(data[i][val] == ME.checkVal[k]){
						str = 'selected="selected"';
					}
				}
				html+='<option value="'+data[i][val]+'" '+str+'>'+data[i][text]+'</option>'
			};
			$('#'+id).html('<option></option>'+html);
			var selval;
			if(ME.options.multiSelect == false){//单值的赋值
				selval = $('#' + ME.ID + ' .combo_text input').val();
				if($.trim(selval) != ''){
					$('#' + id + ' option').each(function (){
						var _this = this;
						if ($(_this).html() == selval && $('#'+ME.ID+' select').attr('value')){
							$('#'+id).val($(_this).val());
							$(_this).attr('selected', true);
						}
					})
				}
			}else{//多值的赋值
				selval = $('#'+ME.ID+' select').attr('value');
		
				$('#'+ME.ID+' input[type=hidden]').attr('value',selval);
				if($.trim(selval) != ''  && ME.ifsetVal){//''''
					var arr = selval.split(',');
					$('#' + id + ' option').each(function (){
						for(var j=0;j<arr.length;j++){
							if ($(this).attr('value') == arr[j]){
								$(this).attr('selected', true);
								if($.inArray($(this).html(),ME.checkText) == -1){
									 ME.checkText.push($(this).html());
								}
							   
							}
						}
					})
					$('#'+ME.ID+' input[type=text]').attr('value',ME.checkText.join(','));
				}
			}


		},
		/**
        功能：设置下拉列表
        参数：请求回来的数据
         */
		setUlItem: function(data){
			var ME  = this;
			var val = ME.options.valueField;
			var text = ME.options.displayField;
			var html = '';
			var $wrap = $('ul[for="'+ME.ID+'"]');
			if(ME.options.multiSelect == true){
				for(var i=0;i<data.length;i++){
					var str = ''
					for(var k=0;k<ME.checkVal.length;k++){
						if(data[i][val] == ME.checkVal[k]){
							str = 'checked="checked"';
						}
					}
					html+='<li value="'+data[i][val]+'"><input type="checkbox" '+str+'/><span>'+data[i][text]+'</span></li>'
				}
				$wrap.html(html);

				ME.checkToSelect();
			}else{
				for(var i=0;i<data.length;i++){
					html+='<li value="'+data[i][val]+'">'+data[i][text]+'</li>'
				}
				$wrap.html(html);
				ME.keyToSelect();
				ME.mouseToSelect();

				var highLightIndex = ($('#'+ME.ID+' option[selected=selected]').index() - 1) >= 0 ? ($('#'+ME.ID+' option[selected=selected]').index() - 1) : 0 ;
			    ME.highLight('ul[for="'+ME.ID+'"] li:eq('+highLightIndex+')');
			}
 
			ME.delText();
			//设置下拉列表的宽度
			$wrap.css('width',$('#'+ME.ID+' span.combo_text').width());
		},
		/**
        功能：多选时，点击checkbox选择
         */
		checkToSelect: function(){
			var ME = this;
			var $wrap = $('ul[for="'+ME.ID+'"]');
			$wrap.find('li').each(function(){
				var _this = this;
				$(this).bind('mouseover',function(){
					ME.highLight(_this);
				})
				$(this).bind('click',function(ev){
				     var ev = ev || window.event;			
					if($(this).find(':checkbox').is(':checked')){//本来是选中的						
						for(var i=0;i<ME.checkVal.length;i++){
							if(ME.checkVal[i] == $(this).attr('value')){
								ME.checkVal.splice(i,1);
							}
							if(ME.checkText[i] ==$(this).find(':checkbox').siblings('span').html()){
								ME.checkText.splice(i,1);
							}
						}		
						$(this).find(':checkbox').prop('checked',false);					
					}else{
						if($.inArray($(this).attr('value'),ME.checkVal) == -1){
                           ME.checkText.push($(this).find(':checkbox').siblings('span').html());
						   ME.checkVal.push($(this).attr('value'));	
						}
						$(this).find(':checkbox').prop('checked',true);
					}
					$('#'+ME.ID+' select option').each(function(){
						$(this).attr('selected',false);
						for(var k=0;k<ME.checkVal.length;k++){
							if($(this).attr('value') == ME.checkVal[k]){
								$(this).attr('selected',true);
							}
						}
					});
					$('#'+ME.ID+' input[type=text]').val(ME.checkText.join(','));
					$('#'+ME.ID+' input[type=hidden]').attr('value',ME.checkVal.join(','));
					$('#'+ME.ID+' select').attr('value',ME.checkVal.join(','));

					//ifEditGrid用于确定是否是可编辑中的combo，用于下拉选中后进行可编辑表格中的数据保存
					if(ME.options.ifEditGrid == true){
						var oTr = $('#'+ME.ID).closest('tr');
						var editgrid_ID = $('#'+ME.ID).closest('form').attr('id');
						var editgrid_id = editgrid_ID.substring(0,editgrid_ID.length - 5);

						if(oTr.hasClass('editing')){
							$('#'+editgrid_id).EditableGrid('saveValue','editing');
						}else{
		                    $('#'+editgrid_id).EditableGrid('saveValue','adding');
						}				
					}					
					ev.stopPropagation();
				})
			});
			$wrap.find(':checkbox').each(function(){				
				$(this).bind('click',function(ev){
				    var ev = ev || window.event;			
					if(!$(this).is(':checked')){//本来是未选中的						
						for(var i=0;i<ME.checkVal.length;i++){
							if(ME.checkVal[i] == $(this).parent('li').attr('value')){
								ME.checkVal.splice(i,1);
							}
							if(ME.checkText[i] ==$(this).siblings('span').html()){
								ME.checkText.splice(i,1);
							}
						}							
					}else{
						if($.inArray($(this).attr('value'),ME.checkVal) == -1){
                           ME.checkText.push($(this).siblings('span').html());
						   ME.checkVal.push($(this).parent('li').attr('value'));	
						}
					}
					$('#'+ME.ID+' select option').each(function(){
						$(this).attr('selected',false);
						for(var k=0;k<ME.checkVal.length;k++){
							if($(this).attr('value') == ME.checkVal[k]){
								$(this).attr('selected',true);
							}
						}
					});
					$('#'+ME.ID+' input[type=text]').val(ME.checkText.join(','));
					$('#'+ME.ID+' input[type=hidden]').attr('value',ME.checkVal.join(','));
					$('#'+ME.ID+' select').attr('value',ME.checkVal.join(','));

					//ifEditGrid用于确定是否是可编辑中的combo，用于下拉选中后进行可编辑表格中的数据保存
					if(ME.options.ifEditGrid == true){
						var oTr = $('#'+ME.ID).closest('tr');
						var editgrid_ID = $('#'+ME.ID).closest('form').attr('id');
						var editgrid_id = editgrid_ID.substring(0,editgrid_ID.length - 5);

						if(oTr.hasClass('editing')){
							$('#'+editgrid_id).EditableGrid('saveValue','editing');
						}else{
		                    $('#'+editgrid_id).EditableGrid('saveValue','adding');
						}				
					}
					ev.stopPropagation();
				});				
			});
		},
		/**
        功能：鼠标选择下拉项目
         */
		mouseToSelect: function(){
			var ME = this;
			var $wrap = $('ul[for="'+ME.ID+'"]');
			$wrap.find('li').each(function(){
				var _this = this;
				$(this).bind('mouseover',function(){
					ME.highLight(_this);
				})
				$(this).click(function(ev){
					var ev = ev || window.event;
					ME.selectVal(_this);
					$wrap.addClass('item_display');
					ev.stopPropagation();
				})
			});
		},
		/**
        功能：键盘选择下拉项目
         */
		keyToSelect: function(){
			var ME = this;
			var count = 0;
			var $wrap = $('ul[for="'+ME.ID+'"]');
				$('#'+ME.ID).unbind('keydown');
				$('#'+ME.ID).bind('keydown',function(ev){
					var ev = ev || window.event;
					if(ev.keyCode == 13){
						ME.selectVal('ul[for="'+ME.ID+'"] li.item_active');
					    ME.toCollapse();
						return false;
					}else if(ev.keyCode == 38){
						count= $wrap.find('li.item_active').index() - 1;
						var index =  count %  $wrap.find('li').length;

						ME.highLight( $wrap.find('li:eq('+index+')'));
						return false;
					}else if(ev.keyCode == 40){
						count=  $wrap.find('li.item_active').index() + 1;
						var index =  count %  $wrap.find('li').length;

						ME.highLight($wrap.find('li:eq('+index+')'));
						return false;
					}
				})
		},
		/**
        功能：一键删除输入框中的文字
         */
		delText: function(){
			var ME = this;
          $('#'+ME.ID+' input').bind('keyup',function(ev){	
          	    var ev = ev || window.event;
				if(ev.keyCode != 13 && ev.keyCode != 40 && ev.keyCode != 38){
					$('#'+ME.ID+' input').val('');
					$('#'+ME.ID+' select').attr('value','');
					$('#'+ME.ID+' select option').attr('selected',false);
					$('input[type=hidden]').val('');
					ME.checkText = [];
					ME.checkVal = [];
				}
           });
		},
		/**
        功能：触发选择
        参数：当前选择的项目
         */
		selectVal: function(obj){
			var ME = this;
			var html = $(obj).html();
			html = html.replace(/&lt;/g,'<');
			html = html.replace(/&gt;/g,'>');
			$('#'+ME.ID+' .combo_text input').val(html);
			var index = $(obj).index();
			var id = ME.element.context.id;

			$('#'+id+' select').attr('value','');
			$('#'+id+' option').attr('selected',false);
			$('#'+id+' option').eq(index+1).attr('selected',true);
			$('#'+id).val($('#'+id+' option').eq(index+1).val());
			ME.checkVal = [];
			ME.checkVal.push($('#'+id+' option').eq(index+1).val());	

			//ifEditGrid用于确定是否是可编辑中的combo，用于下拉选中后进行可编辑表格中的数据保存
			if(ME.options.ifEditGrid == true){
				var oTr = $('#'+ME.ID).closest('tr');
				var editgrid_ID = $('#'+ME.ID).closest('form').attr('id');
				var editgrid_id = editgrid_ID.substring(0,editgrid_ID.length - 5);

				if(oTr.hasClass('editing')){
					$('#'+editgrid_id).EditableGrid('saveValue','editing');
				}else{
                    $('#'+editgrid_id).EditableGrid('saveValue','adding');
				}				
			}

			if(ME.afterFn != null){
				ME.afterFn([$('#'+id+' option').eq(index+1).val(),$(obj).html()]);
			}
		},
		/**
        功能：高亮鼠标移入的下拉选项
        参数：当前下拉选项的索引
         */
		highLight: function(i){
			var ME  = this;
			var $wrap = $('ul[for="'+ME.ID+'"]');
			$wrap.find('li').removeClass('item_active');
			$(i).addClass('item_active');
		},
		/**
        功能：鼠标点击右侧下拉图表进行展开收缩下拉列表
         */
		mouseToCollapse: function(){
			var ME  = this;
			var id = ME.ID;
			var $wrap = $('[for="'+ME.ID+'"]');
			if(ME.options.icon == true){
				$('#' + ME.ID + ' .combo_text span').unbind('click');
				$('#' + ME.ID + ' .combo_text span').bind('click',function (ev) {
					var ev = ev || window.event;

					if($wrap.hasClass('item_display') == true){

						ME.getData();
					}
					ME.toCollapse();

					ev.stopPropagation();
				})
			}
		},
		/**
        功能：点击输入框进行展开收缩下拉列表
         */
		inputToCollapse: function(){
			var ME  = this;
			var id = ME.ID;
			var $wrap = $('ul[for="'+ME.ID+'"]');
			$('#' + ME.ID + ' .combo_text input').unbind('click');
			$('#' + ME.ID + ' .combo_text input').bind('click',function (ev) {
				var ev = ev || window.event;
				if($wrap.hasClass('item_display') == true){
					ME.getData();
				}
				ME.toCollapse();
                ev.stopPropagation();
			})
		},
		/**
        功能：触发展开收缩下拉列表
         */
		toCollapse: function(){
			var ME  = this;
			var $wrap = $('ul[for="'+ME.ID+'"]');
			var top = $('#'+ME.ID).offset().top + 30;
			var left = $('#'+ME.ID).offset().left;

			$wrap.css({'top':top,'left':left});

			$('div.table_wrap').addClass('collapse_table');
            $('ul.item_list').not('ul[for="'+ME.ID+'"]').addClass('item_display'); 

			if(ME.options.readonly == false) {
				$wrap.toggleClass('item_display');
			}
		},
		/**
        功能：设置默认选中的值
        参数:由隐藏的值和显示的值组成的数组
         */
		setAllValue: function(arr){
			
			var ME = this;
			var id = ME.ID;

			if(ME.options.multiSelect){

				var options = '';
				ME.checkVal = arr[0].split(',')
				ME.checkText = arr[1].split(',');
                $('#'+id+' select').html('<option value="'+arr[0]+'" selected="selected">'+arr[1]+'</option>');
                $('#'+id).children('input[type=hidden]').attr('value',arr[0].split(','));
			}else{
				$('#'+id+' select').attr('value',arr[0]);
				$('#'+id+' select').html('<option value="'+arr[0]+'" selected="selected">'+arr[1]+'</option>');
			}
			var html = arr[1];
			html = html.replace(/&lt;/g,'<');
			html = html.replace(/&gt;/g,'>');
			$('#'+id+' .combo_text input').val(html);
		},
		/**
        功能：设置默认选中的值
        参数：（？？？）
         */
        getValue: function(){
        	var ME = this;
			var id = ME.element.context.id;
			var val = '';
			if(ME.options.multiSelect){
                val = $('#'+id+"_wrap").find('.hid_val').attr('value');
			}else{
				val = $('#'+id).val();
			}
			return val;
        },
		/**
        功能：设置默认选中的值
        参数：（？？？）
         */
		setValue: function(val){
			var ME = this;
			var id = ME.element.context.id;
			var val = $('#'+id).attr('value');
			if(val){
				val = val;
			}
			if($.trim(val) != ''){
				 ME.getData();
				if(ME.options.multiSelect){
            	    ME.checkVal = val.split(',');
                }
				$('#' + id + ' option').each(function () {
					var _this = this;
					if ($(_this).html() == val || $(_this).attr('value') == val) {
						var html = $(_this).html();
						$('#'+id).val($(_this).val());
						$(_this).attr('selected', true);

                        html = html.replace(/&lt;/g,'<');
			            html = html.replace(/&gt;/g,'>');
						$('#'+ME.ID+' .combo_text input').val(html);
					}
				})
			}else{
				$('#' + id + ' option').each(function () {
					$(this).attr('selected', false);
				})
				$('#'+ME.ID+' .combo_text input').val('');
			}
		},
		clickOtherToHideTable: function(){

			var ME = this;
			var $wrap = $('ul[for="'+ME.ID+'"]');
			
			$('body').bind('click',function(){
				$wrap.addClass('item_display');
			})
		},
		/**
        功能：设置请求地址参数
        参数: 参数json
         */
		setParam: function(param){
			this.setparam = param;
		},
		/**
        功能：设置前置事件
        参数: 函数
         */
		beforeSelect: function(fn){
			this.paramFn = fn;
		},
		/**
        功能：设置后置事件
        参数: 函数
         */
		afterSelect: function (fn) {
			this.afterFn = fn;
		},
		/**
        功能：设置检验
        参数: 检验规则
         */
		setCheck: function(str){
			var ME = this;
			var id = ME.element.context.id;

			$('#'+id).attr('check',str);
            if(ME.options.multiSelect == true){
				$('#'+ME.ID).find('input[type=hidden]').attr('check',str);
			}

			$('#'+ME.ID).find('span.tips').remove();

			//if(ME.options.showTips == true){
				var check = $('#'+id).attr('check');
				var checkArr = check.split(',');
				var arr = [];
				for(var k=0;k<checkArr.length;k++){
					arr = checkArr[k].split(':');
					if(arr[0] == 'required'){
						$('#'+ME.ID).prepend('<span class="tips">*</span>')
					}
				}
				$('#'+ME.ID+' span.tips').parent('div').css('outline','none');
			//}
		},
		/**
        功能：切换只读状态
        参数: true为只读
         */
		setReadOnly: function(i){
			var ME = this;
			var id = ME.ID;
			var $wrap = $('ul[for="'+ME.ID+'"]');
			if(i == true){
				ME.options.readonly = true;
				$('#'+id+' .combo_text').css('background-color','#EEEEEE');
				$('#'+id+' .combo_text input').prop('disabled','disabled');
				$wrap.css('display','none');
			}else {
				ME.options.readonly = false;
				$('#'+id+' .combo_text').css('background-color','white');
				$('#' + id + ' .combo_text input').removeAttr('disabled');
				$wrap.css('display','');
			}
		},
		/**
		 * 功能:改变下拉列表的静态数据
		 * 参数:json数组
		 */
		changeStaticData: function(arr){
            this.options.staticData = arr;
		},
		destroy: function(){
			$.Widget.prototype.destroy.call(this);
		}

	})

})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */
;(function($, undefined) {
	$.widget("RUI.RComboGrid", {
		options:{
			/***
             * 下拉列表的宽度
             * @name RComboGrid#panelWidth
             * @type String
             * @default ' '
             * @example '200'
             * 无
             */
			panelWidth:'300',
			/***
             * 下拉列表的高度
             * @name RComboGrid#panelHeight
             * @type String
             * @default "170"
             * @example '170'
             * 无
             */
			panelHeight:'175',
			/***
             * 隐藏的值
             * @name RComboGrid#idField
             * @type String
             * @default " "
             * @example
             * 无
             */
			idField: '',
			/***
             * 显示的值
             * @name RComboGrid#textField
             * @type String
             * @default " "
             * @example
             * 无
             */
			textField: '',
			/***
             * 表格数据请求地址
             * @name RComboGrid#url
             * @type String
             * @default " "
             * @example
             * 无
             */
			url: '',
			/***
             * 数据请求方式
             * @name RComboGrid#method
             * @type String
             * @default 'post'
             * @example
             * 无
             */
			method: 'post',
			/***
             * 每页显示的条数
             * @name RComboGrid#pageSize
             * @type String
             * @default '6'
             * @example
             * 无
             */
			pageSize: '6',
			/***
             * 要显示的字段
             * @name RComboGrid#columns
             * @type Array
             * @default []
             * @example
             * 无
             */
			columns: [],
			/***
             * 是否显示图标
             * @name RComboGrid#icon
             * @type Boolean
             * @default true
             * @example
             * 无
             */
			icon: true,
			 /***
             * 是否为只读
             * @name RComboGrid#readonly
             * @type Boolean
             * @default false
             * @example
             * 无
             */
			readonly:false,
			/***
             * 是否多选
             * @name RComboGrid#multiSelect
             * @type Boolean
             * @default false
             * @example
             * 无
             */
			multiSelect:false,
			/***
             * 多选时是否将所选项显示在输入框中
             * @name RComboGrid#showText
             * @type Boolean
             * @default false
             * @example
             * 无
             */
			showText:false,
			/***
             * 是否显示必填提示符号
             * @name RComboGrid#showTips
             * @type Boolean
             * @default false
             * @example
             * 无
             */
			showTips:false,
			/***
             * 表格为可编辑grid中的combo
             * @name RComboGrid#ifEditGrid
             * @type Boolean
             * @default false
             * @example
             * 无
             */
			ifEditGrid: false,
			/***
             * 是否允许用户输入与下拉列表不一致的值
             * @name RComboGrid#isWrite
             * @type Boolean
             * @default false
             * @example
             * 无
             */
			isWrite:false,
			 /***
             * 设置前置事件
             * @name RComboGrid#beforeSelect
             * @type Function
             * @default null
             * @example
             * 无
             */
			beforeSelect: null,
			/***
             * 设置后置事件
             * @name RComboGrid#afterSelect
             * @type Function
             * @default null
             * @example
             * 无
             */
			afterSelect:null,
			/***
             * 是否启用浏览器缓存
             * @name RComboGrid#isCache
             * @type Boolean
             * @default false
             * @example
             * 无
             */
			isCache:false
		},
		/***
         * 全局ID
         */
		ID:'',
		/***
         * 存储前置事件函数
         */
		paramFn:null,
		/***
         * 用于存储后置事件函数
         */
		afterFn:null,
        /***
         * 输入的后置事件
         */
		compareFn:null,
        /***
         * 多选时已经选中的选项的显示值
         */
		checkText:[],
		/***
         * 多选时已经选中的选项的隐藏值
         */
		checkVal:[],
		/***
         * 请求地址的参数
         */
		setparam: {},
		_create: function() {
			var ME = this;
		},
		_init: function() {
			var ME = this;
			var id = ME.element.context.id;
			var isDisabled;

			ME.checkVal = [];
			ME.checkText = [];

			$('#'+id).wrap('<div id="'+id+'_wrap"></div>');
			$('#'+id).attr({'hid':id,'combogrid':true});
			id = id +'_wrap';
			ME.ID = id;

			//在可编辑grid中有可能会重复创建下拉列表，所以在创建前先删除原先创建的
			$('div[for="'+ME.ID+'"]').remove();

			if(ME.options.readonly == false){
				isDisabled ='';
			}else{
				isDisabled ='disabled';
			}
			if(ME.options.icon == true){
				$('#'+id).append('<div class="text_box"><input type="text" '+isDisabled+' class="input_text input_text_w" placeholder="请选择..."/><span class="tocollapse"></span></div>');
			}else{
				$('#'+id).append('<div class="text_box"><input type="text" '+isDisabled+' class="input_text" placeholder="请选择..."/></div>');
			}
			$('#'+id+' .input_text').attr('check',$('#'+id+' input[type=hidden]').attr('check'));

			$('body').append('<div for="'+ME.ID+'" class="table_wrap collapse_table"><div class="data_panel"><div class="data_table"><table cellpadding="0" cellspacing="0"></table></div><div class="combogrid_page"></div></div>');

			$('#'+id).css('position','relative');
			
			var $wrap = $('div[for="'+ME.ID+'"]');
			$wrap.css('width',ME.options.panelWidth);
			$wrap.find('.data_table').css('height',ME.options.panelHeight);

			$wrap.find('.data_table table').append('<thead></thead>');
			for(var i =0;i<ME.options.columns.length;i++){
				if(ME.options.multiSelect == true){
					$wrap.find('.data_panel .data_table thead').append('<th class="number"></th><th class="chkCol"></th><th>'+ME.options.columns[i].title+'</th>');
				}else{
					$wrap.find('.data_panel .data_table thead').append('<th class="number"></th><th>'+ME.options.columns[i].title+'</th>');
				}
			};
			if(ME.options.showTips == true){
				var check = $('#'+id+' input[type=hidden]').attr('check');
				var checkArr = check.split(',');
				var arr = [];
				for(var k=0;k<checkArr.length;k++){
					arr = checkArr[k].split(':');
					if(arr[0] == 'required'){
						$('#'+ME.ID).prepend('<span class="tips">*</span>')
					}
				}
				$('#'+ME.ID+' span.tips').parent('div').css('outline','none');

			}

			if(ME.options.beforeSelect){
				this.paramFn = ME.options.beforeSelect;
			}
			if(ME.options.afterSelect){
				this.afterFn = ME.options.afterSelect;
			}
			if(ME.options.readonly == false){
				$('#'+id+' .text_box').css('background-color','white')
			}else{
				$('#'+id+' .text_box').css('background-color','#EEEEEE')
			}
		   	ME.keyToSearch();
			ME.mouseToCollapse();
			ME.clickOtherToHideTable();	  
		},
		/**
        功能：获取数据
        参数：ajax请求地址的参数
         */
		loader: function(i){
			var ME = this;
			var $wrap = $('div[for="'+ME.ID+'"]');
			$wrap.find('.data_panel tr').remove();

			if(!i){
				i = {page:1,rows:ME.options.pageSize};
			}
			if(!$.isEmptyObject(ME.setparam)){
               for(var key in ME.setparam){
				   i[key] = ME.setparam[key];
			   }
			}
			if(ME.paramFn != null){
				var param = ME.paramFn();
				for(var attr in param[0]){
					i[attr] = param[0][attr]
				}
				if(param[1]){
					ME.options.idField = param[1][0];
					ME.options.textField = param[1][1];
					ME.options.columns = [
						{title:'名称',field:param[1][1]},
					]
				}
			}
			var strparam = '';
			for(var attr in i){
				strparam += attr +'='+ i[attr]+'&';
			}
			var url = ME.options.url+'?'+strparam;
			var cacheData = window.sessionStorage.getItem(url);
			if(cacheData && ME.options.isCache){
				ME.setData(cacheData,i);
			}else{
				$.ajax({
					type: ME.options.method,
					url:ME.options.url,
					async:false,
					data:i,
					cache:false,
					success:function(data){
						var kn = this.url + '?'+this.data+'&';
						window.sessionStorage[kn] = data;
						ME.setData(data,i);
					},
					error:function(){}
				});
			}
		},
		/**
        功能：生成下拉列表
        参数：数据，传递的page参数
         */
		setData: function(data,jparam){
                if(typeof(data) != "object"){
                    data = JSON.parse(data);
                }
				var ME = this;
				var id = ME.ID;
				var itemval = ME.options.columns[0].field;
				var idF = ME.options.idField;
				var textF = ME.options.textField;
				var $wrap = $('div[for="'+ME.ID+'"]');


				for(var i=0;i<data.rows.length;i++){
					var bgClass = '';
					if(i%2 != 0){
						bgClass = 'evenBgColor';
					}
					if(ME.options.multiSelect == true){//!
						var checkStr = '';
						for(var k=0;k<ME.checkVal.length;k++){
							if(data.rows[i][idF] == ME.checkVal[k]){
								var checkStr = 'checked';
							}
						}
						$wrap.find('.data_table table').append('<tr index=' + data.rows[i][idF] +' class="'+ bgClass +'"><td>'+(i+1)+'</td><td><input '+checkStr+' type="checkbox" value="'+data.rows[i][idF]+'" text="'+data.rows[i][textF]+'"></td><td title="'+ data.rows[i][itemval] +'">' + data.rows[i][itemval] + '</td></tr>');
					}else{
						$wrap.find('.data_table table').append('<tr index=' + data.rows[i][idF] + ' class="'+ bgClass +'"><td>'+(i+1)+'</td><td title="'+ data.rows[i][itemval] +'">' + data.rows[i][itemval] + '</td></tr>');
					}
				}
			   for(var j = 1; j < ME.options.columns.length; j++) {
					itemval = ME.options.columns[j].field;
					for(var i = 0; i < data.rows.length; i++) {
						$wrap.find('.data_table table tr:eq('+i+')').append('<td title="'+ data.rows[i][itemval] +'">' + data.rows[i][itemval] + '</td>');
					}
				};
				ME.setPage({page:data.page,allPage:data.totalpage,total:data.total},jparam);
				ME.mouseToSelect(data);
				
			    if(!ME.options.multiSelect){
			    	ME.keyToSelect(data);
			    }
				if(!ME.options.isWrite){
					if (data.rows.length == 0){
						$('#' + id + ' .input_text').val(' ');
						ME.checkVal = [];
						ME.checkText = [];
					}
				}
		},
		/**
        功能：生成分页
        参数：返回的page参数，传递的page参数
         */
		setPage: function(i,jparam){
			var ME = this;
			var id = ME.ID;
			var $wrap = $('div[for="'+ME.ID+'"]');

			$wrap.find('.combogrid_page').html('');//!
			var html = '<span class="pagination_nav"><span class="pagination_bgimg"></span><span class="pagination_bgimg pagination_bgimg_pos1"></span><span class="nowPage">'+i.page+'</span>/<span>'+i.allPage+'</span><span class="canClick pagination_bgimg pagination_bgimg_pos2"></span><span class="canClick pagination_bgimg pagination_bgimg_pos3"></span></span>';

			$wrap.find('.combogrid_page').append(html);

			$wrap.find('.combogrid_page .pagination_nav span:eq(4)').click(function(ev){
				ME.next(jparam,i);
			});
			$wrap.find('.combogrid_page .pagination_nav span:eq(1)').click(function(ev){
				ME.prev(jparam);
			});
			$wrap.find('.combogrid_page .pagination_nav span:eq(5)').click(function(ev){
				ME.last(jparam,i);
			});
			$wrap.find('.combogrid_page .pagination_nav span:eq(0)').click(function(ev){
				ME.first(jparam);
			});
			//阻止冒泡到顶部
			$wrap.find('.combogrid_page').bind('click',function(ev){
                ev = ev || window.event;
                ev.stopPropagation();
			});
		},
		/**
        功能：上一页
        参数：传递的page参数
         */
		prev: function(jparam){
			var ME = this;
			var id = ME.ID;
			var $wrap = $('div[for="'+ME.ID+'"]');
			if(parseInt(jparam.page) > 1) {
				var page = parseInt(jparam.page) - 1;
				var param = ME.options.textField;
				var data = {page: page, rows: ME.options.pageSize};
				if(jparam[param]){
					data[param] = jparam[param];
				}
				ME.loader(data);
			}
			if(parseInt(jparam.page) <= 1){
				$wrap.find('.combogrid_page .pagination_nav span:eq(0),div[for="'+ME.ID+'"].combogrid_page  .pagination_nav span:eq(1)').removeClass('canClick')
			}else{
				$wrap.find('.combogrid_page  .pagination_nav span:eq(0),div[for="'+ME.ID+'"].combogrid_page  .pagination_nav span:eq(1)').addClass('canClick')
			}
			    $wrap.find('.combogrid_page  .pagination_nav span:eq(4),div[for="'+ME.ID+'"].combogrid_page  .pagination_nav span:eq(5)').addClass('canClick')
		},
		/**
        功能：下一页
        参数：传递的page参数,返回的page参数
         */
		next: function(jparam,i){
			var ME = this;
			var id = ME.ID;
			var $wrap = $('div[for="'+ME.ID+'"]');
			if(parseInt(jparam.page)< i.allPage) {
				var page = parseInt(jparam.page) + 1;
				var param = ME.options.textField;
				var data = {page: page, rows: ME.options.pageSize};
				if(jparam[param]){
					data[param] = jparam[param];
				}
				ME.loader(data);
			}
			if(jparam.page >= i.allPage){
				$wrap.find('.combogrid_page  .pagination_nav span:eq(4),div[for="'+ME.ID+'"].combogrid_page  .pagination_nav span:eq(5)').removeClass('canClick')
			}
		    	$wrap.find('.combogrid_page  .pagination_nav span:eq(0),div[for="'+ME.ID+'"].combogrid_page  .pagination_nav span:eq(1)').addClass('canClick')
		},
		/**
        功能：第一页
        参数：传递的page参数
         */
		first: function(jparam){
			var ME = this;
			var id = ME.ID;
			var page = 1;
			var param = ME.options.textField;
			var data = {page:page,rows : ME.options.pageSize};
			var $wrap = $('div[for="'+ME.ID+'"]');
			if(jparam[param]){
				data[param] = jparam[param];
			}
			ME.loader(data);
			    $wrap.find('.combogrid_page  .pagination_nav span:eq(0),div[for="'+ME.ID+'"].combogrid_page  .pagination_nav span:eq(1)').removeClass('canClick')
				$wrap.find('.combogrid_page  .pagination_nav span:eq(4),div[for="'+ME.ID+'"].combogrid_page  .pagination_nav span:eq(5)').addClass('canClick')

		},
		/**
        功能：最后一页
        参数：传递的page参数,返回的page参数
         */
		last: function(jparam,i){
			var ME = this;
			var id = ME.ID;
			var page = i.allPage;
			var param = ME.options.textField;
			var data = {page:page,rows : ME.options.pageSize};
			var $wrap = $('div[for="'+ME.ID+'"]');
			if(jparam[param]){
				data[param] = jparam[param];
			}
			ME.loader(data);
			$wrap.find('.combogrid_page  .pagination_nav span:eq(0),[for="'+ME.ID+'"].combogrid_page  .pagination_nav span:eq(1)').addClass('canClick');
		},
		/**
        功能：高亮鼠标移入的下拉选项
        参数：当前下拉选项的索引
         */
		highLight: function(i){
			var ME = this;
			var id = ME.ID;
			$('div[for="'+ME.ID+'"] .data_panel .high_light').removeClass('high_light');
			i.addClass('high_light');
		},
		/**
        功能：触发选择
        参数：数据
         */
		selectRow: function(data){	
			var ME = this;
			var id = ME.ID;
			var $wrap = $('div[for="'+ME.ID+'"]');
			//确保已经选中了下拉列表再去执行函数
			if($wrap.find('.data_panel .high_light').length > 0){
				for(var i=0;i<data.rows.length;i++){
					if(data.rows[i][ME.options.idField] == $wrap.find('.data_panel .high_light').attr('index') || data.rows[i][ME.options.idField] ==  $wrap.find('.data_panel .select_light').attr('index')){
						if(ME.options.multiSelect == false){
							$('#'+id+' input[type=text]').val(data.rows[i][ME.options.textField])
							$('#'+id+' input[type=hidden]').attr('value',data.rows[i][ME.options.idField])
						}
					}
				}
				if(ME.afterFn != null && !ME.options.multiSelect){
					ME.afterFn([$('#'+id+' input[type=hidden]').val(),$('#'+id+' input[type=text]').val()]);
				}

				//ifEditGrid用于确定是否是可编辑中的combogrid，用于下拉选中后进行可编辑表格中的数据保存
				if(ME.options.ifEditGrid == true){
					var oTr = $('#'+ME.ID).closest('tr');
					var editgrid_ID = $('#'+ME.ID).closest('form').attr('id');
					var editgrid_id = editgrid_ID.substring(0,editgrid_ID.length - 5);

					if(oTr.hasClass('editing')){
						$('#'+editgrid_id).EditableGrid('saveValue','editing');
					}else{
	                    $('#'+editgrid_id).EditableGrid('saveValue','adding');
					}				
				}
			}
		},
		/**
        功能：鼠标选择下拉项目
         */
		mouseToSelect: function(data){
			var ME = this;
			var id = ME.ID;
			var $wrap = $('div[for="'+ME.ID+'"]');
			$wrap.find('.data_panel tr').on('mouseover','td',function(ev){
				ME.highLight($(this).parent());
			})
			if(!ME.options.multiSelect){
				$wrap.find('.data_panel tr').on('mousedown','td',function(ev){
					ME.selectRow(data);
					ME.collapseTable();
				})
			}else{
				$wrap.find('.data_panel tr').bind('click',function(ev){
					var ev = ev || window.event;
					var $chk = $(this).find(':checkbox');
					if($chk.is(':checked')){
						for(var i=0;i<ME.checkVal.length;i++){
							if(ME.checkVal[i] == $chk.attr('value')){
								ME.checkVal.splice(i,1);
							}
							if(ME.checkText[i] == $chk.attr('text')){
								ME.checkText.splice(i,1);
							}
						}
						$chk.prop('checked',false);
					}else{
						ME.checkVal.push($chk.attr('value'));
						ME.checkText.push($chk.attr('text'));
						$chk.prop('checked',true);
					}
					if(ME.options.showText == true){
						var str = ME.checkText.join(',');
						$('#'+id+' .input_text').val(str);
					}
					$('#'+id+' input[type=hidden]').attr('value',ME.checkVal.join(','))
					ME.setValBox();
					ev.stopPropagation();
					//执行多选的后置事件
					if(ME.options.multiSelect && ME.options.afterSelect){
						ME.options.afterSelect();
					}	
					//ifEditGrid用于确定是否是可编辑中的combogrid，用于下拉选中后进行可编辑表格中的数据保存
					if(ME.options.ifEditGrid == true){
						var oTr = $('#'+ME.ID).closest('tr');
						var editgrid_ID = $('#'+ME.ID).closest('form').attr('id');
						var editgrid_id = editgrid_ID.substring(0,editgrid_ID.length - 5);

						if(oTr.hasClass('editing')){
							$('#'+editgrid_id).EditableGrid('saveValue','editing');
						}else{
		                    $('#'+editgrid_id).EditableGrid('saveValue','adding');
						}				
					}			
				})
				$wrap.find(':checkbox').bind('click',function(ev){
					var ev = ev || window.event;
					var $chk = $(this);
					if($chk.is(':checked')){
						ME.checkVal.push($chk.attr('value'));
						ME.checkText.push($chk.attr('text'));
						$chk.prop('checked',true);
					}else{
						for(var i=0;i<ME.checkVal.length;i++){
							if(ME.checkVal[i] == $chk.attr('value')){
								ME.checkVal.splice(i,1);
							}
							if(ME.checkText[i] == $chk.attr('text')){
								ME.checkText.splice(i,1);
							}
						}
						$chk.prop('checked',false);
					}
					if(ME.options.showText == true){
						var str = ME.checkText.join(',');
						$('#'+id+' .input_text').val(str);
					}
					$('#'+id+' input[type=hidden]').attr('value',ME.checkVal.join(','))
					ME.setValBox();				
					//执行多选的后置事件
					if(ME.options.multiSelect && ME.options.afterSelect){
						ME.options.afterSelect();
					}
					//ifEditGrid用于确定是否是可编辑中的combogrid，用于下拉选中后进行可编辑表格中的数据保存
					if(ME.options.ifEditGrid == true){
						var oTr = $('#'+ME.ID).closest('tr');
						var editgrid_ID = $('#'+ME.ID).closest('form').attr('id');
						var editgrid_id = editgrid_ID.substring(0,editgrid_ID.length - 5);

						if(oTr.hasClass('editing')){
							$('#'+editgrid_id).EditableGrid('saveValue','editing');
						}else{
		                    $('#'+editgrid_id).EditableGrid('saveValue','adding');
						}				
					}
					ev.stopPropagation();
				})
			}
			
		},
		/**
        功能：模糊查询
         */
		keyToSearch: function(){
			var ME = this;
			var id = ME.ID;
			var text = '';
			var timer = null;
			var $wrap = $('div[for="'+ME.ID+'"]');

			$('#'+id+' .input_text').bind('click',function(ev){
				var ev = ev || window.event;
				ME.collapseTable();
				if($wrap.hasClass('collapse_table') == false) {
					var data = {page: 1, rows: ME.options.pageSize};
					ME.loader(data);
				}
				ev.stopPropagation();
			})
            $('#'+id+' .input_text').bind('keyup click',function(ev){
				clearTimeout(timer);
				if(ev.keyCode != 13 && ev.keyCode != 38 && ev.keyCode != 40 ) {
				   $wrap.find('.data_panel').removeClass('collapse_table');
			       $wrap.find('.combogrid_page').removeClass('collapse_table');
					timer = setTimeout(function () {
						//$('#' + id + ' input[type=hidden]').val('');
						text = $('#' + id + ' .input_text').val();
						var param = ME.options.textField;
						var data = {page: 1, rows: ME.options.pageSize};
						data[param] = text;
						if (text == '') {
							$('#' + id + ' input[type=hidden]').val('');
						}
						ME.loader(data);
						if (ME.options.isWrite) {
							if ($.trim($('#' + id + ' input[type=hidden]').val()) == '') {
								$('#' + id + ' input[type=hidden]').val($('#' + id + ' .input_text').val())
							}
						}
						if (ME.options.isWrite && ME.compareFn) {
							ME.compareFn($('#' + id + ' input[type=hidden]').val());
						}
					}, 800);
				}
			});

		},
		/**
        功能：键盘选择下拉列表
         */
		keyToSelect: function(data){
			var ME = this;
			var id = ME.ID;
			var $wrap = $('div[for="'+ME.ID+'"]');
			var count = 0;
				$('#' + id+',[for="'+ME.ID+'"] .data_panel').unbind('keydown');
				$('#' + id+',[for="'+ME.ID+'"] .data_panel').bind('keydown', function (ev) {
					var ev = window.event || ev;
					if (ev.keyCode == 13) {
						ME.selectRow(data);
						ME.collapseTable();
						return false;
					} else if (ev.keyCode == 38) {
						count = $wrap.find('.data_panel .high_light').index() - 1;
						var index = count % $wrap.find('.data_panel tr').length;
						ME.highLight( $wrap.find('.data_panel tr:eq(' + index + ')'));
					} else if (ev.keyCode == 40) {
						count =  $wrap.find('.data_panel .high_light').index() + 1;
						var index = count %  $wrap.find('.data_panel tr').length;
						ME.highLight( $wrap.find('.data_panel tr:eq(' + index + ')'));
					}
				})
		},
		/**
        功能：获取所选选项的隐藏值
         */
		getValue: function(){
			var ME = this;
			var id = ME.ID;
			var val = $('#'+id+' input[type=hidden]').val();
			return val;
		},
		/**
        功能：鼠标点击右侧下拉图表进行展开收缩下拉列表
         */
		mouseToCollapse: function(){
			var ME = this;
			var id = ME.ID;
			var $wrap = $('div[for="'+ME.ID+'"]');

			if(ME.options.icon == true){
				$('#' + id + ' .tocollapse').bind('click', function (ev) {
					var ev = ev || window.event;
					ME.collapseTable();
					if($wrap.find('.data_panel').hasClass('collapse_table') == false){
							ME.loader();
					}
                    ev.stopPropagation();
				})
			}
		},
		/**
        功能：触发展开收缩下拉列表
         */
		collapseTable: function(){
			var ME = this;
			var id = ME.ID;
			var $wrap = $('div[for="'+ME.ID+'"]');
            //设置下拉列表的位置
		    var top = $('#'+id).offset().top+30;
		    var left = $('#'+id).offset().left;
		    $wrap.css({'top':top,'left':left});
			//影藏其他有可能的下拉列表
            $('div.table_wrap').not('[for="'+ME.ID+'"]').addClass('collapse_table');
            $('ul.item_list').addClass('item_display');  
			if(ME.options.readonly == false) {
				$wrap.toggleClass('collapse_table');
			}

		},
		clickOtherToHideTable: function(){
			var ME = this;
			var id = ME.ID;
			var $wrap = $('div[for="'+ME.ID+'"]');
			$('body').bind('click',function(){
                 $wrap.addClass('collapse_table');

			})
		},
		/**
        功能：设置默认选中的值
        参数:由隐藏的值和显示的值组成的数组
         */
		setAllValue: function(arr){
			var ME = this;
			var id = ME.ID;
			$('#'+id+' input[type=hidden]').val(arr[0]);
			$('#'+id+' .input_text').val(arr[1]);
			if(ME.options.multiSelect == true){
				ME.checkVal = arr[0].split(',')
				ME.checkText = arr[1].split(',');
			}
		},
		/**
        功能：设置默认选中的值
        参数：需设置的影藏值
         */
		setValue:function(v){
			var ME = this;
			var id = ME.ID;
			var selected = v;
			var data = {page:1};
			if($('#'+id+' input[type=hidden]').attr('value') != '' && $('#'+id+' input[type=hidden]').attr('value') != undefined){
				selected = $('#'+id+' input[type=hidden]').attr('value');
				data[ME.options.idField] = selected;
				if(ME.options.multiSelect == true){
					ME.checkVal = ME.checkVal.concat(selected.split(','));
				}
			}else if(v != '' && v != undefined && v != null){
				$('#'+id+' input[type=hidden]').attr('value',v);
			}else{
				return false;
			}

			var strparam = '';
			for(var attr in data){
				strparam += attr +'='+ data[attr]+'&';
			}
			var url = ME.options.url+'?'+strparam;
			var cacheData = window.sessionStorage.getItem(url);
			var val = '';
			if(cacheData  && ME.options.isCache){
				cacheData = JSON.parse(cacheData);
				if(ME.options.multiSelect == true){
					for (var i = 0; i < cacheData.rows.length; i++){
						for(var j = 0;j < ME.checkVal.length;j ++){
							if (cacheData.rows[i][ME.options.idField] == ME.checkVal[j]){
								ME.checkText.push(cacheData.rows[i][ME.options.textField]);
                                val += ','+ cacheData.rows[i][ME.options.textField];
							}
						}
					}
					$('#' + id + ' .input_text').val(val);
				}else{
					for (var i = 0; i < cacheData.rows.length; i++){
						if (cacheData.rows[i][ME.options.idField] == selected){
							$('#' + id + ' .input_text').val(cacheData.rows[i][ME.options.textField]);
						}
					}
				}
			}else{
				var opurl = ME.options.url;
			    var opidField = ME.options.idField;
                var vurl = opurl;
                if(opurl.indexOf(opidField)>0){
                    var opsub=opurl.substring(opurl.indexOf(opidField));
                    var opfield = opsub.split("&")[0];
                    var opfieldvalue = opfield.split("=")[1];
                    vurl = ME.options.url.replace(opfieldvalue,v);
                }else{
                    vurl = ME.options.url+'&'+ME.options.idField+'='+v;
                }
                
				$.ajax({
					type: ME.options.method,
					url: vurl,
					async: false,
					data: data,
					cache:false,
					success: function (data) {
                        if(typeof(data) != "object"){
                            data = JSON.parse(data);
                        }
						if(ME.options.multiSelect == true){
							for (var i = 0; i < data.rows.length; i++){
								for(var j = 0;j < ME.checkVal.length;j ++){
									if (data.rows[i][ME.options.idField] == ME.checkVal[j]){
										ME.checkText.push(data.rows[i][ME.options.textField]);
										val += ','+ data.rows[i][ME.options.textField];
									}
								}
							}
							$('#' + id + ' .input_text').val(val);
						}else{
							for (var i = 0; i < data.rows.length; i++){
								if (data.rows[i][ME.options.idField] == selected){
									$('#' + id + ' .input_text').val(data.rows[i][ME.options.textField]);
								}
							}
						}
						var kn = this.url + '?' + this.data + '&';
						var str = JSON.stringify(data);
						window.sessionStorage[kn] = str;
					},
					error: function (){
					}
				});
			}
			if($.trim(selected) == ''){
				$('#'+id+' input[type=hidden]').attr('value','');
				$('#' + id + ' .input_text').val('');

			}
		},
		/**
        功能：改变ajax请求参数
        参数：参数
         */
		setParam: function(param){
			this.setparam = param;
		},
		/**
        功能：设置前置事件
        参数: 函数
         */
		beforeSelect: function(fn){
			this.paramFn = fn;
		},
		/**
        功能：设置后置事件
        参数: 函数
         */
		afterSelect: function (fn) {
			this.afterFn = fn;
		},
		/**
        功能：传入输入的后置事件
        参数: 函数
         */
		toCompare: function(fn){
		   	this.compareFn = fn;
		},
		/**
        功能：切换只读状态
        参数: true为只读
         */
		setReadOnly: function(i){
			var ME = this;
			var id = ME.ID;
			var $wrap = $('div[for="'+ME.ID+'"]');
			if(i == true){
				$('#'+id+' .input_text').prop('disabled','disabled');
				$('#'+id+' .text_box').css('background-color','#EEEEEE')
				$wrap.find('.data_panel').css('display','none');
				$wrap.find('.combogrid_page').css('display','none');
				ME.options.readonly = true;
			}else{
				$('#'+id+' .input_text').removeAttr('disabled');
				$('#'+id+' .text_box').css('background-color','white')
				$wrap.find('.data_panel').css('display','');
				$wrap.find('.combogrid_page').css('display','');
				ME.options.readonly = false;
			}
		},
		/**
        功能：改变验证规则
        参数: 验证规则
         */
		setCheck: function(str){
			var ME = this;
			var id = ME.element.context.id;

			$('#'+id).attr('check',str);
			$('#'+ME.ID+' input.input_text').attr('check',str);

			$('#'+ME.ID).find('span.tips').remove();

		//	if(ME.options.showTips == true){
				var check = $('#'+ME.ID+' input[type=hidden]').attr('check');
				var checkArr = check.split(',');
				var arr = [];
				for(var k=0;k<checkArr.length;k++){
					arr = checkArr[k].split(':');
					if(arr[0] == 'required'){
						$('#'+ME.ID).prepend('<span class="tips">*</span>')
					}
				}
				$('#'+ME.ID+' span.tips').parent('div').css('outline','none');

			//}
		},
		/**
        功能：返回多选所有选中的隐藏的值
         */
		selectCheckbox:function(){//!
			var ME = this;
			var id = ME.ID;
			return ME.checkVal;
		},
		/**
        功能：设置多选的默认选中的值
        参数: 由影藏值组成的数组
         */
		setCheckboxVal: function(arr){
			var ME = this;
			var id = ME.ID;
			ME.checkVal = ME.checkVal.concat(arr)
			$.ajax({
				type: ME.options.method,
				url: ME.options.url,
				cache:false,
				success: function (data) {
					data = JSON.parse(data);
					for (var i = 0; i < data.rows.length; i++) {
						for(var j = 0;j < arr.length; j++){
							if (data.rows[i][ME.options.idField] == arr[j]) {
								ME.checkText.push(data.rows[i][ME.options.textField]);
							}
						}
					}
					var kn = this.url + '?' + this.data + '&';
					var str = JSON.stringify(data);
					window.sessionStorage[kn] = str;
					ME.setValBox();
				},
				error: function (){
				}
			});
		},
		/**
        功能：多选选中选项显示在单独设置的容器中
         */
        setValBox: function(){//!
            var ME = this;
            var id = ME.element.context.id;
            $('div[boxFor='+id+'] table').html(' ');
            for(var i=0;i<ME.checkText.length;i++){
                //$('div[boxFor='+id+'] table').append('<tr><td width="20"><span class="glyphicon glyphicon-remove-circle" index="'+ME.checkVal[i]+'" text="'+ME.checkText[i]+'"></span></td></td><td>'+ME.checkText[i]+'</td></tr>');
                $('div[boxFor='+id+'] table').append('<tr><td>&nbsp&nbsp'+ME.checkText[i]+'</td></tr>');
            }
            ME.delCheckVal();
        },
		/**
        功能：多选选中选项显示在单独设置的容器中，删除已选择的项目
         */
		delCheckVal: function(){//!
			var ME = this;
			var id = ME.element.context.id;
			$('div[boxFor='+id+'] table .glyphicon-remove-circle').each(function(){
				var _this = this;
				$(this).bind('click',function(){
					for(var i=0;i<ME.checkVal.length;i++){
						if(ME.checkVal[i] == $(this).attr('index')){
							ME.checkVal.splice(i,1);
						}
						if(ME.checkText[i] == $(this).attr('text')){
							ME.checkText.splice(i,1);
						}
					}
					$(_this).parent().parent().remove();
				})
			})
		},
		destroy: function(){
			$.Widget.prototype.destroy.call(this);
		}

	})

})(jQuery);/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */

;
(function ($, undefined) {
    $.widget("RUI.RGrid", {
        options: {
            dataUrl: null,
            colNames: null,
            colModel: null,
            width: null,
            height: null,
            onRowDbClick: null,
            afterRowInsert: null,
            isDefine: null,
            multiSelect: true,
            sumFieldColumn: null,
            rownumWidth: '25',
            method: 'POST',
            baseParams: {}
        },
        _create: function () {
            var self = this;
            var id = self.element.attr('id');
            var op = self.options;
            var onRowDbClick = op.onRowDbClick;
            var afterRowInsert = op.afterRowInsert;
            var w_height = $(window).height();
            //加上表头高度和翻页高度
            var otherDivHeight = 76;
            var rowArr = [];

            if (op.height) {
                w_height = op.height;
            } else if ($('.operation_block').length != 0) {  //企金Saas平台
                w_height = "auto";
            } else {//fcloud平台
                //该行代码用于tab里面是iframe时,有display为none的tab中的表格没有高度问题（原因是iframe为隐藏时，iframe中的window高度为0）
                if (w_height <= 0) {
                    w_height = $(window.parent.document).find('iframe').css('height');
                }
                if ($('.grid_operate').length != 0) {
                    //49 ==> $('.grid_operate').outerHeight(true);因为隐藏掉的tab页中无法获取其高度，所以直接写上49
                    otherDivHeight += 49;
                }
                w_height -= (otherDivHeight + 10);
                rowArr = [50, 100, 200, 300];
            }
            var w_contentPage = $(window).width() - op.width;
            var grid_selector = "#" + id;
            var pager_selector = "#" + id + "-grid-pager";
            var parent_column = $(grid_selector).closest('[class*="col-"]');
            $(window).on('resize.jqGrid', function () {
                $(grid_selector).jqGrid('setGridWidth', parent_column.width());

            })
            $(window).bind('resize', function () {
                var w_height = $(window).height();
                //加上表头高度和翻页高度
                var otherDivHeight = 76;
                if (op.height) {
                    w_height = op.height;
                } else if ($('.operation_block').length != 0) {//企金Saas平台
                    w_height = null;
                } else {//fcloud平台
                    //该行代码用于tab里面是iframe时,有display为none的tab中的表格没有高度问题（原因是iframe为隐藏时，iframe中的window高度为0）
                    if (w_height <= 0) {
                        w_height = $(window.parent.document).find('iframe').css('height');
                    }
                    if ($('.grid_operate').length != 0) {
                        //49 ==> $('.grid_operate').outerHeight(true);因为隐藏掉的tab页中无法获取其高度，所以直接写上49
                        otherDivHeight += 49;
                    }
                    w_height -= (otherDivHeight + 10);
                }
                $(grid_selector).jqGrid('setGridHeight', w_height);
            })
            $(document).on('settings.ace.jqGrid', function (ev, event_name, collapsed) {
                if (event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed') {
                    setTimeout(function () {
                        $(grid_selector).jqGrid('setGridWidth', parent_column.width());
                    }, 0);
                }
            })
            //根据显示列的数量，确定grid是否自适应宽度
            var isFit = false;
            var viewColNum = op.colModel.length;
            for (var i = 0; i < op.colModel.length; i++) {
                if (op.colModel[i].hidden == true) {
                    viewColNum--;
                }
            }
            //显示列小于8列的，宽度自适应
            if (viewColNum < 8) {
                isFit = true;
            }
            if (op.isDefine) {
                var actFormatter = function (cellvalue, options, rawObject) {
                    var detail = ' ';
                    if (cellvalue == 'true') {
                        detail = '<a class="operate" src="javascript:;" style=" text-decoration: underline !important;cursor: pointer;" index="' + options.rowId + '">' + op.isDefine[1] + '</a>';
                    } else {
                        detail = '<button index="' + options.rowId + '">' + op.isDefine[1] + '</button>'
                    }
                    return detail;
                };
                op.colNames.push('操作');
                op.colModel.push({name: 'visible', formatter: actFormatter, sortable: false});
            }
            var lastSel;
            jQuery(grid_selector).jqGrid({
                url: op.dataUrl,
                datatype: "json",
                height: w_height,
                autowidth: true,
                colNames: op.colNames,
                colModel: op.colModel,
                rownumbers: true,
                rownumWidth: op.rownumWidth,
                viewrecords: true,
                mtype: op.method,
                shrinkToFit: isFit,
                rowNum: 50,
                rowList: rowArr,
                jsonReader: {
                    root: "rows",
                    page: "page",
                    total: "totalpage",
                    records: "total",
                    repeatitems: false,
                    id: "0"
                },
                postData: op.baseParams,
                pager: pager_selector,
                loadtext: "数据加载中，请稍候...",
                altRows: true,
                multiselect: op.multiSelect,
                multiboxonly: true,
                ondblClickRow: function (rowid, iRow, iCol, e) {
                    var rowData = $(grid_selector).jqGrid('getRowData', rowid);
                    onRowDbClick && onRowDbClick(rowid, rowData);
                },
                loadComplete: function (data) {
                    var table = this;
                    setTimeout(function () {
                        updatePagerIcons(table);
                        enableTooltips(table);
                    }, 0);
                    if ($.trim(op.sumFieldColumn).length > 0) {
                        $('.search_wrap .total[id=' + op.sumFieldColumn + ']').show();
                        $('.search_wrap .total[id=' + op.sumFieldColumn + '] span').eq(0).html(data.total);
                        $('.search_wrap .total[id=' + op.sumFieldColumn + '] span').eq(1).html(data.sumFieldColumn);
                    }
                },
                gridComplete: function () {
                    jQuery(grid_selector).find('a.operate,button').each(function () {
                        $(this).click(function () {
                            var index = $(this).attr('index');
                            var idata = jQuery(grid_selector).jqGrid('getRowData', index);
                            op.isDefine[0](idata);
                        })
                    })
                },
                afterInsertRow: function (rowid, lastSel) {
                    afterRowInsert && afterRowInsert(rowid, lastSel);
                }
            });

            $(window).triggerHandler('resize.jqGrid');

            function updatePagerIcons(table) {
                var replacement =
                    {
                        'ui-icon-seek-first': 'ace-icon fa fa-angle-double-left bigger-140',
                        'ui-icon-seek-prev': 'ace-icon fa fa-angle-left bigger-140',
                        'ui-icon-seek-next': 'ace-icon fa fa-angle-right bigger-140',
                        'ui-icon-seek-end': 'ace-icon fa fa-angle-double-right bigger-140'
                    };
                $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function () {
                    var icon = $(this);
                    var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
                    if ($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
                })
            }

            function enableTooltips(table) {
                $('.navtable .ui-pg-button').tooltip({container: 'body'});
                $(table).find('.ui-pg-div').tooltip({container: 'body'});
            }

            $(document).one('ajaxloadstart.page', function (e) {
                $(grid_selector).jqGrid('GridUnload');
                $('.ui-jqdialog').remove();
            });

        },
        _bindEvent: function () {
            var ME = this;
        },
        setGridParam: function (params) {
            var id = this.element.attr('id');
            jQuery("#" + id).setGridParam({postData: params, page: 1}).trigger("reloadGrid");
        },
        getSelectedDatas: function () {
            var id = this.element.attr('id');
            var rowId = jQuery("#" + id).getGridParam('selarrrow');
            var rowDatas = new Array();
            for (var i = 0; i < rowId.length; i++) {
                var rowData = jQuery("#" + id).getRowData(rowId[i]);
                rowDatas.push(rowData);
            }
            return rowDatas;
        },
        getAllData: function () {
            var id = this.element.attr('id');
            return jQuery("#" + id).getRowData();
        },
        setValue: function (v) {
            var ME = this;
        },
        destroy: function () {
            $.Widget.prototype.destroy.call(this);
        }
    });
})(jQuery);/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */

/** 
 * @name RButton
 * @class 
 * 按钮组件，代替原始html中的button，提供了图标的功能并扩展了常用的api，通常用于事件和动作触发。
 */

; 
(function($, undefined) {
    $.widget("RUI.RButton", {
    options : {
			onClick: null,
			isShow: true
	},
	_create : function() {
			var ME = this;
			// 绑定事件
            ME._bindEvent();
	},
	_init: function() {
		var ME = this;
		var id = ME.element.context.id;
		if(ME.options.isShow == false){
            $('#'+id).hide();
		}
	},
	_bindEvent : function() {
		var ME = this;
		ME.element.click(function(e) {
		ME.click();
    });
	},
	click :function(e){				
		var ME = this;
		var op = ME.options;
		
		if ($.isFunction(op.onClick)) {
		    op.onClick.call(ME);
		}                      			
	},
	setText: function(val){
		var ME = this;
		var id = ME.element.context.id;
		$('#'+id+' span').html(val);
	},
	setInvisible:function(param){
		var ME = this;
		var id = ME.element.context.id;
		$('#'+id).removeAttr('visible');
        if(param){
			$('#'+id).hide();
		}else{
			$('#'+id).show();
		}
	},
	destroy : function() {
		$.Widget.prototype.destroy.call(this);
	}
  });
})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */


/**
 * @name FWin
 * @class 
 * 弹出窗， 用于弹窗方式进行数据展示或交互。典型的如增加，修改，查看的页面。
 */

/**@lends FWin# */

/**
 * 窗体的标题。
 * @type String
 * @name FWin#title
 * @default ""
 */

/**
 * 通过setHtml方法设置html片段后触发该事件，或者设置pageUrl属性（isIframe属性为false）以ajax的方式成功加载html片段后触发该事件。注意事项：&lt;f:win&gt;A&lt;/f:win&gt; 或者&lt;@win &gt;Av/@win&gt;，其中A的值可以为空格，回车，具体页面内容，①当A是以上值时，调用组件的show方法触发onSetHtml事件。②当A没值时，且未设置pageUrl属性，那么调用组件的show方法时不触发onSetHtml事件。③当A没值时，设置pageUrl(isIframe属性为false)，请求成功后都会触发onSetHtml事件。
 * @event
 * @name FWin#onSetHtml
 * @type Function
 * @example
 */

/**
 * 调用show方法时，触发onShow事件。用户可以在该事件中对组件中的表单进行重新
 * @event
 * @name FWin#onShow
 * @type Function
 * @example
 */

; (function($, undefined) {
    $.widget('RUI.RWin', {
    	options : {
    		height : null,
    		width : null,
    		maxable : false,
            onClose : true,
            hasCloseBtn : true
		},
		_create : function() {
			var ME = this;
			
		},
		createWin : function(url) {
			var ME = this;
			var id = '#'+ME.element.attr('id');
			var width = ME.options.width;
			var height = ME.options.height;
			var maxable = ME.options.maxable;
            var onClose = ME.options.onClose;
            var hasCloseBtn = ME.options.hasCloseBtn;
			var iframeid = '#iframe-'+ME.element.attr('id');
			$(id).on('show.bs.modal', function (event) {
				var $iframe=$(this).find('iframe');
				var h_param=height,w_param=width,w_final,h_final,top,left;
                h_param=$(window).height();
				w_param =window.innerWidth  || document.documentElement.clientWidth;		

				$iframe.removeAttr('height');
				$iframe.removeAttr('src');

                if(hasCloseBtn==false){
                    $(this).find('button').hide();
                }

				if(maxable==true){
					w_final= w_param;
					h_final = h_param;
					top = 0;
					left = 0;
					$iframe.css({'height':h_final-30});
				}else{
					w_final = width;
					h_final = height;
					top = (h_param-height)/2;
					left = (w_param-width)/2;
					$iframe.css({'height':(h_final-30)+'px'});
				};
				$(this).children('.modal-dialog').css({
					position: 'absolute',
					width: w_final,
					height:h_final,
					top: top,
					left: left,
					margin: '0'
				});
				$(id).on('shown.bs.modal', function (event) {
					$(iframeid).attr("src",url);
				})
				$(this).find('.modal-content').css({
					width: w_final,
					height:h_final,
				});
				$(this).find('.modal-body').css({'height':(h_final-30)});
			});
		  $(window).resize(function(){
			  var h_param=height,w_param=width,w_final,h_final,top,left;
			  h_param=$(window).height();
			  w_param =window.innerWidth  || document.documentElement.clientWidth;
              if(hasCloseBtn==false){
                  $(this).find('button').hide();
              }
				if(maxable==true){
					w_final= w_param;
					h_final = h_param;
					top = 0;
					left = 0;
				}else{
					w_final = width;
					h_final = height;
					top = (h_param-height)/2;
					left = (w_param-width)/2;
				};
				$(id).children('.modal-dialog').css({				
					top: top,
					left: left,
				});
		  })
		  $(id).modal('show');
		},
		_bindEvent : function() {
			var ME = this;
		},
		setPageUrl : function(url) {
			var ME = this;
		},
		destroy : function() {
			$.Widget.prototype.destroy.call(this);
		}
	});
})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */

/**
 * @name RCalendar
 * @class 
 * 日历组件，供用户选择日期和时间的输入以及格式化。
 */
;(function($,undefined){
	$.widget('RUI.RCalendar',{
		options:{
			skin:'twoer',
			dateFmt:'',
			errDealMode: 1,
			showTips:false,
			staticShow:false,
			afterSelect:null,
            readonly:false
		},
		_init: function(){
			var ME = this;
			var id = ME.element.context.id;
			if(ME.options.staticShow){
				    ME.options.eCont = id;
                if(ME.options.afterSelect){
                	ME.options.onpicked = ME.options.afterSelect;
                	WdatePicker(ME.options);
                }
			}else{
				$('#'+id).wrap('<div id="'+id+'_wrap"></div>');
				$('#'+id+'_wrap').css('position','relative');

				if(ME.options.showTips == true){
					var check = $('#'+id).attr('check');
					var checkArr = check.split(',');
					var arr = [];
					for(var k=0;k<checkArr.length;k++){
						arr = checkArr[k].split(',');
						if(arr[0] == 'required'){
							$('#'+id+'_wrap').prepend('<span class="tips">*</span>');
						}
					}
				}
	            var val;
				$('#'+id).click(function(){
					WdatePicker(ME.options);
	             })
			}


		},
		setValidDates: function(param){//param->{minDate:'%y-%M-01',maxDate:'%y-%M-%ld'}
             var ME = this;
             var id = ME.element.context.id;
             ME.options = $.extend(true,ME.options,param);
		},
		afterSelect:function(fn){
             var ME = this;
             var id = ME.element.context.id;
             var param = {onpicked:fn};
             ME.options = $.extend(true,ME.options,param);
		},
		_create: function(){
            var ME = this;
            var id = ME.element.context.id;
            if(ME.options.readonly == true){
                $('#'+id).attr('readonly','readonly');
                $('#'+id).css('background-color','#EEEEEE');
                $('#'+id).attr('disabled','disabled');
            }
		}
	})
})(jQuery)
/**
 * Created by H on 2016/8/26.
 */
;(function($,undefined){
	$.widget('RUI.RNumberField',{
		options:{
			numFmt:'',
			showTips:false,
			readonly:false
		},
		_init: function(){
		},
		_create: function(){
			var ME = this;
			var ID = ME.element.context.id;
			var timer = null;
			if(ME.options.showTips == true){
				$('#'+ID).wrap('<div  id="'+ID+'_wrap" style="position:relative"></div>');
				var check = $('#'+ID).attr('check');
				var checkArr = check.split(',');
				var arr = [];
				for(var k=0;k<checkArr.length;k++){
					arr = checkArr[k].split(':');
					if(arr[0] == 'required'){
						$('#'+ID+'_wrap').prepend('<span style="position: absolute;left: -8px;top: 8px;color: red;">*</span>')
					}
				}
			}
			var reg = '';
			if(ME.options.numFmt == 'int'){
				$('#'+ID).attr('placeholder','请填写整数');
				$('#'+ID).bind('keyup',function(){
					reg = /^-?\d*$/;
					if(reg.test($('#'+ID).val()) == false){
						var val = $('#'+ID).val();
						$('#'+ID).val(val.substring(0,val.length-1));
					}
				})
			}else{
				$('#'+ID).attr('placeholder','小数点保留至两位');
				if(ME.options.numFmt == 'money'){
					$('#'+ID).attr('isMoney','true');
					$('#'+ID).attr('type','text');
				}
				$('#'+ID).bind('keyup',function(){
					reg =/^\d+(\.+\d{1,2})?$/;
					if(reg.test($('#'+ID).val()) == false){
						var arr = $('#'+ID).val().split('');
            var Rmoney = ''
            for(var i = 0;i<arr.length;i++){
                if(arr[i] !== '.'){
                    Rmoney += arr[i]
                }else {
                    Rmoney += arr[i]
                    Rmoney += arr[i + 1] || ''
                    Rmoney += arr[i + 2] || ''
                    break;
                }
            }
            $('#'+ID).val(Rmoney);
					}
				})
			}

			if(ME.options.readonly == true){
				$('#'+ID).attr('readonly','readonly');
				$('#'+ID).css('background-color','#EEEEEE');
			}
            ME.cancelLongPress($('#'+ID));
		},
		cancelLongPress:function(ele){
			var kflag = false;
			ele.bind('keypress',function(e){
                if( kflag ){
		            e.preventDefault();
			    }else{
			        kflag = true;
			    }
			})
			
			ele.bind('keyup', function(e){
			    kflag = false;
			});
		}
	})
})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */

/**
 * @name RTextArea
 * @class 
 * 文本输入框，输入文字，与html原始的TextArea一致。
 */
; 
(function($, undefined) {
    $.widget("RUI.RTextArea", {
        options : {
			selectable : true,
			viewtype : 2,
			showTips : false,
			readonly : false
		},
		_create : function() {
			var ME = this;
			var id = ME.element.context.id;
			if(ME.options.showTips == true){
				$('#'+id).wrap('<div id="'+id+'_wrap" style="position:relative"></div>');
				var check = $('#'+id).attr('check');
				var checkArr = check.split(',');

				var arr = [];
				for(var k=0;k<checkArr.length;k++){
					arr = checkArr[k].split(':');
					if(arr[0] == 'required'){
						$('#'+id+'_wrap').prepend('<span style="position: absolute;left: -8px;top: 8px;color: red;">*</span>')
					}
				}
			}
			if(ME.options.readonly == true){
				$('#'+id).css('background-color','#EEEEEE');
			}
		},
		_bindEvent : function() {
			var ME = this;
		},
		setValue : function(v) {
			var ME = this;
		},
		destroy : function() {
			$.Widget.prototype.destroy.call(this);
		}
	});
})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */

/**
 * @name RTextField
 * @class 
 * 文本输入框，输入文字，与html原始的input[type=text]一致。
 */
; 
(function($, undefined) {
    $.widget("RUI.RTextField", {
        options : {
			selectable : true,
			viewtype : 2,
			showTips: false,
			readonly: false,
			afterInput:null
		},
		ID:'',
		_create : function() {
			var ME = this;
			var id = ME.element.context.id;
            ME.ID = id + '_wrap';

			if(ME.options.readonly == true){
				$('#'+id).attr('readonly','readonly');
				$('#'+id).css('background-color','#EEEEEE');
				$('#'+id).prop('placeholder','');
			}

			if(ME.options.showTips == true){
				$('#'+id).wrap('<div id="'+id+'_wrap" style="position:relative"></div>');
				var check = $('#'+id).attr('check');
				var checkArr = check.split(',');

				var arr = [];
				for(var k=0;k<checkArr.length;k++){
					arr = checkArr[k].split(':');
					if(arr[0] == 'required'){
						$('#'+id+'_wrap').prepend('<span class="tips">*</span>');
					}
				}

			}
			if(ME.options.afterInput){
				$('#'+id).bind('blur',function(){
					ME.options.afterInput($('#'+id).val());
				});
			}
		},
		setCheck: function(str){
			var ME = this;
			var id = ME.element.context.id;

			$('#'+id).attr('check',str);

			$('#'+ME.ID).find('span.tips').remove();

			//if(ME.options.showTips == true){
			var check = $('#'+id).attr('check');
			var checkArr = check.split(',');
			var arr = [];
			for(var k=0;k<checkArr.length;k++){
				arr = checkArr[k].split(':');
				if(arr[0] == 'required'){
					$('#'+ME.ID).prepend('<span class="tips">*</span>')
				}
			}
			$('#'+ME.ID+' span.tips').parent('div').css('outline','none');
			//}
		},
		_bindEvent : function() {
			var ME = this;
		},
		setValue : function(v) {
			var ME = this;
		},
		setReadOnly : function(param){
			var ME = this;
			var id = ME.element.context.id;
			if(!param){
               $('#'+id).removeAttr('readonly');
			   $('#'+id).css('backgroundColor','white');
			}else{
               $('#'+id).attr('readonly','readonly');
			   $('#'+id).css('backgroundColor','#EEEEEE');
			}
		},
		destroy : function() {
			$.Widget.prototype.destroy.call(this);
		}
	});
})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */

/**
 * @name RTree
 * @class 
 * 
 */
;
(function($,undefined){
    $.widget("RUI.RTree",{
        options:{
            dataUrl:"",
            selectModel:false,
            onNodeClick:null
        },
        treeData:null,
        _create: function(){
            var ME = this;
            ME.getData();
        },
        getData: function(){
            var ME = this;
            $.ajax({
                url: ME.options.dataUrl,
                type: 'post',
                dataType: 'json',
                async:false,
                success: function(data){
                    ME.setTree(data);
                },
                error: function(){}
            });
        },
        setTree: function(data){
            var ME = this;
            var tid = ME.element.context.id;

            $('#'+tid).html(' ');
            data = data.data;
            ME.treeData = data;
            for(var i=0;i<data.length;i++){
                 var html = '';
                 if(data[i].children){            
                     html = '<li id="tree_'+data[i].id+'" ifParent="true" class="tree-branch"><div class="tree-branch-header"><i class="tree-toggle fa fa-plus-square-o"></i><span class="tree-branch-title"><i class="tree-chk fa fa-square-o" haschecked="'+data[i].checked+'"></i><span class="tree-branch-name">'+data[i].name+'</span></span></div></li>';
                     $('#'+tid).append(html);
                     ifchild(data[i]);
                 }else{
                     html = '<li id="tree_'+data[i].id+'" class="tree-branch"><div class="tree-branch-header"><span class="tree-branch-title"><i class="tree-chk fa fa-square-o" haschecked="'+data[i].checked+'"></i><span class="tree-branch-name">'+data[i].name+'</span></span></div></li>';
                     $('#'+tid).append(html);
                 };
            };
            function ifchild(item){
                var  inhtml = ' <ul id="child_'+item.id+'"  class="tree-branch-children"></ul>';
                $('#'+tid+' #tree_'+item.id).append(inhtml);

                if(item.children) {
                    for (var j = 0; j < item.children.length; j++) {
                        if (item.children[j].children) {
                            inhtml = '<li id="tree_'+item.children[j].id+'" ifParent="true"  class="tree-branch"><div class="tree-branch-header"><i class="tree-toggle fa fa-plus-square-o" ></i><span class="tree-branch-title"><i class="tree-chk fa fa-square-o" haschecked="'+item.children[j].checked+'"></i><span class="tree-branch-name">'+item.children[j].name+'</span></span></div></li>';
                            $('#'+tid+' #child_'+item.id).append(inhtml);
                            ifchild(item.children[j]);
                        } else {
                            inhtml = '<li id="tree_'+item.children[j].id+'" class="tree-branch"><div class="tree-branch-header"><span class="tree-branch-title"><i class="tree-chk fa fa-square-o" haschecked="'+item.children[j].checked+'"></i><span class="tree-branch-name">'+item.children[j].name+'</span></span></div></li>';
                            $('#'+tid+' #child_'+item.id).append(inhtml);
                        }
                    }
                }
            }
            ME.toggleTree();
            if(ME.options.selectModel){
                ME.toggleCheckBox();
                ME.setCheck();
            }else{
                $('#'+tid).find('i.tree-chk').remove();
                ME.toMarkNode();
            }
            if(ME.options.onNodeClick){
                $('#'+tid+' span.tree-branch-name').each(function(){
                    var hid = $(this).closest('li').attr('id').substring(5);
                    $(this).bind('click',function(){
                        ME.options.onNodeClick(hid);
                    })
                })
            }
        },
        toggleTree: function(){
            var ME = this;
            var tid = ME.element.context.id;
            $('#'+tid+' [ifParent=true]').children('.tree-branch-header').children('i').bind('click',function(){                
                 if(!$(this).attr('ifShow') || $(this).attr('ifShow') == 'false'){
                     $(this).parent().siblings('ul').show();
                     $(this).attr('ifShow',true);
                     $(this).removeClass('fa-plus-square-o').addClass('fa-minus-square-o');
                 }else{
                     $(this).parent().parent().find('ul').hide();
                     $(this).parent().parent().find('[ifShow=true]').removeClass('fa-minus-square-o').addClass('fa-plus-square-o');
                     $(this).parent().parent().find('[ifShow=true]').attr('ifShow',false);
                     $(this).attr('ifShow',false);
                 }
            })
        },
        toggleCheckBox: function(){
            var ME = this;
            var tid = ME.element.context.id;

            $('#'+tid+' .tree-chk').bind('click',function(){
                if($(this).hasClass('fa-square-o')){
                    $(this).removeClass('fa-square-o').addClass('fa-check-square fa-check-y');
                    $(this).parent().parent().siblings('ul').find('.tree-chk').removeClass('fa-square-o fa-check-n').addClass('fa-check-square fa-check-y');
                    $(this).parent().parent().parent().attr('state','all-checked');
                    $(this).parent().parent().siblings('ul').find('li').attr('state','all-checked');
                    ME.findchecked($(this).parent().parent().parent(),true);
                }else{
                    $(this).removeClass('fa-check-square fa-check-y').addClass('fa-square-o');
                    $(this).parent().parent().siblings('ul').find('.tree-chk').addClass('fa-square-o').removeClass('fa-check-square fa-check-y fa-check-n');
                    $(this).parent().parent().parent().attr('state','no-checked');
                    $(this).parent().parent().siblings('ul').find('li').attr('state','no-checked');
                     ME.findchecked($(this).parent().parent().parent(),false);
                }
            })
            
        },
        setCheck: function(){
             var ME = this;
             var tid = ME.element.context.id;
             $('#'+tid).find('.tree-chk').each(function(){                     
                if($(this).attr('haschecked') == 'true'){                 
                   if($(this).parent().parent().parent().attr('ifparent') != 'true'){
                           $(this).addClass('fa-check-square fa-check-y').removeClass('fa-square-o');
                           $(this).parent().parent().parent('li').attr({'state':'all-checked'});                    
                     }
                }
             })
             $('#'+tid+' [state="all-checked"]').each(function(){
                   findCheck($(this));
             })
             function findCheck(obj){
                 var oUl = obj.closest('ul');
                 if(oUl.children('li').length > oUl.children('li[state="all-checked"]').length){
                      oUl.closest('li').attr('state','half-checked');
                      oUl.closest('li').children('div').find('span i').removeClass('fa-square-o').addClass('fa-check-square fa-check-n');
                 }else{
                      oUl.closest('li').attr('state','all-checked');
                      oUl.closest('li').children('div').find('span i').removeClass('fa-square-o').addClass('fa-check-square fa-check-y');
                 }
                 if(!oUl.hasClass('rtree')){
                      findCheck(oUl.closest('li'));                   
                 }
             }
        },
        findchecked: function(obj,ifchecked){
            var ME = this;
            var bli = obj.siblings('li').length;
            var cbli = obj.siblings('li[state="all-checked"]').length;
            var hbli = obj.siblings('li[state="half-checked"]').length;
            var selfCheck = obj.attr('state');
            if(ifchecked){
                //假如兄弟全部已被选中
                if(bli == cbli && selfCheck == "all-checked"){//除了兄弟的个数与兄弟中全部被选中的个数一致，自身也要是全部选中的
                    obj.parent().siblings('div').find('.tree-chk').removeClass('fa-square-o fa-check-n').addClass('fa-check-square fa-check-y');
                    obj.parent().parent().attr('state','all-checked');                
                }else{//假如兄弟有没被选中的
                    obj.parent().siblings('div').find('.tree-chk').removeClass('fa-square-o fa-check-y').addClass('fa-check-square fa-check-n');
                    obj.parent().parent().attr('state','half-checked');   
                }
                if(obj.parent().parent().length > 0){
                    ME.findchecked(obj.parent().parent(),true);
                 }  
            }else{
                //假如兄弟全部已未被选中
                if(cbli == 0 && hbli == 0 && selfCheck =='no-checked'){//除了兄弟的个数与兄弟中全部没被选中的个数一致，自身也要是全部未被选中的
                    obj.parent().siblings('div').find('.tree-chk').addClass('fa-square-o').removeClass('fa-check-square fa-check-y fa-check-n');
                    obj.parent().parent().attr('state','no-checked');                
                }else{
                    obj.parent().siblings('div').find('.tree-chk').removeClass('fa-square-o fa-check-y').addClass('fa-check-square fa-check-n');
                    obj.parent().parent().attr('state','half-checked');  
                }
                if(obj.parent().parent().length > 0){
                    ME.findchecked(obj.parent().parent(),false);
                }  

            }
            
        },
        toMarkNode: function(){
            var ME = this;
            var tid = ME.element.context.id;

            $('#'+tid+' span.tree-branch-name').bind('mousedown',function(){
                $('#'+tid+' span.tree-branch-name').removeAttr('mark');
                 $('#'+tid+' .tree-branch-header').removeClass('tree_active');
                $(this).attr('mark','true')
                $(this).closest('.tree-branch-header').addClass('tree_active');
            })
        },
        expand: function(){
             var ME = this;
             var tid = ME.element.context.id;
             $('#'+tid+' .tree-toggle').removeClass('fa-plus-square-o').addClass('fa-minus-square-o');
             $('#'+tid+' i.tree-toggle').attr('ifshow','true')
             $('#'+tid+' .tree-branch-children').show();  
        },
        close: function(){
             var ME = this;
             var tid = ME.element.context.id;
             $('#'+tid+' .tree-toggle').addClass('fa-plus-square-o').removeClass('fa-minus-square-o');
             $('#'+tid+' i.tree-toggle').attr('ifshow','false')
             $('#'+tid+' .tree-branch-children').hide();  
        },
        refresh: function(){
            var ME = this;  
            ME.getData();
        },
        getValue: function(){
             var ME = this;
             var tid = ME.element.context.id;
             var arr = [];
             var iarr = [];
             if(ME.options.selectModel){
                 $('#'+tid).find('li[state="all-checked"],li[state="half-checked"]').each(function(){
                    var id = $(this).attr('id').substring(5);

                    iarr.push(id);
                 })
                 var jarr = ME.viewjsondata(ME.treeData);
                 for(var i=0;i<iarr.length;i++){
                     for(var j = 0;j<jarr.length;j++){
                          if(jarr[j].id == iarr[i]){
                             arr.push(jarr[j]);
                          }
                     }
                 }
                 
             }else{
                if($('#'+tid).find('[mark="true"]').length > 0){
                    var id = $('#'+tid).find('[mark="true"]').closest('li').attr('id').substring(5);
                    arr.push(id);
                }            
             }   
             return arr;       
        },
        getName: function(){             
             var ME = this;
             var tid = ME.element.context.id;
             var arr = [];

             if(ME.options.selectModel){
                 $('#'+tid).find('li[state="all-checked"],li[state="half-checked"]').each(function(){
                    var name = $(this).children('div').find('span.tree-branch-name').html();
                    arr.push(name);
                 })
             }else{
                var name = $('#'+tid).find('[mark="true"]').html();
                arr.push(name);
             }

             return arr;             
        },
        viewjsondata:function(s){
                var a = [];
                var ME = this;
               
                for(var i = 0, j = s.length; i<j; i++){
                        var r = {};
                        $.extend(r, { "id":s[ i ]["id"], "pid":s[ i ]["pid"], "name":s[ i ]["name"],"leaf":s[ i ]["leaf"]});
                        a.push(r);
                        if(s[ i ]["children"] && s [ i ]["children"].length > 0){
                                $.merge(a, ME.viewjsondata(s[ i ]["children"]));
                        }
                }
                return a;
        }

    })
})(jQuery)/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明
 * ========   =======  ============================================
 *
 * ========   =======  ============================================
 */
;(function($, undefined) {
	$.widget("RUI.RValidate", {
		options:{
			'success':null,
			'opt':null,
			'scroll':false
		},
		_create: function() {
			var ME = this;
		},
		_init: function() {

		},
		validate: function(){
			var ME = this;
			var ID = ME.element.context.id;
			var classname = 'for'+ID;
			$('.'+classname).remove();
			$('#'+ID+' .promptinput').removeClass('promptinput');

			this.checkInput();
			this.checkSelect();
			this.checkTextarea();
			this.checkHidden();
			if($('.promptbox').length == 0){
				if(this.options.success){
					this.options.success(this.options.opt);
				}else{
					return true;
				}				
			}else{
                return false;
			}

		},
		checkHidden: function(){
			var ME = this;
			var iForm = $('#'+ME.element.context.id);

			var hIdden = iForm.find('input[type=hidden]');
			hIdden.each(function(){
				var check = $(this).attr('check');
				var _this = this;
				// if($(_this).attr('name') && $(_this).attr('hid') == undefined){
					if(check == 'required'){
						ME.ifRequired(_this);
					}
				// }
			})
		},
		checkInput: function(){
			var ME = this;
			var iForm = $('#'+ME.element.context.id);

			var iNputs = iForm.find('input[type=text]');
			iNputs.each(function(){
				var check = $(this).attr('check');
				var _this = this;
				if(check !=''&& check != 'undefined' && check != undefined){
					var checkArr = check.split(',');
					$.each(checkArr, function(i,val){
						var eachItemArr = val.split(':');
						switch (eachItemArr[0]){
							case 'required' :
								if(!ME.ifRequired(_this)){
									return false;
								};
							case 'maxlength' :
								ME.checkMax(_this,eachItemArr[1]);
								break;
							case 'minlength' :
								ME.checkMin(_this,eachItemArr[1]);
								break;
							case 'email' :
								ME.ifEmail(_this);
								break;
							case 'cellphone' :
								ME.ifCellphone(_this);
								break;
							case 'telephone' :
								ME.ifTelephone(_this);
								break;
							default : ;
						}

					});
				}
			})
		},
		checkSelect: function(){
			var ME = this;
			var iForm = $('#'+ME.element.context.id);

			var sElects = iForm.find('select');
			sElects.each(function(){
				var check = $(this).attr('check');
				var _this = this;
				if(check !=''&& check != undefined && check != 'undefined' && $(_this).attr('name')){
					ME.ifRequired(_this);
				}
			})
		},
		checkTextarea: function(){
			var ME = this;
			var iForm = $('#'+ME.element.context.id);

			var Textarea = iForm.find('textarea');
			Textarea.each(function(){
				var check = $(this).attr('check');
				var _this = this;
				if(check !=''&& check != undefined){
					var checkArr = check.split(',');
					$.each(checkArr, function(i,val){
						var eachItemArr = val.split(':');
						switch (eachItemArr[0]){
							case 'required' :
								if(!ME.ifRequired(_this)){
									return false;
								};

							case 'maxlength' :
								ME.checkMax(_this,eachItemArr[1]);
								break;
							case 'minlength' :
								ME.checkMin(_this,eachItemArr[1]);
								break;
							default : ;
						}

					});
				}
			})
		},
		ifEmail: function(i){
			var ME = this;
			var str  = $(i).val();
			var reg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			if(!reg.test(str) && $.trim(str)){
				if(ME.options.scroll == false) {
					$(i).addClass('promptinput');
				}
				ME.showPromptbox('不符合邮箱格式',$(i).offset().left,$(i).offset().top,$(i).width());
			}
		},
		ifCellphone: function(i){
			var ME = this;
			var str  = $(i).val();
			var reg = /^1(3|4|5|7|8)\d{9}$/;
			if(!reg.test(str) && $.trim(str)){
				if(ME.options.scroll == false) {
					$(i).addClass('promptinput');
				}
				ME.showPromptbox('不符合手机号码格式',$(i).offset().left,$(i).offset().top,$(i).width());
			}
		},
		ifTelephone: function(i){
			var ME = this;
			var str  = $(i).val();
			var reg = /^0\d{2,3}-?\d{7,8}$/;
			if(!reg.test(str) && $.trim(str)){
				if(ME.options.scroll == false) {
					$(i).addClass('promptinput');
				}
				ME.showPromptbox('不符合电话格式',$(i).offset().left,$(i).offset().top,$(i).width());
			}
		},
        ifRequired: function(i){
            var ME = this;
            var str  = $(i).val();
            var onOff = true;
            var obj = $(i);

            if(i.className == 'input_text'){
                obj = $(i).parent('div');
            }
            if($(i).attr('role') == 'defaultText'){
                obj = $(i).parent();
            }
            if($(i).attr('type') == 'hidden'){
                obj = $(i).parent();
            }
            if($(i).hasClass('hid_val')){
                obj = $(i).parents('form').find('span.combo_text');
            }

            if($(i).parent().parent().next().attr('boxfor')){
                var id = $(i).parent().prev().attr('id');
                str  = $('#'+id+'-box').html();
                if($.trim(str)=='' || str == null){
                    ME.showPromptbox('不能为空',obj.offset().left,obj.offset().top,obj.width());
                    if(ME.options.scroll == false) {
                        if (i.className == 'textbox-value') {
                            $(i).parent('span').addClass('promptinput');
                        }else if($(i).hasClass('input_text')){
                            $(i).parent('div').addClass('promptinput');
                        }else {
                            obj.addClass('promptinput');
                        }
                    }
                    onOff = false;
                }
            }else {
                if(i.nodeName == 'SELECT'){
                    var id = $(i).attr('id')+'_wrap';
                    obj = $('#'+id+' .combo_text');
                    str  = $('#'+id+' select').val()
                }
                if($.trim(str)=='' || str == null){
                    console.log($(i).parent().parent().next().attr('boxfor'));
                    ME.showPromptbox('不能为空',obj.offset().left,obj.offset().top,obj.width());
                    if(ME.options.scroll == false) {
                        if (i.className == 'textbox-value') {
                            $(i).parent('span').addClass('promptinput');
                        }else if($(i).hasClass('input_text')){
                            $(i).parent('div').addClass('promptinput');
                        }else {
                            obj.addClass('promptinput');
                        }
                    }
                    onOff = false;
                }
            }

            return onOff;
        },
		checkMax: function(i,len){
			var ME = this;
			var str  = $(i).val();
			if($.trim(str).length > len){
				if(ME.options.scroll == false) {
					$(i).addClass('promptinput');
				}
				ME.showPromptbox('不能长于'+len+'个字符',$(i).offset().left,$(i).offset().top,$(i).width());
			}
		},
		checkMin: function(i,len){
			var ME = this;
			var str  = $(i).val();
			if($.trim(str).length < len && $.trim(str).length != ''){
				if(ME.options.scroll == false) {
					$(i).addClass('promptinput');
				}
				ME.showPromptbox('不能短于'+len+'个字符',$(i).offset().left,$(i).offset().top,$(i).width());
			}
		},
		destroy: function(){
			$.Widget.prototype.destroy.call(this);
		},
		showPromptbox: function(i,x,y,w){
			var ME = this;
			var iForm = $('#'+ME.element.context.id);
			var classname = 'for'+ME.element.context.id;
			if(ME.options.scroll == true){
				var iForm = $('#'+ME.element.context.id);
				var iTab = iForm.find('.tab_data');
				var tx = iTab.offset().left;
				var ty = iTab.offset().top;
				iTab.append($('<span class="'+classname+'"></span>').text(i).addClass('promptbox').fadeIn().css({'position':'absolute','top':y-ty+20+iTab.scrollTop(),'left':x-tx+w-60}))
			}else{
				$('body').append($('<span class="'+classname+'"></span>').text(i).addClass('promptbox').fadeIn().css({'position':'absolute','top':y-20,'left':x+w-65}))
			}
		}
	})

})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */

/**
 * @name RMessage
 * @class 
 * 消息提示，用于提供提示信息的弹出窗口，类似于JavaScript中使用alert()、confirm()、prompt()函数时出现的那种提示信息的弹出窗口。
 */

/**@lends RMessage# */

;(function($) {
    $.RMessage = {      
        /**
	     * alert消息框
	     * @name RMessage#alert
	     * @function
	     * @param title 消息的标题
	     * @param msg 消息的内容
	     * @param callback 消息关闭的时候的回调方法
	     * @example
	     * <pre>
	     * $.RMessage.alert("Attention", "Everything is ok!");
	     * </pre>
	     */
	    confirm: function(title,msg,confirmHandle,cancelHandle){
	    	this.show({
	    		type:1,
	    		title:title,
	    		msg:msg,
	    		confirmHandle:confirmHandle,
	    		cancelHandle:cancelHandle
	    	});
	    },
        alert: function(title, msg, confirmHandle) {
            var self = this;
            self.show({
            	type:0,
                title: title,
                msg: msg,
                confirmHandle: confirmHandle
            });
        },       
        show: function(op) {        
        		var confirmBtns = "<button type='button' class='btn btn-primary' style='padding:2px 6px;' data-dismiss='modal' id='confirmBtn'>确定</button> \
		                    <button type='button' class='btn btn-primary' style='padding:2px 6px;' data-dismiss='modal' id='cancelBtn'>取消</button>";

		        var alertBtns = "<button type='button' class='btn btn-primary' style='padding:2px 6px;' data-dismiss='modal' id='confirmBtn'>确定</button>";
        		var btns = op.type?confirmBtns:alertBtns;
        		
        		if ($("body").find('#winModal').length<1) {
        			var template = "\
		            <div class='modal fade bs-example-modal-lg' id='winModal' tabindex='-1' role='dialog' aria-labelledby='winModalLabel'> \
		            <div class='modal-dialog modal-sm' role='document'> \
		            <div class='modal-content'> \
		            <div class='modal-header'> \
		            <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button> \
		            <h4 class='modal-title' id='winModalLabel'>消息</h4> \
		            </div> \
		            <div class='modal-body'> \
		            <p id='winModalContent' style='font-size:15px;'>提示内容</p> \
		            </div> \
		             <div class='modal-footer' style='padding:5px;margin-right:5px;'> \
		                  </div> \
		            </div> \
		            </div> \
		            </div>";
		            $("body").css('height',$(window).height()).append(template);

        		};
        		$("#winModal .modal-footer").empty();
        		$("#winModal .modal-footer").append(btns);

				$("#winModalLabel").text(op.title);
				$("#winModalContent").text(op.msg);
			    if($('#winModal .modal-backdrop').length > 0){
				   $('#winModal .modal-backdrop').remove();
			    }
				$("#winModal").modal("show");							
				$("#confirmBtn").unbind('click').click(function(e) {
					if ($.isFunction(op.confirmHandle)) {
						op.confirmHandle();
					}
				}); 
				$("#cancelBtn").unbind('click').click(function(e) {
					if ($.isFunction(op.cancelHandle)){
						op.cancelHandle();
					}
				});            
        }  
    };
})(jQuery);/**
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明
 * ========   =======  ============================================
 *
 * ========   =======  ============================================
 */
;(function($,undefined){
    $.widget('RUI.EditableGrid',{
        options:{
            /***
             * 表格数据请求地址
             * @name EditableGrid#dataUrl
             * @type String
             * @default " "
             * @example
             * 无
             */
            dataUrl:'',
            /***
             * 指定要显示的列，以及该列变为可编辑状态下的类型等
             * @name EditableGrid#columns
             * @type Array
             * @default []
             * @example
             * 无
             */
            columns:[],
            /***
             * 一页需要显示的条数
             * @name EditableGrid#pageSize
             * @type Number
             * @default 3
             * @example
             * 无
             */
            pageSize:3,
            /***
             * 配置按钮
             * @name EditableGrid#initialize
             * @type Array
             * @default null
             * @example
             * 无
             */
            initialize:null,
            /***
             * 表格高度
             * @name EditableGrid#height
             * @type Number
             * @default null
             * @example
             * 无
             */
            height:null,
            /***
             * 表格影藏列
             * @name EditableGrid#hiddenCol
             * @type Array
             * @default []
             * @example
             * 无
             */
            hiddenCol:[],
            /***
             * 保存函数
             * @name EditableGrid#saveFn
             * @type Function
             * @default null
             * @example
             * 无
             */
            saveFn:null,
            /***
             * 主键
             * @name EditableGrid#primaryKey
             * @type Array
             * @default []
             * @example
             * 无
             */
            primaryKey:[]
        },
        /***
         * 保存表格当前页数据的变量
         */
        tabledata:null,
        /***
         * 保存删除的数据
         */
        delData:[],
        /***
         *对临时保存的数据进行json格式化处理所需要的变量
         */
        addItem:0,
        /***
         * 保存编辑的数据
         */
        editData:[],
        /***
         * 保存新增的数据
         */
        addData:[],
        /***
         * 用于保存各条数据的主键
         */
        allpKey:[],
        /***
         * 用于保存表格各列的宽度
         */
        tdWid:[],
        _create: function(){

        },
        _init: function(){
            var ME = this;
            var ID = ME.element.context.id;

            ME.delData = [];
            ME.addData = [];
            ME.editData = [];

            $('#'+ID).wrap('<form id="'+ID+'_form" class="editablegrid" onSubmit="return false"></form>');
            var html = '<div class="tab_wrap"><div class="tab_title"><table cellpadding="0" cellspacing="0" style="position: relative;"><thead></thead></table></div>';
            html += '<div class="tab_data"><table cellpadding="0" cellspacing="0"></table></div></div>';
            html += '<div class="tab_page"></div>';
            $('#'+ ID).html(html);
            ME.setHead();
            ME.getData({'rows':ME.options.pageSize,'page':'1'});
        },
       /***
        功能：设置表格头部
         **/
        setHead: function(){
            var ME = this;
            var ID = ME.element.context.id;
            var options = ME.options;
            var headtr = $('<tr><th>操作</th></tr>');
            for(var i=0;i<options.columns.length;i++){
                headtr.append('<th>'+options.columns[i].title+'</th>');
            }
            $('#'+ID+' .tab_title table thead').append(headtr);
        },
        /**
        功能：设置各列宽度
         */
        setWidth: function(){
            var ME = this;
            var ID = ME.element.context.id;
            var widarr = [];
            var tabW = 0;
            $('#'+ID+' .first_row td').each(function(){
                if($(this).attr('width') == undefined){
                    tabW+=parseInt($(this).width()); 
                }else{
                    tabW+=parseInt($(this).attr('width'));
                }
            })
            $('#' + ID + ' .tab_data').children('table').width(tabW);
            $('#'+ID+' .first_row td').each(function() {
                widarr.push($(this).outerWidth());
            })
            for(var i=0;i<widarr.length;i++){
                $('#' + ID + ' .tab_title th').eq(i).outerWidth(widarr[i]);
            }
            $('#' + ID + ' .tab_title table').width($('#' + ID + ' .tab_data table').width());
            ME.tdWid = widarr;
        },
        /**
        功能：设置表格高度
         */
        setHeight: function(){
            var ME = this;
            var ID = ME.element.context.id;
            $('#'+ID).parents('body').css({'height':'100%','width':'100%'});
            $('#'+ID).parents('html').css({'height':'100%','width':'100%'});

            if(ME.options.height == null){
                $('#'+ID).parent().css('height','100%');
                $('#'+ID+' .tab_data').css('height',($('#'+ID).parent().height()-85));
            }else{
                $('#'+ID+' .tab_data').css('height',ME.options.height);
            }
        },
        /**
        功能：头部表格与数据表格同步滚动
         */
        headScroll: function(){
            var ME = this;
            var ID = ME.element.context.id;
            $('#'+ID+' .tab_data').scroll(function(){
                $('#'+ID+' .tab_title').scrollLeft($(this).scrollLeft());
            });
        },
       /**
        功能：获得表格数据
        参数：发送请求时需要传入的参数
         */
        getData: function(i){
            var ME = this;
            var options = ME.options;
            $.ajax({
                url:options.dataUrl,
                type: 'POST',
                async:false,
                cache:false,
                data:i,
                success: function(data){
                    data = JSON.parse(data);
                    ME.tabledata = null;
                    ME.tabledata = data.rows;
                    ME.setBody(data);
                    ME.setPage([i.page,data.totalpage,data.total],data);
                },
                error: function(){
                    alert('请求异常!');
                }
            })
        },
       /**
        功能：加载表格
         */
        setBody: function(data){
            var ME = this;
            var ID = ME.element.context.id;
            var len = data.rows.length;
            var keyArr = ME.options.hiddenCol;
            var bodytr;
            var bodytd;
            if(len>0){
                $('span.promptbox').remove();
                $('#'+ID+' .tab_data table').html('');
                //用于存放每条数据隐藏的值
                ME.allpKey = [];
                for(var i=0;i<len;i++ ){
                    var keyJson = {};
                    for(var k=0;k<keyArr.length;k++){
                        keyJson[keyArr[k]] = data.rows[i][keyArr[k]];
                    }
                    ME.allpKey.push(keyJson);
                    if(i==0){
                        bodytr = $('<tr  class="first_row"><td width="100"><span class="glyphicon glyphicon-edit edit_btn"></span><span class="glyphicon glyphicon-trash del_btn"></span></td></tr>');
                    }else{
                        bodytr = $('<tr><td><span class="glyphicon glyphicon-edit edit_btn"></span><span class="glyphicon glyphicon-trash del_btn"></span></td></tr>');
                        if(i%2 != 0){
                            bodytr.addClass('row_col');
                        }
                    }

                    for(var j=0;j<ME.options.columns.length;j++){
                        if(ME.options.columns[j].type == 4 || ME.options.columns[j].type == 5|| ME.options.columns[j].type == 0){
                            var hid = ME.options.columns[j].id;
                            var htext = ME.options.columns[j].text;

                             bodytd = $('<td  index="'+data.rows[i][hid]+';'+data.rows[i][htext]+'"></td>');
                            if(ME.options.columns[j].width != undefined){
                                bodytd.attr('width',ME.options.columns[j].width)
                            }
                        }else{
                             bodytd = $('<td></td>');
                            if(ME.options.columns[j].width != undefined){
                                bodytd.attr('width',ME.options.columns[j].width)
                            }
                           
                        }
                        // bodytd.attr('id',ME.options.columns[j].text+'-'+i+'-'+j) 
                        var opt = ME.options.columns[j].text;
                        var text =  data.rows[i][opt];
                        bodytd.append(text);
                        bodytr.append(bodytd);
                    }
                    $('#'+ID+' .tab_data table').append(bodytr);
                }
            }else{
                 bodytr = $('<tr class="first_row nodata_row"><td width="70"></td></tr>');
                for(var j=0;j<ME.options.columns.length;j++){

                    bodytd = $('<td></td>');
                    if(ME.options.columns[j].width != undefined){
                        bodytd.attr('width',ME.options.columns[j].width)
                    }
                    bodytr.append(bodytd);
                }
                $('#'+ID+' .tab_data table').append(bodytr);              
            }
            $('#'+ID+' .tab_data table tbody').addClass('data_body')
            ME.setWidth();
            ME.setHeight();
            ME.headScroll();
            ME.toEdit();
            ME.toDelete();
        },
        /**
        功能：删除表格中的一条记录
         */
        toDelete: function(){
            var ME = this;
            var ID = ME.element.context.id;

            $('#'+ID+' .del_btn').each(function(){
                var _this = this;
                $(_this).unbind('click');
                $(_this).click(function(){
                    var index = $(_this).parent().parent().index();
                    ME.delData.push(ME.tabledata[index]);
                    $(_this).parent().parent().addClass('hasDel').children('td').append('<div class="del_line"></div>');
                    $(_this).parent().parent().addClass('hasDel').children('td').eq(0).find('span').unbind('click').css('cursor','not-allowed');
                });
            })
        },
        /**
        功能：取消编辑
         */
        toCancelEdit: function(){
            var ME = this;
            var ID = ME.element.context.id;

            $('#'+ID+' .cancel_btn').each(function() {
                var _this = this;
                $(_this).unbind();
                $(_this).click(function () {
                    $('span.promptbox').remove();
                   
                    //删除row_0等行标，和删除editing编辑标志
                    if($(_this).parent().parent().hasClass('first_row')){
                        $(_this).parent().parent().attr('class','first_row');
                    }else if($(_this).parent().parent().hasClass('row_col')){
                        $(_this).parent().parent().attr('class','row_col');  
                    }else{
                        $(_this).parent().parent().removeAttr('class');
                    }
                      

                    $(_this).parent().parent().unbind('mouseleave');
                    var index = $(_this).parent().parent().index();
                    var data = ME.tabledata[index];
                    var pTr = $(_this).parent().parent();
                    pTr.html('<td width="100"><span class="glyphicon glyphicon-edit edit_btn"></span><span class="glyphicon glyphicon-trash del_btn"></span></td>');
                    
                    for (var j = 0; j < ME.options.columns.length; j++){
                        if(ME.options.columns[j].type == 4 || ME.options.columns[j].type == 5|| ME.options.columns[j].type == 0 ){
                          var hid = ME.options.columns[j].id;
                          var htext = ME.options.columns[j].text;
                          var bodytd = $('<td index="'+data[hid]+';'+data[htext]+'"></td>');
                        }else{
                            var bodytd = $('<td></td>');
                        }
                     
                        var opt = ME.options.columns[j].text;
                        var text =  data[opt];
                        bodytd.append(text);
                        bodytd.attr('width',ME.tdWid[j+1]);
                        pTr.append(bodytd);
                    };
                    ME.toDelSame(data,'editing');
                    ME.toEdit();
                    ME.toDelete();
                    ME.setWidth();
                })
            })
        },
       /**
        功能：一行变为编辑状态
         */
        toEdit: function(){
            var ME = this;
            var ID = ME.element.context.id;
            var col = ME.options.columns;

            $('#'+ID+' .edit_btn').each(function(){
                var _this = this;
                $(_this).unbind('click');
                $(_this).click(function(){
                    var rowNum = ME.toSetRowNum(0);
                    $(_this).parent().parent().addClass('editing  row_'+rowNum).children('td').addClass('tr_bg');
                    var index = $(_this).parent().parent().index();
                    var atd = $(_this).parent().parent().find('td');
                    atd.eq(0).html('<span class="glyphicon glyphicon-remove cancel_btn"></span>');
                    atd.eq(0).css('background','#99CADE');
                    ME.addItem = 0;
                    ME.typeByNumber(atd,rowNum);
                    ME.moveOutToSave();
                    ME.toCancelEdit();
                    ME.setWidth();
                });

            });
        },
        /**
        功能：根据所在行的索引进行可编辑状态的转化
        参数：当前行中所有的td，当前行的索引
         */
        typeByNumber: function(obj,num){
            var ME = this;
            var ID = ME.element.context.id;
            var col = ME.options.columns;
            for(var i=0;i<col.length;i++){
                if(col[i].type == 5){
                    ME.addItem++;
                    var hid;
                    if(obj.eq(i+1).attr('index')){
                          hid = obj.eq(i+1).attr('index').split(';');
                    }else{ 
                          hid = ['','']
                    }
                    var html = '<input type="hidden" check="'+col[i].check+'" id="'+col[i].id+'_'+(i+1)+'_'+num+'" name="'+col[i].id+'">';
                    obj.eq(i+1).html(html);
                    obj.eq(i+1)
                    var opt = {'id':col[i].id+'_'+(i+1)+'_'+num,'Hid':col[i].Hid,'Htext':col[i].Htext,'index':hid[0],'indexShow':hid[1],'url':col[i].url}
                    
                    if(col[i].afterSelect){
                        opt.afterSelect = col[i].afterSelect;
                    }
                   if(col[i].beforeSelect){
                        opt.beforeSelect = col[i].beforeSelect;
                    }
                    if(col[i].checked == true){
                        opt.checked = 'checked';
                    }
                    ME.setCombogrid(opt);
                }else if(col[i].type == 2){//date
                    ME.addItem++;
                    var html = obj.eq(i+1).html();
                    obj.eq(i+1).html('<input class="Wdate" id="'+col[i].text+'_'+(i+1)+'_'+num+'" type="text" name="'+col[i].text+'" check="'+col[i].check+'"/>')
                    obj.eq(i+1).children('input').val(html);
                   
                    var opt = {'id':col[i].text+'_'+(i+1)+'_'+num,'format':col[i].format};

                    ME.setDatepicker(opt);
                }else if(col[i].type == 3){//number
                    ME.addItem++;
                    var html = obj.eq(i+1).html();
                    obj.eq(i+1).html('<input class="change_text" id="'+col[i].text+'_'+(i+1)+'_'+num+'" type="text" name="'+col[i].text+'" placeholder="请填写数字" check="'+col[i].check+'"/>')
                    obj.eq(i+1).children('input').val(html);
                    var opt = {'id':col[i].text+'_'+(i+1)+'_'+num,'format':col[i].format};
                    ME.setNum(opt);
                }else if(col[i].type == 1){//input
                    ME.addItem++
                    var html = obj.eq(i+1).html();
                    obj.eq(i+1).html('<input class="change_text" type="text" id="'+col[i].text+'_'+(i+1)+'_'+num+'" name="'+col[i].text+'" check="'+col[i].check+'"/>')
                    obj.eq(i+1).children('input').val(html);
                }else if(col[i].type == 0){//all
                    ME.addItem++
                    var html = obj.eq(i+1).html();
                    var hid;
                    if(obj.eq(i+1).attr('index')){
                          hid = obj.eq(i+1).attr('index').split(';');
                    }else{ 
                          hid = ['','']
                    }
                    obj.eq(i+1).html('<input class="change_text change_type" type="text" id="'+col[i].id+'_'+(i+1)+'_'+num+'" name="'+col[i].id+'" check="'+col[i].check+'"/>')
                    obj.eq(i+1).children('input').val(html);
                    //当没触发其他列的afterselect事件时，先操作了该列，则要根据其他列的值改变该列的类型
                    if(hid){
                         col[i].beforeSelect(col[i].id+'_'+(i+1)+'_'+num,hid);
                    }                  
                }else if(col[i].type == 4){//combo
                    ME.addItem++;
                    var hid;
                    if(obj.eq(i+1).attr('index')){
                          hid = obj.eq(i+1).attr('index').split(';');
                    }else{ 
                          hid = ['','']
                    }
                    var html = '<select id="'+col[i].id+'_'+(i+1)+'_'+num+'"  name="'+col[i].id+'" style="display: none"  check="'+col[i].check+'"></select>';
                    obj.eq(i+1).html(html);
                    if(col[i].url != undefined){
                        var dataopt = col[i].url;
                    }else{
                        var dataopt = col[i].staticData;
                    }
                    var opt = {'id':col[i].id+'_'+(i+1)+'_'+num,'Hid':col[i].Hid,'Htext':col[i].Htext,'index':hid[0],'indexShow':hid[1],'dataopt':dataopt };
    
                    if(col[i].afterSelect){
                        opt.afterSelect = col[i].afterSelect;
                    }
                    if(col[i].beforeSelect){
                        opt.beforeSelect = col[i].beforeSelect;
                    }
                    if(col[i].checked == true){
                        opt.checked = 'checked';
                    }
                    ME.setCombo(opt);
                }else{
                    obj.eq(i+1).css('background','#99CADE');
                }
            }
        },
        /**
        功能：更加数据表位可编辑状态
        参数：当前行中所有的td，当前行的索引，数据（该方法用于翻页之后可编辑状态的转变和初始化输入输出可编辑状态的转变）
         */
        typeByData: function(obj,num,data){
            var ME = this;
            var col = ME.options.columns;
            for(var i=0;i<col.length;i++){
                if(col[i].type == 5){//combogrid.
                    ME.addItem++;
                    var hid = ME.options.columns[i].id;
                    var text = hid + 'Show';
                    var html = '<input type="hidden" check="'+col[i].check+'" id="'+col[i].id+'_'+(i+1)+'_'+num+'" name="'+col[i].id+'">';
                    obj.eq(i+1).html(html);
                    var opt = {'id':col[i].id+'_'+(i+1)+'_'+num,'Hid':col[i].Hid,'Htext':col[i].Htext,'index':data[hid],'indexShow':data[text],'url':col[i].url}
                    if(col[i].afterSelect){
                        opt.afterSelect = col[i].afterSelect;
                    }
                    if(col[i].beforeSelect){
                        opt.beforeSelect = col[i].beforeSelect;
                    }
                    if(col[i].checked == true){
                        opt.checked = 'checked';
                    }
                    ME.setCombogrid(opt);
                }else if(col[i].type == 1){//input
                    ME.addItem++;
                    var hid = ME.options.columns[i].text;
                    var html = data[hid];
                    obj.eq(i+1).html('<input class="change_text" type="text" id="'+col[i].text+'_'+(i+1)+'_'+num+'" name="'+col[i].text+'" check="'+col[i].check+'"/>')
                    obj.eq(i+1).children('input').val(html);
                }else if(col[i].type == 0){//input
                    ME.addItem++;
                    var hid = ME.options.columns[i].id;
                    var html = data[hid];
                    var text = hid + 'Show';
                    obj.eq(i+1).html('<input class="change_text change_type" type="text" id="'+col[i].id+'_'+(i+1)+'_'+num+'" name="'+col[i].id+'" check="'+col[i].check+'"/>')

                    if(hid){
                         col[i].beforeSelect(col[i].id+'_'+(i+1)+'_'+num,[data[hid],data[text]]);
                    }  
                }else if(col[i].type == 2){//date
                    ME.addItem++;
                    var hid = ME.options.columns[i].text;
                    var html = data[hid];
                    obj.eq(i+1).html('<input class="Wdate" id="'+col[i].text+'_'+(i+1)+'_'+num+'" type="text" name="'+col[i].text+'" check="'+col[i].check+'"/>')
                    obj.eq(i+1).children('input').val(html);

                    var opt = {'id':col[i].text+'_'+(i+1)+'_'+num,'format':col[i].format};
                
                    ME.setDatepicker(opt);
                }else if(col[i].type == 3){//number
                    ME.addItem++;
                    var hid = ME.options.columns[i].text;
                    var html = data[hid];
                    obj.eq(i+1).html('<input class="change_text" id="'+col[i].text+'_'+(i+1)+'_'+num+'" type="text" name="'+col[i].text+'" placeholder="请填写数字" check="'+col[i].check+'"/>')
                    obj.eq(i+1).children('input').val(html);

                    var opt = {'id':col[i].text+'_'+(i+1)+'_'+num,'format':col[i].format};

                    ME.setNum(opt);
                }else if(col[i].type == 4){//combo
                    ME.addItem++;
                    var hid = ME.options.columns[i].id;
                    var text = hid + 'Show';
                    var html = '<select id="'+col[i].id+'_'+(i+1)+'_'+num+'"  name="'+col[i].id+'" style="display: none"  check="'+col[i].check+'"></select>';
                    obj.eq(i+1).html(html);
                    if(col[i].url != undefined){
                        var dataopt = col[i].url;
                    }else{
                        var dataopt = col[i].staticData;
                    }
                    var opt = {'id':col[i].id+'_'+(i+1)+'_'+num,'Hid':col[i].Hid,'Htext':col[i].Htext,'index':data[hid],'indexShow':data[text],'dataopt':dataopt };

                    if(col[i].afterSelect){
                        opt.afterSelect = col[i].afterSelect;
                    }
                    if(col[i].beforeSelect){
                        opt.beforeSelect = col[i].beforeSelect;
                    }
                    if(col[i].checked == true){
                        opt.checked = 'checked';
                    }
                    ME.setCombo(opt);
                }else{
                    obj.eq(i+1).css('background','#99CADE');
                }
            }
        },
        /**
        功能：设置combo
        opt参数：combo的id,隐藏的值，显示的值，隐藏的值，请求地址，前置事件
         */
        setCombo: function(opt){
            
            var ME = this;
            var optUrl = '';
            var optData = '';
            var arr;
            if(typeof(opt.dataopt) == 'object'){
                optUrl = '';
                optData = opt.dataopt;
            }else{
                optUrl = opt.dataopt;
                optData = '';
            }
            var ifchecked = false;
            if(opt.checked == 'checked'){
                ifchecked = true;
            }
            $('#'+opt.id).RCombo({
                dataUrl:optUrl,
                valueField:opt.Hid,
                displayField:opt.Htext,
                staticData:optData,
                icon: false,
                multiSelect: ifchecked,
                ifEditGrid:true
            });
            if(opt.index){             
                $('#'+opt.id).RCombo('setAllValue', [opt.index,opt.indexShow]);               
            }
            if(opt.beforeSelect){
                $('#' + opt.id).RCombo('beforeSelect',opt.beforeSelect);
            }
            if(opt.afterSelect) {
                $('#' + opt.id).RCombo('afterSelect',opt.afterSelect);
            }
        },
         /**
            功能：创建combogrid
            opt参数：id、隐藏值、显示值、默认值、请求地址、前置事件、后置事件、是否多选
         */
        setCombogrid: function(opt){
            var ME = this;
            var arr;
            var ifchecked = false;

            if(opt.checked == 'checked'){
                ifchecked = true;
            }
            $('#'+opt.id).RComboGrid({
                idField: opt.Hid,//用于获取值，不显示
                textField: opt.Htext,//用于检索，显示
                url:opt.url,
                method: 'post',
                pageSize: 6,
                columns: [
                    {title:'名称',field:opt.Htext}
                ],
                icon: false,
                multiSelect:ifchecked,
                showText:ifchecked,
                ifEditGrid:true
            });
            if(opt.index){      
                $('#'+opt.id).RComboGrid('setAllValue', [opt.index,opt.indexShow]);               
            }
             if(opt.beforeSelect){
                $('#' + opt.id).RComboGrid('beforeSelect',opt.beforeSelect);
            }
            if(opt.afterSelect) {
                $('#' + opt.id).RComboGrid('afterSelect',opt.afterSelect);
            }
        },
        /**
            功能：创建日历控件
            opt参数：RCalendar的id,日期格式
         */
        setDatepicker: function(opt){
            var ME = this;
            var param = '';
            if($('#'+opt.id).parents('tr').hasClass('editing')){
                param = 'editing';
            }else if($('#'+opt.id).parents('tr').hasClass('adding')){
                param = 'adding'; 
            }
            $('#'+opt.id).RCalendar({
                dateFmt: opt.format
            });
            $('#'+opt.id).RCalendar('afterSelect',function(){
                 ME.saveValue(param)
             });
        },
        /**
            功能：创建数字控件
            opt参数：RNumberField的id,数字格式
         */
        setNum: function(opt){
            $('#'+opt.id).RNumberField({
                dataFmt: opt.format
            });
        },
        /**
            功能：保存
         */
        saveAll: function(className){

            var ME = this;
            var ID = ME.element.context.id;
            $('#'+ID+' .'+className).bind('click',function(){
                ME.options.saveFn();
            })

        },
        /**
            功能：返回所有删除的数据的主键组成的数组
         */
        getDelArray: function(){
            var arr = [];
            if(this.options.primaryKey.length == 1){
                for(var i=0;i<this.delData.length;i++){
                    arr.push(this.delData[i][this.options.primaryKey[0]]);
                }
            }
            return arr;
        },
        /**
            功能：获得编辑过得数据
         */
        getEditValue: function(){
            return this.editData;
        },
        /**
            功能：获得删除的数据
         */
        getDelValue: function(){
            return this.delData;
        },
        /**
            功能：获得新增的数据
         */
        getAddValue: function(){
            return this.addData;
        },
        /**
            功能：获得当前页所有的数据
         */
        getAllValue: function(){
            var ME = this;
            var tabledata = ME.tabledata.slice();
            var delData = ME.delData.slice();
            var editData = ME.editData.slice();
            var primaryKey = ME.options.primaryKey.slice();
            var ifSame = true;
            //删除所有数据中已删除的数据
            for(var i=0;i<tabledata.length;i++){
                for(var j=0;j<delData.length;j++){
                    ifSame = true;
                    for(var k=0;k<primaryKey.length;k++){
                        if(tabledata[i][primaryKey[k]] != delData[j][primaryKey[k]]){

                            ifSame = false;
                        }
                    }
                    if(ifSame){
                        tabledata.splice(i,1);
                    }
                }
            }
            //删除所有数据中已修改的数据
            for(var i=0;i<tabledata.length;i++){
                for(var j=0;j<editData.length;j++){
                    ifSame = true;
                    for(var k=0;k<primaryKey.length;k++){
                        if(tabledata[i][primaryKey[k]] != editData[j][primaryKey[k]]){
                           ifSame = false;
                        }
                    }
                    if(ifSame){
                       $.extend(tabledata[i],editData[j]);
                    }
                }
            }
            tabledata = tabledata.concat(ME.addData);
            return tabledata;
        },
        /**
            功能：加载分页
            参数：当前页的分页信息组成的数组，数据（？？）
         */
        setPage:function(arr,data){
            var ME = this;
            var ID = ME.element.context.id;
            var  html = '<button class="add_btn">新增</button><span class="page_nav"><span class="page_bgimg"></span><span class="page_bgimg page_bgimg_pos1"></span><span class="page_num">'+arr[0]+'</span>/<span class="page_all">  '+arr[1]+'</span><span class="page_bgimg page_bgimg_pos2"></span><span class="page_bgimg page_bgimg_pos3"></span></span><p>共'+arr[2]+'条</p>';

            $('#'+ID+' .tab_page').html(html);
            if(ME.options.initialize){
                for(var i= ME.options.initialize.length-1;i > -1;i--){
                    ME.addBtn(ME.options.initialize[i][0],'initialize_'+i);
                    if(ME.options.initialize[i][1]) {
                        ME.initialize(ME.options.initialize[i][1], 'initialize_' + i);
                    }else{
                        ME.saveAll('initialize_'+i);
                    }
                }
            }
            $('#'+ID +' .page_nav span:eq(4)').click(function(){
                ME.next(arr);
            });
            $('#'+ID +' .page_nav span:eq(1)').click(function(){
                ME.prev(arr);
            });
            $('#'+ID +' .page_nav span:eq(5)').click(function(){
                ME.last(arr);
            });
            $('#'+ID +' .page_nav span:eq(0)').click(function(){
                ME.first(arr);
            });
            ME.addRow();
            ME.saveEdit();
        },
        /**
            功能：翻前一页
            arr参数：当前为第几页，总页数，总条数
         */
        prev: function(arr){
            var ME = this;
            var page = parseInt(arr[0])-1;
            var data = {page:page,rows : ME.options.pageSize};
            if(page>0) {
                ME.pageTurn(data);
            }
        },
        /**
            功能：翻后一页
            arr参数：当前为第几页，总页数，总条数
         */
        next: function(arr){
            var ME = this;
            var page = parseInt(arr[0])+1;
            var data = {page:page,rows : ME.options.pageSize};
            if(page <= arr[1]){
                ME.pageTurn(data);
            }
        },
        /**
            功能：第一页
            arr参数：当前为第几页，总页数，总条数
         */
        first: function(arr){
            var ME = this;
            var page = 1;
            var data = {page:page,rows : ME.options.pageSize};
            ME.pageTurn(data);
        },
        /**
            功能：最后一页
            arr参数：当前为第几页，总页数，总条数
         */
        last: function(arr){
            var ME = this;
            var page = arr[1];
            var data = {page:page,rows : ME.options.pageSize};
            ME.pageTurn(data);
        },
        /**
            功能：翻页验证，翻页过后恢复所有编辑过数据
            参数：ajax请求时需要传入的参数
         */
        pageTurn: function(data){
            var ME = this;
            var ID = ME.element.context.id;
            $('#'+ID+'_form').RValidate({
                'success': toVal,
                'scroll': true
            });
            $('#'+ID+'_form').RValidate('validate');
            function toVal(){
                ME.getData(data);
                ME.toFindDel();
                ME.toFindEdit();
                ME.toFindAdd();
            }
        },
        /**
            功能：新增数据
         */
        addRow: function(){
            var ME = this;
            var ID = ME.element.context.id;
            var col = ME.options.columns;
            var rowNum = 0;

            $('#'+ID+' .add_btn').click(function(){
                $('span.promptbox').remove();
                $('#'+ID+' .promptinput').removeClass('promptinput');
                ME.addItem = 0;
                rowNum = ME.toSetRowNum(rowNum);

                var tr = $('<tr class="row_'+rowNum+' adding"><td class="tr_bg" width="70"></td></tr>');
                for(var i= 0;i<ME.options.columns.length;i++){
                    tr.append('<td class="tr_bg"></td>');
                }
                $('#'+ID+' .data_body').append(tr);

                var atr = $('#'+ID+' .row_'+rowNum).find('td');
                atr.eq(0).html('<span class=" glyphicon glyphicon-ban-circle cancel_add"></span>');
                atr.eq(0).css('background','#99CADE');
                ME.typeByNumber(atr,rowNum);
                ME.moveOutToSave();
                ME.cancelAdd();
                ME.setWidth();
            });
        },
        /**
            功能：获取一个字符串中的所有数字
            参数：字符串
         */
        toGetNum: function(str){
            var reg = /\d+/g;
            return str.match(reg);
        },
        /**
            功能：设置新增行的唯一标示
            参数：预备的标示
         */
        toSetRowNum: function(n){
            var ME = this;
            var ID = ME.element.context.id;
            var allRow = $('#'+ID+' tr.adding,#'+ID+' tr.editing');
            var len = allRow.length;
            var num;
            var on = false;
            for(var i=0;i<len;i++){
                num = ME.toGetNum(allRow.eq(i).attr('class'))[0];
                if(num == n){
                    on = true;
                }
            }
            if(on == true){
                n++;
                return ME.toSetRowNum(n);
            }else{
                return n;
            };

        },
        /**
            功能：取消新增行
         */
        cancelAdd: function(){
            var ME = this;
            var ID = ME.element.context.id;
            var reg = /\d+/g;
            var page = parseInt($('#'+ID+' span.page_num').html());
            var classname = '';
            var index = '';
            $('#'+ID+' .cancel_add').click(function(){
                classname =  $(this).parent().parent().attr('class');
                index = page+'_'+classname.match(reg)[0];
                for(var i=0;i<ME.addData.length;i++){
                    if(ME.addData[i].useforfind == index){
                        ME.addData.splice(i,1);
                    }
                }
                $(this).parent().parent().remove();
                $('span.promptbox').remove();
                $('#'+ID+' .promptinput').removeClass('promptinput');
                ME.setWidth();

            });
        },
        /**
            功能：鼠标移出保存数据
         */
        moveOutToSave: function(){
            var ME = this;
            var ID = ME.element.context.id;
            if($('span.promptbox').length == 0){
                $('#'+ID+' tr.editing').each(function(){
                    var _this = this;
                    $(_this).bind('mouseleave',function(){
                        ME.saveValue('editing');
                    });
                })
                $('#'+ID+' tr.adding').each(function(){
                    var _this = this;
                    $(_this).bind('mouseleave',function(){
                        ME.saveValue('adding');
                    });
                })
            }
        },
        /**
            功能：选择后保存数据
         */
        afterSelectToSave: function(){
            
        },
        /**
            功能：翻页时进行当前页的数据保存验证
         */
        saveEdit: function(){
            var ME = this;
            var ID = ME.element.context.id;
            $('#'+ID+' tr ').unbind('click');
            $('#'+ID+' .save_alladd').click(function(){
                ME.saveValue(null);
            });
        },
        /**
            功能：保存时去重
            参数：传入是新增验证还是编辑验证
         */
        toValidate: function(successFn){
            var ME = this;
            var ID = ME.element.context.id;
             $('#'+ID+'_form').RValidate({
                'success': successFn,
                'scroll': true
            });
            var result = $('#'+ID+'_form').RValidate('validate');
            return result;
        },
        /**
            功能：保存时去重
            参数：传入是新增验证还是编辑验证
         */
        saveValue: function(index){
            var ME = this;
            var ID = ME.element.context.id;
            getvalue(index);
            function getvalue(index){
                var len = $('#'+ID+' .data_body').children('tr.'+index).length;
                var  page = parseInt($('#'+ID+' span.page_num').html());
                var reg = /\d+/g;
                for(var j=0;j<len;j++){
                    var lineNum = $('#'+ID+' .data_body').children('tr.'+index).eq(j).index();
                    var allinput = $('#'+ID+' .data_body').children('tr.'+index).eq(j).find('input,select');
                    var dataJson = {};
                    for(var i = 0;i<allinput.length;i++){
                        if(allinput.eq(i).attr('name') != undefined){
                            //保存所有隐藏值
                            if(allinput.eq(i).attr('combogrid') == 'true'){
                               dataJson[allinput.eq(i).attr('name')+'Show'] = allinput.eq(i).parent().find('input.input_text').val();
                            }else if(allinput.eq(i)[0].nodeName.toUpperCase() == 'SELECT'){
                               dataJson[allinput.eq(i).attr('name')+'Show'] = allinput.eq(i).parent().find('.combo_text input').val();
                            }else if(allinput.eq(i).hasClass('hid_val')){
                               dataJson[allinput.eq(i).attr('name')+'Show'] = allinput.eq(i).parent().find('.combo_text input').val(); 
                            }
                            dataJson[allinput.eq(i).attr('name')] = allinput.eq(i).val();
                        }
                    }
                    if(index == 'editing'){
                        var classname = $('#'+ID+' .data_body').children('tr.'+index).eq(j).attr('class');                       
                        //这里的useforfind是为了在翻页时唯一确定该行
                        dataJson['useforfind'] = classname.match(reg)[0];

                        var object = $.extend({}, ME.allpKey[lineNum],dataJson);
                        ME.toDelSame(object,index);
                        ME.editData.push(object);
                    }else{
                        var classname = $('#'+ID+' .data_body').children('tr.'+index).eq(j).attr('class');
                        dataJson['useforfind'] = page+'_'+ classname.match(reg)[0];
                        ME.toDelSame(dataJson,index);
                        ME.addData.push(dataJson);
                    }

                }
            }
        },
        /**
            功能：去重
            参数：需要验证的一条数据，是编辑验证还是新增验证
         */
        toDelSame: function (obj,str) {
            var ME = this;
            var ID = ME.element.context.id;
            var on = false;
            if(str == 'editing'){
                for(var j=0;j<ME.editData.length;j++){
                    for(var m=0;m<ME.options.primaryKey.length;m++){
                        on = false;
                        if(ME.editData[j][ME.options.primaryKey[m]] != obj[ME.options.primaryKey[m]]){
                            on = true;
                        }
                    }
                    if(on == false){
                        ME.editData.splice(j,1);
                    }
                }
            }else{
                for(var j=0;j<ME.addData.length;j++){
                    if(ME.addData[j]['useforfind'] == obj['useforfind']){
                        ME.addData.splice(j,1);
                    }
                }
            }

        },
        /**
            功能：初始化输入输出执行
            参数：请求地址，（？？？？）
         */
        initialize:function(url,classname){
            var ME = this;
            var ID = ME.element.context.id;
            $('#'+ID+' .tab_page button.'+classname).unbind('click');
            $('#'+ID+' .tab_page button.'+classname).bind('click',function(){
                $.ajax({
                    url:url,
                    type:'POST',
                    cache:false,
                    success: function(data){
                        data = JSON.parse(data);
                        data = data.rows;
                        ME.showData(data);
                    },
                    error: function(){}
                })
            })
        },
        /**
            功能：初始化表格加载
           参数：表格数据
         */
        showData: function(data){//0000
            var ME = this;
            var ID = ME.element.context.id;
            var rowNum = 0;
            var col = ME.options.columns;
            $('span.promptbox').remove();
            if($('#'+ID+' .save_btn').length != 0){
                alert('请先保存更改！')
                return false;
            }
            if($('#'+ID+' .cancel_add').length != 0){
                alert('请先保存添加！')
                return false;
            }
            for(var k=0;k<data.length;k++){
                ME.addItem = 0;
                rowNum = ME.toSetRowNum(rowNum);
                var tr = $('<tr class="row_'+rowNum+' adding"><td class="tr_bg" width="70"></td></tr>');
                for(var i= 0;i<ME.options.columns.length;i++){
                    tr.append('<td class="tr_bg"></td>');
                }
                $('#'+ID+' .data_body').append(tr);
                var atr = $('#'+ID+' .row_'+rowNum).find('td');
                atr.eq(0).html('<span class=" glyphicon glyphicon-ban-circle cancel_add"></span>');
                atr.eq(0).css('background','#99CADE');
                ME.typeByData(atr,rowNum,data[k]);
                ME.moveOutToSave();
                ME.cancelAdd();
            }
        },
        /**
            功能：创建按钮
            参数：按钮文字，按钮样式
         */
        addBtn: function(text,className){
            var ME = this;
            var ID = ME.element.context.id;
            $('<button class="'+className+'">'+text+'</button>').insertAfter($('#'+ID+' .tab_page button:last'));
        },
        /**
            功能：翻页时找到改业删除的数据
         */
        toFindDel: function(){
            var ME = this;
            var ID = ME.element.context.id;
            var col = ME.options.columns;
            var on = false;

            for(var k = 0;k<ME.delData.length;k++){
                for(var j=0;j<ME.tabledata.length;j++){
                    for(var m=0;m<ME.options.primaryKey.length;m++){
                        on = false;
                        if(ME.delData[k][ME.options.primaryKey[m]] != ME.tabledata[j][ME.options.primaryKey[m]]){
                            on = true;
                        }
                    }
                    if(on == false){
                        $('#'+ID+' .data_body').children('tr').eq(j).addClass('hasDel').children('td').append('<div class="del_line"></div>');
                        $('#'+ID+' .data_body').children('tr').eq(j).children('td').eq(0).find('span').unbind('click').css('cursor','not-allowed');
                    }
                }
            }
        },
        /**
            功能：翻页时找到该页编辑的数据
         */
        toFindEdit: function(){
            var ME = this;
            var ID = ME.element.context.id;
            var col = ME.options.columns;
            var on = false;
            for(var k = 0;k<ME.editData.length;k++){
                for(var j=0;j<ME.tabledata.length;j++){
                    for(var m=0;m<ME.options.primaryKey.length;m++){
                        on = false;
                        if(ME.editData[k][ME.options.primaryKey[m]] != ME.tabledata[j][ME.options.primaryKey[m]]){
                            on = true;
                        }
                    }
                    if(on == false){
                        var index = ME.editData[k].useforfind;
                        $('#'+ID+' .data_body').children('tr').eq(j).addClass('editing row_'+index).find('td:not(.hid_td)').addClass('tr_bg');                      
                        var atr = $('#'+ID+' .data_body').children('tr').eq(j).find('td');
                        atr.eq(0).html('<span class="glyphicon glyphicon-remove cancel_btn"></span>');
                        atr.eq(0).css('background','#99CADE');
                        ME.addItem = 0;

                        ME.typeByData(atr,index,ME.editData[k]);
                        ME.moveOutToSave();
                        ME.toCancelEdit();
                        ME.setWidth();
                    }
                }
            }

        },
        /**
            功能：翻页时找到该页新增的数据
         */
        toFindAdd: function(){
            var ME = this;
            var ID = ME.element.context.id;
            var col = ME.options.columns;
            var rowNum ;
            var pageNum = parseInt($('#'+ID+' .page_num').html());
            for(var k = 0;k<ME.addData.length;k++){
                if(ME.toGetNum(ME.addData[k].useforfind)[0] == pageNum){
                    ME.addItem = 0;
                    rowNum = ME.toGetNum(ME.addData[k].useforfind)[1];
                    var tr = $('<tr class="row_'+rowNum+' adding"><td class="tr_bg" width="70"></td></tr>');
                    for(var i= 0;i<ME.options.columns.length;i++){
                        tr.append('<td class="tr_bg"></td>');
                    }
                    $('#'+ID+' .data_body').append(tr);
                    var atr = $('#'+ID+' .row_'+rowNum).find('td');
                    atr.eq(0).html('<span class=" glyphicon glyphicon-ban-circle cancel_add"></span>');
                    atr.eq(0).css('background','#99CADE');
                    ME.typeByData(atr,rowNum,ME.addData[k]);
                    ME.moveOutToSave();
                    ME.cancelAdd();
                    ME.setWidth();
                }
            }
        },
        
        /**
            功能：获取表格的单元格的类型
            参数：其他影响他的单元格的值，确定为传入参数数组的第几个，需改变类型的单元格对象
         */
        changeType: function(jsonParam){
            var ME = this;
            var id = jsonParam.id;
            var type = jsonParam.type;
            var param = jsonParam.param;
                    
            var inputname = '';
            var check = '';
            inputname = $('#'+id).attr('name');
            check = $('#'+id).attr('check');
            switch (parseInt(type)){
                case 5:
                    $('#'+id).parents('td').html('<input type="hidden" name="' + inputname + '" id="'+id+'" check="' + check + '"/>');
                    param.ifEditGrid = true;
                    $('#'+id).RComboGrid(param);
                    break;
                case 4:
                    $('#'+id).parents('td').html('<select id="'+id+'" name="' + inputname + '" style="display: none" check="' + check + '"></select>');
                    param.ifEditGrid = true;
                    $('#'+id).RCombo(param);
                    break;
                case 3:
                    $('#'+id).parents('td').html('<input id="'+id+'"  class="change_text" name="' + inputname + '"  placeholder="请填写数字" check="' + check + '">');
                    $('#'+id).RNumberField(param);
                    break;
                case 2:
                    $('#'+id).parents('td').html('<input id="'+id+'"  class="Wdate" name="' + inputname + '"  check="' + check + '">');
                    $('#'+id).RCalendar(param);
                    $('#'+id).RCalendar('afterSelect',function(){
                         ME.saveValue('editing');
                    });
                    break;
                case 1:
                    $('#'+id).parents('td').html('<input class="change_text" id="'+id+'"  name="'+ inputname +'"  check="' + check + '">');
                    $('#'+id).RTextField(param);
                    break;
            }          
        },
        destroy: function(){
            $.Widget.prototype.destroy.call(this);
        }
    })
})(jQuery);/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明
 * ========   =======  ============================================
 *
 * ========   =======  ============================================
 */

;(function($,undefined){
    $.widget('RUI.GroupGrid', {
        options: {
            dataUrl: '',
            columns: [],
            pageSize: '',
            pid:'pid',
            id:'id',
            width:'',
            isExtend:true
        },
        widArr:[],
        panelHeight:null,
        param:null,
        _create: function (){

        },
        _init: function () {
            var ME = this;
            var ID = ME.element.context.id;

            var html = '<div class="tab_wrap"><div class="tab_title"><table cellpadding="0" cellspacing="0"><thead></thead></table></div>';
            html += '<div class="tab_data"><table cellpadding="0" cellspacing="0"><tbody></tbody></table></div></div>';
            html += '<div class="tab_page"></div>';
            $('#' + ID).html(html);
            ME.setHead();
            ME.getData({page:1,rows:ME.options.pageSize});

        },
        setHead: function () {
            var ME = this;
            var ID = ME.element.context.id;
            var options = ME.options;
            var headtr = $('<tr><th></th><th></th></tr>');
            for (var i = 0; i < options.columns.length; i++) {
                headtr.append('<th>' + options.columns[i].title + '</th>');
            }
            $('#' + ID + ' .tab_title table thead').append(headtr);
        },
        setWidth: function () {
            var ME = this;
            var ID = ME.element.context.id;
            var widarr = [];
            var tabW = 0;

            $('#' + ID + ' .tab_data tr:first td').eq(0).outerWidth(ME.options.width);
            $('#' + ID + ' .tab_data tr:first td').eq(1).outerWidth(25);
            for(var i=0;i<$('#' + ID + ' .tab_data tr:first td').length;i++){
                if(i != 0){
                    if(i==1){
                        widarr.push(25)
                        tabW += 25;
                    }else {
                        widarr.push($('#' + ID + ' .tab_data tr:first td').eq(i).outerWidth());
                        tabW += parseInt($('#' + ID + ' .tab_data tr:first td').eq(i).outerWidth());
                    }
                }else{
                    widarr.push(parseInt(ME.options.width));
                    tabW+=parseInt(ME.options.width);
                }
            }
            $('#' + ID + ' .tab_data table').width(tabW);
            ME.widArr = widarr;
            for (var i = 0; i < widarr.length; i++) {
                $('#' + ID + ' .tab_title th').eq(i).outerWidth(widarr[i]);
            }
            $('#' + ID + ' .tab_title table').width(tabW);
            ME.collapseItem();
        },
        setHeight: function () {
            var ME = this;
            var ID = ME.element.context.id;
            if(ME.panelHeight){
                $('#' + ID + ' .tab_data').css('height', ME.panelHeight);
            }else{
                $('#' + ID).parents('body').css({'height': '100%', 'width': '100%'});
                $('#' + ID).parents('html').css({'height': '100%', 'width': '100%'});
                var h = 0;
                var len = $('#' + ID).parent().siblings('div').length;
                for(var i=0;i< len;i++){
                    h+= $('#' + ID).parent().siblings('div').eq(i).height();
                }
                h = h+90;
                $('#' + ID).parent().css({'padding':'9px 10px','background':'white'});
                $('#' + ID + ' .tab_data').css('height', ($('body').height() - h));
                ME.panelHeight =  ($('body').height() - h);
            }
          },
        headScroll: function () {
            var ME = this;
            var ID = ME.element.context.id;
            $('#' + ID + ' .tab_data').scroll(function () {
                $('#' + ID + ' .tab_title').scrollLeft($(this).scrollLeft());
            });
        },
        setGridParam: function(i){
            var ME = this;
            var ID = ME.element.context.id;
            var options = ME.options;
            ME.param = i;
            i.page = 1;
            i.rows = ME.options.pageSize;
            $.ajax({
                url: options.dataUrl,
                type: 'POST',
                data:i,
                cache:false,
                success: function (data) {
                    data = JSON.parse(data);
                    if(data.rows.length == 0){
                         //ME.prev([i.page]);
                        $('#' + ID + ' .tab_data table tbody').html('');
                        $('#'+ID+' .page_num').html('0');
                        $('#'+ID+' .page_all').html('0');
                        $('#'+ID+' .tab_page p').html('共0条');
                    }else{
                         ME.setBody(data.rows);
                         ME.setPage([i.page,data.totalpage,data.total],data);
                    }
                },
                error: function () {

                }
            })
        },
        getData: function (i) {
            var ME = this;
            var ID = ME.element.context.id;
            var options = ME.options;
            if(ME.param){
                i = $.extend({},ME.param,i);
            }
            $.ajax({
                url: options.dataUrl,
                type: 'POST',
                data:i,
                cache:false,
                success: function (data) {
                    data = JSON.parse(data);
                    ME.setBody(data.rows);
                    ME.setPage([i.page,data.totalpage,data.total],data);
                },
                error: function () {

                }
            })
        },
        setBody: function (data) {
            var ME = this;
            var ID = ME.element.context.id;
            var mdata = data;
            var delarr = [];
            var len = mdata.length;
            var columns = ME.options.columns;
            var index = 1;
            var mar = 0;
            var tpid = ME.options.pid;
            var tid = ME.options.id;
            if (len > 0) {
                $('#' + ID + ' .tab_data table tbody').html('');
                var tBody = $('#'+ID+' .tab_data tbody');
                for (var i = 0; i < len; i++) {
                    var str = mdata[i].rpath;
                    if((str.length  - str.replace(/#/g,'').length - 1) == 0) {
                        for(var l=0;l<mdata.length;l++){
                            if(mdata[i].checked == 'true' ){
                                var checkstr='<input type="checkbox" />';
                            }else{
                                var checkstr ='';
                            }
                            if(mdata[l][tpid] == mdata[i][tid]){
                                var oTr = $('<tr index="'+mdata[i][tid]+'" ifp="true" root="true" pid="'+mdata[i][tpid]+'"><td><span class="glyphicon glyphicon-plus file_open"></span></td><td class="check_min_w">'+checkstr+'</td></tr>');
                                break;
                            }else{
                                var oTr = $('<tr index="'+mdata[i][tid]+'" root="true" pid="'+mdata[i][tpid]+'"><td><span class="glyphicon glyphicon-file file_item"></span></td><td>'+checkstr+'</td></tr>');
                            }
                        }

                        for (var j = 0; j < columns.length; j++) {
                            var val = columns[j].text;
                            oTr.append('<td class="tab_data_td">' + mdata[i][val] + '</td>');
                        }
                        tBody.append(oTr);
                        delarr.push(mdata[i]);
                    }
                }
                for(var i=0;i<delarr.length;i++){
                    for(var j=0;j<mdata.length;j++){
                        if(delarr[i] == mdata[j]){
                            mdata.splice(j,1);
                        }
                    }
                }
                dealData();
                function dealData() {
                    var len = mdata.length;
                    delarr = [];
                    if(len > 0){
                        for (var i = 0; i < len; i++) {
                            var str = mdata[i].rpath;

                            if((str.length  - str.replace(/#/g,'').length - 1) == index) {
                                mar = 20*index;
                                for(var l=0;l<mdata.length;l++){
                                    if(mdata[i].checked == 'true' ){
                                        var checkstr='<input type="checkbox" />';
                                    }else{
                                        var checkstr ='';
                                    }
                                    if(mdata[l][tpid] == mdata[i][tid]){
                                        var oTr = $('<tr index="'+mdata[i][tid]+'" ifp="true" pid="'+mdata[i][tpid]+'"><td style="padding-left: '+mar+'px"><span class="glyphicon glyphicon-plus file_open"></span></td><td class="check_min_w">'+checkstr+'</td></tr>');
                                        break;
                                    }else{
                                        var oTr = $('<tr index="'+mdata[i][tid]+'" pid="'+mdata[i][tpid]+'"><td style="padding-left: '+mar+'px"><span class="glyphicon glyphicon-file file_item"></span></td><td class="check_min_w">'+checkstr+'</td></tr>');
                                    }
                                }
                                for(var j = 0; j < columns.length; j++) {
                                    var val = columns[j].text;
                                    oTr.append('<td class="tab_data_td">' + mdata[i][val] + '</td>');
                                }
                                $('#'+ID+' .tab_data tbody tr').each(function(){
                                    if($(this).attr('index') == mdata[i][tpid]){
                                        oTr.insertAfter($(this));
                                    }
                                })

                                delarr.push(mdata[i]);
                            }
                        }
                        for(var i=0;i<delarr.length;i++){
                            for(var j=0;j<mdata.length;j++){
                                if(delarr[i] == mdata[j]){
                                    mdata.splice(j,1);
                                }
                            }
                        }
                        index++;
                        dealData();
                    }

                }
                $('#' + ID + ' .tab_data table').append(tBody);
            }
            ME.setWidth();
            ME.headScroll();
            ME.setHeight();
            ME.choiceRow();
           if(ME.options.isExtend){
             ME.allExtend();
           }
        },
        collapseItem: function(){
            var ME = this;
            var ID = ME.element.context.id;
            $('#'+ID+' .tab_data tr').css('display','none')
            $('#'+ID+' .tab_data tr[root = true]').css('display','block');
            for(var j=0;j<$('#' + ID + ' .tab_data tr').length;j++){
                for(var i=0;i<ME.widArr.length;i++){
                    $('#' + ID + ' .tab_data tr').eq(j).find('td').eq(i).outerWidth(ME.widArr[i]);
                }
            }
            $('#'+ID+' .tab_data tr[ifp = true]').each(function(){
                var index = $(this).attr('index');
                $(this).find('span').click(function(){
                    $(this).toggleClass('glyphicon-minus');
                    $('.tab_data tr').each(function(){
                        if($(this).attr('pid') == index){
                            $(this).toggleClass('dis');
                            for(var i=0;i<ME.widArr.length;i++){
                                $(this).find('td').eq(i).outerWidth(ME.widArr[i]);
                            }
                            findTr(this);
                        }
                    })
                })
            })
            function findTr(i){
                var trId = $(i).attr('index');
                $(i).find('span').removeClass('glyphicon-minus');
                $('.tab_data tr').each(function(){
                    if($(this).attr('pid') == trId){
                        $(this).removeClass('dis');
                        findTr(this);
                    }
                })
            }
        },
         allExtend: function(){
            var ME = this;
            var ID = ME.element.context.id;
            $('#'+ID+' .tab_data tr[ifp = true]').each(function(){
                var index = $(this).attr('index');
                $(this).find('span').toggleClass('glyphicon-minus');
                $('.tab_data tr').each(function(){
                    if($(this).attr('pid') == index){
                        $(this).toggleClass('dis');
                        for(var i=0;i<ME.widArr.length;i++){
                            $(this).find('td').eq(i).outerWidth(ME.widArr[i]);
                        }
                        findTr(this);
                    }
                })              
            })
            function findTr(i){
                var trId = $(i).attr('index');
                $(i).find('span').removeClass('glyphicon-minus');
                $('.tab_data tr').each(function(){
                    if($(this).attr('pid') == trId){
                        $(this).removeClass('dis');
                        findTr(this);
                    }
                })
            }
        },
        choiceRow: function(){
            var ME = this;
            var ID = ME.element.context.id;
            $('#'+ID+' input[type=checkbox]').bind('click',function(){
                if($(this).parent().parent().hasClass('choice')){
                      $(this).parent().parent().css('background','#FFFFFF');  
                      $(this).parent().parent().removeClass('choice');
                }else{
                      $(this).parent().parent().css('background','#DCEDF3'); 
                      $(this).parent().parent().addClass('choice');
                }//99999
                // $('#'+ID+' input[type=checkbox]').prop('checked',false);
                // $('#' + ID + ' .tab_data table tr').css('background','#FFFFFF').removeClass('choice');
                // if($(this).prop('checked')){
                //     $(this).prop('checked',false);
                // }else{
                //     $(this).prop('checked',true);
                //     $(this).parent().parent().css('background','#E4EFC9').addClass('choice');
                // }
            })
        },
        getParent: function () {
            var ME = this;
            var ID = ME.element.context.id;
            var arr;
            var allArr = [];
            // var pid = $('#' + ID + ' .tab_data table tr.choice').attr('pid');
            // var uid = $('#' + ID + ' .tab_data table tr.choice').attr('index')
            var choice = $('#' + ID + ' .tab_data table tr.choice');
            choice.each(function(){
                arr = [];
                arr.push($(this).attr('pid'))
                arr.push($(this).attr('index'))
                allArr.push(arr);
            })
            // for(var i=0;i<choice.length;i++){
            //     arr = [];
            //     arr.push(choice[i].attr('pid'))
            //     arr.push(choice[i].attr('index'))
            //     allArr.push(arr);
            // }
            return allArr;
        },
        setPage: function (arr, data) {
            var ME = this;
            var ID = ME.element.context.id;
            var options = ME.options;


            // var html = '<span class="page_nav"><span class="page_bgimg"></span><span class="page_bgimg page_bgimg_pos1"></span><span class="page_num">' + arr[0] + '</span>/<span class="page_all">  ' + arr[1] + '</span><span class="page_bgimg page_bgimg_pos2"></span><span class="page_bgimg page_bgimg_pos3"></span></span><p>共' + arr[2] + '条</p>';
            

            var html = '<table class="ui-pg-table" style="width:100%;table-layout:fixed;height:100%;" role="row" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td align="left"></td><td style="white-space: pre; width: 322px;" align="center"><table style="table-layout:auto;" class="ui-pg-table" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="ui-pg-button ui-corner-all " ><span class="ui-icon ace-icon fa fa-angle-double-left bigger-140"></span></td><td  class="ui-pg-button ui-corner-all"><span class="ui-icon ace-icon fa fa-angle-left bigger-140"></span></td><td class="ui-pg-button " style="width:4px;"><span class="ui-separator"></span></td><td dir="ltr"> <input class="ui-pg-input"  role="textbox" type="text" value="'+ arr[0] +'"> 共 <span ">'+arr[1]+'</span> 页</td><td class="ui-pg-button" style="width: 4px;"><span class="ui-separator"></span></td><td  class="ui-pg-button ui-corner-all"><span class="ui-icon ace-icon fa fa-angle-right bigger-140"></span></td><td  class="ui-pg-button ui-corner-all"><span class="ui-icon ace-icon fa fa-angle-double-right bigger-140"></span></td><td dir="ltr"></td></tr></tbody></table></td><td align="right"><div dir="ltr" style="text-align:right" class="ui-paging-info">共'+arr[2]+'条</div></td></tr></tbody></table>';//99999
      

            $('#' + ID + ' .tab_page').html(html);
            //设置禁用按钮
            if(arr[0] == arr[1]){
                $('#' + ID + ' .ui-pg-button:eq(5)').addClass('ui-state-disabled')
                $('#' + ID + ' .ui-pg-button:eq(4)').addClass('ui-state-disabled')
               
            }else if(arr[0] == 1){
                $('#' + ID + ' .ui-pg-button:eq(0)').addClass('ui-state-disabled')
                $('#' + ID + ' .ui-pg-button:eq(1)').addClass('ui-state-disabled')
            }
            $('#' + ID + '  .ui-pg-button:eq(4)').click(function () {
                ME.next(arr);
            });
            $('#' + ID + '  .ui-pg-button:eq(1)').click(function () {
                ME.prev(arr);
            });
            $('#' + ID + '  .ui-pg-button:eq(5)').click(function () {
                ME.last(arr);
            });
            $('#' + ID + '  .ui-pg-button:eq(0)').click(function () {
                ME.first(arr);
            });
        },
        reloadGrid: function(){
              var ME = this;
              ME.getData({page:1,rows:ME.options.pageSize});
        },
        prev: function (arr) {
            var ME = this;
            var page = parseInt(arr[0]) - 1;
            var data = {page: page, rows: ME.options.pageSize};
            if (page > 0) {
                ME.getData(data);
            }
        },
        next: function (arr) {
            var ME = this;
            var page = parseInt(arr[0]) + 1;
            var data = {page: page, rows: ME.options.pageSize};
            if (page <= arr[1]) {
                ME.getData(data);
            }
        },
        first: function (arr) {
            var ME = this;
            var page = 1;
            var data = {page: page, rows: ME.options.pageSize};
            ME.getData(data);
        },
        last: function (arr) {
            var ME = this;
            var ID = ME.element.context.id;
            var page = arr[1];
            var data = {page: page, rows: ME.options.pageSize};
            ME.getData(data);
            $('#' + ID + ' .ui-pg-button:eq(5)').addClass('ui-state-disabled')
            $('#' + ID + ' .ui-pg-button:eq(4)').addClass('ui-state-disabled')
            // $('#' + ID + ' .ui-pg-button:eq(0)').removeClass('ui-state-disabled')
            // $('#' + ID + ' .ui-pg-button:eq(1)').removeClass('ui-state-disabled')
        },
        destroy: function () {
            $.Widget.prototype.destroy.call(this);
        }
    })
})(jQuery);/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明
 * ========   =======  ============================================
 *
 * ========   =======  ============================================
 */
;(function($,undefined){
    $.widget('RUI.RMultiSelect',{
        option:{
            showTips: false,
            readonly: false,
        },
        _init:function(){},
        _create: function(){
            var ME = this;
            var id = ME.element.context.id;
            $('#'+id).css({'height':'152px','overflow':'auto', 'border': '1px solid #DDDDDD','padding':'5px'});
            $('#'+id).append('<table class="val_Tab"></table>');

            ME.ID = id + '_wrap';

            if(ME.options.readonly == true){
                $('#'+id).find('input').attr('readonly','readonly').css('background-color','#EEEEEE');
                $('#'+id).css('background-color','#EEEEEE');
            }

            if(ME.options.showTips == true){
                $('#'+id).wrap('<div id="'+id+'_wrap" style="position:relative"></div>');
                $('#'+id+'_wrap').prepend('<span class="tips">*</span>');
                var check = $('#'+id).find('input').attr('check');
                var checkArr = check.split(',');

                var arr = [];
                for(var k=0;k<checkArr.length;k++){
                    arr = checkArr[k].split(':');
                    if(arr[0] == 'required'){
                        $('#'+id+'_wrap').prepend('<span class="tips">*</span>');
                    }
                }
            }
        },
        getValue: function(){
            var ME = this;
            var id = ME.element.context.id;
            var forid = $('#'+id).attr('boxFor');
            var val = $('#'+forid).RComboGrid('selectCheckbox');
            return val;
        },
        setValue: function(){
            var ME = this;
            var id = ME.element.context.id;
            var forid = $('#'+id).attr('boxFor');
            var val = $('#'+forid).val();

            var arr = val.split(',');
            $('#'+forid).RComboGrid('setCheckboxVal',arr);

        }
    })
})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明
 * ========   =======  ============================================
 *
 * ========   =======  ============================================
 */

;(function ($, undefined) {
    $.widget('RUI.RUploadfile', {
        options: {
            dataUrl: '',
            addUrl: '',
            fileTypeExts: '',
            fileSizeLimit: '',
            queueSizeLimit: '',
            uploadSuccess: null,
            uploadError:null,
            showfileList:true,
            autoUpload:false,
            disabled:false
        },
        delData:[],
        addData:[],
        _init: function () {

        },
        _create: function () {
            var ME = this;
            var ID = ME.element.context.id;
            var mess  = ME.flashChecker();

            if(ME.options.showfileList){
                $('#' + ID).html('<div class="title"><span class="glyphicon glyphicon-cloud-upload"></span>附件上传(保存后自动上传)<span class="uploadmessage">'+mess+'</span></div><div class="uploaded"><table><tr><th>操作</th><th>文件名称</th><th>文件大小</th><th>上传用户</th><th>上传时间</th></tr> </table> </div><div class="upload_Btn"><input id="' + ID + '_btn" name="file_upload" type="file" multiple="true"></div>');
            }else{
                $('#' + ID).html('<input id="' + ID + '_btn" name="file_upload" type="file" multiple="true">');
                $('#' + ID).removeAttr('class');
            }

            ME.getData();
            ME.setOptions();
        },
        getData: function () {
            var ME = this;
            var ID = ME.element.context.id;
            if(ME.options.dataUrl!=""){
                $.ajax({
                    url: ME.options.dataUrl,
                    type: 'GET',
                    cache:false,
                    success: function (data) {
                        if(typeof(data) != "object"){
                            data = JSON.parse(data);
                        }
                        ME.setTable(data.rows);
                    },
                    error: function (err) {

                    }
                })
            }
        },
        setTable: function (data) {
            var ME = this;
            var ID = ME.element.context.id;

            for (var i = 0; i < data.length; i++) {
                //新增了下载功能
                $('#' + ID + ' table').append('<tr><td><span index="'+data[i].storageid+'" class=" glyphicon glyphicon-remove-circle remove_file"></span>&nbsp;<a href="'+getRootPath_web()+'/common/fileDownload.do?ids='+data[i].storageid+'" class=" glyphicon glyphicon-download download_file"></a></td><td>' + data[i].filename + '</td><td>' + data[i].filesize + '</td><td>' + data[i].creatorname + '</td><td>' + data[i].createdate + '</td></tr>');
            }
            ME.delFile(ME.options.disabled);
        },
        setOptions: function () {
            var ME = this;
            var ID = ME.element.context.id;

            $('#' + ID + '_btn').uploadify({
                'swf': getRootPath_web()+'/CYUI/plugins/uploadify/uploadify.swf',
                'uploader': ME.options.addUrl,
                'auto': ME.options.autoUpload,
                'buttonText': '选择文件',
                'width': 100,
                'removeCompleted': true,
                'fileTypeExts': ME.options.fileTypeExts,
                'multi': true,
                'queueSizeLimit': ME.options.queueSizeLimit,
                'fileSizeLimit': ME.options.fileSizeLimit,
                'successTimeout':7200,
                'removeTimeout':7200,
                'onInit': function(){
                    if(!ME.options.showfileList){
                        $('#'+ID+'_btn-queue').hide();
                    }
                    if(ME.options.disabled){
                        $('#'+ID).find('.upload_Btn').hide();
                    }
                },
                'onUploadSuccess': function (file, data, response){
                    ME.addData.push(file.name);
                    var obj = JSON.parse(data);
                    if(ME.options.uploadSuccess && obj.success){
                        ME.options.uploadSuccess();
                    }
                    if(ME.options.uploadError && !obj.success){
                        ME.options.uploadError(obj.msg);
                    }
                },
                'onUploadError': function (file, errorCode, errorMsg, errorString) {
                    if(ME.options.uploadError){
                        ME.options.uploadError();
                    }
                }
            });
        },
        changeUrl: function(url){
            var ME = this;
            var ID = ME.element.context.id;
            $('#'+ID+'_btn').uploadify('changeUrl',url);
        },
        upload: function(){
            var ME = this;
            var ID = ME.element.context.id;
            $('#'+ID+'_btn').uploadify('upload','*');
        },
        delFile: function(disabled){
            var ME = this;
            var ID = ME.element.context.id;
            if(disabled=="true"){
                $('#'+ID+' .remove_file').each(function(){
                    $(this).removeClass('glyphicon-remove-circle');
                })
            }
            $('#'+ID+' .remove_file').each(function(){
                $(this).unbind('click');
                $(this).bind('click',function(){
                    ME.delData.push($(this).attr('index'));
                    $(this).parent().parent().remove();
                })
            })

        },
        delFile: function(disabled){
            var ME = this;
            var ID = ME.element.context.id;
            if(disabled=="true"){
                $('#'+ID+' .remove_file').each(function(){
                    $(this).removeClass('glyphicon-remove-circle');
                })
            }
            $('#'+ID+' .remove_file').each(function(){
                $(this).unbind('click');
                $(this).bind('click',function(){
                    ME.delData.push($(this).attr('index'));
                    $(this).parent().parent().remove();
                })
            })

        },

        getDelData: function(){
            return this.delData;
        },
        getAddFileName: function(){
            return this.addData;
        },
        getAddFileNum: function(){
            var ME = this;
            var ID = ME.element.context.id;
            var num = $('#'+ID+'_btn-queue').children('div').length;
            return num;
        },
        disabled:function(disabled){
            var ME = this;
            var ID = ME.element.context.id;
            ME.options.disabled = disabled;
            $('#'+ID).find('.upload_Btn').hide();
        },
        flashChecker: function () {
            var hasFlash = 0;         //是否安装了flash
            var flashVersion = 0; //flash版本
            var isIE = /*@cc_on!@*/0;      //是否IE浏览器
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
    })


})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明
 * ========   =======  ============================================
 *
 * ========   =======  ============================================
 */
;(function($,undefined){
	$.widget('RUI.RTabs',{
		options:{
			active:0,
			iframeInfo:null
		},
		_init:function(){},
		_create: function(){
			var ME = this;
			var id = ME.element.context.id;
			var iframeInfo = ME.options.iframeInfo;
			ME.setActive(ME.options.active);

			if(ME.options.iframeInfo){
				for(var i = 0;i < iframeInfo.length;i ++){
					$('#'+iframeInfo[i].id+' div.tab_con').html('<iframe name="iframe-'+iframeInfo[i].id+'" id="iframe-'+iframeInfo[i].id+'" width="100%"  frameborder="0" ></iframe>');
				}
			}
			//直接计算高度，初始设置
			$("#"+id).find('iframe').each(function(index, el) {
				$(el).height(ME.getHeight($(el)));
			});

			$('[name=iframe-'+iframeInfo[ME.options.active].id+']').attr('src',iframeInfo[ME.options.active].url);

			//点击之后进行高度设置
			$('#'+id+' a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
				var iframeId = $(e.target).attr('href').substring(1);
				var liIndex = $(e.target).parent('li').index();
				$("#"+id).find('iframe').each(function(index, el) {
					$(el).height(ME.getHeight($(el)));
				});
				if(!$('[name="iframe-'+iframeId+'"]').attr('src')){
					$('[name="iframe-'+iframeId+'"]').attr('src',iframeInfo[liIndex].url);
				}

			});
		},
		setActive:function(num){
			var ME = this;
			var id = ME.element.context.id;
			var index=parseInt(num);
			var maxIndex=ME.getTabNumbers()
			index=index<maxIndex?index:(maxIndex-1);
			$("#"+id+" ul>li:eq("+index+")").addClass('in active');
			$('#'+id+' .tab-content>.tab-pane:eq('+index+')').addClass('active');
		},
		getTabNumbers:function(){
			var ME = this;
			var id = ME.element.context.id;
			var tabsNumbers=$("#"+id+">ul li").length

			return tabsNumbers;
		},
		getHeight:function(jselector){
			var w_height=$(document).height();
			var otherDivHeight=0;
			var arr=new Array();
			jselector.parents().each(function(index, el) {
				arr[index]=$(el).outerHeight(true);
			});
			for (var i = 0; i < arr.length-2; i++) {
				otherDivHeight+=(arr[i+1]-arr[i]);
			};
			w_height-=(otherDivHeight+5);
			return w_height;
		}
	})
})(jQuery);/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */
;(function($,undefined){
    $.widget('RUI.RCharts',{
        options:{
            width:'',
            height:'',
            type:'',
            dataTitle:[],
            xAxis:'',
            yAxis:'',
            xTitle:'',
            yTitle:'',
            dataUrl:'',
            title:'',
            subtext:'',
            eachName:'',
            eachValue:''
        },
        _init: function(){

        },
        _create: function(){
            var ME = this;
            var ID = ME.element.context.id;
            $('#'+ID).css({'width':ME.options.width,'height':ME.options.height});
            this.getData();
        },
        getData: function(){
            var ME = this;
            var ID = ME.element.context.id;

            $.ajax({
                url:ME.options.dataUrl,
                type:'GET',
                success: function(data){
                    if(ME.options.type == 'bar'){
                        ME.setBar(data);
                    }else if(ME.options.type == 'line'){
                        ME.setLine(data);
                    }else{
                        ME.setPie(data);
                    }
                },
                error: function(){

                }
            })
        },
        setBar: function(data){
            var ME = this;
            var ID = ME.element.context.id;
            var myChart = echarts.init(document.getElementById(ID));

            var iData = [];
            var iDate;
            for(var j=0;j<ME.options.dataTitle.length;j++){
                var ijson = {"name":ME.options.dataTitle[j],"type":ME.options.type};
                iData.push(ijson);
            }
            for(var i=0;i<data.length;i++){
                var idata = [];
                iDate = [];
                for(var k=0;k<data[i].rows.length;k++){
                    idata.push(data[i].rows[k][ME.options.yAxis]);
                    iDate.push(data[i].rows[k][ME.options.xAxis]);
                }
                iData[i].data = idata;
            }

            myChart.setOption({
                title : {
                    text: ME.options.title,
                    subtext: ME.options.subtext
                },
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:ME.options.dataTitle
                },
                xAxis : [
                    {
                        name : ME.options.xTitle,
                        type : 'category',
                        data : iDate
                    }
                ],
                yAxis : [
                    {
                        name : ME.options.yTitle,
                        type : 'value',
                        splitArea : {show : true}
                    }
                ],
                series : iData
            });
        },
        setPie: function(data){
            var ME = this;
            var ID = ME.element.context.id;
            var myChart = echarts.init(document.getElementById(ID));

            var iData = [];
            iData.push({type:'pie', radius : '55%', center: ['50%', '60%']});
            var idata = [];
            for(var i=0;i<data[0].rows.length;i++){
                idata.push({value:data[0].rows[i][ME.options.eachValue],name:data[0].rows[i][ME.options.eachName]});
            }
            iData[0].data = idata;
            myChart.setOption({
                title : {
                    text: ME.options.title,
                    subtext: ME.options.subtext,
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient : 'vertical',
                    x : 'left',
                    data:ME.options.dataTitle
                },
                calculable : true,
                series : iData
            });
        },
        setLine: function(data){
            var ME = this;
            var ID = ME.element.context.id;
            var myChart = echarts.init(document.getElementById(ID));

            var iData = [];
            var iDate;
            for(var j=0;j<ME.options.dataTitle.length;j++){
                var ijson = {"name":ME.options.dataTitle[j],"type":ME.options.type};
                iData.push(ijson);
            }
            for(var i=0;i<data.length;i++){
                var idata = [];
                iDate = [];
                for(var k=0;k<data[i].rows.length;k++){
                    idata.push(data[i].rows[k][ME.options.yAxis]);
                    iDate.push(data[i].rows[k][ME.options.xAxis]);
                }
                iData[i].data = idata;
            }

            myChart.setOption({
                title : {
                    text: ME.options.title,
                    subtext: ME.options.subtext
                },
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:ME.options.dataTitle
                },
                xAxis : [
                    {
                        name : ME.options.xTitle,
                        boundaryGap : false,
                        type : 'category',
                        data : iDate
                    }
                ],
                yAxis : [
                    {
                        name : ME.options.yTitle,
                        type : 'value',
                        splitArea : {show : true}
                    }
                ],
                series : iData
            });
        }
    })
})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */

/*
 * 根据UC或者字典编号，清除Combo或ComboGrid的浏览器缓存
 */
function clearCache(keyarray){
   for(var attr in window.sessionStorage){
     for(var i=0;i<keyarray.length;i++){
         if(attr.indexOf(keyarray[i]) != -1){
             window.sessionStorage.removeItem(attr);
         }
     }
   }
}

function clearAllCache(){
    window.sessionStorage.clear();
}
/*
*创建删除遮罩*/
$.fn.doMask = function(){
    $(this).append('<div class="set_mask"></div>');
    $('div.set_mask').append('<div class="mask_message">正在处理中...</div>');
    $('div.set_mask').css({width:$(this).width(),height:$(this).height()});
    $('div.mask_message').css({left:($('div.set_mask').width()/2-125),top:($(window).height())/2-20});
}
$.fn.removeMask = function(){
    $('div.set_mask').remove();
}
//获取未选择的checkbox的字段
$.fn.extend({
    "AllSerialize": function (isJason) {
        var $f = $(this);
        for(var i = 0; i<$("input").length; i++){
            $("input").eq(i).val($.trim($("input").eq(i).val()));
        }
        var data = $(this).serialize();
        var $allchks = $(this).find(":checked");
        var $chks = $(this).find(":checkbox:not(:checked)");

        data = data.replace(/%E2%88%9A/g,'1');
        data = data.replace(/%C3%97/g,'1');

        //有默认值的输入框
        if($('[role=defaultText]').length > 0){
           var arr = data.split('&');
           $('[role=defaultText]').each(function(){
               var name = $(this).attr('name');
               var defaultText = $(this).siblings('span').html();
               var val = $(this).val();
               for(var i = 0;i < arr.length;i ++){
                  if(arr[i].split('=')[0] == name){
                  
                    arr[i] = name +'=' + defaultText +val;
                    
                    break;
                  }
               }
           })
           data = arr.join('&');
        }
        //去掉金额输入框中的逗号
        if($('[isMoney=true]').length > 0){
           var arr = data.split('&');
           $('[isMoney=true]').each(function(){
               var name = $(this).attr('name');
               var val = $(this).val();
               val = val.replace(/,/g,'');
               for(var i = 0;i < arr.length;i ++){
                  if(arr[i].split('=')[0] == name){
                  
                    arr[i] = name +'=' +val;
                    
                    break;
                  }
               }
           })
           data = arr.join('&');
        }
        
        if ($chks.length != 0 || $allchks.length != 0) {
            var nameArr = [];
            var tempStr = "";
            $chks.each(function () {
                var chkName = $(this).attr("name");
                if(chkName){
                    if ($.inArray(chkName, nameArr) == -1 && $f.find(":checkbox[name='" + chkName + "']:checked").length == 0) {
                        nameArr.push(chkName);
                        tempStr += "&" + chkName + "=0";
                    }
                }
            });
            data += tempStr;
            return data;
        }
        
        $allchks.each(function(){
            var str = $(this).attr('name');
            if(str){
                data = data.replace(eval("/"+str+"=on/"),str+'=1');
            }
        })
        
        if(isJason){
            var obj={};
            var keyvalue=[];
            var key="",value="";
            var paraString=data.split("&");
            for(var i in paraString){
                keyvalue=paraString[i].split("=");
                key=keyvalue[0];
                value=keyvalue[1];
                obj[key]=value;
            }
            return decodeURIComponent(JSON.stringify(obj));
        }else{
            return data;
        }
    }
});
 
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
};
//获取字符串中的数字
 function toGetNum(str){
            var reg = /\d+/g;
            return str.match(reg);
}
//阻止浏览器默认回退事件
$(document).bind('keydown',function(ev){
    var ev = ev || window.event;
    if(ev.keyCode == 8 && ev.target.nodeName.toUpperCase() != 'INPUT' && ev.target.nodeName.toUpperCase() != 'TEXTAREA'){         
        return false;
    }
})


//浮点数加法运算
function FloatAdd(arg1,arg2,pos){

    var r1,r2,m;

    try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
    try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}

    m=Math.pow(10,Math.max(r1,r2));

    return toNbits((arg1*m+arg2*m)/m,pos)

}

//浮点数减法运算
function FloatSub(arg1,arg2,pos){

    var r1,r2,m,n;

    try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
    try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}

    m=Math.pow(10,Math.max(r1,r2));

//动态控制精度长度
    n=(r1>=r2)?r1:r2;

    return toNbits(((arg1*m-arg2*m)/m).toFixed(n),pos)

}

//浮点数乘法运算
function FloatMul(arg1,arg2,pos){

    var m=0,s1=arg1.toString(),s2=arg2.toString();

    try{m+=s1.split(".")[1].length}catch(e){}
    try{m+=s2.split(".")[1].length}catch(e){}

    return toNbits(Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m),pos)

}

//浮点数除法运算
function FloatDiv(arg1,arg2,pos){

    var t1=0,t2=0,r1,r2;

    try{t1=arg1.toString().split(".")[1].length}catch(e){}
    try{t2=arg2.toString().split(".")[1].length}catch(e){}

    with(Math){

        r1=Number(arg1.toString().replace(".",""));
        r2=Number(arg2.toString().replace(".",""));

        return toNbits((r1/r2)*pow(10,t2-t1),pos)

    }
}

//保留小数位数的方法控制
function toNbits(flt,pos) {

    var rd=1;

    for(var i=1;i<=parseInt(pos);i++){
        rd=rd*10;
    }

    if(parseFloat(flt) == flt){
        return Math.round(flt * rd) / rd;
    } else{
        return 0;
    }
}
/**
 * Created by H on 2016/11/11.
 */
;(function($,undefined){
    $.widget('RUI.REditor',{
        options:{
            panelWidth:null,
            PanelHeight:600
        },
        UE:null,
        _init: function(){
            var id = this.element.context.id;
            if(!this.options.panelWidth){

                this.options.panelWidth = $('#'+id).parent().width();
            }
            var ue = UE.getEditor('container',{
                initialFrameWidth:this.options.panelWidth,
                initialFrameHeight:this.options.panelHeight
            });
            this.UE = ue;
        },
        _create: function(){

        },
        setValue: function(data){
            var ME = this;
            ME.UE.ready(function(){
                ME.UE.setContent(data);
            })
        },
        getValue: function(){
            var val = this.UE.getContent();
            return val;
        }
    })
})(jQuery)/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */
;(function($, undefined) {
	$.widget("RUI.RForm", {
		options : {
             /**
             * form需要回调的值
             * @name RForm#value
             * @type Json
             * @default null
             * @example
             * 无
             */
			value:null
		},
		_create: function() {
			var ME = this;
			var ID = this.element.context.id;
            var name = '';
            var data;

            if(ME.options.value.rows.length < 1){
                $.RMessage.alert("消息",ME.options.value.msg,parent.closeWinFn);
                return;
            }else{
                data = ME.options.value.rows[0];
            }

			$('input,select,textarea').each(function(){
				name = $(this).attr('name');

				if(name){
                    if($(this).attr('combogrid')){
                       
                        	//attr的两种情况：1.单选(字段值的隐藏值后面加id,显示值后面加name)；2.多选(字段值隐藏值不加id,显示值加name)
                        	if(data[name]){
                                var attr = name;
                                if(name.indexOf("id")>0){
                                    name = name.substring(0,name.indexOf("id"));
                                }
                        		var arr = [data[attr],data[name+'name']];
                        		if(arr[0]){
                                    $('#'+attr).RComboGrid('setAllValue',arr);
                                }
                              
                        	}
                        
                    }else if(this.tagName == 'SELECT'){
                      
                        	if(data[name]){
                        		//单选多选一致(字段值的影藏值后面加id,显示值不加;combo与combogrid是相反的数组)
                        		var arr = [data[name+'value'],data[name]];
                        		if(arr[0]){
                                   $('#'+name).RCombo('setAllValue',arr);
                                }
                               
                        	}
                        
                    }else if($(this).attr('role') == 'defaultText'){

                        var defaultTextL = $(this).siblings('span').html().length;
                        var dataVal = data[name].substring(defaultTextL);
                        $(this).val(dataVal); 
                                             
                    }else{
                       
                        	if($(this).hasClass('hid_val')){
                                
		                        	if(data[name]){
		                        	
		                        		//combo与combogrid是相反的数组
		                        		var arr = [data[name+'value'],data[name]];
		                        		$(this).val(data[name+'value']);
                                        if(arr[0]){
		                                   $('#'+name).RCombo('setAllValue',arr);
                                        }
                                        
		                        	}
		                        
                        	}else{
                              if(data[name]){
                        		$(this).val(data[name]);
                        	  }
                        	}
                        
                    }
				}
			})
            ME.findCheckBox();
		},
		_init: function() {
		
		},
        /**
         *功能:对checkbox进行选中或不选中设置
         */
        findCheckBox: function(){
            var ME = this;
            var ID = this.element.context.id;
            $('#'+ID).find('input[type=checkbox]').each(function(){
                if($(this).attr('name')){
                    if($(this).attr('value') == '√'){
                         $(this).RCheckbox('setChecked',true);
                    }else{
                         $(this).RCheckbox('setChecked',false);
                    }
                }
            })  
        },
		destroy: function(){
			$.Widget.prototype.destroy.call(this);
		}

	})

})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */

/**
 * @name RCheckbox
 * @class 
 */
; 
(function($, undefined) {
    $.widget("RUI.RCheckbox", {
        options : {
			viewtype : 2,
			readonly: false,
			type:'',
			checked:false
		},
		_create : function() {
			var ME = this;
			var ID = ME.element.context.id;
             $('#'+ID).css({'-webkit-opacity':0,'-moz-opacity':0,'opacity':0,'filter':'alpha(opacity:0)'});
			if(ME.options.readonly){
                if(ME.options.checked){
                   $('#'+ID).prop('checked','checked');
                   $('[for='+ID+']').addClass('ckx_wrap_active_n');
                }else{
                   $('[for='+ID+']').addClass('ckx_wrap_n');
                }
                $('[for='+ID+']').bind('click',function(){
                   	return false;
                })
			}else{
			  if(ME.options.checked){
                   $('#'+ID).prop('checked','checked');
                   $('[for='+ID+']').addClass('ckx_wrap_active');
               }
			  if(ME.options.type == 'radio'){
                 $('[for='+ID+']').bind('click',function(){
                   var groupId = $(this).attr('groupFor');
                   var ifActive = $(this).hasClass('ckx_radio_wrap_active');          
			  	   $('label[groupFor='+groupId+']').removeClass('ckx_radio_wrap_active');
			  	   $('input[groupFor='+groupId+']').prop('checked',false);			  	    
			  	   if(!ifActive){
			  	     	$(this).addClass('ckx_radio_wrap_active');			  	     	  
			  	     	$('#'+ID).prop('checked','checked');			  	     	  
			  	   }
			  	   return false;
			     })
			  }else{
			  	 $('[for='+ID+']').bind('click',function(){

			   	   $(this).toggleClass('ckx_wrap_active');
			     })
			  }
			}		
		},	
		setReadOnly :function(checked){
            var ME = this;
			var ID = ME.element.context.id;
            if(checked){
               $('#'+ID).prop('checked','checked');
               $('[for='+ID+']').removeClass('ckx_wrap_active').addClass('ckx_wrap_active_n');
            }else{
               $('#'+ID).prop('checked',false);

               $('[for='+ID+']').removeClass('ckx_wrap_active').addClass('ckx_wrap_n');

            }
            $('[for='+ID+']').unbind('click');
            $('[for='+ID+']').bind('click',function(){
               	return false;
            })
		},
		setChecked : function(checked) {
			var ME = this;
			var ID = ME.element.context.id;
			if(checked){
				if(ME.options.type == 'radio'){
	               $('#'+ID).prop('checked','checked');
	               $('[for='+ID+']').addClass('ckx_radio_wrap_active');
				}else{
	               $('#'+ID).prop('checked','checked');
	               $('[for='+ID+']').addClass('ckx_wrap_active');
				}
			}else{
				if(ME.options.type == 'radio'){
	               $('#'+ID).prop('checked',false);
	               $('[for='+ID+']').removeClass('ckx_radio_wrap_active');
				}else{
	               $('#'+ID).prop('checked',false);
	               $('[for='+ID+']').removeClass('ckx_wrap_active');
				}
			}
		},
		destroy : function() {
			$.Widget.prototype.destroy.call(this);
		}
	});
})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */

/**
 * @name Rradio
 * @class 
 */
; 
(function($, undefined) {
    $.widget("RUI.Rradio", {
        options : {
			viewtype : 2,
			readonly: false,
			checked:false
		},
		_create : function() {
			var ME = this;
			var ID = ME.element.context.id;
             $('#'+ID).css({'-webkit-opacity':0,'-moz-opacity':0,'opacity':0,'filter':'alpha(opacity:0)'});
			if(ME.options.readonly){
                if(ME.options.checked){
                   $('#'+ID).prop('checked','checked');
                   $('[for='+ID+']').addClass('rdo_wrap_active_n');
                }else{
                   $('[for='+ID+']').addClass('rdo_wrap_n');
                }
                $('[for='+ID+']').bind('click',function(){
                   	return false;
                })
			}else{	
			    if(ME.options.checked){
                   $('#'+ID).prop('checked','checked');
                   $('[for='+ID+']').addClass('rdo_wrap_active');
                }else{
                  if($('input[name = '+$('#'+ID).attr('name')+']').length > 1){
                       $('[for='+ID+']').bind('click',function(){
                           var groupId = $(this).attr('groupFor');
                       	   $('label[groupFor='+groupId+']').removeClass('rdo_wrap_active');
					   	   $(this).addClass('rdo_wrap_active');					   	  
					    })
                  }else{
                  	   $('[for='+ID+']').bind('click',function(){
					   	   $(this).addClass('rdo_wrap_active');
					    })
                  }
                }		  			  
			}		
		},	
		_bindEvent : function() {
			var ME = this;
		},
		setReadOnly :function(checked){
            var ME = this;
			var ID = ME.element.context.id;
            if(checked){
               $('#'+ID).prop('checked','checked');
               $('[for='+ID+']').removeClass('ckx_wrap_active').addClass('rdo_wrap_active_n');
            }else{
               $('#'+ID).prop('checked',false);

               $('[for='+ID+']').removeClass('ckx_wrap_active').addClass('rdo_wrap_n');

            }
            $('[for='+ID+']').unbind('click');
            $('[for='+ID+']').bind('click',function(){
               	return false;
            })
		},
		setValue : function(v) {
			var ME = this;
		},
		destroy : function() {
			$.Widget.prototype.destroy.call(this);
		}
	});
})(jQuery);
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */
;(function($,undefined){
	$.widget('RUI.SimpleGrid',{
     	options:{
            dataUrl:'',
            columns:null,
            pageSize:'',
            height:'',
            primaryKey:null,
            operateFn:[]
     	},
     	pageNum:null,
     	totalpage:null,
      tabData:[],
     	_create: function(){
            var ME = this;
            var ID = ME.element.context.id;
            var tableHead = $('<tr><th><input type="checkbox" /></th></tr>');
            for(var i = 0;i < ME.options.columns.length;i ++){
           	 tableHead.append('<th>'+ME.options.columns[i].title+'</th>');
            }
            
            if(ME.options.operateFn.length > 0){
               tableHead.append('<th>操作</th>');
            }

            $('#'+ID+' .simple_title table').append(tableHead);
            ME.getData();
     	},
     	getData: function(param){
     		var ME = this;
            var ID = ME.element.context.id;
            if(!param){
            	param = {page:'1',rows: ME.options.pageSize};
            }
            $.ajax({
            	url:ME.options.dataUrl,
            	type:'post',
            	dataType:'JSON',
            	data:param,
            	success: function(data){
                    ME.setTable(data.rows);
                    ME.setPage(data);
                    ME.goToPage();
                    ME.tabData = data.rows;
            	},
            	error: function(){

            	}
            })
     	},
     	setTable: function(data){
     	     var ME = this;
           var ID = ME.element.context.id;
           var operateFn = ME.options.operateFn
           $('#'+ID+' .simple_data table').html('');
     
           for(var i = 0;i < data.length;i ++){
           	   var index = '';
           	   if(ME.options.primaryKey){
                   index = data[i][ME.options.primaryKey]
           	   }
           	   var oTr = $('<tr index="'+index+'"><td><input type="checkbox" /></td></tr>');
           	   for(var j = 0;j < ME.options.columns.length;j ++){
           	   	  oTr.append('<td>'+data[i][ME.options.columns[j].text]+'</td>');
           	   }
               var oTd = $('<td></td>');
               for(var k=0;k<operateFn.length;k++){   
                   var oSpan = $('<span></span>'); 
                   oSpan.append(operateFn[k].text); 
   
                   oSpan.bind('click',data[i],operateFn[k].fn)
                   oTd.append(oSpan);
               }
               oTr.append(oTd);
           	   $('#'+ID+' .simple_data table').append(oTr);
           }
           $('#'+ID).find('span').bind('click',function(ev){
              var ev = ev || window.event;

              ev.stopPropagation();
           })
     	},
     	setPage: function(data){
     	   var ME = this;
           var ID = ME.element.context.id;
           ME.pageNum = data.page;
           ME.totalpage = data.totalpage;
           $('#'+ID+' .simple_page').html('<span class="simple_prev"><i class="fa fa-angle-left"></i></span><span class="simple_pageNum">'+data.page+'</span><span class="simple_next"><i class="fa fa-angle-right"></i></span>跳至<input type="text" value="'+data.page+'">页');
           $('#'+ID+' .simple_prev').bind('click',function(){
           	  ME.prev();
           })
           $('#'+ID+' .simple_next').bind('click',function(){
           	  ME.next();
           })
           ME.setHeight();
           ME.setWidth();
           ME.selectRow();
           ME.toDetail();
     	},
     	prev: function(){
           var ME = this;
           var ID = ME.element.context.id;
           if(ME.pageNum > 1){
              ME.getData({page:(--ME.pageNum),rows: ME.options.pageSize});
           }
     	},
     	next: function(){
           var ME = this;
           var ID = ME.element.context.id;
           if(ME.pageNum < ME.totalpage){
              ME.getData({page:(++ME.pageNum),rows: ME.options.pageSize});
           }
     	},
     	goToPage: function(){
     	   var ME = this;
           var ID = ME.element.context.id;

           $('#'+ID+' .simple_page input').bind('keyup',function(ev){
           	   ev = ev || window.event;
               if(ev.keyCode == 13){        
                   var val = $(this).val();
                   if(val <= ME.totalpage && val >= 1){
		               ME.getData({page:val,rows: ME.options.pageSize});
		           }
               }
           })
     	},
     	setHeight: function(){
     	   var ME = this;
           var ID = ME.element.context.id;

           if(ME.options.height){
               $('#'+ID+' .simple_data').height(ME.options.height);
           }else{
               $('#' + ID).parents('body').css({'height': '100%'});
               $('#' + ID).parents('html').css({'height': '100%'});             
               var h = 0;
               var len = $('#' + ID).siblings('div').length;
               for(var i=0;i< len;i++){
                  h += $('#' + ID).siblings('div').eq(i).height();
               }
               h = h+165;
            
               $('#'+ID+' .simple_data').css('height', ($('body').height() - h));
           }
     	},
     	setWidth: function(){
     		var ME = this;
            var ID = ME.element.context.id;
            var widarr = [];

            for(var i=0;i < $('#'+ID+ ' .simple_data tr:first td').length;i++){               
                widarr.push($('#'+ID+ ' .simple_data tr:first td').eq(i).width());                                  
            }     
            for (var i = 0; i < widarr.length; i++){
                $('#' + ID + ' .simple_title th').eq(i).outerWidth(widarr[i]);
            }
            if($('#' + ID + ' .simple_title').width() > $('#' + ID + ' .simple_data table').width()){
                $('#' + ID + ' .simple_title table').width($('#' + ID + ' .simple_title').width() - 17)
            }
     	},
     	selectRow: function(){
     		var ME = this;
        var ID = ME.element.context.id;

     		$('#'+ID+' .simple_data tr').bind('click',function(){
     			    $(this).find('input').prop('checked',true);
     			    $(this).addClass('simple_select_row');
     		})
     		$('#'+ID+' .simple_data tr input').bind('click',function(ev){
               ev = ev || window.event;
               if($(this).is(':checked')){              	
               	   $(this).parent().parent().addClass('simple_select_row');
               }else{
                   $(this).parent().parent().removeClass('simple_select_row');
               }
               ev.stopPropagation();
     		})
     		$('#'+ID+' .simple_title input').bind('click',function(){
     		   if($(this).is(':checked')){              	
               	   $('#'+ID+' .simple_data input').prop('checked',true);
               	   $('#'+ID+' .simple_data tr').addClass('simple_select_row');
               }else{
                   $('#'+ID+' .simple_data input').prop('checked',false);
                   $('#'+ID+' .simple_data tr').removeClass('simple_select_row');
               }
     		});
     	},
     	getRows: function(){
           var ME = this;
           var ID = ME.element.context.id;
           var arr = [];

           $('#'+ID+' .simple_data td input:checked').each(function(){
           	   arr.push($(this).parent().parent().attr('index'));
           })
           return arr;          
     	},
      getSelectedDatas: function(){
           var ME = this;
           var ID = ME.element.context.id;
           var arr = [];
           var tabData = ME.tabData;
           $('#'+ID+' .simple_data td input:checked').each(function(){
              var index = $(this).index();
              arr.push(tabData[index]);
           })
           return arr;
      },
      setGridParam: function(param){
           var ME = this;
           param = $.extend({'page':'1','rows':ME.options.pageSize},param);
           ME.getData(param);
      },
      toDetail: function(){
           var ME = this;
           var ID = ME.element.context.id;           
           $('#'+ID+' tr a').bind('click',function(ev){
                var ev = ev || window.event;

                ev.stopPropagation();
           })

      },
     	_init:function(){

     	}
     })
})(jQuery)
/*
 * 系统名称: RUI
 * 软件版权: ceyingfintech
 * 作者：chx
 * 邮箱：chx
 * 修改记录:
 * 修改日期             修改人员         修改说明 
 * ========   =======  ============================================
 * 
 * ========   =======  ============================================
 */
;(function($,undefined){
	$.widget('RUI.DvTextField',{
		options:{
            selectable : true,
			viewtype : 2,
			showTips: false,
			readonly: false,
		},
		ID:'',
		_create:function(){
            var ME = this;
			var id = ME.element.context.id;
            ME.ID = id + '_wrap';

			if(ME.options.readonly == true){
				$('#'+id).find('input').attr('readonly','readonly').css('background-color','#EEEEEE');
				$('#'+id).css('background-color','#EEEEEE');
			}

			if(ME.options.showTips == true){
				$('#'+id).wrap('<div id="'+id+'_wrap" style="position:relative"></div>');
				var check = $('#'+id).find('input').attr('check');
				var checkArr = check.split(',');

				var arr = [];
				for(var k=0;k<checkArr.length;k++){
					arr = checkArr[k].split(':');
					if(arr[0] == 'required'){
						$('#'+id+'_wrap').prepend('<span class="tips">*</span>');
					}
				}

			}
		},
		setDefaultValue:function(value){
            var ME = this;
			var id = ME.element.context.id;
            
            $('#'+id+' span').html(value);
            
		},
		_init: function(){

		}
	})
})(jQuery)
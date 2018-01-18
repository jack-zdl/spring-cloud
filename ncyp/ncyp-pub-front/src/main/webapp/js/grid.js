$('.operation_block span').bind('click',function(){
	$(this).parent('div').find('span').removeClass('active');
	$(this).addClass('active');
});
// $("#tab").RGrid({
// 	dataUrl :"http://localhost:8082/webx/js/data.json",
// 	colModel :[
// 	             {name : 'code',index : 'code',sortable:false},
// 	             {name : 'createdby',index : 'createdby',sortable:false},
// 	             {name : 'dataRight',index : 'dataRight',sortable:false},
// 	             {name : 'isactive',index : 'isactive',sortable:false},
// 	             {name : 'lastmodifiedon',index : 'lastmodifiedon',sortable:false}
// 			  ],
// 	colNames :[ '标题', '标题', '标题', '标题', '标题' ],
// 	isDefine :[test,'支付'],
// 	multiSelect: false,
// 	rownumWidth: '50'
// });
// function test(){
//     alert('支付去~');
// }
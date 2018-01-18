/**
 * 版本：_FVERSION_
 * @author qudc
 */
(function($) {
    $.FUI = $.FUI || {};
    $.FUI.lang = $.FUI.lang || {};

    /**
     * FUI工具类的国际化信息
     */
    window['$i18n'] = {
        'mask':{
            'defaultMsg':"正在处理,请稍候..."
        }

    }


    /**
     *ajax 组件相关提示信息的国际化
     * FUI提供的ajax的默认错误处理函数，用户可以通过以下方式来实现： $.extend($.FUI.FAjax,{_defaultErrorHandler:function(error){//错误处理代码}})
     */
    $.FUI.FAjax._defaultErrorHandler = function(result) {
        //默认的错误处理 调用FUI.Messagebox 进行错误提示，提示内容：错误号，错误信息 ，暂时用alert框来实现。
        alert(result.errorNo + ":::" + result.errorInfo);
    }


    // jQuery validate
    $.extend($.validator.messages, {
        required: "必填字段",
        remote: "请修正该字段",
        email: "请输入正确格式的电子邮件",
        url: "请输入合法的网址",
        date: "请输入合法的日期",
        dateISO: "请输入合法的日期 (ISO).",
        number: "请输入合法的数字",
        digits: "只能输入整数",
        creditcard: "请输入合法的信用卡号",
        equalTo: "请再次输入相同的值",
        accept: "请输入拥有合法后缀名的字符串",
        maxlength: $.validator.format("长度最多是 {0} 的字符串"),
        minlength: $.validator.format("长度最少是 {0} 的字符串"),
        rangelength: $.validator.format("长度介于 {0} 和 {1} 之间的字符串"),
        range: $.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
        max: $.validator.format("请输入一个最大为 {0} 的值"),
        min: $.validator.format("请输入一个最小为 {0} 的值"),

        alphanumeric: "字母、数字、下划线",
        lettersonly: "必须是字母",
        phone: "数字、空格、括号"
    });
    //add by qudc  2012-10-31 添加表格无数据时的提示内容的国际化信息。
    $.FUI.lang.grid = {
        emptyMsg:"没有数据"
    }

    //add by qudc  2012-10-31 添加分页栏的国际化信息。
    $.FUI.lang.pagingbar = {
        pageTotalMsg:"显示{0}到{1},共{2}条数据",
        beforePageText : "第",
        afterPageText  : "页 共{0} 页",
        beforePageSizeText  : "每页",
        afterPageSizeText  : "条"
    }

    $.FUI.lang.message = {
        errorCode:"错误码"
    }

    $.FUI.lang.custom = {
        errorinfo : "数据为空"
    }

})(jQuery);
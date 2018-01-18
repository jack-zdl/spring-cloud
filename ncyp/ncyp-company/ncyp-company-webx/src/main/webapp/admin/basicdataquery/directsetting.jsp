<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<div class="operate_btn_list clearfix">
    <ul>
        <li>
            <div onclick="area()">
                <p>区域</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
        <li>
            <div onclick="bank()">
                <p>银行</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
        <li>
            <div onclick="banklocation()">
                <p>开户银行</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
        <li>
            <div onclick="transcode()">
                <p>交易信息码</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
        <li>
            <div onclick="directchannel()">
                <p>直联渠道</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
        <li>
            <div onclick="directchannelArea()">
                <p>直联渠道区域</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
        <li>
            <div onclick="directchannelCmd()">
                <p>直联渠道指令</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
        <li>
            <div onclick="directchannelCmdParamdef()">
                <p>直联渠道指令参数定义</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
        <li>
            <div onclick="directchannelCmdParamval()">
                <p>直联渠道指令参数值</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
        <li>
            <div onclick="directchannelTransCode()">
                <p>直联渠道交易信息码</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
        <li>
            <div onclick="directchannelTransResult()">
                <p>直联渠道交易结果</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
        <li>
            <div onclick="directqueryCmdConfig()">
                <p>直联查询指令配置</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
    </ul>
</div>

<script>
    var basicdataCloseWinFn = function(){
        $("#areaModal").modal("hide");
        $("#bankModal").modal("hide");
        $("#banklocationModal").modal("hide");
        $("#transcodeModal").modal("hide");
        $("#directchannelModal").modal("hide");
        $("#directchannelAreaModal").modal("hide");
        $("#directchannelCmdModal").modal("hide");
        $("#directchannelCmdParamdefModal").modal("hide");
        $("#directchannelCmdParamvalModal").modal("hide");
        $("#directchannelTransCodeModal").modal("hide");
        $("#directchannelTransResultModal").modal("hide");
        $("#directqueryCmdConfigModal").modal("hide");

    }
    function area()
    {
        var url = "${pageContext.request.contextPath}/admin/area/areas.jsp";
        $("#areaModal").RWin("createWin", url);
    }
    function bank()
    {
        var url = "${pageContext.request.contextPath}/admin/bank/banks.jsp";
        $("#bankModal").RWin("createWin", url);
    }
    function banklocation()
    {
        var url = "${pageContext.request.contextPath}/admin/banklocations/banklocations.jsp";
        $("#banklocationModal").RWin("createWin", url);
    }
    function transcode()
    {
        var url = "${pageContext.request.contextPath}/admin/transcodes/transcodes.jsp";
        $("#transcodeModal").RWin("createWin", url);
    }
    function directchannel()
    {
        var url = "${pageContext.request.contextPath}/admin/directchannel/directchannels.jsp";
        $("#directchannelModal").RWin("createWin", url);
    }
    function directchannelArea()
    {
        var url = "${pageContext.request.contextPath}/admin/directchannel/directchannelareas.jsp";
        $("#directchannelAreaModal").RWin("createWin", url);
    }
    function directchannelCmd()
    {
        var url = "${pageContext.request.contextPath}/admin/directchannel/directchannelcmds.jsp";
        $("#directchannelCmdModal").RWin("createWin", url);
    }
    function directchannelCmdParamdef()
    {
        var url = "${pageContext.request.contextPath}/admin/directchannel/directchannelcmdparamcef.jsp";
        $("#directchannelCmdParamdefModal").RWin("createWin", url);
    }
    function directchannelCmdParamval()
    {
        var url = "${pageContext.request.contextPath}/admin/directchannel/directchannelcmdparamval.jsp";
        $("#directchannelCmdParamvalModal").RWin("createWin", url);
    }
    function directchannelTransCode()
    {
        var url = "${pageContext.request.contextPath}/admin/directchannel/directchanneltranscodes.jsp";
        $("#directchannelTransCodeModal").RWin("createWin", url);
    }
    function directchannelTransResult()
    {
        var url = "${pageContext.request.contextPath}/admin/directchannel/directchanneltransresults.jsp";
        $("#directchannelTransResultModal").RWin("createWin", url);
    }
    function directqueryCmdConfig()
    {
        var url = "${pageContext.request.contextPath}/admin/directchannel/directquerycmdconfigs.jsp";
        $("#directqueryCmdConfigModal").RWin("createWin", url);
    }
</script>
</body>
</html>

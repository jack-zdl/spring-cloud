<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
	SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
	String userid = currUser.getUserId();
%>
<html>
<style>

	body{
		background: #fff;
	}
	.page-content{
		padding: 8px 20px;
	}
	.chosen-container-multi ul.chosen-choices{
		height: 30px !important;
		overflow: auto;
	}
	.dd{
		max-width: none;
	}
	.middle-box {
		z-index: 100;
		font-size: 170px;
		max-width: 400px;
		margin: 140px auto 0;
		padding-top: 110px;
		width: 300px;
		text-align: center;
		animation-fill-mode: both;
		animation-iteration-count: 1;
		animation-duration: 2s;
		backface-visibility: visible;
		animation-name: fadeInDown;
	}
	@keyframes fadeInDown {
		0% {
			opacity: 0;
			-webkit-transform: translateY(-20px);
			-ms-transform: translateY(-20px);
			transform: translateY(-20px)
		}
		100% {
			opacity: 1;
			-webkit-transform: translateY(0);
			-ms-transform: translateY(0);
			transform: translateY(0)
		}
	}
</style>
</head>
<r:win title="待办事项" id="newpage"  maxable="true"></r:win>
<body class="no-skin">
<div class="main-container" id="main-container">

	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<div class="dd dd-draghandle">
							<ol class="dd-list">
								<%--<li class="dd-item dd2-item" style="cursor: pointer;" onclick="toNewpage(id)" id="ALLOCATEAPPLY" ></li>--%>
							</ol>
						</div>
					</div>
				</div>
			</div><!-- /.page-content -->
		</div>
	</div><!-- /.main-content -->
</div><!-- /.main-container -->

<script type="text/javascript">

    function toNewpage(){
        var url ="${pageContext.request.contextPath}/workflow/client/todo/todoTask.jsp";
        window.open(url);
//			  $("#newpage").RWin('createWin',url);
//            window.location.href = url;
//            window.parent.createNewpageWin(id);
    }
    $(function($){
        Ajax.req({
            url: configObject.TAG+'/workbench/agreementTempTodo.do',
            type:"json",
            method:"post",
            async:false,
            params: {
                userId:"<%=userid%>"
            },
            ok: function(text) {
                var liString='';
                console.log(text);
                console.log(text.rows.length);
                if(text.rows.length > 0) {
//                    for (var i = 0; i < text.data.length; i++) {
//                        var flow = text.data[i];
//                        var id = flow.processid;
                        liString += '<li class="dd-item dd2-item" style="cursor: pointer;" onclick="toNewpage()" id="'  + '" >\
											<div class="dd-handle dd2-handle" >\
												<i class="normal-icon ace-icon fa fa-bars blue bigger-130"></i>\
												<i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>\
											</div>\
											<div class="dd2-content" >\
												三方模板任务' + /*flow.procname +*/ '\
												<span class="label label-warning arrowed-in-right" style="margin-left:20px;">\
													共' + text.rows.length + '笔\
												</span>\
											</div>\
										</li>';
//                    }
                } else {
                    liString += '<div class="middle-box"><h1>暂无待办任务</h1></div>';
                }
                $('.dd-list').append(liString);

                /* $('.dd2-item').click(function(event) {
                    fcloud.addFrameModal($(this));
                    var el=$(this);
                    fcloud.frameModalShowEvent($(this));
                    fcloud.frameModalShownEvent($(this));
                }); */

            },
            err: function(text) {
                alert("消息："+text);
            }
        });
        /* .done(function(data) {
            var arr=data['ret_data'].data;
            var liString='';
            for (var i = 0; i < arr.length; i++) {
                var flow=arr[i];
                liString+='<li class="dd-item dd2-item" style="cursor: pointer;" data-href="'+flow.processid+'.html" id="'+flow.processid+'">\
                                <div class="dd-handle dd2-handle">\
                                    <i class="normal-icon ace-icon fa fa-bars blue bigger-130"></i>\
                                    <i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>\
                                </div>\
                                <div class="dd2-content" >\
                                    '+flow.procname+'\
                                    <span class="label label-warning arrowed-in-right" style="margin-left:20px;">\
                                        共'+flow.processidnum+'笔\
                                    </span>\
                                </div>\
                            </li>';
            };
            $('.dd-list').append(liString);
        }) */
        /* .fail(function() {
        }) */
        /* .always(function() {
            // $('.dd').nestable();
            // $('.dd-handle a').on('mousedown', function(e){
            // 	e.stopPropagation();
            // });
            $('.dd2-item').click(function(event) {
                fcloud.addFrameModal($(this));
                var el=$(this);
                fcloud.frameModalShowEvent($(this));
                fcloud.frameModalShownEvent($(this));
            });;
        }); */

    });

</script>
</body>
</html>

		

					
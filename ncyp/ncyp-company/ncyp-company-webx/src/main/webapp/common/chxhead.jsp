<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<meta http-equiv="X-UA-Compatible" content="IE=9;IE=8;IE=7;IE=EDGE">
<head>
    <title>策赢平台</title>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/font-awesome.min.css" />
    <link href="${pageContext.request.contextPath}/CYUI/bootstrap/assets/css/datepicker.css" rel="stylesheet" type="text/css"  />
    <link href="${pageContext.request.contextPath}/CYUI/bootstrap/assets/css/RUI.all.css" rel="stylesheet" type="text/css"  />

    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/bootstrap/assets/js/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/js/RUI.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/plugins/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/js/adapter.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/js/base64.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/js/CfcaSign.js"></script>

    <style>
        body {
            background: rgba(0, 0, 0, .1);
        }

        ul, li {
            list-style: none;
            margin: 0;
            padding: 0;
            cursor: pointer;
        }

        .items:hover{
            box-shadow: 0 3px 10px #000;
        }
        .active{
            border: 2px solid #2E90CF;
        }

        .banner {
            width: 100%;
            height: 46px;
            font-size: 24px;
            line-height: 46px;
            padding: 0 20px;
            background-color: #2E90CF;
            color: white;
            position: fixed;
        }
        .banner>i{
            vertical-align: middle;
        }

        .list-btn {
            width: 100%;
            height: 66px;
            background-color: white;
            margin: 10px auto;
            padding: 0 10px;
            overflow: hidden;
        }

        .list-btn > div {
            float: left;
        }

        .owner-logo {
            width: 40px;
            height: 40px;
            border-radius: 100%;
            overflow: hidden;
            margin-right: 10px;
        }

        .owner-name {
            font-size: 18px;
            font-weight: bolder;
            vertical-align: middle;
        }

        .owner {
            margin-right: 50px;
        }

        .details {
            font-size: 14px;
        }

        .details > div {
            float: right;
            padding: 10px 0;
            width: 240px;
        }

        .details-text {
            margin-right: 50px;
        }

        .details-date {
            margin-right: 50px;
        }

        .details-status {
            margin-right: 10px;
        }

        #right-list {
            padding: 20px 0 10px 42px;
            -webkit-box-shadow: -10px 0 10px;
            box-shadow: -10px 0 10px;
            background-color: white;
            display: none;
        }
        .right-list-title{
            background-color: gainsboro;
            width: 100%;
            height: 32px;
            position: absolute;
            top: 0;
            left: 0;
            text-align: right;
            padding: 0 40px;
            color: gray;
            font-size: 24px;
            /*cursor: pointer;*/
        }

        @media (max-width: 767px) {
            button {
                height: 120px;
            }
        }

        @keyframes fadeInRight {
            from {
                opacity: 0;
                transform: translate3d(100%, 0, 0);
            }

            to {
                opacity: 1;
                transform: none;
            }
        }

        .fadeInRight {
            animation-name: fadeInRight;
            animation-duration: 1s;
            animation-fill-mode: both;
            width: 50%;
            position: fixed;
            top: 46px;
            right: 0;
            display: inline-block;
            padding-bottom: 16px;
        }

        @keyframes fadeOutRight {
            from {
                opacity: 1;
            }

            to {
                opacity: 0;
                transform: translate3d(100%, 0, 0);
            }
        }

        .fadeOutRight {
            animation-name: fadeOutRight;
            animation-duration: 1s;
            animation-fill-mode: both;
            width: 50%;
            position: fixed;
            top: 46px;
            right: 0;
            display: inline-block;
        }

        .right-list-details {
            margin: 20px 10px;
            padding: 10px;
            /*height: 486px;*/
            overflow: auto;
        }
        .scrollbar::-webkit-scrollbar{
            width: 8px;
            height: 16px;
            background-color: #f5f5f5;
        }
        .scrollbar::-webkit-scrollbar-track{
            box-shadow: inset 0 0 6px rgba(0,0,0,.3);
            border-radius: 10px;
            background-color: #f5f5f5;
        }
        .scrollbar::-webkit-scrollbar-thumb{
            height: 20px;
            border-radius: 10px;
            box-shadow: inset 0 0 6px rgba(0,0,0,.3);
            background-color: gainsboro;
        }
        .right-list-details-menu > ul {
            cursor: default;
        }
        .right-list-details-menu > ul > li {
            margin: 10px auto;
            cursor: default;
        }

        .right-list-details-menu > ul > li > div {
            display: inline-block;
        }

        .right-list-details-title {
            width: 150px;
        }

        .right-list-details-text {
            text-align: center;
        }

        .right-list-flow {
            padding: 10px;
        }

        .msg-others {
            border-bottom: 1px solid black;
            margin: 5px 10px;
            float: left;
            width: 50%;
            border-radius: 10px 10px;
            background-color: #bce8f1;
            cursor: pointer;
        }

        .msg-mine {
            border-bottom: 1px solid black;
            margin: 5px 10px;
            float: right;
            width: 50%;
            border-radius: 10px 10px;
            background-color: #bce8f1;
            cursor: pointer;
        }

        .msg-menu > p {
            margin-bottom: 0;
            text-align: left;
        }

        .msg-client {
            margin-left: 10px;
            font-size: 16px;
        }

        .msg-details {
            margin-left: 20px;
            font-size: 14px;
        }

        .msg-date {
            margin-left: 10px;
            color: gray;
            font-size: 12px;
        }

        .right-list-btns {
            position: absolute;
            left: 0;
            bottom: 0;
            height: 80px;
            width: 100%;
            text-align: center;
            margin: -35px 0;
            padding-top: 6px;
            box-shadow: 0 -5px 5px gainsboro;
        }

        .right-list-btns > .btn {
            width: 106px;
            height: 32px;
            margin-right: 20px;
        }
        .page-content {
            padding: 8px 20px;
        }
        .chosen-container-multi ul.chosen-choices{
            height: 30px !important;
            overflow: auto;
        }
        .dd{
            max-width: none;
        }

        .chosen-container-multi ul.chosen-choices {
            height: 30px !important;
            overflow: auto;
        }

        .dd {
            max-width: none;
        }

        .gray-bg {
            color: #a7aaab;
            background-color: #f3f3f4;
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

        .font-bold {
            font-weight: 600;
        }

        /*等待效果样式start*/
        .ibox{
            display: block;
            /*display: none;*/
        }
        .sk-spinner-cube-grid.sk-spinner
        {
            width: 50px;
            height: 50px;
            margin: 0 auto;
        }.sk-spinner-cube-grid .sk-cube
         {
             float: left;
             width: 33%;
             height: 33%;

             -webkit-animation: sk-cubeGridScaleDelay 1.3s infinite ease-in-out;
             animation: sk-cubeGridScaleDelay 1.3s infinite ease-in-out;

             background-color: #2E90CF;;
         }.sk-spinner-cube-grid .sk-cube:nth-child(1)
          {
              -webkit-animation-delay: .2s;
              animation-delay: .2s;
          }.sk-spinner-cube-grid .sk-cube:nth-child(2)
           {
               -webkit-animation-delay: .3s;
               animation-delay: .3s;
           }.sk-spinner-cube-grid .sk-cube:nth-child(3)
            {
                -webkit-animation-delay: .4s;
                animation-delay: .4s;
            }.sk-spinner-cube-grid .sk-cube:nth-child(4)
             {
                 -webkit-animation-delay: .1s;
                 animation-delay: .1s;
             }.sk-spinner-cube-grid .sk-cube:nth-child(5)
              {
                  -webkit-animation-delay: .2s;
                  animation-delay: .2s;
              }.sk-spinner-cube-grid .sk-cube:nth-child(6)
               {
                   -webkit-animation-delay: .3s;
                   animation-delay: .3s;
               }.sk-spinner-cube-grid .sk-cube:nth-child(7)
                {
                    -webkit-animation-delay: 0s;
                    animation-delay: 0s;
                }.sk-spinner-cube-grid .sk-cube:nth-child(8)
                 {
                     -webkit-animation-delay: .1s;
                     animation-delay: .1s;
                 }.sk-spinner-cube-grid .sk-cube:nth-child(9)
                  {
                      -webkit-animation-delay: .2s;
                      animation-delay: .2s;
                  }@-webkit-keyframes sk-cubeGridScaleDelay
                   {
                       0%,
                       100%,
                       70%
                       {
                           -webkit-transform: scale3D(1,1,1);
                           transform: scale3D(1,1,1);
                       }35%
                        {
                            -webkit-transform: scale3D(0,0,1);
                            transform: scale3D(0,0,1);
                        }
                   }@keyframes sk-cubeGridScaleDelay
                    {
                        0%,
                        100%,
                        70%
                        {
                            -webkit-transform: scale3D(1,1,1);
                            transform: scale3D(1,1,1);
                        }35%
                         {
                             -webkit-transform: scale3D(0,0,1);
                             transform: scale3D(0,0,1);
                         }
                    }
        /*等待效果样式end*/
    </style>
</head>
<body>
package com.ceying.common.util.rpc;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

public class AESEncrypt {

    private static final String ALGO = "AES";

    public static String getKeyForJS(String id) throws Exception{
        String password = getKey(id);
        String keyForJS = Base64.getEncoder().encodeToString(password.getBytes("UTF-8"));
        return keyForJS;
    }

    public static String getKey(String id) throws Exception{
        String password = "";
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest((id + "CeYing-FinTech-2017").getBytes("UTF-8"));
            password = Base64.getEncoder().encodeToString(messageDigest);

            while(password.length() < 32){
                password = "0" + password;
            }
            password = password.substring(15, 31);
        }
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        return password;
    }

    /** 三方协议加密
     *
     * @param taContractId  三方协议合同编号 TAxxxx
     * @param ta 三方协议全文（文本字符串）
     * @return 三方协议加密后内容
     * @throws Exception
     */
    public static String taEncrypt(String taContractId, String ta) throws Exception {
        String password = getKey(taContractId);
        return encrypt(ta, password);
    }

    // 三方协议解密
    public static String taDecrypt(String taContractId, String cipherText) throws Exception {
        String password = getKey(taContractId);
        return decrypt(cipherText, password);
    }

    public static String encrypt(String plainText, String password){
        String cipherText = "";
        try {
            Encoder encoder = Base64.getEncoder();
            Key key = new SecretKeySpec(password.getBytes("UTF-8"), ALGO);
            String keyForJS = encoder.encodeToString(password.getBytes("UTF-8"));

            Cipher c = Cipher.getInstance(ALGO);
            c.init(Cipher.ENCRYPT_MODE, key);
            byte[] encVal = c.doFinal(plainText.getBytes("UTF-8"));
            cipherText = encoder.encodeToString(encVal);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cipherText;
    }

    public static String decrypt(String cipherText, String password){
        String plainText = "";

        try {
            Decoder decoder = Base64.getDecoder();
            Key key = new SecretKeySpec(password.getBytes(), ALGO);

            Cipher c = Cipher.getInstance(ALGO);
            c.init(Cipher.DECRYPT_MODE, key);
            byte[] cipherBytes = decoder.decode(cipherText);
            byte[] decVal = c.doFinal(cipherBytes);
            plainText = new String(decVal);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plainText;
    }

    public static void main(String[] args) throws Exception {
        String cSrc = "\n" +
                "\n" +
                "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n" +
                "    \n" +
                "    <html xmlns=\"http://www.w3.org/1999/xhtml\">\n" +
                "    \n" +
                "<head>  \n" +
                "            <link rel=\"canonical\" href=\"http://blog.csdn.net/chengfei112233/article/details/5842085\"/> \n" +
                "\n" +
                "   \n" +
                "\n" +
                "  \n" +
                " <meta http-equiv=\"Cache-Control\" content=\"no-siteapp\" /><link rel=\"alternate\" media=\"handheld\" href=\"#\" />\n" +
                "\n" +
                "    <meta name=\"shenma-site-verification\" content=\"5a59773ab8077d4a62bf469ab966a63b_1497598848\"> \n" +
                "       \n" +
                "    <title>js转string为byte[] - chengfei112233的专栏\n" +
                "        - CSDN博客</title>\n" +
                "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n" +
                "    <meta name=\"description\" content=\"function stringToBytes ( str ) {  var ch, st, re = [];  for (var i = 0; i &lt; str.length; i++ ) {    ch = str.charCodeAt(i);  // get char     st = [];                 // set up stack    do {      st.push( ch &amp; 0xFF );  // push byte to sta\" />\n" +
                "\n" +
                "    <meta name=\"keywords\" content=\"byte,string,function\" />\n" +
                "\n" +
                "   \n" +
                "    <script src=\"http://static.blog.csdn.net/scripts/blog_static_head.min.js\" type=\"text/javascript\"></script>\n" +
                "\n" +
                "    \n" +
                "        <!--new top-->\n" +
                "       \n" +
                "       \n" +
                "        <!--new top-->\n" +
                "    \n" +
                "      <!-- ad begin -->\n" +
                "         \n" +
                "    <!-- ad end-->\n" +
                "\n" +
                "    <link rel=\"Stylesheet\" type=\"text/css\" href=\"http://static.blog.csdn.net/skin/light_blue/css/style.css?v=1.1\" />\n" +
                "\n" +
                "    \n" +
                "\n" +
                "    <link id=\"RSSLink\" title=\"RSS\" type=\"application/rss+xml\" rel=\"alternate\" href=\"/chengfei112233/rss/list\" />\n" +
                "    <link rel=\"shortcut icon\" href=\"http://c.csdnimg.cn/public/favicon.ico\" />\n" +
                "    <link type=\"text/css\" rel=\"stylesheet\" href=\"http://static.blog.csdn.net/scripts/SyntaxHighlighter/styles/simple.css\" />\n" +
                " \n" +
                "\n" +
                "\n" +
                "\n" +
                "    <link href=\"http://c.csdnimg.cn/blog/csdn_public_blog_detail.min.css\" type=\"text/css\" rel=\"stylesheet\" />\n" +
                "     \n" +
                "         <link rel=\"stylesheet\" href=\"http://static.blog.csdn.net/css/csdn_blog_detail.min.css\" />\n" +
                "\n" +
                "  \n" +
                "\n" +
                "\n" +
                "    <!-- 请置于所有广告位代码之前 --> \n" +
                "            <script src=\"http://dup.baidustatic.com/js/ds.js\"></script>\n" +
                "\n" +
                "</head>\n" +
                "\n" +
                "\n" +
                "<body>\n" +
                "     \n" +
                "        <div class=\"tracking-ad\" data-view=\"true\" data-mod=\"ad_popu_72\"  data-mtp=\"62\" data-order=\"40\" data-con=\"ad_content_2072\" >\n" +
                "                     <script id=\"popuLayer_js_q\" src=\"http://ads.csdn.net/js/popuLayer.js\" defer=\"defer\"  type=\"text/javascript\"></script>\n" +
                "                <div id=\"layerd\" style=\"position: fixed;bottom:0px;right:0px;line-height:0px;z-index:1000\">\n" +
                "    \t                <div class=\"J_close layer_close\" style=\"display:;background-color:#efefef;padding:0px;color:#333;font:12px/24px Helvetica,Tahoma,Arial,sans-serif;text-align:right;\">关闭</div><!-- 广告占位容器 --><div id=\"cpro_u2895327\"></div></div>\n" +
                "                <script>  document.getElementById(\"popuLayer_js_q\").onload = function () { var styObjd = styObj = { width: \"300px\", \"height\": parseInt(250) + 28 }; window.CSDN.Layer.PopuLayer(\"#layerd\", { storageName: \"layerd\", styleObj: styObjd, total: 50, expoire: 1000 * 60 }); }</script><!-- 投放代码 --><script type=\"text/javascript\">                    /*服务器频道首页置顶Banner960*90，创建于2014-7-3*/    (window.cproArray = window.cproArray || []).push({ id: \"u2895327\" });  </script>  <script src=\"http://cpro.baidustatic.com/cpro/ui/c.js\" type=\"text/javascript\"></script>\n" +
                "     \n" +
                "        </div>\n" +
                "\n" +
                "    <!-- 广告位开始 -->\n" +
                "        \n" +
                "    <!-- 广告位结束 -->\n" +
                "\n" +
                "    \n" +
                "   \n" +
                "      <!--new top-->\n" +
                "    <script id=\"toolbar-tpl-scriptId\" fixed=\"true\" prod=\"blog\" skin=\"black\" src=\"http://c.csdnimg.cn/public/common/toolbar/js/html.js\" type=\"text/javascript\"></script>\n" +
                "     <!--new top-->\n" +
                "    <div id=\"container\">\n" +
                "        <div id=\"header\">\n" +
                "    <div class=\"header\">\n" +
                "        <div id=\"blog_title\">\n" +
                "            <h2>\n" +
                "                <a href=\"http://blog.csdn.net/chengfei112233\">chengfei112233的专栏</a></h2>\n" +
                "            <h3></h3>\n" +
                "            <div class=\"clear\">\n" +
                "            </div>\n" +
                "        </div>\n" +
                "        <div class=\"clear\">\n" +
                "        </div>\n" +
                "        \n" +
                "     \n" +
                "    </div>\n" +
                "</div>\n" +
                "<div id=\"navigator\">\n" +
                "    <div class=\"navigator_bg\">\n" +
                "    </div>\n" +
                "    <div class=\"navigator\">\n" +
                "        <ul>           \n" +
                "                <li id=\"btnContents\"><a href=\"http://blog.csdn.net/chengfei112233?viewmode=contents\"><span onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_mulu'])\">\n" +
                "                    <img src=\"http://static.blog.csdn.net/images/ico_list.gif\">目录视图</span></a></li>\n" +
                "                <li id=\"btnView\"><a href=\"http://blog.csdn.net/chengfei112233?viewmode=list\"><span onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_zhaiyao'])\">\n" +
                "                    <img src=\"http://static.blog.csdn.net/images/ico_summary.gif\">摘要视图</span></a></li>\n" +
                "                <li id=\"btnRss\"><a href=\"http://blog.csdn.net/chengfei112233/rss/list\"><span onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_RSS'])\">\n" +
                "                    <img src=\"http://static.blog.csdn.net/images/ico_rss.gif\">订阅</span></a></li>                \n" +
                "            \n" +
                "\n" +
                "            </ul>\n" +
                "    </div>\n" +
                "</div>\n" +
                "<script type=\"text/javascript\">\n" +
                "    var username = \"chengfei112233\";\n" +
                "    var _blogger = username;\n" +
                "    var blog_address = \"http://blog.csdn.net/chengfei112233\";\n" +
                "    var static_host = \"http://static.blog.csdn.net\";\n" +
                "    var currentUserName = \"\";  \n" +
                "</script>\n" +
                "\n" +
                "        <div id=\"body\">\n" +
                "            <div id=\"main\">\n" +
                "                <div class=\"main\">\n" +
                "                        <div class=\"ad_class\">\n" +
                "<div class=\"notice tracking-ad\" data-mod='popu_3' > \n" +
                "\n" +
                "\n" +
                "<a href=\"http://blog.csdn.net/epubit17/article/details/77770966\">\n" +
                "<font color=red><strong>异步赠书：Kotlin领衔10本好书</strong></font></a>\n" +
                "\n" +
                "&nbsp;&nbsp;&nbsp;&nbsp\n" +
                "\n" +
                "<a href=\"http://edu.csdn.net/huiyiCourse/series_detail/63\">\n" +
                "<font color=red><strong>免费直播：AI时代，机器学习如何入门？</strong></font></a>\n" +
                "\n" +
                "&nbsp;&nbsp;&nbsp;&nbsp\n" +
                "\n" +
                "<a href=\"http://blog.csdn.net/turingbooks/article/details/77479427\">\n" +
                "<font color=blue><strong>程序员8月书讯</strong></font></a>\n" +
                "\n" +
                "&nbsp;&nbsp;&nbsp;&nbsp\n" +
                "\n" +
                "\n" +
                "<a href=\"https://gitee.com/enterprises?from=csdn-sqbkxq\">\n" +
                "<font color=red><strong>项目管理+代码托管+文档协作，开发更流畅</strong></font></a>\n" +
                "\n" +
                "\n" +
                "\n" +
                "</div>                        </div>\n" +
                "\n" +
                "                        \n" +
                "\n" +
                "\n" +
                "\n" +
                "  \n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "<script   type=\"text/javascript\" src=\"http://static.blog.csdn.net/scripts/category.js\"></script>\n" +
                "\n" +
                "  <script type=\"text/ecmascript\">\n" +
                "      window.quickReplyflag = true;\n" +
                "      var isBole = false; \n" +
                "      var fasrc=\"http://my.csdn.net/my/favorite/miniadd?t=js%e8%bd%acstring%e4%b8%babyte%5b%5d&u=http://blog.csdn.net/chengfei112233/article/details/5842085\"\n" +
                "    </script>\n" +
                "<div id=\"article_details\" class=\"details\">\n" +
                "    <div class=\"article_title\">   \n" +
                "         <span class=\"ico ico_type_Original\"></span>\n" +
                "\n" +
                "    <h1>\n" +
                "        <span class=\"link_title\"><a href=\"/chengfei112233/article/details/5842085\">\n" +
                "        js转string为byte[]        \n" +
                "           \n" +
                "        </a>\n" +
                "        </span>\n" +
                "\n" +
                "         \n" +
                "    </h1>\n" +
                "</div>\n" +
                "\n" +
                "   \n" +
                "\n" +
                "        <div class=\"article_manage clearfix\">\n" +
                "        <div class=\"article_l\">\n" +
                "            <span class=\"link_categories\">\n" +
                "            标签：\n" +
                "              <a href='http://www.csdn.net/tag/byte' target=_blank onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_tag']);\">byte</a><a href='http://www.csdn.net/tag/string' target=_blank onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_tag']);\">string</a><a href='http://www.csdn.net/tag/function' target=_blank onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_tag']);\">function</a><a href='http://www.csdn.net/tag/up' target=_blank onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_tag']);\">up</a><a href='http://www.csdn.net/tag/c' target=_blank onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_tag']);\">c</a>\n" +
                "            </span>\n" +
                "        </div>\n" +
                "        <div class=\"article_r\">\n" +
                "            <span class=\"link_postdate\">2010-08-26 23:09</span>\n" +
                "            <span class=\"link_view\" title=\"阅读次数\">21050人阅读</span>\n" +
                "            <span class=\"link_comments\" title=\"评论次数\"> <a href=\"#comments\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_pinglun'])\">评论</a>(1)</span>\n" +
                "            <span class=\"link_collect tracking-ad\" data-mod=\"popu_171\"> <a href=\"javascript:void(0);\" onclick=\"javascript:collectArticle('js%e8%bd%acstring%e4%b8%babyte%5b%5d','5842085');return false;\" title=\"收藏\">收藏</a></span>\n" +
                "             <span class=\"link_report\"> <a href=\"#report\" onclick=\"javascript:report(5842085,2);return false;\" title=\"举报\">举报</a></span>\n" +
                "\n" +
                "        </div>\n" +
                "    </div>    <style type=\"text/css\">        \n" +
                "            .embody{\n" +
                "                padding:10px 10px 10px;\n" +
                "                margin:0 -20px;\n" +
                "                border-bottom:solid 1px #ededed;                \n" +
                "            }\n" +
                "            .embody_b{\n" +
                "                margin:0 ;\n" +
                "                padding:10px 0;\n" +
                "            }\n" +
                "            .embody .embody_t,.embody .embody_c{\n" +
                "                display: inline-block;\n" +
                "                margin-right:10px;\n" +
                "            }\n" +
                "            .embody_t{\n" +
                "                font-size: 12px;\n" +
                "                color:#999;\n" +
                "            }\n" +
                "            .embody_c{\n" +
                "                font-size: 12px;\n" +
                "            }\n" +
                "            .embody_c img,.embody_c em{\n" +
                "                display: inline-block;\n" +
                "                vertical-align: middle;               \n" +
                "            }\n" +
                "             .embody_c img{               \n" +
                "                width:30px;\n" +
                "                height:30px;\n" +
                "            }\n" +
                "            .embody_c em{\n" +
                "                margin: 0 20px 0 10px;\n" +
                "                color:#333;\n" +
                "                font-style: normal;\n" +
                "            }\n" +
                "    </style>\n" +
                "    <script  type=\"text/javascript\">\n" +
                "        $(function () {\n" +
                "            try\n" +
                "            {\n" +
                "                var lib = eval(\"(\"+$(\"#lib\").attr(\"value\")+\")\");\n" +
                "                var html = \"\";\n" +
                "                if (lib.err == 0) {\n" +
                "                    $.each(lib.data, function (i) {\n" +
                "                        var obj = lib.data[i];\n" +
                "                        //html += '<img src=\"' + obj.logo + '\"/>' + obj.name + \"&nbsp;&nbsp;\";\n" +
                "                        html += ' <a href=\"' + obj.url + '\" target=\"_blank\">';\n" +
                "                        html += ' <img src=\"' + obj.logo + '\">';\n" +
                "                        html += ' <em><b>' + obj.name + '</b></em>';\n" +
                "                        html += ' </a>';\n" +
                "                    });\n" +
                "                    if (html != \"\") {\n" +
                "                        setTimeout(function () {\n" +
                "                            $(\"#lib\").html(html);                      \n" +
                "                            $(\"#embody\").show();\n" +
                "                        }, 100);\n" +
                "                    }\n" +
                "                }      \n" +
                "            } catch (err)\n" +
                "            { }\n" +
                "            \n" +
                "        });\n" +
                "    </script>\n" +
                "        <div   class=\"bog_copyright\">         \n" +
                "            <p  class=\"copyright_p\" >版权声明：本文为博主原创文章，未经博主允许不得转载。</p>\n" +
                "        </div>\n" +
                "\n" +
                "  \n" +
                "\n" +
                "  \n" +
                "  \n" +
                "     \n" +
                "\n" +
                "\n" +
                "<div id=\"article_content\" class=\"article_content tracking-ad\" data-mod=popu_307  data-dsm = \"post\" >\n" +
                "<p><textarea cols=\"50\" rows=\"15\" name=\"code\" class=\"javascript\">function stringToBytes ( str ) {\n" +
                "  var ch, st, re = [];\n" +
                "  for (var i = 0; i &lt; str.length; i++ ) {\n" +
                "    ch = str.charCodeAt(i);  // get char \n" +
                "    st = [];                 // set up &quot;stack&quot;\n" +
                "    do {\n" +
                "      st.push( ch &amp; 0xFF );  // push byte to stack\n" +
                "      ch = ch &gt;&gt; 8;          // shift value down by 1 byte\n" +
                "    }  \n" +
                "    while ( ch );\n" +
                "    // add stack contents to result\n" +
                "    // done because chars have &quot;wrong&quot; endianness\n" +
                "    re = re.concat( st.reverse() );\n" +
                "  }\n" +
                "  // return an array of bytes\n" +
                "  return re;\n" +
                "}\n" +
                "stringToBytes( &quot;A/u1242B/u4123C&quot; );  // [65, 18, 66, 66, 65, 35, 67]\n" +
                "</textarea>\n" +
                " </p>   \n" +
                "</div>\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "<!-- Baidu Button BEGIN -->\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "<div class=\"bdsharebuttonbox tracking-ad\" style=\"float: right;\" data-mod=\"popu_172\">\n" +
                "<a href=\"#\" class=\"bds_more\" data-cmd=\"more\" style=\"background-position:0 0 !important; background-image: url(http://bdimg.share.baidu.com/static/api/img/share/icons_0_16.png?v=d754dcc0.png) !important\"></a>\n" +
                "<a href=\"#\" class=\"bds_qzone\" data-cmd=\"qzone\" title=\"分享到QQ空间\"  style=\"background-position:0 -52px !important\"></a>\n" +
                "<a href=\"#\" class=\"bds_tsina\" data-cmd=\"tsina\" title=\"分享到新浪微博\"style=\"background-position:0 -104px !important\"></a>\n" +
                "<a href=\"#\" class=\"bds_tqq\" data-cmd=\"tqq\" title=\"分享到腾讯微博\"style=\"background-position:0 -260px !important\"></a>\n" +
                "<a href=\"#\" class=\"bds_renren\" data-cmd=\"renren\" title=\"分享到人人网\"style=\"background-position:0 -208px !important\"></a>\n" +
                "<a href=\"#\" class=\"bds_weixin\" data-cmd=\"weixin\" title=\"分享到微信\"style=\"background-position:0 -1612px !important\" ></a>\n" +
                "</div>\n" +
                "<script>window._bd_share_config = { \"common\": { \"bdSnsKey\": {}, \"bdText\": \"\", \"bdMini\": \"1\", \"bdMiniList\": false, \"bdPic\": \"\", \"bdStyle\": \"0\", \"bdSize\": \"16\" }, \"share\": {} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>\n" +
                "<!-- Baidu Button END -->\n" +
                "\n" +
                "   \n" +
                "\n" +
                "<!--172.16.140.12-->\n" +
                "\n" +
                "<!-- Baidu Button BEGIN -->\n" +
                "<script type=\"text/javascript\" id=\"bdshare_js\" data=\"type=tools&amp;uid=1536434\" ></script>\n" +
                "<script type=\"text/javascript\" id=\"bdshell_js\"></script>\n" +
                "<script type=\"text/javascript\">\n" +
                "    document.getElementById(\"bdshell_js\").src = \"http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=\" + Math.ceil(new Date()/3600000)\n" +
                "</script>\n" +
                "<!-- Baidu Button END -->\n" +
                "\n" +
                "\n" +
                "\n" +
                " \n" +
                "\n" +
                "\n" +
                "        <div id=\"digg\" ArticleId=\"5842085\" >\n" +
                "            <dl id=\"btnDigg\" class=\"digg digg_disable\"  onclick=\"btndigga();\">\n" +
                "               \n" +
                "                 <dt>顶</dt>\n" +
                "                <dd>1</dd>\n" +
                "            </dl>\n" +
                "           \n" +
                "              \n" +
                "            <dl id=\"btnBury\" class=\"digg digg_disable\"  onclick=\"btnburya();\">\n" +
                "              \n" +
                "                  <dt>踩</dt>\n" +
                "                <dd>0</dd>               \n" +
                "            </dl>\n" +
                "            \n" +
                "        </div>\n" +
                "     <div class=\"tracking-ad\" data-mod=\"popu_222\"><a href=\"javascript:void(0);\" >&nbsp;</a>   </div>\n" +
                "    <div class=\"tracking-ad\" data-mod=\"popu_223\"> <a href=\"javascript:void(0);\" >&nbsp;</a></div>\n" +
                "    <script type=\"text/javascript\">\n" +
                "        function btndigga() {\n" +
                "            $(\".tracking-ad[data-mod='popu_222'] a\").click();\n" +
                "        }\n" +
                "        function btnburya() {\n" +
                "            $(\".tracking-ad[data-mod='popu_223'] a\").click();\n" +
                "        }\n" +
                "            </script>\n" +
                "\n" +
                "   <ul class=\"article_next_prev\">\n" +
                "                <li class=\"prev_article\"><span  onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_shangyipian']);location.href='http://blog.csdn.net/chengfei112233/article/details/5842071';\">上一篇</span><a href=\"http://blog.csdn.net/chengfei112233/article/details/5842071\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_shangyipian'])\">两个Ruby小函数：URLDecode/URLEncode</a></li>\n" +
                "                <li class=\"next_article\"><span onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_xiayipian']);location.href='http://blog.csdn.net/chengfei112233/article/details/5929429';\">下一篇</span><a href=\"http://blog.csdn.net/chengfei112233/article/details/5929429\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_xiayipian'])\">JAVA判断中英文,并根据中英文自动截取字符串</a></li>\n" +
                "    </ul>\n" +
                "\n" +
                "    <div style=\"clear:both; height:10px;\"></div>\n" +
                "\n" +
                "\n" +
                "            <div class=\"similar_article\"   >\n" +
                "                    <h4></h4>\n" +
                "                    <div class=\"similar_c\"style=\"margin:20px 0px 0px 0px\">\n" +
                "                        <div class=\"similar_c_t\">\n" +
                "                          &nbsp;&nbsp;相关文章推荐\n" +
                "                        </div>\n" +
                "                   \n" +
                "                        <div class=\"similar_wrap tracking-ad\" data-mod=\"popu_36\"  style=\"max-height:250px\">                       \n" +
                "                            <ul class=\"similar_list fl\">    \n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://blog.csdn.net/luxingshun/article/details/7339443\" title=\"byte与string互转函数\" strategy=\"BlogCommendFromCsdn_0\" target=\"_blank\">byte与string互转函数</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://edu.csdn.net/huiyiCourse/detail/501?utm_source=blog7\" title=\"【直播】大中型UGC信息网站SEO分享--乔向阳\" strategy=\"undefined\" target=\"_blank\">【直播】大中型UGC信息网站SEO分享--乔向阳</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://download.csdn.net/download/cong00_cong/8324877\" title=\"freemarker总结\" strategy=\"BlogCommendFromCsdn_1\" target=\"_blank\">freemarker总结</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://edu.csdn.net/huiyiCourse/series_detail/60?utm_source=blog7\" title=\"【直播】打通Linux脉络 进程、线程和调度--宋宝华\" strategy=\"undefined\" target=\"_blank\">【直播】打通Linux脉络 进程、线程和调度--宋宝华</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://blog.csdn.net/chengfei112233/article/details/5842085\" title=\"js转string为byte[]\" strategy=\"BlogCommendFromCsdn_2\" target=\"_blank\">js转string为byte[]</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://edu.csdn.net/huiyiCourse/detail/503?utm_source=blog7\" title=\"【直播】Java最佳学习路线指导--肖海鹏\" strategy=\"undefined\" target=\"_blank\">【直播】Java最佳学习路线指导--肖海鹏</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://download.csdn.net/download/u013725518/8732569\" title=\"C#_string_byte数组转换解析\" strategy=\"BlogCommendFromCsdn_3\" target=\"_blank\">C#_string_byte数组转换解析</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://edu.csdn.net/combo/detail/539?utm_source=blog7\" title=\"【套餐】C++音视频实战技术套餐--夏曹俊\" strategy=\"undefined\" target=\"_blank\">【套餐】C++音视频实战技术套餐--夏曹俊</a>\n" +
                "                                   </li>\n" +
                "                            </ul>\n" +
                "                              <ul class=\"similar_list fr\">      \n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://blog.csdn.net/lgl1170860350/article/details/56015449\" title=\"js byte[] 和string 相互转换 UTF-8\" strategy=\"BlogCommendFromCsdn_4\" target=\"_blank\">js byte[] 和string 相互转换 UTF-8</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://edu.csdn.net/combo/detail/544?utm_source=blog7\" title=\"【套餐】0基础拿下HTML5和CSS3--李仁密\" strategy=\"undefined\" target=\"_blank\">【套餐】0基础拿下HTML5和CSS3--李仁密</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://download.csdn.net/download/fanbingfu/9933345\" title=\"js date转String 日期字符串转换\" strategy=\"BlogCommendFromCsdn_5\" target=\"_blank\">js date转String 日期字符串转换</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://edu.csdn.net/combo/detail/532?utm_source=blog7\" title=\"【套餐】机器学习之数学基础系列--AI100\" strategy=\"undefined\" target=\"_blank\">【套餐】机器学习之数学基础系列--AI100</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://blog.csdn.net/qy924120316/article/details/77185466\" title=\"byte[]转String，编码与乱码问题，以及Base64编码\" strategy=\"BlogCommendFromCsdn_6\" target=\"_blank\">byte[]转String，编码与乱码问题，以及Base64编码</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://blog.csdn.net/tongxinxiao/article/details/42242193\" title=\"关于String类型数字转化为byte类型及JS中不包含年月日的时间控件\" strategy=\"BlogCommendFromCsdn_7\" target=\"_blank\">关于String类型数字转化为byte类型及JS中不包含年月日的时间控件</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://download.csdn.net/download/hgj8888/3231914\" title=\"图片转换格式（byte[]，Stream，string）\" strategy=\"BlogCommendFromCsdn_8\" target=\"_blank\">图片转换格式（byte[]，Stream，string）</a>\n" +
                "                                   </li>\n" +
                "                                   <li>\n" +
                "                                       <em>•</em>\n" +
                "                                       <a href=\"http://blog.csdn.net/lunatic7/article/details/77348021\" title=\"char * string 转byte数组 HexString2Bytes\" strategy=\"BlogCommendFromCsdn_9\" target=\"_blank\">char * string 转byte数组 HexString2Bytes</a>\n" +
                "                                   </li>\n" +
                "                            </ul>\n" +
                "                        </div>\n" +
                "                    </div>\n" +
                "                </div>   \n" +
                "      \n" +
                "</div>\n" +
                "\n" +
                "     <div>\n" +
                "           \n" +
                "\n" +
                "       \n" +
                "                           \n" +
                "            <!-- 广告位：PC端-博客内容页-banner1-960*90 --> \n" +
                "            <script> \n" +
                "                (function() { \n" +
                "                    var s = \"_\" + Math.random().toString(36).slice(2); \n" +
                "                    document.write('<div id=\"' + s + '\"></div>'); \n" +
                "                    (window.slotbydup=window.slotbydup || []).push({ \n" +
                "                        id: '4228013', \n" +
                "                        container: s, \n" +
                "                        size: '0,0', \n" +
                "                        display: 'inlay-fix' \n" +
                "                    }); \n" +
                "                })(); \n" +
                "            </script>\n" +
                "    </div>\n" +
                "\n" +
                "<div id=\"suggest\"></div>\n" +
                "         <script  language=\"javascript\" type='text/javascript'>     \n" +
                "             $(function(){\n" +
                "                 $.get(\"/chengfei112233/svc/GetSuggestContent/5842085\",function(data){\n" +
                "                     $(\"#suggest\").html(data);\n" +
                "                 });     \n" +
                "             });             \n" +
                "         </script>  \n" +
                "\n" +
                "\n" +
                "\n" +
                "            \n" +
                "                                    \n" +
                "            \n" +
                "                                    \n" +
                "\n" +
                "        <!-- 广告位开始 -->\n" +
                "        <!-- 广告位结束 -->\n" +
                "\n" +
                "\n" +
                "<div class=\"comment_class\">\n" +
                "    <div id=\"comment_title\" class=\"panel_head\">\n" +
                "        <span class=\"see_comment\">查看评论</span><a name=\"comments\"></a></div>\n" +
                "    <div id=\"comment_list\">\n" +
                "    </div>\n" +
                "    <div id=\"comment_bar\">\n" +
                "    </div>\n" +
                "    <div id=\"comment_form\">\n" +
                "    </div>\n" +
                "    <div class=\"announce\">\n" +
                "        * 以上用户言论只代表其个人观点，不代表CSDN网站的观点或立场<a name=\"reply\"></a><a name=\"quote\"></a></div>\n" +
                "</div>\n" +
                "\n" +
                "<script type=\"text/javascript\">\n" +
                "    var fileName = '5842085';\n" +
                "    var commentscount = 1;\n" +
                "    var islock = false\n" +
                "</script>\n" +
                "\n" +
                "    <div id=\"ad_bot\">\n" +
                "    </div>\n" +
                "<div id=\"report_dialog\">\n" +
                "</div>\n" +
                "\n" +
                "<div id=\"d-top\"  style=\"bottom:60px;\">\n" +
                "\n" +
                "        <a id=\"quick-reply\" class=\"btn btn-top q-reply\" title=\"快速回复\" style=\"display:none;\">\n" +
                "            <img src=\"http://static.blog.csdn.net/images/blog-icon-reply.png\" alt=\"快速回复\">\n" +
                "        </a>    \n" +
                "    <a id=\"d-top-a\" class=\"btn btn-top backtop\"  style=\"display: none;\" title=\"返回顶部\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_huidaodingbu'])\" style=\"\">         \n" +
                "         <img src=\"http://static.blog.csdn.net/images/top.png\" alt=\"TOP\">\n" +
                "    </a>\n" +
                "</div>\n" +
                "<script type=\"text/javascript\">\n" +
                "    $(function ()\n" +
                "    {\n" +
                "        $(\"#ad_frm_0\").height(\"90px\");\n" +
                "        \n" +
                "        setTimeout(function(){\n" +
                "            $(\"#ad_frm_2\").height(\"200px\");\n" +
                "        },1000);    \n" +
                "    });\n" +
                "  \n" +
                "</script>\n" +
                "<style type=\"text/css\">\n" +
                "    .tag_list\n" +
                "    {\n" +
                "        background: none repeat scroll 0 0 #FFFFFF;\n" +
                "        border: 1px solid #D7CBC1;\n" +
                "        color: #000000;\n" +
                "        font-size: 12px;\n" +
                "        line-height: 20px;\n" +
                "        list-style: none outside none;\n" +
                "        margin: 10px 2% 0 1%;\n" +
                "        padding: 1px;\n" +
                "    }\n" +
                "    .tag_list h5\n" +
                "    {\n" +
                "        background: none repeat scroll 0 0 #E0DBD3;\n" +
                "        color: #47381C;\n" +
                "        font-size: 12px;\n" +
                "        height: 24px;\n" +
                "        line-height: 24px;\n" +
                "        padding: 0 5px;\n" +
                "        margin: 0;\n" +
                "    }\n" +
                "    .tag_list h5 a\n" +
                "    {\n" +
                "        color: #47381C;\n" +
                "    }\n" +
                "    .classify\n" +
                "    {\n" +
                "        margin: 10px 0;\n" +
                "        padding: 4px 12px 8px;\n" +
                "    }\n" +
                "    .classify a\n" +
                "    {\n" +
                "        margin-right: 20px;\n" +
                "        white-space: nowrap;\n" +
                "    }\n" +
                "</style>\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "<div id=\"pop_win\" style=\"display:none ;position: absolute; z-index: 10000; border: 1px solid rgb(220, 220, 220); top: 222.5px; left: 630px; opacity: 1; background: none 0px 0px repeat scroll rgb(255, 255, 255);\">\n" +
                "    \n" +
                "</div>\n" +
                "<div id=\"popup_mask\"></div>\n" +
                "<style>\n" +
                "    #popup_mask\n" +
                "    {\n" +
                "        position: absolute;\n" +
                "        width: 100%;\n" +
                "        height: 100%;\n" +
                "        background: #000;\n" +
                "        z-index: 9999;\n" +
                "        left: 0px;\n" +
                "        top: 0px;\n" +
                "        opacity: 0.3;\n" +
                "        filter: alpha(opacity=30);\n" +
                "        display: none;\n" +
                "    }\n" +
                "\n" +
                "</style>\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "<script type=\"text/javascript\">\n" +
                "    $(function(){        \n" +
                "        \n" +
                "        setTimeout(function(){\n" +
                "            $(\".comment_body:contains('回复')\").each(function(index,item){\n" +
                "                var u=$(this).text().split('：')[0].toString().replace(\"回复\",\"\")\n" +
                "                var thisComment=$(this);\n" +
                "                if(u)\n" +
                "                {\n" +
                "                    $.getJSON(\"https://passport.csdn.net/get/nick?callback=?\", {users: u}, function(a) {\n" +
                "                        if(a!=null&&a.data!=null&&a.data.length>0)\n" +
                "                        {\n" +
                "                            nick=a.data[0].n; \n" +
                "                            if(u!=nick)\n" +
                "                            {\n" +
                "                                thisComment.text(thisComment.text().replace(u,nick));  \n" +
                "                            }\n" +
                "                        }       \n" +
                "                    });  \n" +
                "                }\n" +
                "            });         \n" +
                "\n" +
                "        },200);  \n" +
                "\n" +
                "        setTimeout(function(){\n" +
                "            $(\".math\").each(function(index,value){$(this).find(\"span\").last().css(\"color\",\"#fff\"); })\n" +
                "        },5000);\n" +
                "\n" +
                "        setTimeout(function(){\n" +
                "            $(\".math\").each(function(index,value){$(this).find(\"span\").last().css(\"color\",\"#fff\"); })\n" +
                "        },10000);\n" +
                "\n" +
                "        setTimeout(function(){\n" +
                "            $(\".math\").each(function(index,value){$(this).find(\"span\").last().css(\"color\",\"#fff\"); })\n" +
                "        },15000);\n" +
                "        \n" +
                "        setTimeout(function(){\n" +
                "            $(\"a img[src='http://js.tongji.linezing.com/stats.gif']\").parent().css({\"position\":\"absolute\",\"left\":\"50%\"});\n" +
                "        },300);\n" +
                "    });\n" +
                "\n" +
                "    function loginbox(){\n" +
                "        var $logpop=$(\"#pop_win\");\n" +
                "        $logpop.html('<iframe src=\"https://passport.csdn.net/account/loginbox?service=http://static.blog.csdn.net/callback.htm\" frameborder=\"0\" height=\"600\" width=\"400\" scrolling=\"no\"></iframe>');\n" +
                "\n" +
                "        $('#popup_mask').css({\n" +
                "            opacity: 0.5,\n" +
                "            width: $( document ).width() + 'px',\n" +
                "            height:  $( document ).height() + 'px'\n" +
                "        });\n" +
                "        $('#popup_mask').css(\"display\",\"block\");\n" +
                " \n" +
                "        $logpop.css( {\n" +
                "            top: ($( window ).height() - $logpop.height())/ 2  + $( window \n" +
                "       ).scrollTop() + 'px',\n" +
                "            left:($( window ).width() - $logpop.width())/ 2\n" +
                "        } );\n" +
                " \n" +
                "        setTimeout( function () {\n" +
                "            $logpop.show();\n" +
                "            $logpop.css( {\n" +
                "                opacity: 1\n" +
                "            } );\n" +
                "        }, 200 );\n" +
                " \n" +
                "        $('#popup_mask').unbind(\"click\");\n" +
                "        $('#popup_mask').bind(\"click\", function(){\n" +
                "            $('#popup_mask').hide();\n" +
                "            var $clopop = $(\"#pop_win\");\n" +
                "            $(\"#common_ask_div_sc\").css(\"display\",\"none\");\n" +
                "            $clopop.css( {\n" +
                "                opacity: 0\n" +
                "            } );\n" +
                "            setTimeout( function () {\n" +
                "                $clopop.hide();\n" +
                "            }, 350 );\n" +
                "            return false;\n" +
                "        });\n" +
                "    }   \n" +
                "\n" +
                "    var articletitle='js转string为byte[]';\n" +
                "\n" +
                "</script>\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "                        <div class=\"clear\">\n" +
                "                        </div>\n" +
                "                    </div>                   \n" +
                "                \n" +
                "            </div>\n" +
                "                   \n" +
                "           <div id=\"side\">\n" +
                "               \n" +
                "    <div class=\"side\">\n" +
                "<div id=\"panel_Profile\" class=\"panel\">\n" +
                "<ul class=\"panel_head\"><span>个人资料</span></ul>\n" +
                "<ul class=\"panel_body profile\">\n" +
                "<div id=\"blog_userface\">\n" +
                "    <a href=\"http://my.csdn.net/chengfei112233\" target=\"_blank\">\n" +
                "    <img src=\"http://avatar.csdn.net/B/2/7/1_chengfei112233.jpg\" title=\"访问我的空间\" style=\"max-width:90%\"/>\n" +
                "    </a>\n" +
                "    <br />\n" +
                "    <span><a href=\"http://my.csdn.net/chengfei112233\" class=\"user_name\" target=\"_blank\">chengfei112233</a></span>\n" +
                "</div>\n" +
                "<div class=\"interact\">\n" +
                "\n" +
                "    <a href=\"javascript:void(0);\" class=\"attent\" id=\"span_add_follow\" title=\"[加关注]\"></a>\n" +
                "\n" +
                " <a href=\"javascript:void(0);\" class=\"letter\"  title=\"[发私信]\" onclick=\"window.open('http://msg.csdn.net/letters/model?receiver=chengfei112233','_blank','height=350,width=700');_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_sixin'])\"></a>  \n" +
                "</div>\n" +
                "<div id=\"blog_medal\">\n" +
                "                <div id=\"bms_box\">\n" +
                "               </div>\n" +
                "</div>\n" +
                "<ul id=\"blog_rank\">\n" +
                "    <li>访问：<span>377556次</span></li>\n" +
                "    <li>积分：<span>4398</span> </li>    \n" +
                "    <li >等级： <span style=\"position:relative;display:inline-block;z-index:1\" >\n" +
                "            <img src=\"http://c.csdnimg.cn/jifen/images/xunzhang/jianzhang/blog5.png\" alt=\"\" style=\"vertical-align: middle;\" id=\"leveImg\">\n" +
                "            <div id=\"smallTittle\" style=\" position: absolute;  left: -24px;  top: 25px;  text-align: center;  width: 101px;  height: 32px;  background-color: #fff;  line-height: 32px;  border: 2px #DDDDDD solid;  box-shadow: 0px 2px 2px rgba (0,0,0,0.1);  display: none;   z-index: 999;\">\n" +
                "            <div style=\"left: 42%;  top: -8px;  position: absolute;  width: 0;  height: 0;  border-left: 10px solid transparent;  border-right: 10px solid transparent;  border-bottom: 8px solid #EAEAEA;\"></div>\n" +
                "            积分：4398 </div>\n" +
                "        </span>  </li>\n" +
                "    <li>排名：<span>第6891名</span></li>\n" +
                "</ul>\n" +
                "<ul id=\"blog_statistics\">\n" +
                "    <li>原创：<span>65篇</span></li>\n" +
                "    <li>转载：<span>36篇</span></li>\n" +
                "    <li>译文：<span>0篇</span></li>\n" +
                "    <li>评论：<span>44条</span></li>\n" +
                "</ul>\n" +
                "</ul>\n" +
                "</div>\n" +
                "\n" +
                "\n" +
                "<div class=\"panel\" id=\"panel_Search\">\n" +
                "    <ul class=\"panel_head\"><span>文章搜索</span></ul>\n" +
                "    <ul class=\"panel_body\" class=\"form_search\">\n" +
                "        <form id=\"frmSearch\" action=\"http://so.csdn.net/search\" class=\"form_search csdn-tracking-statistics\" target=\"_blank\"  data-mod=\"popu_306\">\n" +
                "        <span><input id=\"inputSearch\" type=\"text\" class=\"blogsearch\" title=\"请输入关键字\" /></span>\n" +
                "        <input id=\"btnSubmit\" type=\"button\" value=\"搜索\" title=\"search in blog\" />\n" +
                "        <input type=\"hidden\" name=\"q\" id=\"inputQ\" />\n" +
                "        <input type=\"hidden\" name=\"t\" value=\"blog\" />\n" +
                "        <a id=\"btnSearchBlog\" target=\"_blank\"></a>\n" +
                "        </form>\n" +
                "    </ul>\n" +
                "</div>\n" +
                "\n" +
                "<script type=\"text/javascript\">\n" +
                "\n" +
                "   \n" +
                "    $(function () {\n" +
                "        $(\"#btnSubmit\").unbind(\"click\");\n" +
                "        $(\"#btnSubmit\").click(function () {           \n" +
                "            search();\n" +
                "        });\n" +
                "\n" +
                "        $(\"#frmSearch\").submit(function () {           \n" +
                "            search();\n" +
                "            return false;\n" +
                "        });\n" +
                "\n" +
                "        function search()\n" +
                "        {\n" +
                "            if ($(\"#inputSearch\").val() == \"\") {               \n" +
                "                alert(\"请录入搜索关键词！\");                         \n" +
                "                return false;\n" +
                "            }\n" +
                "            //var url = \"http://so.csdn.net/so/search/s.do?q=\" + encodeURIComponent($(\"#inputSearch\").val()) + \"&u=\" + username + \"&t=blog\";           \n" +
                "            var url = \"https://www.baidu.com/s?wd=\" + encodeURIComponent($(\"#inputSearch\").val()) + \"%20site%3Ablog.csdn.net\"\n" +
                "            window.location.href = url;\n" +
                "        }   \n" +
                "    });\n" +
                "</script><div id=\"panel_Category\" class=\"panel\">\n" +
                "<ul class=\"panel_head\"><span>文章分类</span></ul>\n" +
                "<ul class=\"panel_body\">    \n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/653840\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">android技术</a><span>(1)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/748319\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">Flex</a><span>(2)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/705576\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">GWT及相关</a><span>(6)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/657068\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">JAVA技术</a><span>(2)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/594692\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">linux</a><span>(19)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/724322\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">ruby</a><span>(3)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/663067\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">shell</a><span>(2)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/828727\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">云相关技术</a><span>(6)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/594693\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">持续集成</a><span>(4)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/602698\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">测试技术</a><span>(1)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/903880\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">Maven</a><span>(1)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/922180\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">php技术</a><span>(15)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/1071351\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">前端技术</a><span>(3)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/1078858\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">操作系统</a><span>(8)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/1158743\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">数据库</a><span>(9)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/1160006\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">服务器</a><span>(3)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/1162407\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">运维</a><span>(8)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/1185737\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">互联网</a><span>(1)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/6707415\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">虚拟化</a><span>(1)</span>\n" +
                "                </li>\n" +
                "                 <li>\n" +
                "                    <a href=\"/chengfei112233/article/category/6707416\" onclick=\"_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_wenzhangfenlei']); \">云存储</a><span>(1)</span>\n" +
                "                </li>\n" +
                "</ul>\n" +
                "</div><div id=\"panel_Archive\" class=\"panel\">\n" +
                "<ul class=\"panel_head\"><span>文章存档</span></ul>\n" +
                "<ul class=\"panel_body\">\n" +
                "<div id=\"archive_list\">\n" +
                "<!--归档统计-->\n" +
                "<li><a href=\"/chengfei112233/article/month/2017/05\">2017年05月</a><span>(1)</span></li><li><a href=\"/chengfei112233/article/month/2017/02\">2017年02月</a><span>(3)</span></li><li><a href=\"/chengfei112233/article/month/2017/01\">2017年01月</a><span>(1)</span></li><li><a href=\"/chengfei112233/article/month/2016/11\">2016年11月</a><span>(2)</span></li><li><a href=\"/chengfei112233/article/month/2016/10\">2016年10月</a><span>(1)</span></li><li><a href=\"/chengfei112233/article/month/2016/05\">2016年05月</a><span>(2)</span></li><li><a href=\"/chengfei112233/article/month/2015/01\">2015年01月</a><span>(1)</span></li><li><a href=\"/chengfei112233/article/month/2014/12\">2014年12月</a><span>(4)</span></li><li><a href=\"/chengfei112233/article/month/2014/06\">2014年06月</a><span>(1)</span></li><li><a href=\"/chengfei112233/article/month/2013/08\">2013年08月</a><span>(1)</span></li><li><a href=\"/chengfei112233/article/month/2012/11\">2012年11月</a><span>(4)</span></li><li><a href=\"/chengfei112233/article/month/2012/07\">2012年07月</a><span>(5)</span></li><li><a href=\"/chengfei112233/article/month/2012/06\">2012年06月</a><span>(19)</span></li><li><a href=\"/chengfei112233/article/month/2012/05\">2012年05月</a><span>(4)</span></li><li><a href=\"/chengfei112233/article/month/2012/02\">2012年02月</a><span>(7)</span></li><li><a href=\"/chengfei112233/article/month/2012/01\">2012年01月</a><span>(1)</span></li><li><a href=\"/chengfei112233/article/month/2011/12\">2011年12月</a><span>(3)</span></li><li><a href=\"/chengfei112233/article/month/2011/11\">2011年11月</a><span>(3)</span></li><li><a href=\"/chengfei112233/article/month/2011/10\">2011年10月</a><span>(1)</span></li><li><a href=\"/chengfei112233/article/month/2011/07\">2011年07月</a><span>(1)</span></li><li><a href=\"/chengfei112233/article/month/2011/06\">2011年06月</a><span>(2)</span></li><li><a href=\"/chengfei112233/article/month/2011/05\">2011年05月</a><span>(3)</span></li><li><a href=\"/chengfei112233/article/month/2011/03\">2011年03月</a><span>(1)</span></li><li><a href=\"/chengfei112233/article/month/2010/12\">2010年12月</a><span>(2)</span></li><li><a href=\"/chengfei112233/article/month/2010/11\">2010年11月</a><span>(1)</span></li><li><a href=\"/chengfei112233/article/month/2010/10\">2010年10月</a><span>(4)</span></li><li><a href=\"/chengfei112233/article/month/2010/08\">2010年08月</a><span>(5)</span></li><li><a href=\"/chengfei112233/article/month/2010/07\">2010年07月</a><span>(5)</span></li><li><a href=\"/chengfei112233/article/month/2010/03\">2010年03月</a><span>(3)</span></li><li><a href=\"/chengfei112233/article/month/2010/02\">2010年02月</a><span>(2)</span></li><li><a href=\"/chengfei112233/article/month/2009/10\">2009年10月</a><span>(1)</span></li><li><a href=\"/chengfei112233/article/month/2009/09\">2009年09月</a><span>(4)</span></li><li><a href=\"/chengfei112233/article/month/2009/08\">2009年08月</a><span>(3)</span></li>\n" +
                "</div>\n" +
                "</ul>\n" +
                "</div>\n" +
                "<div id=\"hotarticls\" class=\"panel tracking-ad\" data-mod=\"popu_340\">\n" +
                "<ul class=\"panel_head\">\n" +
                "    <span>       \n" +
                "阅读排行    </span>\n" +
                "</ul>\n" +
                "\n" +
                "<ul class=\"panel_body itemlist\">\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/5842085\" title=\"js转string为byte[]\">js转string为byte[]</a><span>(21040)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/6623672\" title=\"Win7用远程桌面(xrdp+vnc)连接Ubuntu\">Win7用远程桌面(xrdp+vnc)连接Ubuntu</a><span>(19636)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/5977259\" title=\"Flex中跨域访问及#2048安全沙箱错误问题\">Flex中跨域访问及#2048安全沙箱错误问题</a><span>(14467)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/7252404\" title=\"hadoop-eclipse开发环境搭建及error: failure to login错误\">hadoop-eclipse开发环境搭建及error: failure to login错误</a><span>(13623)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/7620814\" title=\"nginx的location定义正则后SCRIPT_NAME, PATH_INFO多了index.php\">nginx的location定义正则后SCRIPT_NAME, PATH_INFO多了index.php</a><span>(13281)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/7183227\" title=\"PHP UTF-8和Unicode编号互转（多语言）\">PHP UTF-8和Unicode编号互转（多语言）</a><span>(12826)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/7263386\" title=\"Cannot find utCompiledCode record for this version of the uninstaller\">Cannot find utCompiledCode record for this version of the uninstaller</a><span>(12210)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/7646585\" title=\"OpenSSL is not properly installed on your system.\">OpenSSL is not properly installed on your system.</a><span>(10089)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/7703812\" title=\"MySQL Cluster （三） --- 3台机器搭建集群环境\">MySQL Cluster （三） --- 3台机器搭建集群环境</a><span>(10032)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/5961234\" title=\"gwt中java与js的相互调用\">gwt中java与js的相互调用</a><span>(10013)</span>\n" +
                "</li>\n" +
                "</ul>\n" +
                "</div>\n" +
                "<div id=\"hotarticls2\" class=\"panel tracking-ad\" data-mod=\"popu_341\">\n" +
                "<ul class=\"panel_head\"><span>评论排行</span></ul>\n" +
                "<ul class=\"panel_body itemlist\">\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/7252404\" title=\"hadoop-eclipse开发环境搭建及error: failure to login错误\">hadoop-eclipse开发环境搭建及error: failure to login错误</a><span>(9)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/5961234\" title=\"gwt中java与js的相互调用\">gwt中java与js的相互调用</a><span>(6)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/54573851\" title=\"在WIN7、WIN10操作系统用WebDAV映射网络驱动器需要的操作\">在WIN7、WIN10操作系统用WebDAV映射网络驱动器需要的操作</a><span>(5)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/8244592\" title=\"Yum离线安装（四） --- yum的CheckSum问题\">Yum离线安装（四） --- yum的CheckSum问题</a><span>(3)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/7183227\" title=\"PHP UTF-8和Unicode编号互转（多语言）\">PHP UTF-8和Unicode编号互转（多语言）</a><span>(2)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/7649938\" title=\"keepalived+nginx实现双机热备\">keepalived+nginx实现双机热备</a><span>(2)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/7288054\" title=\"linux发送html格式邮件，邮箱收不到html格式问题\">linux发送html格式邮件，邮箱收不到html格式问题</a><span>(2)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/5308930\" title=\"Android 开发环境搭建中--- “An SDK Target must be specified.” 问题解决\">Android 开发环境搭建中--- “An SDK Target must be specified.” 问题解决</a><span>(2)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/7641923\" title=\"Yum离线安装（一） --- RPM 打包技术与典型 SPEC 文件分析\">Yum离线安装（一） --- RPM 打包技术与典型 SPEC 文件分析</a><span>(2)</span>\n" +
                "</li>\n" +
                "<li>\n" +
                "<a href=\"/chengfei112233/article/details/6954442\" title=\"vmware tools ,/mnt/hgfs 下没有共享文件夹，解决办法\">vmware tools ,/mnt/hgfs 下没有共享文件夹，解决办法</a><span>(1)</span>\n" +
                "</li>\n" +
                "</ul>\n" +
                "</div>\n" +
                "<div id=\"homepageArticles\" class=\"panel tracking-ad\" data-mod=\"popu_4\">\n" +
                "<ul class=\"panel_head\"><span>推荐文章</span></ul>\n" +
                "<ul class=\"panel_body\" id=\"ad_commend\">\n" +
                "<ul>\n" +
                "<li><a href=\"http://blog.csdn.net/blogdevteam/article/details/77651442\" target=\"_blank\">* CSDN日报20170828——《4个方法快速打造你的阅读清单》</a></li>\n" +
                "<li><a href=\"http://blog.csdn.net/blogdevteam/article/details/77647813\" \n" +
                "target=\"_blank\">* CSDN博客模板调查问卷</a></li>\n" +
                "<li><a href=\"http://blog.csdn.net/yhaolpz/article/details/77366154\"target=\"_blank\">* 动手打造史上最简单的 Recycleview 侧滑菜单</a></li>\n" +
                "<li><a href=\"http://blog.csdn.net/sweettool/article/details/77018506\" \n" +
                "target=\"_blank\">* TCP网络通讯如何解决分包粘包问题</a></li>\n" +
                "<li><a href=\"http://blog.csdn.net/dc_726/article/details/77728729\" \n" +
                "target=\"_blank\">* 程序员的八重境界</a></li>\n" +
                "<li><a href=\"http://blog.csdn.net/pangpang123654/article/details/77720036\" \n" +
                "target=\"_blank\">* 四大线程池详解\n" +
                "</a></li>\n" +
                "\n" +
                "</ul></ul>\n" +
                "</div>\n" +
                "\n" +
                "\n" +
                "<div id=\"newcomments\" class=\"panel\">\n" +
                "<ul class=\"panel_head\"><span>最新评论</span></ul>\n" +
                "<ul class=\"panel_body itemlist\">\n" +
                "    <li>\n" +
                "   \n" +
                "         <a href=\"/chengfei112233/article/details/54573851#comments\">在WIN7、WIN10操作系统用WebDAV映射网络驱动器需要的操作</a>\n" +
                "    <p style=\"margin:0px;\"><a href=\"/szkzn142857\" class=\"user_name\">szkzn142857</a>:\n" +
                "求助！还是不行！我为此找了好几天了，我的情况是这样的，本地win7 sp1 旗舰版 原版安装的，本地...\n" +
                "    </p>\n" +
                "    </li>\n" +
                "    <li>\n" +
                "   \n" +
                "         <a href=\"/chengfei112233/article/details/54573851#comments\">在WIN7、WIN10操作系统用WebDAV映射网络驱动器需要的操作</a>\n" +
                "    <p style=\"margin:0px;\"><a href=\"/szkzn142857\" class=\"user_name\">szkzn142857</a>:\n" +
                "求助！还是不行！我为此找了好几天了，我的情况是这样的，本地win7 sp1 旗舰版 原版安装的，本地...\n" +
                "    </p>\n" +
                "    </li>\n" +
                "    <li>\n" +
                "   \n" +
                "         <a href=\"/chengfei112233/article/details/54573851#comments\">在WIN7、WIN10操作系统用WebDAV映射网络驱动器需要的操作</a>\n" +
                "    <p style=\"margin:0px;\"><a href=\"/szkzn142857\" class=\"user_name\">szkzn142857</a>:\n" +
                "求助！还是不行！我为此找了好几天了，我的情况是这样的，本地win7 sp1 旗舰版 原版安装的，本地...\n" +
                "    </p>\n" +
                "    </li>\n" +
                "    <li>\n" +
                "   \n" +
                "         <a href=\"/chengfei112233/article/details/54573851#comments\">在WIN7、WIN10操作系统用WebDAV映射网络驱动器需要的操作</a>\n" +
                "    <p style=\"margin:0px;\"><a href=\"/szkzn142857\" class=\"user_name\">szkzn142857</a>:\n" +
                "求助！还是不行！我为此找了好几天了，我的情况是这样的，本地win7 sp1 旗舰版 原版安装的，本地...\n" +
                "    </p>\n" +
                "    </li>\n" +
                "    <li>\n" +
                "   \n" +
                "         <a href=\"/chengfei112233/article/details/54573851#comments\">在WIN7、WIN10操作系统用WebDAV映射网络驱动器需要的操作</a>\n" +
                "    <p style=\"margin:0px;\"><a href=\"/szkzn142857\" class=\"user_name\">szkzn142857</a>:\n" +
                "求助！还是不行！我为此找了好几天了，我的情况是这样的，本地win7 sp1 旗舰版 原版安装的，本地...\n" +
                "    </p>\n" +
                "    </li>\n" +
                "    <li>\n" +
                "   \n" +
                "         <a href=\"/chengfei112233/article/details/41777489#comments\">服务器性能优化（三） --- Nginx的ngx_pagespeed安装</a>\n" +
                "    <p style=\"margin:0px;\"><a href=\"/qq_24892467\" class=\"user_name\">qq_24892467</a>:\n" +
                "./configure安装老是报错checking for psol ... not found./...\n" +
                "    </p>\n" +
                "    </li>\n" +
                "    <li>\n" +
                "   \n" +
                "         <a href=\"/chengfei112233/article/details/41777419#comments\">服务器性能优化（一） --- Nginx：静态文件优化</a>\n" +
                "    <p style=\"margin:0px;\"><a href=\"/Rookie_CEO\" class=\"user_name\">Rookie_CEO</a>:\n" +
                "学习了，多谢楼主分享。\n" +
                "    </p>\n" +
                "    </li>\n" +
                "    <li>\n" +
                "   \n" +
                "         <a href=\"/chengfei112233/article/details/7288054#comments\">linux发送html格式邮件，邮箱收不到html格式问题</a>\n" +
                "    <p style=\"margin:0px;\"><a href=\"/dslmoon\" class=\"user_name\">dslmoon</a>:\n" +
                "我也是，还没解决\n" +
                "    </p>\n" +
                "    </li>\n" +
                "    <li>\n" +
                "   \n" +
                "         <a href=\"/chengfei112233/article/details/7183227#comments\">PHP UTF-8和Unicode编号互转（多语言）</a>\n" +
                "    <p style=\"margin:0px;\"><a href=\"/zhao0829wang\" class=\"user_name\">zhao0829wang</a>:\n" +
                "好像是有问题的，转汉字会将其他非汉字字符全部清掉\n" +
                "    </p>\n" +
                "    </li>\n" +
                "    <li>\n" +
                "   \n" +
                "         <a href=\"/chengfei112233/article/details/7659768#comments\">Yii中事件和行为的区别和应用</a>\n" +
                "    <p style=\"margin:0px;\"><a href=\"/fengdongjixian\" class=\"user_name\">fengdongjixian</a>:\n" +
                "good\n" +
                "    </p>\n" +
                "    </li>\n" +
                "</ul>\n" +
                "</div>\n" +
                "    </div>\n" +
                "    <div class=\"clear\">\n" +
                "    </div>\n" +
                "\n" +
                "                   <!-- 广告位开始 -->                    <!-- 广告位结束 -->\n" +
                "                   <div class=\"tracking-ad\" data-view=\"true\"  data-mtp=\"63\" data-order=\"40\" data-con=\"ad_content_1260\" style=\"width: 200px; height: 500px;\">\n" +
                "                         <div id=\"nav_show_top_stop\" style=\"width: 200px;height: 500px;z-index:1000\"><div id=\"cpro_u2734128\"></div>\n" +
                "                             <div id=\"cpro_u3031287\"></div></div>\n" +
                "                   </div>\n" +
                "                <script type=\"text/javascript\">\n" +
                "                    setTimeout(function () {\n" +
                "                        var naviga_offsetTop = 0;\n" +
                "                        function naviga_stay_top() { var scrollTop = jQuery(document).scrollTop(); if (scrollTop > naviga_offsetTop) { jQuery(\"#nav_show_top_stop\").css({ \"position\": \"fixed\" }); jQuery(\"#nav_show_top_stop\").css({ \"top\": \"0px\" }); } else { jQuery(\"#nav_show_top_stop\").css({ \"position\": \"fixed\" }); jQuery(\"#nav_show_top_stop\").css({ \"top\": naviga_offsetTop - scrollTop + \"px\" }); } }\n" +
                "                        function onload_function() { naviga_offsetTop = jQuery(\"#nav_show_top_stop\").position().top; jQuery(window).bind(\"scroll\", naviga_stay_top); jQuery(window).bind(\"mousewheel\", naviga_stay_top); jQuery(document).bind(\"scroll\", naviga_stay_top); jQuery(document).bind(\"mousewheel\", naviga_stay_top); } jQuery(document).ready(onload_function);\n" +
                "\n" +
                "                    }, 200);\n" +
                "                </script>                    \n" +
                "<script type=\"text/javascript\">(window.cproArray = window.cproArray || []).push({ id: \"u2734128\" });  </script> \n" +
                "                    <script src=\"http://cpro.baidustatic.com/cpro/ui/c.js\" type=\"text/javascript\"></script> \n" +
                "                   <script type=\"text/javascript\">\n" +
                "                       /*PC端-博客内容页左侧Button2-200*200-2017/7/10*/\n" +
                "                       (window.cproArray = window.cproArray || []).push({ id: \"u3031287\" });\n" +
                "</script>\n" +
                "<script type=\"text/javascript\" src=\"http://cpro.baidustatic.com/cpro/ui/c.js\"></script>\n" +
                "\n" +
                "           </div>   \n" +
                "\n" +
                "            <div class=\"clear\">\n" +
                "            </div>\n" +
                "        </div>\n" +
                "\n" +
                "        \n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "    <script type=\"text/javascript\" src=\"http://passport.csdn.net/content/loginbox/login.js\"></script>\n" +
                "<script type=\"text/javascript\">\n" +
                "    $(function () {\n" +
                "        function __get_code_toolbar(snippet_id) {\n" +
                "            return $(\"<span class='tracking-ad' data-mod='popu_167'><a href='https://code.csdn.net/snippets/\"\n" +
                "                    + snippet_id\n" +
                "                    + \"' target='_blank' title='在CODE上查看代码片'  style='text-indent:0;'><img src='https://code.csdn.net/assets/CODE_ico.png' width=12 height=12 alt='在CODE上查看代码片' style='position:relative;top:1px;left:2px;'/></a></span>\"\n" +
                "                    + \"<span class='tracking-ad' data-mod='popu_170'><a href='https://code.csdn.net/snippets/\"\n" +
                "                    + snippet_id\n" +
                "                    + \"/fork' target='_blank' title='派生到我的代码片' style='text-indent:0;'><img src='https://code.csdn.net/assets/ico_fork.svg' width=12 height=12 alt='派生到我的代码片' style='position:relative;top:2px;left:2px;'/></a></span>\");\n" +
                "        }\n" +
                "        \n" +
                "        $(\"[code_snippet_id]\").each(function () {\n" +
                "            __s_id = $(this).attr(\"code_snippet_id\");\n" +
                "            if (__s_id != null && __s_id != \"\" && __s_id != 0 && parseInt(__s_id) > 70020) {\n" +
                "                __code_tool = __get_code_toolbar(__s_id);\n" +
                "                $(this).prev().find(\".tools\").append(__code_tool);\n" +
                "            }\n" +
                "        });\n" +
                "\n" +
                "        $(\".bar\").show();\n" +
                "    });\n" +
                "</script>\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "    </div>\n" +
                "      <!--new top-->\n" +
                "    \n" +
                "\n" +
                "     \n" +
                "\n" +
                "   \n" +
                "   \n" +
                "     <!--new top-->\n" +
                "   \n" +
                "   \n" +
                "\n" +
                "    \n" +
                "    \n" +
                "    \n" +
                "   \n" +
                "\n" +
                "   \n" +
                "\n" +
                "\n" +
                "       <script type=\"text/javascript\" src=\"http://static.blog.csdn.net/public/res/bower-libs/MathJax/MathJax.js?config=TeX-AMS_HTML\"></script>\n" +
                "          <script type=\"text/javascript\">\n" +
                "              //$(function () {\n" +
                "              //    setTimeout(function () {\n" +
                "              //        var searchtitletags = articletitle + ',' + $(\"#tags\").html();\n" +
                "              //        searchService({\n" +
                "              //            index: 'blog',\n" +
                "              //            query: searchtitletags,\n" +
                "              //            from: 5,\n" +
                "              //            size: 5,\n" +
                "              //            appendTo: '#res',\n" +
                "              //            url: 'recommend',\n" +
                "              //            his: 2,\n" +
                "              //            client: \"blog_cf_enhance\",\n" +
                "              //            tmpl: '<dd style=\"background:url(http://static.blog.csdn.net/skin/default/images/blog-dot-red3.gif) no-repeat 0 10px;\"><a href=\"#{ url }\" title=\"#{ title }\" strategy=\"#{ strategy }\">#{ title }</a></dd>'\n" +
                "              //        });\n" +
                "              //    }, 1000);\n" +
                "              //});\n" +
                "\n" +
                "         </script>\n" +
                "    \n" +
                "    <script src=\"http://static.blog.csdn.net/scripts/csdn_blog_detail.min.js\" type=\"text/javascript\"></script>\n" +
                "        \n" +
                "    <script type=\"text/javascript\" src=\"http://c.csdnimg.cn/blog/csdn_public_blog_detail.min.js?20170719001\"></script>\n" +
                "\n" +
                "    <script type=\"text/javascript\" src=\"http://medal.blog.csdn.net/showblogmedal.ashx?blogid=650844\"></script>\n" +
                "\n" +
                "     \n" +
                "    \n" +
                "\n" +
                "\n" +
                "  <div id=\"a52b5334d\" style=\"width: 1px; height: 1px; display: none;\">\n" +
                "                    <script id=\"adJs52b5334\"></script>\n" +
                "                    <script>document.getElementById(\"adJs52b5334\").src = \"http://ads.csdn.net/js/opt/52b5334.js?t=\" + Math.random();</script>\n" +
                "   </div>\n" +
                "\n" +
                "    \n" +
                "    \n" +
                "        \n" +
                "     \n" +
                "\n" +
                "    \n" +
                "          \n" +
                "    <div class=\"pop_CA_cover\"  style=\"display:none\"></div>\n" +
                "    <div class=\"pop pop_CA\"  style=\"display:none\">\n" +
                "          <div class=\"CA_header\">\n" +
                "            收藏助手\n" +
                "            <span class=\"cancel_icon\"  id=\"fapancle\"  onclick=\"$('.pop_CA').hide();$('.pop_CA_cover').hide();\"></span>\n" +
                "          </div>\n" +
                "          <iframe src=\"\" id=\"fa\" frameborder=\"0\" width=\"100%\" height=\"360\"  scrolling=\"no\" ></iframe>\n" +
                "    </div>\n" +
                "\n" +
                "\n" +
                "        <script type=\"text/javascript\">\n" +
                "\n" +
                "            $(function () {\n" +
                "                var fromjs = $(\"#fromjs\");\n" +
                "                if (fromjs.length > 0) {\n" +
                "                    $(\"#fromjs .markdown_views pre\").addClass(\"prettyprint\");\n" +
                "                    prettyPrint();\n" +
                "\n" +
                "                    $('pre.prettyprint code').each(function () {\n" +
                "                        var lines = $(this).text().split('\\n').length;\n" +
                "                        var $numbering = $('<ul/>').addClass('pre-numbering').hide();\n" +
                "                        $(this).addClass('has-numbering').parent().append($numbering);\n" +
                "                        for (i = 1; i <= lines; i++) {\n" +
                "                            $numbering.append($('<li/>').text(i));\n" +
                "                        };\n" +
                "                        $numbering.fadeIn(1700);\n" +
                "                    });\n" +
                "\n" +
                "                    $('.pre-numbering li').css(\"color\", \"#999\");\n" +
                "                }\n" +
                "            });\n" +
                "\n" +
                "            $(\".markdown_views a[target!='_blank']\").attr(\"target\", \"_blank\");\n" +
                "\n" +
                "            //$(\".toc a[target='_blank']\").attr(\"target\", \"\");\n" +
                "\n" +
                "            setTimeout(function () {\n" +
                "                $(\".toc a[target='_blank']\").attr(\"target\", \"\");\n" +
                "            }, 500);\n" +
                "\n" +
                "        </script>\n" +
                "\n" +
                "</body>\n" +
                "</html>   \n";

//        System.out.println(cSrc);
        // 加密
//        String enString = encrypt(cSrc, cKey);
//        System.out.println("加密后的字串是：" + enString);
        // 解密
//        String DeString = decrypt(enString, cKey);
//        System.out.println("解密后的字串是：" + DeString);

        String enString = taEncrypt("TA10000300000120170801020809", cSrc);
//        String hex = RpcInvoke.bytesToHexString(enString.getBytes("UTF-8"));

        System.out.println("加密后的字串是：" + enString);

//        enString = RpcInvoke.hexStr2Str(hex);
        String DeString = taDecrypt("TA10000300000120170801020809", enString);
        System.out.println("解密后的字串是：" + DeString);
        String keyForJS = getKeyForJS("TA10000300000120170801020809");
        System.out.println("Key for JS是：" + keyForJS);
    }
}


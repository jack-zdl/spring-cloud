var CryptoAgent = "";
// Create ActiveX object according to the platform
function OnLoad() {
    try {
        var eDiv = document.createElement("div");
        if (navigator.appName.indexOf("Internet") >= 0 || navigator.appVersion.indexOf("Trident") >= 0) {
            if (window.navigator.cpuClass == "x86") {
                eDiv.innerHTML = "<object id=\"CryptoAgent\" codebase=\"CryptoKit.Cypfintech.x86.cab\" classid=\"clsid:F87C344E-3D2A-45C5-BCCF-DBFFEF5668E2\" ></object>";
            }
            else {
                eDiv.innerHTML = "<object id=\"CryptoAgent\" codebase=\"CryptoKit.Cypfintech.x64.cab\" classid=\"clsid:FE9859B2-245B-4794-A9B7-6E01BA93B5CD\" ></object>";
            }
        }
        else {
            eDiv.innerHTML = "<embed id=\"CryptoAgent\" type=\"application/npCryptoKit.Cypfintech.x86\" style=\"height: 0px; width: 0px\">";
        }
        document.body.appendChild(eDiv);
    }
    catch (e) {
        // alert(e);
        return;
    }
    CryptoAgent = document.getElementById("CryptoAgent");
    CryptoAgent.SetSM2CSPList("CFCA CSP v3.0||CFCA Ulan CSP v4.0");
}
window.onload = OnLoad;

// Sign a JSONArray message (detach)
// [{"URID":[{"sid":"12345","blob":"BASE64 String"},{"sid":"22222","blob":"BASE64 String"}]}, ...]
function MsgSignJSONArray(jsonarray, KeyNum) {

    jsonarray = JSON.stringify(jsonarray);
    jsonarray = JSON.parse(jsonarray);

    if (CryptoAgent == "") {
        OnLoad();
    }

    while (true) {
        try {
            CryptoAgent.SelectCertificate("", "", "");
            var SN = CryptoAgent.GetSignCertInfo("SerialNumber");

            if (SN == KeyNum) {
                var numOfUrid = jsonarray.length;

                for (var i = 0; i < numOfUrid; i++) {
                    var urid = Object.keys(jsonarray[i])[0];
                    var numOfFiles = jsonarray[i][urid].length;

                    for (var j = 0; j < numOfFiles; j++) {
                        var source = jsonarray[i][urid][j]["blob"];
                        var temp = CryptoAgent.SignMsgPKCS7(source, "", false);
                        jsonarray[i][urid][j]["blob"] = temp;
                    }
                }
                return JSON.stringify(jsonarray);
            } else {
                if (!window.confirm("请插入正确的安全密钥")){
                    return "";
                }
            }
        }
        catch (e) {
            if (!window.confirm("请插入密钥")){
                return "";
            }
        }
    }
}

// Sign a JSON message
// {"urid1":["file1 base64 string", ...], "urid2":["file2 base64 string", ...], ...}
function MsgSign(json, KeyNum) {

    var obj = json;
    // var objString = JSON.stringify(obj);
    // console.log(objString);

    if (CryptoAgent == "") {
        OnLoad();
    }

    while (true) {
        try {
            CryptoAgent.SelectCertificate("", "", "");
            var SN = CryptoAgent.GetSignCertInfo("SerialNumber");

            if (SN == KeyNum) {
                for (var key in obj) {
                    var len = obj[key].length;
                    for (var i = 0; i < len; i++) {
                        obj[key][i] = CryptoAgent.SignMsgPKCS7(obj[key][i], "", false); // false: detach
                    }
                }

                return obj;
            }else {
                if (!window.confirm("请插入正确的安全密钥")){
                    return "";
                }
            }
        }catch (e) {
            if (!window.confirm("请插入密钥")){
                return "";
            }
        }
    }
}

// Sign a string message
function SignString(json, KeyNum) {
    var obj = json;
    var objString = Base64.encode(JSON.stringify(obj)); // btoa(JSON.stringify(obj))
    // console.log(objString);

    if (CryptoAgent == "") {
        OnLoad();
    }

    while (true) {
        try {
            CryptoAgent.SelectCertificate("", "", "");
            var SN = CryptoAgent.GetSignCertInfo("SerialNumber");
            // console.log(SN);
            // console.log(KeyNum);
            if (SN == KeyNum) {
                var sign = CryptoAgent.SignMsgPKCS7(objString, "", true);
                return sign;

            }else {
                if (!window.confirm("请插入正确的安全密钥")){
                    return "";
                }
            }
        }catch (e) {
            if (!window.confirm("请插入密钥")){
                return "";
            }
        }
    }
}

// Sign a Base64 string message
// base64: base64编码过的字符串
// KeyNum: 签名证书序列号
// attached: true带原文; false不带原文
function SignBase64String(base64, KeyNum, attached) {
    var objString = base64;

    if (CryptoAgent == "") {
        OnLoad();
    }

    while (true) {
        try {
            CryptoAgent.SelectCertificate("", "", "");
            var SN = CryptoAgent.GetSignCertInfo("SerialNumber");
            // console.log(SN);
            // console.log(KeyNum);
            if (SN == KeyNum) {
                var sign = CryptoAgent.SignMsgPKCS7(objString, "", attached);
                return sign;

            }else {
                if (!window.confirm("请插入正确的安全密钥")){
                    return "";
                }
            }
        }catch (e) {
            if (!window.confirm("请插入密钥")){
                return "";
            }
        }
    }
}
var main = {
	createXMLHttp: function() {
		var xmlHttp;
		if(window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		return xmlHttp;
	},

	sendAjax: function(url, type, callback) {
		var ajax = main.createXMLHttp();
		ajax.open(type, url, true);
		ajax.onreadystatechange=function() {
			if (ajax.readyState == 4 && ajax.status == 200) {
				callback(unescape(ajax.responseText));
			}
		}
		ajax.send(null);
	}
};

var util = {
    checkEmpty: function(value) {
        return (typeof value == "undefined" || value == "");
    },

    checkPhone: function(value) {
        if(value != "" && value.length == 11) {
            var mobile = value;
            var reg0 = /^13\d{5,9}$/;
            var reg1 = /^15\d{5,9}$/;
            var reg2 = /^18\d{5,9}$/;
            var reg3 = /^179\d{4,8}$/;
            var my = false;
            if (reg0.test(mobile)) my = true;
            if (reg1.test(mobile)) my = true;
            if (reg2.test(mobile)) my = true;
            if (reg3.test(mobile)) my = true;
            return my;
        } else {
            return false;
        }
    },

    getQueryString: function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return "";
    }
};
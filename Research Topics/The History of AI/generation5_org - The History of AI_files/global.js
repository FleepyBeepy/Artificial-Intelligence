function fi(url, names) {
	if(navigator.appVersion.lastIndexOf("MSIE 3") == -1) document[names].src = "images/"+url;
}

function WriteCookie (cookieName, cookieValue, expiry) {
	var expDate = new Date();
	if(expiry) {
	    expDate.setTime (expDate.getTime() + expiry);
	    document.cookie = cookieName + "=" + escape (cookieValue) + "; expires=" + expDate.toGMTString();
	}
	else {
	    document.cookie = cookieName + "=" + escape (cookieValue);
	}
}

function ReadCookie (CookieName) {
	var CookieString = document.cookie;
	var CookieSet = CookieString.split (';');
	var SetSize = CookieSet.length;
	var CookiePieces
	var ReturnValue = "";
	var x = 0;
	
	for (x = 0; ((x < SetSize) && (ReturnValue == "")); x++) {
		
		CookiePieces = CookieSet[x].split ('=');
		
		if (CookiePieces[0].substring (0,1) == ' ') {
			CookiePieces[0] = CookiePieces[0].substring (1, CookiePieces[0].length);
		}
		
		if (CookiePieces[0] == CookieName) {
			ReturnValue = CookiePieces[1];
		}
	}

	return unescape(ReturnValue)
}

// Prints a image with caption.
function PrintImage(url, align, courtesy, width, textalign) {
	document.writeln("<table border=0 cellpadding=1 cellspacing=0 align="+align+"><tr><td bgcolor=black>");
	document.writeln("<table border=0 cellpadding=0 cellspacing=0 align=center width="+width+"><tr><td>");
	document.writeln("<img src="+url+" border=0></td></tr>");
	if (courtesy != "none")
		document.writeln("<tr><td bgcolor=#EEEEEE><font size=0><div align="+textalign+">&nbsp;"+courtesy+"</div></font></td></tr>");

	document.writeln("</table></td></tr></table>")
}

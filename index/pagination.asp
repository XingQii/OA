<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<style type="text/css">
/*pagination */
div#pagination {
     height:50px;
     margin-top:3px;
 }
div#pagination .count {
     float:left;
     padding:5px;
     }
div#pagination .pages {
     float:right; padding:5px;
     }

div#paginationTop{background: url(../images/oPagination_bg_top.png) bottom center no-repeat; height:40px; margin-bottom:3px;}
div#paginationTop .count { float:left; padding:5px;}
div#paginationTop .pages { float:right; padding:5px;}

div.pagination {}
div.pagination a {
     padding: 2px 5px 2px 5px;
     margin: 2px;
     border: 1px solid #AAA;
     text-decoration: none; /* no underline */
     color: #444;
}
div.pagination a:hover, div.pagination a:active {
     border: 1px solid #18a3dc;
     color: #18a3dc;
	 width:10px;
	 cursor:pointer;
}
div.pagination .pageinput {border:1px solid #DDD;height:23px;width:40px;margin-left:10px;}
div.pagination .pagebtn {border:0;height:23px;line-height:23px;color:white;margin-left:4px;border-radius:4px;width:25px;background:#FF6600;}
div.pagination .pagebtn:hover {cursor:pointer}
div.pagination span.current {
     padding: 2px 5px 2px 5px;
     margin: 2px;
     border: 1px solid #FF6600;
     font-weight: bold;
     background-color: #FF6600;
     color: #FFF;
	 width:10px;
	 display:inline-block;
     }
div.pagination span.disabled {
     padding: 2px 5px 2px 5px;
     margin: 2px;
     border: 1px solid #EEE;
     color: #DDD;
	 width:40px;
	 display:inline-block;
}
.bold14 {
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
}
.rederror {
	color: red;
}
</style>
</head>
<body>
<%
	'digg style pagination script in asp.. written by Moazam... http://www.moazam.com/2007/03/30/asp-digg-style-pagination-script/
	dim margin,padding,prev,nextPage,lastpage,lpm1,pagination,counter,ps
	function getPaginationString(page, totalitems, limit, adjacents, targetpage)	
		'defaults
		if not isnumeric(adjacents) then adjacents = 1 end if
		if not isnumeric(limit) then  limit = 15 end if
		if not isnumeric(page) then page = 1 end if
		if targetpage = "" then targetpage = "/" end if
		action = Request.ServerVariables("SCRIPT_NAME")
		query = Split(Request.ServerVariables("QUERY_STRING"), "&")
		For Each x In query
        a = Split(x, "=")
        If StrComp(a(0), "page", vbTextCompare) <> 0 Then
            temp = temp & a(0) & "=" & a(1) & "&"
		    'temp1=temp1 &"<input type='hidden' name='"&a(0)&"' value='"&a(1)&"'>"
        End If
        Next
		margin = ""
		padding=""
		'other vars
		prev = page - 1									'previous page is page - 1
		nextPage = page + 1									'nextPage page is page + 1
		lastpage = Ceil(totalitems , limit)				'lastpage is = total items / items per page, rounded up.
		lpm1 = lastpage - 1								'last page minus 1
		'	Now we apply our rules and draw the pagination object. 
		'	We're actually saving the code to a variable in case we want to draw it more than once.
		page=int(page)
		pagination = ""
		if lastpage > 1 then
			
			pagination = pagination & "<div class=""pagination"""
			if margin <> "" OR padding <> "" then
				pagination = pagination &  " style="""
				if margin <> "" then
					pagination = pagination &  "margin: margin"
				end if
				if padding <> "" then
					pagination = pagination &  "padding: padding"
				end if
				pagination = pagination &  """"
			end if
			pagination = pagination &  ">"
	        pagination = pagination &"<form name=formgo action="&action & "?" & temp &" ><TR><TD align=right bgcolor=ffffff colspan="&colspan&" height=25>" 
			'previous button
			if page > 1 then
				pagination = pagination &  "<a href="""&action&"?"&temp&"page="&prev&""">上一页</a>"
			else
				pagination = pagination &  "<span class=""disabled"">上一页</span>"	
			end if
			'pages	
			if lastpage < 7 + (adjacents * 2) then	'not enough pages to bother breaking it up

				for counter = 1 to lastpage
				
					if counter = page then
						pagination = pagination &  "<span class=""current"">"&counter&"</span>"
					else
						pagination = pagination &  "<a href="""&action&"?"&temp&"page="&counter&""" >"&counter&"</a>"
					end if
				next	
			elseif lastpage >= 7 + (adjacents * 2) then	'enough pages to hide some
				'close to beginning only hide later pages
				if page < 1 + (adjacents * 3) then	
					for counter = 1 to (4 + (adjacents * 2))-1
						if counter = page then
							pagination = pagination &  "<span class=""current"">"&counter&"</span>"
						else
							pagination = pagination &  "<a href="""&action&"?"&temp&"page="&counter&""">"&counter&"</a>"
						end if			
					next
					pagination = pagination &  "..."
					pagination = pagination &  "<a href="""&action&"?"&temp&"page="&lpm1&""">"&lpm1&"</a>"
					pagination = pagination &  "<a href="""&action&"?"&temp&"page="&lastpage&""")"">"&lastpage&"</a>"		
				'in middle hide some front and some back
				elseif lastpage - (adjacents * 2) > page AND page > (adjacents * 2) then
					pagination = pagination &  "<a href="""&action&"?"&temp&"page=2"" >1</a>"
					pagination = pagination &  "<a href="""&action&"?"&temp&"page=1"">2</a>"
					pagination = pagination &  "..."
					for counter = (page - adjacents) to (page + adjacents)
						if counter = page then
							pagination = pagination &  "<span class=""current"">"&counter&"</span>"
						else
							pagination = pagination &  "<a href="""&action&"?"&temp&"page="&counter&""" >"&counter&"</a>"
						end if
					next
					pagination = pagination &  "..."
					pagination = pagination &  "<a href="""&action&"?"&temp&"page="&lpm1&""">"&lpm1&"</a>"
					pagination = pagination &  "<a href="""&action&"?"&temp&"page="&lastpage&""")"" >"&lastpage&"</a>"		
				'close to end only hide early pages
				else
					pagination = pagination &  "<a href="""&action&"?"&temp&"page=1"" >1</a>"
					pagination = pagination &  "<a href="""&action&"?"&temp&"page=2"" >2</a>"
					pagination = pagination &  "..."
					for counter = (lastpage - (1 + (adjacents * 3))) To lastpage
						if counter = page then
							pagination = pagination &  "<span class=""current"">"&counter&"</span>"
						else
							pagination = pagination &  "<a href="""&action&"?"&temp&"page="&counter&""" >"&counter&"</a>"
						end if
					next
				end if
			end if
			'nextPage button
			if page < counter - 1 then
				pagination = pagination &  "<a   href="""&action&"?"&temp&"page="&nextPage&""">下一页</a>"
			else
				pagination = pagination &  "<span class=""disabled"">下一页</span>"
			end if
			
			pagination = pagination & "<input type='text' class='pageinput' name='page' id='pagenum'   /><input type='submit' class='pagebtn' value='go' />"
			pagination = pagination & "</form>"
			pagination = pagination &  "</div>" & vbnewline
		end if
		getPaginationString = pagination
	end function
	function Ceil( dividend, divider)
		if (dividend mod divider) = 0 Then
			Ceil = dividend / divider
		ELSE
			Ceil = Int(dividend / divider) + 1
		End if
    End function
%>
</body>
</html>

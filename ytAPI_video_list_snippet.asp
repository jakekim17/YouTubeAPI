<%@Language="VBScript" CODEPAGE="65001"%>
<%Response.ContentType="text/html;charset=UTF-8"%>
<%
	session.codepage="65001"
	response.charset = "UTF-8"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>TEST</title>

<script src="/js/jquery-1.9.1.js"></script>
</head>
<body>
<script type="text/javascript">
<!--		
	function goProc(){

		$.support.cors = true;	
		$.ajax({             
			type: "GET",            
			url: "https://www.googleapis.com/youtube/v3/search?part=snippet&q=%EC%A3%BC%EC%8B%9D%EC%B0%BD%EA%B9%80%EC%A2%85%EC%B2%A0&type=video&key=&order=date",	//key는 자신의 YouTube API key값을 넣어야됨.
			cache: false,
			crossDomain: true,
			success: function(data) {
				//alert("1");
				//alert(data);
				//$("#panel").html(resultText);
				

/*				
				document.write(data);
				document.write("<BR>kind=" + data.kind);
				document.write("<BR>etag=" + data.etag);
				document.write("<BR>nextPageToken=" + data.nextPageToken);
				document.write("<BR>regionCode=" + data.regionCode);
				document.write("<BR>---------------<BR>pageInfo<BR>---------------");
				document.write("<BR>pageInfo.totalResults=" + data.pageInfo.totalResults);
				document.write("<BR>pageInfo.resultsPerPage=" + data.pageInfo.resultsPerPage);
*/

				var resultData = ""
				j=1
				
				//default data cnt 5
				for (i=0; i<=4; i++)
				{
					video_link = "<a href='https://www.youtube.com/watch?v=" + data.items[i].id.videoId + "'>"+ data.items[i].snippet.title +"</a>"

					video_thumbnail_default = "<img src='"+ data.items[i].snippet.thumbnails.default.url +"'>"
					video_thumbnail_medium = "<img src='"+ data.items[i].snippet.thumbnails.medium.url +"'>"
					video_thumbnail_high = "<img src='"+ data.items[i].snippet.thumbnails.high.url +"'>"
					video_thumbnail = "<a href='https://www.youtube.com/watch?v=" + data.items[i].id.videoId + "'>"+ video_thumbnail_default +"</a>"

					resultData = resultData + "<div id='video"+ j+"'>"
					resultData = resultData + video_link
					//resultData = resultData + video_thumbnail + video_link
					resultData = resultData + "</div>"
/*
					document.write("<BR>---------------<BR>items for<BR>---------------");
					document.write("<BR>---------------<BR>for ["+i+"]<BR>---------------");
					document.write("<BR>items["+i+"].kind=" + data.items[i].kind);
					document.write("<BR>items["+i+"].etag=" + data.items[i].etag);
					document.write("<BR>items["+i+"].id.kind=" + data.items[i].id.kind);
					document.write("<BR>items["+i+"].id.videoId=" + data.items[i].id.videoId);
					document.write("<BR>---------------<BR>snippet<BR>---------------");
					document.write("<BR>items["+i+"].snippet.publishedAt=" + data.items[i].snippet.publishedAt);
					document.write("<BR>items["+i+"].snippet.channelId=" + data.items[i].snippet.channelId);
					document.write("<BR>items["+i+"].snippet.title=" + data.items[i].snippet.title);
					document.write("<BR>items["+i+"].snippet.description=" + data.items[i].snippet.description);
					document.write("<BR>---------------<BR>snippet - thumbnails - default<BR>---------------");
					document.write("<BR>items["+i+"].snippet.thumbnails.default.url=" + data.items[i].snippet.thumbnails.default.url);
					document.write("<BR>items["+i+"].snippet.thumbnails.default.width=" + data.items[i].snippet.thumbnails.default.width);
					document.write("<BR>items["+i+"].snippet.thumbnails.default.height=" + data.items[i].snippet.thumbnails.default.height);
					document.write("<BR>---------------<BR>snippet - thumbnails - medium<BR>---------------");
					document.write("<BR>items["+i+"].snippet.thumbnails.medium.url=" + data.items[i].snippet.thumbnails.medium.url);
					document.write("<BR>items["+i+"].snippet.thumbnails.medium.width=" + data.items[i].snippet.thumbnails.medium.width);
					document.write("<BR>items["+i+"].snippet.thumbnails.medium.height=" + data.items[i].snippet.thumbnails.medium.height);
					document.write("<BR>---------------<BR>snippet - thumbnails - high<BR>---------------");
					document.write("<BR>items["+i+"].snippet.thumbnails.high.url=" + data.items[i].snippet.thumbnails.high.url);
					document.write("<BR>items["+i+"].snippet.thumbnails.high.width=" + data.items[i].snippet.thumbnails.high.width);
					document.write("<BR>items["+i+"].snippet.thumbnails.high.height=" + data.items[i].snippet.thumbnails.high.height);
					document.write("<BR>---------------<BR>snippet - channelTitle,liveBroadcastContent <BR>---------------");
					document.write("<BR>items["+i+"].snippet.channelTitle=" + data.items[i].snippet.channelTitle);
					document.write("<BR>items["+i+"].snippet.liveBroadcastContent=" + data.items[i].snippet.liveBroadcastContent);
*/
					j++
				}


/*

					var video1_id = data.items[0].id.videoId;
					var video1_link = "https://www.youtube.com/watch?v=" + video1_id;
					var video1_div = "<a href='https://www.youtube.com/watch?v=" + video1_id + "'>video1</a>"
					
					var video2_id = data.items[1].id.videoId;
					var video2_link = "https://www.youtube.com/watch?v=" + video2_id;
					var video2_div = "<a href='https://www.youtube.com/watch?v=" + video2_id + "'>video2</a>"

					
					var video3_id = data.items[2].id.videoId;
					var video3_link = "https://www.youtube.com/watch?v=" + video3_id;
					var video3_div = "<a href='https://www.youtube.com/watch?v=" + video3_id + "'>video3</a>"

					
					var video4_id = data.items[3].id.videoId;
					var video4_link = "https://www.youtube.com/watch?v=" + video4_id;
					var video4_div = "<a href='https://www.youtube.com/watch?v=" + video4_id + "'>video4</a>"

					
					var video5_id = data.items[4].id.videoId;
					var video5_link = "https://www.youtube.com/watch?v=" + video5_id;
					var video5_div = "<a href='https://www.youtube.com/watch?v=" + video5_id + "'>video5</a>"

					var resultData = "<div id='video1'>"+video1_div+"</div><div id='video2'>"+video2_div+"</div><div id='video3'>"+video3_div+"</div><div id='video4'>"+video4_div+"</div><div id='video5'>"+video5_div+"</div>"
*/
					//document.write(resultData);

					//alert(resultData);

					$("#panel").html(resultData);

					//document.write(video1_id+"|"+video2_id+"|"+video3_id+"|"+video4_id+"|"+video5_id);

			}, 
			error: function(xhr, status, error) { 
				console.log(xhr);
				console.log(status);
				console.log(error);
				alert(xhr); 
				alert(status); 
				alert(error); 
			} 
		}); 
	}
//-->
</script>
<div id="panel">loading...</div>


2<BR>
5<BR>
6<BR>
<a href="JavaScript: goProc();">7</a>
</body>
</html>
<script>
	goProc();
</script>

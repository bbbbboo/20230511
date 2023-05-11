<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Wave Effect</title>
    <script src="https://unpkg.com/wavesurfer.js@6.6.3/dist/wavesurfer.js"></script>   
    <style type="text/css">
    @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap');

/*배경색*/
body{
    background: #FF1493;
}

 /* 폰트설정 */
.container{
    font-family: 'Quicksand', sans-serif;
}

.music-player{
    margin-top: 10px;
    margin-bottom: 10px;
    background: #fff2f6;
    
    height: 250px;
    border-radius: 15px;
    
    
    display: flex;
    align-items: center;

}

/*앨범사진 크기*/
#music-icon{
    height: 180px;
    width: 180px;
    margin-left: 20px;
    

}

.info{
    margin-left: 20px;
    width: 100%;
}

.info h3{
    
    margin-bottom: 10px;
}

.control-bar{
    margin-top: 1px;
}

.control-bar img{
    height: 20px;
    margin-right: 10px;
    cursor:pointer;
}
    
    
    
    </style>
    
    <!--첫번째-->
    <div class="container">
        <div class="music-player">
            <img src="/resources/img/img1.jpeg" alt="music" id="music-icon">
            <div class="info">
                <h1>Name1 - TitleName12 </h1>
                <div id="waveform"></div>
                <div class="control-bar">
                    <img src="/resources/img/play.png" alt="play" id="playBtn1" title="Play / pause">
                    <img src="/resources/img/stop.png" alt="stop" id="stopBtn1" title="Stop">
                    <img src="/resources/img/volume.png" alt="volume" id="volumeBtn1" title="mute / unmute">
                </div>
            </div>
        </div>
    </div>
    
    <script>

	var wavesurfer[];
	var playBtn[];
	var stopBtn[];
	var volumBtn[];
	for ( var i= 0 ; i<3; i++){
		var playBtn[i] = document.getElementById("playBtn"+[i]);
        var stopBtn[i] = document.getElementById("stopBtn"+[i]);
        var volumBtn[i] = document.getElementById("volumeBtn"+[i]);
		
   	 var wavesurfer[i] = WaveSurfer.create({
        container: '#waveform'+i,
        waveColor: '#e3bbee',
        progressColor: '#fe38ab',
        //파동바의 크기
        barWidth: 3,
        resposive:true,
        hideScrollbar: true,
        normalize: true,
        barHeight: 1,
        //파동끝부분의 둥글기?
        barRadius:3
    });
		
	}
    wavesurfer.load('../resources/wav/CLF_80_Keys_TapePiano_Fm.wav');
    wavesurfer.setHeight(50);

    playBtn[i].onclick = function(){
        wavesurfer.playPause();
        if(playBtn[i].src.match("play")){
            playBtn[i].src = "/resources/img/pause.png";
        }
        else{
            playBtn[i].src = "/resources/img/play.png";
        }
    }
    stopBtn[i].onclick = function(){
        wavesurfer.stop();
    }
   volumeBtn[i].onclick = function(){
    wavesurfer.toggleMute();
    if(volumeBtn[i].src.match("volume")){
        volumeBtn[i].src="/resources/img/volume.png";
    } else{
        volumeBtn[i].src ="/resources/img/mute.png";
    }
   }
    </script>

   
</body>
</html>
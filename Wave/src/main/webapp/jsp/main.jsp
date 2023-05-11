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
    
    height: 210px;
    border-radius: 15px;
    
    
    display: flex;
    align-items: center;

}

.time{
	margin-bottom: 8px;
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
            <img src="/resources/img/img1.jpg" alt="music" id="music-icon">
            <div class="info">
                <h1>Name1 - TitleName1 </h1>
                <div id="waveform"></div>
                <div class="time">
                	<span id="current1">0:00</span>
                	<span id="duration1">0:00</span>
                </div>
                <div class="control-bar">
                    <img src="/resources/img/play.png" alt="play" id="playBtn1" title="Play / pause">
                    <img src="/resources/img/stop.png" alt="stop" id="stopBtn1" title="Stop">
                    <img src="/resources/img/volume.png" alt="volume" id="volumeBtn1" title="mute / unmute">
                </div>
            </div>
        </div>
    </div>
    
    <script>
        var playBtn1 = document.getElementById("playBtn1");
        var stopBtn1 = document.getElementById("stopBtn1");
        var volumBtn1 = document.getElementById("volumeBtn1");
        duration1 = document.querySelector("#duration1");
        current1 = document.querySelector("#current1");
        
        var timeCalculator1 = function(value){
        	second = Math.floor(value % 60);
        	minute = Math.floor((value / 60) % 60);
        	
        	if (second <10 ){
        		second = "0" + second;
        	}
        	return minute + ":" + second;
        };


    var wavesurfer1 = WaveSurfer.create({
        container: '#waveform',
        waveColor: '#e3bbee',
        progressColor: '#fe38ab',
        //파동바의 크기
        barWidth: 3,
        resposive:true,
        hideScrollbar: true,
        //파동끝부분의 둥글기?
        barRadius:3
    });
    wavesurfer1.load('../resources/wav/CLF_80_Keys_TapePiano_Fm.wav');
    wavesurfer1.setHeight(70);

    playBtn1.onclick = function(){
        wavesurfer1.playPause();
        if(playBtn1.src.match("play")){
            playBtn1.src = "/resources/img/pause.png";
        }
        else{
            playBtn1.src = "/resources/img/play.png";
        }
    }
    stopBtn1.onclick = function(){
        wavesurfer1.stop();
    }
   volumeBtn1.onclick = function(){
    wavesurfer1.toggleMute();
    if(volumeBtn1.src.match("volume")){
        volumeBtn1.src="/resources/img/mute.png";
    } else{
        volumeBtn1.src ="/resources/img/volume.png";
    }
   }
   //load audio duration on load
   wavesurfer1.on("ready",function(e){
	   duration1.textContent = timeCalculator1(wavesurfer1.getDuration()); 
   })
   
  //get update current time on play
  wavesurfer1.on("audioprocess",function(e){
	  current1.textContent = timeCalculator1(wavesurfer1.getCurrentTime());
  })
    </script>

    <!--두번째-->
    <div class="container">
        <div class="music-player">
            <img src="/resources/img/img2.jpg" alt="music" id="music-icon">
            <div class="info">
                <h1>Name2 - TitleName2 </h1>
                <div id="waveform2"></div>
                <div class="time">
                	<span id="current2">0:00</span>
                	<span id="duration2">0:00</span>
                </div>
                <div class="control-bar">
                   <img src="/resources/img/play.png" alt="play" id="playBtn2" title="Play / pause">
                    <img src="/resources/img/stop.png" alt="stop" id="stopBtn2" title="Stop">
                    <img src="/resources/img/volume.png" alt="volume" id="volumeBtn2" title="mute / unmute">
                </div>
            </div>
        </div>
    </div>
    

<script>
    var playBtn2 = document.getElementById("playBtn2");
    var stopBtn2 = document.getElementById("stopBtn2");
    var volumeBtn2 = document.getElementById("volumeBtn2");
    duration2 = document.querySelector("#duration2");
    current2 = document.querySelector("#current2");
    
    var timeCalculator2 = function(value){
    	second = Math.floor(value % 60);
    	minute = Math.floor((value / 60) % 60);
    	
    	if (second <10 ){
    		second = "0" + second;
    	}
    	return minute + ":" + second;
    };


	var wavesurfer2 = WaveSurfer.create({
	    container: '#waveform2',
	    waveColor: '#e3bbee',
	    progressColor: '#fe38ab',
	    //파동바의 크기
	    barWidth: 3,
	    resposive:true,
	    hideScrollbar: true,
	    //파동끝부분의 둥글기?
	    barRadius:3
	});
	wavesurfer2.load('../resources/wav/RNT_vocal_phrase_falling_dry_130_Em.wav');
	wavesurfer2.setHeight(70);
	
	playBtn2.onclick = function(){
	    wavesurfer2.playPause();
	    if(playBtn2.src.match("play")){
	        playBtn2.src = "/resources/img/pause.png";
	    }
	    else{
	        playBtn2.src = "/resources/img/play.png";
	    }
	}
	stopBtn2.onclick = function(){
	    wavesurfer2.stop();
	}
	volumeBtn2.onclick = function(){
	wavesurfer2.toggleMute();
	if(volumeBtn2.src.match("volume")){
	    volumeBtn2.src="/resources/img/volume.png";
	} else{
	    volumeBtn2.src ="/resources/img/mute.png";
	}
}
	
	   //load audio duration on load
	   wavesurfer2.on("ready",function(){
		   duration2.textContent = timeCalculator2(wavesurfer2.getDuration()); 
	   })
	   
	  //get update current time on play
	  wavesurfer2.on("audioprocess",function(){
		  current2.textContent = timeCalculator2(wavesurfer2.getCurrentTime());
	  })
</script>

<!--3번째-->
<div class="container">
    <div class="music-player">
        <img src="/resources/img/img3.jpg" alt="music" id="music-icon">
        <div class="info">
            <h1>Name3 - TitleName3 </h1>
            <div id="waveform3"></div>
            <div class="time">
                	<span id="current3">0:00</span>
                	<span id="duration3">0:00</span>
                </div>
            <div class="control-bar">
                <img src="/resources/img/play.png" alt="play" id="playBtn3" title="Play / pause">
                <img src="/resources/img/stop.png" alt="stop" id="stopBtn3" title="Stop">
                <img src="/resources/img/volume.png" alt="volume" id="volumeBtn3" title="mute / unmute">
            </div>
        </div>
    </div>
</div>


<script>
		var playBtn3 = document.getElementById("playBtn3");
		var stopBtn3 = document.getElementById("stopBtn3");
		var volumeBtn3 = document.getElementById("volumeBtn3");
		duration3 = document.querySelector("#duration3");
	    current3 = document.querySelector("#current3");
	    
	    var timeCalculator3 = function(value){
	    	second = Math.floor(value % 60);
	    	minute = Math.floor((value / 60) % 60);
	    	
	    	if (second <10 ){
	    		second = "0" + second;
	    	}
	    	return minute + ":" + second;
	    };
		
		
		var wavesurfer3 = WaveSurfer.create({
		container: '#waveform3',
		waveColor: '#e3bbee',
		progressColor: '#fe38ab',
		//파동바의 크기
		barWidth: 3,
		resposive:true,
		hideScrollbar: true,
		//파동끝부분의 둥글기?
		barRadius:3
		});
		wavesurfer3.load('../resources/wav/TROPKILLAZ_melody_loop_crazy_horns_02_95_Bmin.wav');
		wavesurfer3.setHeight(70);
		
		playBtn3.onclick = function(){
		    wavesurfer3.playPause();
		    if(playBtn3.src.match("play")){
		        playBtn3.src = "/resources/img/pause.png";
		    }
		    else{
		        playBtn3.src = "/resources/img/play.png";
		    }
		}
		stopBtn3.onclick = function(){
		    wavesurfer3.stop();
		}
		volumeBtn3.onclick = function(){
		wavesurfer.toggleMute();
		if(volumeBtn3.src.match("volume")){
		    volumeBtn3.src="/resources/img/volume.png";
		} else{
		    volumeBtn3.src ="/resources/img/mute.png";
		}
	}
	   //load audio duration on load
	   wavesurfer3.on("ready",function(){
		   duration3.textContent = timeCalculator2(wavesurfer3.getDuration()); 
	   })
	   
	  //get update current time on play
	  wavesurfer3.on("audioprocess",function(){
		  current3.textContent = timeCalculator3(wavesurfer3.getCurrentTime());
	  })
</script>



</body>
</html>
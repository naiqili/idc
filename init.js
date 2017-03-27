var audio_context;
var recorder;
  
function setText(text) {
    document.getElementById("output").value += text;
}
                    
function startUserMedia(stream) {
    var input = audio_context.createMediaStreamSource(stream);
    recorder = new Recorder(input);
}

$(document).ready(function(){
    $.get("/cgi-bin/task_describ.py",function(data,status){
        $('#task_describ').text(data)
    });
    
    $('#btn_test').click(function(){
        alert('start');
        $.post('/cgi-bin/audio_test.py',
            {text: 'interesting'},
            function(data, status){
                alert(data);
            });
    });
    
    try {
      window.AudioContext = window.AudioContext || window.webkitAudioContext;
      navigator.getUserMedia = ( navigator.getUserMedia ||
                       navigator.webkitGetUserMedia ||
                       navigator.mozGetUserMedia ||
                       navigator.msGetUserMedia);
      window.URL = window.URL || window.webkitURL;
      
      audio_context = new AudioContext;
    } catch (e) {
      alert('No web audio support in this browser!');
    }
    
    navigator.getUserMedia({audio: true}, startUserMedia, function(e) {});
    
    $('#btn_start_rec').click(function(){  
        recorder && recorder.record();
    });
    
    $('#btn_stop_rec').click(function(){        
        recorder && recorder.stop();
    });
    
    $('#btn_submit').click(function(){
        recorder && recorder.exportWAV(function(blob) {
            var txt_sent1 = $('#output').val();
            
            var formData = new FormData();
            formData.append('text', txt_sent1);
            formData.append('audio', blob);
            var request = new XMLHttpRequest();
            request.open("POST", "/cgi-bin/process.py");
            request.send(formData);
            request.onreadystatechange = function(){
                if(request.readyState === 4 && request.status === 200){
                    alert(request.responseText);
                }
            }
        });
    });
});

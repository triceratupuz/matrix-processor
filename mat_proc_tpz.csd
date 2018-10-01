<CsoundSynthesizer>
<CsLicense>
</CsLicense>
<CsOptions>
-iadc -odac -m1
-b256 -B512

;Current Directory
--omacro:GSCURDIR=/storage/emulated/0/DCIM/MatrixProcessor/

;Include files directory
--env:INCDIR+=/storage/emulated/0/DCIM/MatrixProcessor/include
</CsOptions>

<CsHtml5>
<!DOCTYPE html>
<html>
<head>
<title>Matrix</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">

<style type="text/css">
body {
	background-color: FFFFFF;
	font-size:19px;
	font-family: Sans-serif;
}

h1 {
	color: #000000;
	font-size:1.1em;
              width: 100%;
}

label {
	color: #000000;
	//font-weight: bold;
	font-size:0.9em;
}

.mixer {
            column-count:7;
}

.header {
          padding-top: 0.5%;
          padding-bottom: 0.5%;
          padding-left: 0.5%;
          padding-right: 0.5%;
          border-style:solid;
          border-width: 1px;
          border-color:#000000;
          column-count:4;
}

.time {
          //margin:0.5%;
         width:20%;
         float:left;
}

.loopthr {
         width:9%;
         float:left;
}

.timew {
         float:left;
}

.timetop {
         width:50%;
         float:left;
}

.mixeritem {
         width:10%;
         float:left;
}


#midiww {
    column-count:4;
}

input[type=checkbox] {
	font-size:0.8em;
	padding: 0.5em;
	border: 0;
}

input[type=button] {
               width:45%;
	font-size:1em;
	//padding: 0.5em;
	border-style:solid;
              border-width: 1px;
              border-color:#000000;
	background-color: #bbbbbb;
}

input[type=range] {
	-webkit-appearance: none;
	border-radius:8px;
	box-shadow: inset 0 0 5px #555;
	backgroud-color: #999;
	height:20px;
	width:100%;
	vertical-alig:middle;
}

input[type=range].vertical {
	/*vertical slider*/
	-webkit-appearance: slider-vertical;
	border-radius:8px;
	box-shadow: inset 0 0 5px #555;
	backgroud-color: #999;
	height:6.5%;
	width:30%;
	vertical-alig:middle;
              horizontal-alig:middle;
}

input[type=range].vertical2 {
	/*vertical slider*/
	-webkit-appearance: slider-vertical;
	border-radius:8px;
	box-shadow: inset 0 0 5px #555;
	backgroud-color: #999;
	height:8%;
	width:5%;
	vertical-alig:middle;
              horizontal-alig:middle;
              //padding:5px;
}

input[type=number] {
    width:5em;
    font-size:0.9em;
}

input[type=number].head {
    width:24%;
    font-size:0.7em;
}

input[type=number].top {
          width:45%;
}

input[type=number].foot {
          width:100%;
}

select {
              font-size:1.0em;
	font-family: Sans-serif;
              width:100%;
}

select.foot {
              width:100%;
}

select.foothalf {
              width:45%;
}

input[type=button].bpm {
               width:21%;
               font-size:0.8em;
}

input[type=button].viuw {
               width:30%;
               font-size:0.8em;
}


input[type=button].preset {
               width:17.5%;
}


input[type=button].foothw {
               width:50%;
               font-size:1.5em;
}

input[type=button].footdh {
               width:100%;
               font-size:2.3em;
}

</style>

<script type="text/javascript">

//CONFIGURATION-----------------------------------------------------------------------------------
//create efflist e para
// first number is csound instr - 100

var effectsData = [[0, "nothing", "", "", "", ""],
    [1, "mix", "gain", "phase inv", "", ""],
    [2, "distort", "pre", "post", "shape 1", "shape 2"],
    [3, "clip", "pre", "vol", "", ""],
    [4, "abs", "abs", "direct", "", ""],
    [5, "degrader", "fold", "bits", "dry-wet", ""],
    [6, "powershape", "shape", "hp", "lp", "volume"],
    [8, "slow attack", "threshold", "time", "", ""],
    [9, "compressor", "gain", "threshold", "ratio", ""],
    [70, "gate", "threshold", "lop-hip", "", ""],
    [71, "shortEnv", "threshold", "attack", "sustain", "release"],
    [10, "lowpass", "freq", "Q", "volume", ""],
    [11, "highpass", "freq", "volume", "", ""],
    [12, "evelopLp", "sens", "freq L", "freq H", "Q"],
    [13, "lpf18", "freq", "resonance", "distortion", "dry-wet"],
    [14, "1b parametric", "freq", "band", "gain", ""],
    [15, "condorcab", "scoop", "", "", ""],
    [19, "4b eq", "bass", "lowmid", "highmid", "high"],
    [20, "tremolo", "freq", "volume", "square", "dry-wet"],
    [60, "tremoloBpm", "step", "qty", "square", "dry-wet"],
    [21, "flanger", "freq", "delay", "feedback", "dry-wet"],
    [22, "phaser", "lfo", "frequency", "feedback", "dry-wet"],
    [23, "chorus", "delay", "frequency", "feedback", "dry-wet"],
    [24, "leslie", "crossover", "L speed", "H speed", "doppler"],
    [25, "pitch", "pitch", "quality", "dry-wet", ""],
    [26, "pitch HQ", "pitch", "fine", "dry-wet", ""],
    [27, "ring mod", "freq", "shape", "dry-wet", ""],
    [28, "freq mod", "car shift", "mod shift", "spread", "dry-wet"],
    [29, "hilbert", "freq", "min shift", "max shift", "direction"],
    [30, "delay", "time", "feedback", "dry-wet", ""],
    [61, "delayBpm", "step", "qty", "feedback", "dry-wet"],
    [32, "reverseDelay", "time", "feedback", "dry-wet", ""],
    [33, "crapDelay", "time", "crap", "feedback", "dry-wet"],
    [40, "reverb", "hp in", "size", "cutoff", "dry-wet"],
    [41, "modulverb", "random", "feedback", "cutoff", "dry-wet"],
    [42, "schroeder", "time", "pretime", "postime", "dry-wet"],
    [43, "enverb", "hp in", "size", "cutoff", "threshold"],
    [50, "spectral arp", "speed", "min", "max", "env"],
    [51, "freq shift", "freq", "gain", "dry-wet", ""],
    [52, "pseudo grain", "rate", "dlyratio", "feedback", "dry-wet"],
    [53, "resonator", "frequency", "cutoff", "feedback", "dry-wet"],
    [55, "harmonizer", "tonality", "interval", "octave", ""]
];


//effect number and names
var efflist = createEffList(effectsData);

//parameters names fo effects
var para = createEffPara(effectsData);

//maximum delay available loopers in seconds
//must be less or equal to csound gimaxDlyTime variable
var maxDlyTime = 120;

//bank and preset number
var bank = 0;
var preset = 0;

var pclowloopers = 100;//first looper PC
var loopersqty = 4;

var pclowfreezers = 105;//first freezer PC
var freezersqty = 3;

var pctaptempo = 127;//tap tempo PC

//output mixer
//id slider, id vumeter, name displayed, midi cc
var mixerdefs = [["mix_ma", "matrixoutv", "Matrix", 100],
                              ["mix_f1",  "freeze1outv", "Freeze1", 101],
                              ["mix_f2",  "freeze2outv", "Freeze2", 102],
                              ["mix_f3",  "freeze3outv", "Freeze3", 103],
                              ["mix_l1",  "loop1outv", "Loop1", 104],
                              ["mix_l2",  "loop2outv", "Loop2", 105],
                              ["mix_l3",  "loop3outv", "Loop3", 106],
                              ["mix_l4",  "loop4outv", "Loop4", 107]]


var leak = 0;//leak tails between programs
csoundApp.setControlChannel("leak", 0);

//--------------------------------------------------------------------------------------------------------------

function createEffList(effectsData){
    //create list with effect and instr number (-100)
    var effList = [];
    for (var idx = 0; idx < effectsData.length; idx++) {
        effList.push([effectsData[idx][0], effectsData[idx][1]]);
    }
    return effList;
}



function createEffPara(effectsData){
    //create list with effect parameters
    var effPara = [];//create space for 100 effects
    for (var idx = 0; idx < 100; idx++) {
        effPara.push(["", "", "", ""]);
    }
    for (var idxx = 0; idxx < effectsData.length; idxx++) {
        effPara[effectsData[idxx][0]] = [effectsData[idxx][2], effectsData[idxx][3], effectsData[idxx][4], effectsData[idxx][5]];
    }
    return effPara;
}



//current midi CC
var midiCcActual =[[-1, 0, 0, 0], [-1, 0, 0, 0],[-1, 0, 0, 0],[-1, 0, 0, 0]];

function setBank(id, value){
    bank = parseInt(value);
    csoundApp.setControlChannel("presetn", bank * 10 + preset);
    for ( var c = 0; c<=9; c++) {
         var iidd = "b" + c.toString();
         document.getElementById(iidd).style.background="#bbbbbb";
    }
    document.getElementById(id).style.background="#ff0000";
    document.getElementById("load").style.background="#ff0000";
}

function setPresN(id, value){
    preset = parseInt(value);
    csoundApp.setControlChannel("presetn", bank * 10 + preset);
    for ( var c = 0; c<=9; c++) {
         var iidd = "p" + c.toString();
         document.getElementById(iidd).style.background="#bbbbbb";
    }
    document.getElementById(id).style.background="#ff0000";
    document.getElementById("load").style.background="#ff0000";
}

function loader(id) {
    //start loading preset and update gui
    csoundApp.setControlChannel(id, 1.0);
    setTimeout(function(id) {
	updgui();
	csoundApp.setControlChannel(id, 0.0);
              document.getElementById(id).style.background = "#bbbbbb";
    }, 200, id)//delay of 200 ms necessary to allow javascript minimum time
}



function loaderMidi(message) {
    //start loading and update gui by midi
    var data = message.data;
    writeToMidiLog('log_in', data);
    //csoundApp.setControlChannel("testamidi", data[1]);
    var midipc = data[1];
    if (data[0] == 192 && data[1] < 100) {
        //Change effects program
        //csoundApp.setControlChannel("testamidi", data[1]);
        preset = midipc % 10;
        bank = (midipc - preset) / 10;
        csoundApp.setControlChannel("midib", preset);
        csoundApp.setControlChannel("midip", bank);
        //bank number
        var idb = "b" + bank.toString();
        setBank(idb, bank.toString());
        //preset number
        var idp = "p" + preset.toString();
        setPresN(idp, preset.toString());
        //activate loading
        csoundApp.setControlChannel("load", 1.0);
        //update gui and reset loading button
        setTimeout(function() {
	updgui();
	csoundApp.setControlChannel("load", 0.0);
              document.getElementById("load").style.background = "#bbbbbb";
        }, 200);//delay of 200 ms necessary to allow javascript minimum time
    } else if (data[0] == 192 && data[1] >= pclowloopers && data[1] < (pclowloopers + loopersqty)) {
        //Start-stop loopers
        var idloop = "looprec" + (data[1] - (pclowloopers - 1)).toString();
        loopPlayRec(idloop);
    } else if (data[0] == 192 && data[1] >= pclowfreezers && data[1] < (pclowfreezers + freezersqty)) {
        //Start-stop freezers
        var idfreez = "freez" + (data[1] - (pclowfreezers - 1)).toString();
        freezPlayRec(idfreez);
    } else if (data[0] == 192 && data[1] == pctaptempo){
        set_tap("tap");
    }
    if (data[0] == 176) {
        //setted CC
        for (var receivedcc = 0; receivedcc < midiCcActual.length; receivedcc++){
            if (data[1] == midiCcActual[receivedcc][1]){
                midiCCdispatch(receivedcc, data[2]);
            }
        }
        //mixer Cc
         for (var receivedcc = 0; receivedcc < mixerdefs.length; receivedcc++){
            if (data[1] == mixerdefs[receivedcc][3]){
                midiCCdispatchsimple(mixerdefs[receivedcc][0], data[2]);
            }
        }
    }
}


//midi control ----------------------------------------------------------------------------------------

// request MIDI access
if (navigator.requestMIDIAccess) {
    navigator.requestMIDIAccess({
        sysex: false
    }).then(onMIDISuccess, onMIDIFailure);
} else {
    alert("No MIDI");
}

// midi functions
function onMIDISuccess(midiAccess) {
    // success
    //console.log('MIDI Access Object', midiAccess);
    //writeToLog('log_in', midiAccess);
    //csoundApp.setControlChannel( "midiready", 1);
    var inputs = midiAccess.inputs.values();
    for (var input = inputs.next(); input && !input.done; input = inputs.next()) {
	//input.value.onmidimessage = onMIDIMessage;
	input.value.onmidimessage = loaderMidi;
    }
}

function onMIDIFailure(e) {
    // fail
    //console.log("No access to MIDI devices or no support " + e);
    //csoundApp.setControlChannel( "midiready", -1);
}



function writeToMidiLog(where, what) {
    //display messages to html
    document.getElementById(where).innerHTML = what;
}


//midi control  Gui----------------------------------------------------------------------------------------


//create a list of channels to be retrived by index for midi cc
var cc_cha_def =[];

function createCcChannelNumber(){
    //to be called at init gui
    //see instr 50 for channel sequence
    var cha__ = ["r0c_n_", "r1c_n_", "r2c_n_", "r3c_n_", "r4c_n_", "r5c_n_", "r6c_n_", "r7c_n_",// "eff_n_",
        "col_n_par1", "col_n_par2", "col_n_par3", "col_n_par4",  "pan_n_", "volmat_n_", "volume_n_"];
    var toappend = "";
    for(var col = 1; col<=7; col++){
        for(var i = 0; i < cha__.length; i++){
            toappend = cha__[i].replace("_n_", col.toString());
            cc_cha_def.push(toappend);
        }
    }
}

//runit
createCcChannelNumber();



function createGuiControllerCC(ccc){
    document.write('<select id="ccmidiC' + ccc + '" onchange="manageMidiCcSettings(id, ' + ccc + ', value)">');
    //must send value to csound to memorize and save in javascript for full control
    document.write('<option value="-1">off</option>');
    for(var i = 0; i< cc_cha_def.length; i++){
        document.write('<option value="' + i + '">' + cc_cha_def[i] + '</option>');
    }
    document.write('</select>parameter<br>');
    document.write('<input type="number" class="head" min=0 max=127 step="1" value=0 id="ccmidiV'+ ccc + '" onchange="manageMidiCcSettings(id, ' + ccc + ', value)">CC<br>');
    document.write('<input type="number" class="head" min=0 max=1 step="0.001" value=0 id="ccmidim'+ ccc + '" onchange="manageMidiCcSettings(id, ' + ccc + ', value)">min<br>');
    document.write('<input type="number" class="head" min=0 max=1 step="0.001" value=0 id="ccmidiM'+ ccc + '" onchange="manageMidiCcSettings(id, ' + ccc + ', value)">max<br>');
}


function manageMidiCcSettings(id, ccguin, value){
     // midi cc settings update
    //send to csound
    sliderDo(id, value);
    //update javascript midiCcActual[] for control after midi message
    var writeToJpar = 0;
    if (id.includes("ccmidiC")){
        writeToJpar = 0;
    } else if (id.includes("ccmidiV")){
        writeToJpar = 1;
    } else if (id.includes("ccmidim")){
        writeToJpar = 2;
    } else if (id.includes("ccmidiM")){
        writeToJpar = 3;
    }
    midiCcActual[ccguin-1][writeToJpar] = parseFloat(value);
}



function midiCCdispatch(midiCcGuiN, value){
    //send value to cc control channel
    var channel = cc_cha_def[midiCcActual[midiCcGuiN][0]];
    var low = midiCcActual[midiCcGuiN][2];
    var high = midiCcActual[midiCcGuiN][3];
    var val = 0.0;
    if (low < high) {
        val = low + (high- low) * value / 127.0;
    } else {
        val = low - (low - high) * value / 127.0;
    }
    //correct value if above 0 or 1
    if (val < 0) {
        val =0.0;
    } else if (val>1) {
         val = 1.0;
    }
    csoundApp.setControlChannel(channel, val);
    //update gui
    var el = document.getElementById(channel);
    el.value = val;
}

function midiCCdispatchsimple(id, value){
    //send value to cc control channel
    var val = value / 127.0;
    csoundApp.setControlChannel(id, val);
    //update gui
    var el = document.getElementById(id);
    el.value = val;
}


// GUI widgets ----------------------------------------------------------------------------------------

function sliderDo(id, value) {
/*to dispatch the value to the software 
    channel named after the slider id*/
    var numberValue = parseFloat(value);
    csoundApp.setControlChannel(id, numberValue);
}


function numberDoLimit(id, value, min, max) {
/*to dispatch the value to the software 
    channel named after the id, limited*/
    var mini = parseFloat(min);
    var maxi = parseFloat(max);
    var numberValue = parseFloat(value);
    if (numberValue < mini) {
        numberValue = mini;
        document.getElementById(id).value = numberValue.toString();
    } else if (numberValue > maxi) {
        numberValue = maxi;
        document.getElementById(id).value = numberValue.toString();
    }
    csoundApp.setControlChannel(id, numberValue);
}


function sliderUpdGUI(id, value, dest) {
/*to dispatch the value to the software 
channel named after the slider id*/
    var numberValue = parseFloat(value);
    var destid = String(dest);
    csoundApp.setControlChannel(id, numberValue);
    var el = document.getElementById(destid);
    //el.innerHTML = "BPM:" + value.toString();
    el.innerHTML = value.toString();
}




function checkDo(id) {
/*to dispatch the value to the software 
channel named after the checkbox id*/
  if (document.getElementById(id).checked) {
    csoundApp.setControlChannel(id, 1.0);
  } else {
    csoundApp.setControlChannel(id, 0.0);
  }
}




function activator(id) {
    csoundApp.setControlChannel(id, 1.0);
    setTimeout(function(id) {
	csoundApp.setControlChannel(id, 0.0);
    }, 50, id)//delay of 40 ms necessary to allow javascript minimum time
}



function delayLimit(id, value, idmode) {
/* when changing delay time*/
  var time = 0.0;
  var valin = parseFloat(value);
  var bpmel = document.getElementById("bpm");
  var bpm = parseFloat(bpmel.value);
  var ind = document.getElementById(idmode);
  var um = ind.options[ind.selectedIndex].value;
   //var um = ind.selectedIndex;
  //csoundApp.setControlChannel(id, valin);
  if (um =="1") {
    time = valin * 60 / bpm;
    while (time > maxDlyTime) {
        valin = valin - 1.0;
        time = valin * 60 / bpm;
        document.getElementById(id).value = valin.toString();
    }
  } else {
    if (valin > maxDlyTime) {
        valin = maxDlyTime;
        document.getElementById(id).value = valin.toString();
    }
    time = valin;
  }
    csoundApp.setControlChannel(id, 1.0 * time);
   //csoundApp.setControlChannel(id, valin);
}



function loopPlayRec(id) {
 /* loopers activation csound only  updates
called by button press */
              activator(id);
}



function recButUpdateT(num) {
/* loopers activation gui only  updates 
called by global timer*/
        var id =  "looprec" + num.toString();
        var el = document.getElementById(id);
        var ch = "recstatus" + num.toString();
        var fromcha = csoundApp.getControlChannel(ch);
        if (fromcha == 1 && el.value == "Play") {
		el.value = "Rec";
		el.style.background="#ff0000";
         } else if (fromcha == 0 && el.value == "Rec") {
		el.value = "Play";
		el.style.background="#bbbbbb";
                            //time value update
                            var tch = "ol_ti" + num.toString();
                            var tfromch = csoundApp.getControlChannel(tch);
                            var te = document.getElementById(tch);
                            te.value = tfromch.toString();                          
         }
}




function freezPlayRec(id)  {
              var el = document.getElementById(id);
	if (el.value == "Freez") {
		el.value = "Freezed";
		el.style.background="#ff0000";
                            csoundApp.setControlChannel(id, 1.0);

	} else {
		el.value = "Freez";
		el.style.background="#bbbbbb";
                           csoundApp.setControlChannel(id, 0.0);
	}
}



function loopMuter(id) {
	var el = document.getElementById(id);
	if (el.value == "Kill") {
		el.value = "Dead";
		el.style.background="#ff0000";
	} else {
		el.value = "Kill";
		el.style.background="#bbbbbb";
	}
	activator(id);
}


function channelSetter(channel) {
	//retrieve value of a channel and set corresponding widget
	var fromcha = csoundApp.getControlChannel(channel);
	var el = document.getElementById(channel);
	el.value = fromcha;
}


function updgui() {
    /*read channels to update gui*/
    var channel = "";
    var num =7;
    for (col =1; col <= num; col++) {
        //matrix
        for (vsl =0; vsl <= num; vsl++) {
              channel = "r"+ vsl.toString() + "c" + col.toString();
	channelSetter(channel);
        }
        //effect
        channel = "eff" + col.toString();
        channelSetter(channel);
        effChange(channel);//to update parameters name indication
        //parameters
        for (par =1; par <= 4; par++) {
            channel = "col" + col.toString() + "par" + par.toString();1
            channelSetter(channel);
        }
        //pan
        channel = "pan" + col.toString();
        channelSetter(channel);
        //volumes
        channel = "volmat" + col.toString();
        channelSetter(channel);
        channel = "volume" + col.toString();
        channelSetter(channel);
     }
     //update midi cc
    var fromcha = 0;
    var el;
    for(var micc =1; micc<=4; micc++){
        //retrive values from csound
        //update gui
        // update array with current cc definition (midiCcActual)
        channel = "ccmidiC" + micc.toString();
        fromcha = csoundApp.getControlChannel(channel);
        el = document.getElementById(channel);
        el.value = fromcha;
        midiCcActual[micc-1][0] = fromcha;

        channel = "ccmidiV" + micc.toString();
        fromcha = csoundApp.getControlChannel(channel);
        el = document.getElementById(channel);
        el.value = fromcha;
        midiCcActual[micc-1][1] = fromcha;

        channel = "ccmidim" + micc.toString();
        fromcha = csoundApp.getControlChannel(channel);
        el = document.getElementById(channel);
        el.value = fromcha;
        midiCcActual[micc-1][2] = fromcha;

        channel = "ccmidiM" + micc.toString();
        fromcha = csoundApp.getControlChannel(channel);
        el = document.getElementById(channel);
        el.value = fromcha;
        midiCcActual[micc-1][3] = fromcha;

    }
}




function selectDo(id) {
    var e = document.getElementById(id);
    var strUser = e.options[e.selectedIndex].value;
    var numberValue = parseFloat(strUser);
    csoundApp.setControlChannel(id, numberValue);
}



function selectDoTime(id) {
    //send date in millis
    var date = Math.floor(Date.now() /1000);
    csoundApp.setControlChannel("current_time", date);
    // then send selection
    selectDo(id);
}

function selectReAm(id, cha) {
    var e = document.getElementById(id);
    var strUser = e.options[e.selectedIndex].value;
    var numberValue = parseFloat(strUser);
    csoundApp.setControlChannel(id, numberValue);
    //update slider Rep
    var chan = "ol_re" + cha;
    if (numberValue == 0) {
        csoundApp.setControlChannel(chan, 1.0);
    } else {
        csoundApp.setControlChannel(chan, 0.0);
    }

}




function updateOnBpm(idvalue, idmode, bpm) {
/*valuta update on bpm change
calle by changeBpm*/
  var ind = document.getElementById(idmode);
  var um = ind.options[ind.selectedIndex].value;
  var indv = document.getElementById(idvalue);
  var indvv  = indv.value;
  if (um =="1") {
    var steps_ind = parseFloat(indvv);
    var time_ind = steps_ind * 60 / bpm;
    while (time_ind > maxDlyTime) {
        steps_ind = steps_ind - 1.0;
        time_ind = steps_ind * 60 / bpm;
    }
  csoundApp.setControlChannel(idvalue, time_ind);
  indv.value = steps_ind.toString();
  }
}



function changeBpm(id, value) {
/* things  to do when bpm change*/
  var bpm = parseFloat(value);
  if (bpm < 10.0) { bpm = 10.0;}//Low limiting
  if (bpm > 1000.0) { bpm = 1000.0;}//high limiting
  var el = document.getElementById(id);

  bpm = Number(Math.round(bpm+'e'+4)+'e-'+4);
   el.value = bpm.toFixed(3);
  csoundApp.setControlChannel(id, bpm);
  //delay value update
  //updateOnBpm("il_ti", "intimeum", bpm);//no more
  updateOnBpm("ol_ti1", "outtimeum1", bpm);
  updateOnBpm("ol_ti2", "outtimeum2", bpm);
  updateOnBpm("ol_ti2", "outtimeum3", bpm);
  updateOnBpm("ol_ti2", "outtimeum4", bpm);
}




function changeDlyUm(idmode, um, idvalue) {
/* when changing delay unit of measure*/
  var bpmel = document.getElementById("bpm");
  var bpm = parseFloat(bpmel.value);
  var valuel = document.getElementById(idvalue);
  var valu = parseFloat(valuel.value);
  var out = 0;
  if (um =="1") {
      out = valu * bpm / 60;
   } else {
      //convert  beata to seconds
      out = valu * 60 / bpm;
   }
   var vround = Number(Math.round(out+'e'+4)+'e-'+4);
   valuel.value = vround.toFixed(3);
}



function changeDlyMode(id, value) {
  var numberValue = parseFloat(value);
  csoundApp.setControlChannel(id, numberValue);
}

function changeDlyInput(id, value)  {
  var numberValue = parseFloat(value);
  csoundApp.setControlChannel(id, numberValue);
}


function doAndLimit(id, value, limit) {
    var numberValue = parseFloat(value);
    var limitValue  = parseFloat(limit);
    var el = document.getElementById(id);
     if (numberValue > limitValue) {
         numberValue = limitValue;
         el.value = numberValue.toString();
     }
    csoundApp.setControlChannel(id, numberValue);
}


function effChange(id) {
    /*send the effect number and update gui*/
    var e = document.getElementById(id);
    var strUser = e.options[e.selectedIndex].value;
    var numberValue = parseFloat(strUser);
    csoundApp.setControlChannel(id, numberValue);
    // update params - ref to global list para
    var ch = id.substr(3);
    var  indexx  = parseInt(strUser);
    document.getElementById("spc"+ ch +"p1").textContent  = para[indexx][0];
    document.getElementById("spc"+ ch +"p2").textContent  = para[indexx][1];
    document.getElementById("spc"+ ch +"p3").textContent  = para[indexx][2];
    document.getElementById("spc"+ ch +"p4").textContent  = para[indexx][3];
}


function panic(id) {
	//set preset to 0, load updategui
	//id="presetn"
	var pres = document.getElementById("presetn");
	pres.value = 0;
	csoundApp.setControlChannel("presetn", 0);
	//id="load"
	activator("load");
}


function toggler(id1, id2, id3) {
    /*toggle divs views*/
    var e1 = document.getElementById(id1);
    var e2 = document.getElementById(id2);
    var e3 = document.getElementById(id3);
    e1.style.display = 'block';
    e2.style.display = 'none';
    e3.style.display = 'none';
}




function loada() {
    /*initialize views*/
    var emat = document.getElementById('matrix');
    emat.style.display = 'block';
    var elop = document.getElementById('loopers');
    elop.style.display = 'none';
    var elom = document.getElementById('midiw');
    elom.style.display = 'none';
}



function set_tap(id) {
    /* tap tempo*/
    csoundApp.setControlChannel(id, 1);
    setTimeout(function() {
	var bppmm = csoundApp.getControlChannel("bpm");
              bppmm = Number(Math.round(bppmm+'e'+4)+'e-'+4);
              document.getElementById("bpm").value = bppmm.toFixed(3);
              //document.getElementById("bpm").value = bppmm.toString();
    }, 200)//delay of 200 ms necessary to allow javascript minimum time
}




// Global timer to update gui
var myVar = setInterval(myTimed, 500);

//Function to be performed by Global timer
function myTimed() {
    // update looper button aspect
    for (nnn =1; nnn <= 4; nnn++) {
         recButUpdateT(nnn);
    }
    // update vumeter
    vuMeter("totaloutv");
    vuMeter("matrixoutv");
    vuMeter("freeze1outv");
    vuMeter("freeze2outv");
    vuMeter("freeze3outv");
    vuMeter("loop1outv");
    vuMeter("loop2outv");
    vuMeter("loop3outv");
    vuMeter("loop4outv");
     // update thresholds
    updThr("autothr1");
    updThr("autothr2");
    updThr("autothr3");
    updThr("autothr4");
    //repeat change
    updThr("ol_re1");
    updThr("ol_re2");
    updThr("ol_re3");
    updThr("ol_re4");
    //number of active chains
    updChIndicator();
}


function vuMeter(id) {
    var matvol = csoundApp.getControlChannel(id);
    var matvolvu = document.getElementById(id);
    if (matvol > 0.99) {
        matvolvu.style.color = "#CC0000";
    } else if (matvol > 0.7) {
        matvolvu.style.color = "#FFA500";
    } else {
        matvolvu.style.color = "#00CC00";
    }
}


function updThr(id) {
    //autothr%d //
    var thrV = csoundApp.getControlChannel(id);
    var thrE = document.getElementById(id);
    thrE.value = thrV;
}


function updChIndicator() {
    //update number of chains
    var val = csoundApp.getControlChannel("upch");
    document.getElementById("upch").innerHTML = val;

}



window.onload = function(){loada();};

//Channel initializations
//csoundApp.setControlChannel('bpm', 60.0);


</script>
</head>

<body>
<div class ="header">
<input type="number" class="head" min=20 max=400 step="any" value=60 id="bpm" onchange="changeBpm(id, value)">
<input type="button" class="bpm" value="BpM" id="tap" onclick="set_tap(id)">
<input type="number" class="head" min=0 max=20 step="any" value=0 id="tailtime" onchange="numberDoLimit(id, value, 0, 20)">
<label>Tail:</label><label id="upch">0</label>

<input type="button" class='viuw' value="matrix" id="matr" onclick="toggler('matrix', 'loopers', 'midiw')">
<input type="button" class='viuw' value="midi" id="miid" onclick="toggler('midiw', 'loopers', 'matrix')">
<input type="button" class='viuw' value="looper" id="looo" onclick="toggler('loopers', 'matrix', 'midiw')">

<select id="record" onchange="selectDoTime(id)">
                                      <option value="0">mixing</option>
                                      <option value="1">recording</option>
</select>


<input type="button" value="Save" id="save" onclick="activator(id)">
<input type="button" value="Load" id="load" onclick="loader(id)">

<input type="button" class="preset" id="b0" value="0" onclick="setBank(id, value)">
<input type="button" class="preset" id="b1" value="1" onclick="setBank(id, value)">
<input type="button" class="preset" id="b2" value="2" onclick="setBank(id, value)">
<input type="button" class="preset" id="b3" value="3" onclick="setBank(id, value)">
<input type="button" class="preset" id="b4" value="4" onclick="setBank(id, value)">
<input type="button" class="preset" id="b5" value="5" onclick="setBank(id, value)">
<input type="button" class="preset" id="b6" value="6" onclick="setBank(id, value)">
<input type="button" class="preset" id="b7" value="7" onclick="setBank(id, value)">
<input type="button" class="preset" id="b8" value="8" onclick="setBank(id, value)">
<input type="button" class="preset" id="b9" value="9" onclick="setBank(id, value)">


<input type="button" class="preset" id="p0" value="0" onclick="setPresN(id, value)">
<input type="button" class="preset" id="p1" value="1" onclick="setPresN(id, value)">
<input type="button" class="preset" id="p2" value="2" onclick="setPresN(id, value)">
<input type="button" class="preset" id="p3" value="3" onclick="setPresN(id, value)">
<input type="button" class="preset" id="p4" value="4" onclick="setPresN(id, value)">
<input type="button" class="preset" id="p5" value="5" onclick="setPresN(id, value)">
<input type="button" class="preset" id="p6" value="6" onclick="setPresN(id, value)">
<input type="button" class="preset" id="p7" value="7" onclick="setPresN(id, value)">
<input type="button" class="preset" id="p8" value="8" onclick="setPresN(id, value)">
<input type="button" class="preset" id="p9" value="9" onclick="setPresN(id, value)">
</div>

<script>
//generate mixer gui
document.write('<div id="matrix" class="mixer">');
var num =7;
for (div =1; div <= num; div++) {
    //document.write('<h1>' + div+'</h1>');
    document.write('channel '+div+'<br>');
    for (vsl =0; vsl <= num; vsl++) {
        //mixer sliders
        document.write(vsl+
            '<input type="range" class="vertical" min=0 max=1 value=0 step=0.001 id="r'+
            vsl + 'c' + div +
            '" oninput="sliderDo(id, value)"><br>');
    }
    //effect selector refer to global list efflist
    document.write('<select id="eff'+div+'"onchange="effChange(id)">');
    for (var eff =0; eff < efflist.length; eff++) {
        document.write('<option value="' + efflist[eff][0] +'">' + efflist[eff][1] + ' </option>');
    }
    document.write('</select><br>');
    //parameters
    document.write('<span id="spc'+div+'p1"></span><br>'+
                                      '<input type="range" min=0 max=1 value=0 step=0.001 id="col'+
                                      div + 'par' + 1 +
                                      '" oninput="sliderDo(id, value)"><br>');
    document.write('<span id="spc'+div+'p2"></span><br>'+
                                      '<input type="range" min=0 max=1 value=0 step=0.001 id="col'+
                                      div + 'par' + 2 +
                                      '" oninput="sliderDo(id, value)"><br>');
    document.write('<span id="spc'+div+'p3"></span><br>'+
                                      '<input type="range" min=0 max=1 value=0 step=0.001 id="col'+
                                      div + 'par' + 3 +
                                      '" oninput="sliderDo(id, value)"><br>');
    document.write('<span id="spc'+div+'p4"></span><br>'+
                                      '<input type="range" min=0 max=1 value=0 step=0.001 id="col'+
                                      div + 'par' + 4 +
                                      '" oninput="sliderDo(id, value)"><br>');

    //pan
    document.write('pan<br>'+
        '<input type="range" min=0 max=1 value=0.5 step=0.001 id="pan'+
        div +
        '" oninput="sliderDo(id, value)"><br>');
    //volume
    document.write('volume<br>'+
        'm<input type="range" class="vertical" min=0 max=1 value=0.5 step=0.001 id="volmat'+
        div +
        '" oninput="sliderDo(id, value)">'+
        '<input type="range" class="vertical" min=0 max=1 value=0 step=0.001 id="volume'+
        div +
        '" oninput="sliderDo(id, value)">o<br>');
    //close column
    //document.write("</div>");
}
document.write("</div>");
</script>



<div id="midiw">
<br><br>
CC assignable to matrix <br>
<div id="midiww">
<script>
createGuiControllerCC(1);
createGuiControllerCC(2);
createGuiControllerCC(3);
createGuiControllerCC(4);
</script>
</div>
<br><br>
fixed midi mapping<br>
PC 0 - 99 : matrix preset 0 to 99<br>
PC <script>document.write(pclowloopers + " - " + (pclowloopers + loopersqty -1));</script> : start/stop loopers<br>
PC <script>document.write(pclowfreezers + " - " + (pclowfreezers + freezersqty -1));</script> : start/stop freezers<br>
PC <script>document.write(pctaptempo);</script> : tap tempo<br>
<br><br>
Output mixer<br>
<script>
for (var fixcc = 0; fixcc < mixerdefs.length; fixcc++){
    document.write('CC '+ mixerdefs[fixcc][3] + ' : ' + mixerdefs[fixcc][2] + '<br>');
}
</script>
<br><br>
Incoming midi messagess:
<div id="log_in">log here</div>
</div>




<div id="loopers">
<br>
<script>
for (lop =1; lop <= loopersqty; lop++) {

    document.write('<div class="timew">');
    document.write('<h1>L<br>o<br>o<br>p<br>' + lop + '</h1>');
    document.write('</div>');

    document.write('<div class="loopthr">');
    document.write('<select id="autothrmode' + lop + '" onchange="changeDlyMode(id, value)">');
    document.write('                                      <option value="0">OFF</option>');
    document.write('                                      <option value="1" selected>man</option>');
    document.write('                                      <option value="2">autoend</option>');
    document.write('                                      <option value="3">thrStart</option>');
    document.write('                                      <option value="4">thrStartautoend</option>');
    document.write('</select><br>');
    document.write('Thr  <input type="range" class="vertical2" min=0 max=1 value=1 step=0.001 id="autothr' +lop+ '" oninput="sliderDo(id, value)"><br>');
    document.write('</div>');

    document.write('<div class="time">');
    document.write('<input type="button" class= "footdh" value="Play" id="looprec' + lop + '" onclick="loopPlayRec(id)">');
    document.write('<input type="button" class= "foothw" value="P 0" id="resetp' + lop+ '" onclick="activator(id)">');
    document.write('<input type="button" class= "foothw" value="Kill" id="mute' + lop+ '" onclick="loopMuter(id)">');
    //matrix input
    document.write('<select id="looperInput' + lop + '" onchange="changeDlyInput(id, value)">');//function to be written
    document.write('                                      <option value="0">from matrix</option>');
    for (lopc =1; lopc < lop; lopc++) {
        document.write('                                      <option value="'+ lopc + '">from loop' + lopc +'</option>');
    }
    document.write('                                      <option value="5">direct in</option>');
    document.write('</select><br>');
    document.write('</div>');

    document.write('<div class="time">');
    document.write('<select id="outtimeum' + lop + '" class= "foot"' + lop+ '"  onchange="changeDlyUm(id, value' + ",'ol_ti" + lop + "')" + '">');
    document.write('                                      <option value="0">sec</option>');
    document.write('                                      <option value="1">beat</option>');
    document.write('</select><br>');
    document.write('<input type="number" class="foot" min=0 max=60 value=1.000 step=0.001 id="ol_ti' + lop + '" onchange="delayLimit(id, value' + ", 'outtimeum" + lop + "')"+ '">');
    document.write('<select class= "foot" id="speedloop'+lop+'" onchange="selectDo(id)">');
    document.write('                                      <option value="0.25">1/4</option>');
    document.write('                                      <option value="0.3333333333">1/3</option>');
    document.write('                                      <option value="0.5">1/2</option>');
    document.write('                                      <option value="1" selected>1</option>');
    document.write('                                      <option value="2">2</option>');
    document.write('                                      <option value="3">3</option>');
    document.write('                                      <option value="-0.25">-1/4</option>');
    document.write('                                      <option value="-0.3333333333">-1/3</option>');
    document.write('                                      <option value="-0.5">-1/2</option>');
    document.write('                                      <option value="-1">-1</option>');
    document.write('                                      <option value="-2">-2</option>');
    document.write('                                      <option value="-3">-3</option>');
    document.write('</select><br>');
    document.write('</div>');

    document.write('<div class="time">');
    document.write('<select id="repamp'+lop+'" class= "foot" onchange="selectReAm(id, ' + lop + ')">');
    document.write('                                      <option value="0" selected>reduce</option>');
    document.write('                                      <option value="1">amplify</option>');
    document.write('</select>');
    document.write('In  <input type="range" class="vertical2" min=0 max=1 value=0 step=0.001 id="ol_in' +lop+ '" oninput="sliderDo(id, value)">');
    document.write('  Rep  <input type="range" class="vertical2" min=0 max=1 value=1 step=0.001 id="ol_re' +lop+ '" oninput="sliderDo(id, value)">');
    document.write('</div><div class="time">');
    document.write('<select id="modshape'+lop+'" class= "foothalf" onchange="selectDo(id)">');
    document.write('                                      <option value="0" selected>off</option>');
    document.write('                                      <option value="1">sin</option>');
    document.write('                                      <option value="2">tri</option>');
    document.write('                                      <option value="3">squ</option>');
    document.write('</select>');
    document.write('<select id="modpolar'+lop+'" class= "foothalf" onchange="selectDo(id)">');
    document.write('                                      <option value="1" selected>pos</option>');
    document.write('                                      <option value="2">bi</option>');
    document.write('                                      <option value="3">neg</option>');
    document.write('</select>');
    document.write('<br>');
    document.write('Amp  <input type="range" class="vertical2" min=0 max=1 value=0 step=0.001 id="ol_ma' +lop+ '" oninput="sliderDo(id, value)">');
    document.write('Fre  <input type="range" class="vertical2" min=0 max=1 value=0 step=0.001 id="ol_mf' +lop+ '" oninput="sliderDo(id, value)">');
    document.write('Off  <input type="range" class="vertical2" min=0 max=1 value=0 step=0.001 id="ol_mo' +lop+ '" oninput="sliderDo(id, value)">');
    document.write("</div>");



     document.write('<div  style="float:left;width:9%;font-size:0.6em;">');
     document.write("to<br>matrix<br>");
    document.write('<input type="range" class="vertical2" min=0 max=1 value=0 step=0.001 id="loop_in_ma' +lop+ '" oninput="sliderDo(id, value)">');
     document.write('</div>');

    document.write('<div style="clear:both;"></div>');
    document.write('<br>');
}

</script>

<div style="clear:both;"></div>
<br>
<div class="timew">
    <br><br>
    <h1>Freez</h1>
</div>
<div style="width:12%;float:left;">
    <br><br>
    <select id="freezinput" onchange="changeDlyInput(id, value)">
        <option value="0">matrix</option>
        <option value="1">loop1</option>
        <option value="2">loop2</option>
        <option value="3">loop3</option>
        <option value="4">loop4</option>
        <option value="5">direct in</option>
     </select>
    <br>
    Rise time   <input type="range" class="vertical2" min=0 max=1 value=0.5 step=0.001 id="freezRise" oninput="sliderDo(id, value)">
</div>
<script>
for (var frezz = 1; frezz <= freezersqty; frezz++) {
    document.write('<div style="width:27%;float:left;">');
    //document.write('<div class="time"><h1>' + frezz + '</h1>');
         document.write('<div style="width:80%;float:left;">');
            document.write('<h1>' + frezz + '</h1>');
            document.write('<input type="button" class= "footdh" value="Freez" id="freez' + 
            frezz + '" onclick="freezPlayRec(id)">');
         document.write('</div>');
         document.write('<div  style="float:left;width:9%;font-size:0.6em;padding:5%;">');
             document.write("to<br>matrix<br>");
             document.write('<input type="range" class="vertical2" min=0 max=1 value=0 step=0.001 id="freez_in_ma' + frezz + '" oninput="sliderDo(id, value)">');
         document.write('</div>');
     document.write('</div>');
}
</script>


<div style="clear:both;"></div>
<br>

<div>
<h1 id="totaloutv">Mixer</h1>
<div class="mixeritem">
    <input type="range" class="vertical2" min=0 max=1 value=0 step=0.001 id="mix_in" oninput="sliderDo(id, value)"><br>Direct
</div>

<script>
//output mixer
for (var mixcount = 0; mixcount < mixerdefs.length; mixcount++) {
    document.write('<div class="mixeritem">'+ 
        '<input type="range" class="vertical2" min=0 max=1 value=0.5 step=0.001 id="'+
         mixerdefs[mixcount][0] + 
         '" oninput="sliderDo(id, value)"><br><span id="' + 
        mixerdefs[mixcount][1] + '">' + mixerdefs[mixcount][2] + '</span></div>');
}
</script>

</div>


</body>
</html>

</CsHtml5>
<CsInstruments>
sr = 48000
ksmps = 256;increased from 64 and 128
nchnls_i = 1
nchnls  = 2
0dbfs = 1

;Current directory see options
gScurDir init "$GSCURDIR"
;UDOS see options
; since 6.11 need complete path
#include "AtanLimit.txt"
#include "BrandtseggComp.txt"
#include "CosSinMix.txt"
#include "DelaySampl.txt"
#include "PitchShifter_aak.txt"
#include "PitchShifter_akk.txt"
#include "looper.txt"
;MACROS see options
#include "macros.txt"



;matrix audio arrays
ga_in[][] init 5,8
ga_out[][] init 5,8


;outputs for direct, matrix, looper1, looper2 in instr 1004
gaoutMix[] init 12 + 3

gimaxDlyTime = 120
giport = 0.07
gkbpm init 60


;table to store gui values
giptab1 ftgen 5, 0, 128, -2, 0
giptab2 ftgen 6, 0, 128, -2, 0
giptab3 ftgen 7, 0, 128, -2, 0
giptab4 ftgen 8, 0, 128, -2, 0
giptab5 ftgen 9, 0, 128, -2, 0

;preset0 = mute matrix
giempty ftgen 10, 0, 128, -2, 0
;tables from 11 to 137 are user by presets

giSine ftgen 138, 0, 8192, 10, 1
giTriangle ftgen 139, 0, 8192, 7, 0, 2048, 1, 4096, -1, 2048, 0
giSquare ftgen 140, 0, 8192, 7, 0, 1, 1, 4095, 1, 1, -1, 4094, -1, 1, 0



gihalfsine ftgen	149, 0, 4097, 9, 0.5, 1, 0
gigrainenv ftgen 150, 0, 4096, 7, 0, 4096/2, 1, 4096/2, 0 


;Global parameter values for pvsanal
gifftsize  = 1024;larger value higher precision
gioverlap  = gifftsize / 4;smaller value higher precision
giwinsize  = gifftsize;larger value higher precision higher latency, at least gifftsize
giwinshape = 1;von-Hann window



instr  1
chnset 0, "tailtime"
gktailtime chnget "tailtime"

;tap tempo
chnset 60, "bpm"
gkbpm chnget "bpm"
chnset 0, "tap"
ktap chnget "tap"
ktime times
klasttap init 0
if ktap == 1 then
     ; stuff here
     if (ktime - klasttap) < 3 then 
         gkbpm = 60 / (ktime - klasttap)
         chnset gkbpm, "bpm"
     endif
     klasttap = ktime
     chnset k(0), "tap"
endif


;Recorder
krec chnget "record"
if changed(krec) == 1 && krec==1 then
  kcurrent_time chnget "current_time"
  event "i", 2010, 0, -1, kcurrent_time
elseif changed(krec) == 1 && krec==0 then
  event "i", -2010, 0, -1
endif

chnset 0, "load"
chnset 0, "save"
chnset 0, "presetn"
kload chnget "load"
ksave chnget "save"
kpreset chnget "presetn" 

kchain init 0
gkchainleak init 1
if kload == 1 && changed(kload)== 1 then
	event "i", -10 - 0.1 - 0.1 * kchain, 0, -1, kpreset, kchain
	event "i", -50 - 0.1 - 0.1 * kchain, 0, -1, kpreset, kchain
	event "i", -1000 - 0.1 - 0.1 * kchain + 0.1, 0, -1, kpreset, kchain, gktailtime
              ;advance audio cannels p5
	kchain = (kchain + 1) % 5
              gkchainleak = (kchain + 1) % 5
              ;start new programs
	event "i", 10 + 0.1 + 0.1 * kchain, 0, -1, kpreset, kchain
	event "i", 50 + 0.1 + 0.1 * kchain, 0, -1, kpreset, kchain
	event "i", 1000 + 0.1 + 0.1 * kchain, 0, -1, kpreset, kchain, gktailtime
endif

if (ksave == 1) && (changed(ksave)== 1) && (kpreset > 0) then
    event "i", 60, 0, -1, kpreset, kchain
endif


;clean direct to out mixer,
;maybe not needed 
;since instr 90 is always overwriting new data
gaoutMix[0] = 0
gaoutMix[1] = 0
;clean matrix audio output to out mixer
gaoutMix[2] = 0
gaoutMix[3] = 0
;clean Loop1 audio output to out mixer
gaoutMix[4] = 0
gaoutMix[5] = 0
;clean Loop2 audio output to out mixer
gaoutMix[6] = 0
gaoutMix[7] = 0
;clean Loop3 audio output to out mixer
gaoutMix[8] = 0
gaoutMix[9] = 0
;clean Loop3 audio output to out mixer
gaoutMix[10] = 0
gaoutMix[11] = 0
;prepare dac/recorder outputs
galtot = 0
gartot = 0

;initialize leakage, see instr 90 and 1000 
galeak init 0

;init instr
event_i "i", 10.1, 0, -1, 0, 0
event_i "i", 50.1, 0, -1, 0, 0
event_i "i", 52, 0, -1
;event_i "i", 1000.1, 0, -1, 0, 0
event_i "i", 90, 0, -1, 0, 0;fixed
event_i "i", 1001, 0, -1
event_i "i", 1100, 0, -1
event_i "i", 2000, 0, -1, 0, 0

endin





instr 10;read channels
kcol = 1
krow = 0
kindx   = 0

while kcol <= 7 do

  ;read Matrix mixer
  krow = 0
  while krow <= 7 do
    Smm sprintfk "r%dc%d", krow, kcol
    kval chnget Smm
    tablew kval, kindx, 5 + p5
    kindx = kindx + 1
    krow = krow + 1
  od

  ;effetto
  Seff sprintfk "eff%d", kcol
  keff chnget Seff
  tablew keff, kindx, 5 + p5
  kindx = kindx + 1
  ;qui codice cambio effetto di effselect

  ;parametri
  kpar = 1
  while kpar <= 4 do
    Spar sprintfk "col%dpar%d", kcol, kpar
    kvpar chnget Spar
    tablew kvpar, kindx, 5 + p5
    kindx = kindx + 1
    kpar = kpar + 1
  od

  ;pan
  Span sprintfk "pan%d", kcol
  kpan chnget Span
  tablew kpan, kindx, 5 + p5
  kindx = kindx + 1

  ;volumi
  Smat sprintfk "volmat%d", kcol
  kmat chnget Smat
  tablew kmat, kindx, 5 + p5
  kindx = kindx + 1

  Svol sprintfk "volume%d", kcol
  kvol chnget Svol
  tablew kvol, kindx, 5 + p5
  kindx = kindx + 1

  ;fine
  krow = 0
  kcol = kcol + 1
  ;printk2 kindx
od


;MIDI CC CONTROLLERS TO SAVE IN TABLE
kccidx = 1
while kccidx <= 4 do
    SccmidiC sprintfk "ccmidiC%d", kccidx
    kccmidiC chnget SccmidiC
    tablew kccmidiC, kindx, 5 + p5
    kindx = kindx + 1
    ;
    SccmidiV sprintfk "ccmidiV%d", kccidx
    kccmidiV chnget SccmidiV
    tablew kccmidiV, kindx, 5 + p5
    kindx = kindx + 1
    ;
    Sccmidim sprintfk "ccmidim%d", kccidx
    kccmidim chnget Sccmidim
    tablew kccmidim, kindx, 5 + p5
    kindx = kindx + 1
    ;
    SccmidiM sprintfk "ccmidiM%d", kccidx
    kccmidiM chnget SccmidiM
    tablew kccmidiM, kindx, 5 + p5
    kindx = kindx + 1
    ;
    kccidx = kccidx + 1
od

endin






instr 50;load
;print p1, p4
tableicopy p5+5, 10 + p4; destination, source
;update channels for gui
icol = 1
irow = 0
indx   = 0

while icol <= 7 do

  ;read Matrix mixer
  irow = 0
  while irow <= 7 do
    Smm sprintf "r%dc%d", irow, icol
    ival tab_i indx, 5 + p5
    chnset ival, Smm
    indx = indx + 1
    irow = irow + 1
  od

  ;effetto
  Seff sprintf "eff%d", icol
  ieff tab_i indx, 5 + p5
  chnset ieff, Seff
  indx = indx + 1

  ;parametri
  ipar = 1
  while ipar <= 4 do
    Spar sprintf "col%dpar%d", icol, ipar
    ivpar  tab_i indx,  5 + p5
    chnset ivpar, Spar
    indx = indx + 1
    ipar = ipar + 1
  od

  ;pan
  Span sprintf "pan%d", icol
  ipan tab_i indx, 5 + p5
  chnset ipan, Span
  indx = indx + 1

  ;volumi
  Smat sprintf "volmat%d", icol
  imat  tab_i indx, 5 + p5
  chnset imat, Smat
  indx = indx + 1

  Svol sprintf "volume%d", icol
  ivol tab_i indx, 5 + p5
  chnset ivol, Svol
  indx = indx + 1

  ;fine
  irow = 0
  icol = icol + 1
od
;next availble memory location
print indx



;MIDI CC CONTROLLERS TO SAVE IN TABLE
iccidx = 1
while iccidx <= 4 do
    SccmidiC sprintf "ccmidiC%d", iccidx
    iccmidiC tab_i indx, 5 + p5
    chnset iccmidiC, SccmidiC
    indx = indx + 1
    ;
    SccmidiV sprintf "ccmidiV%d", iccidx
    iccmidiV tab_i indx, 5 + p5
    chnset iccmidiV, SccmidiV
    indx = indx + 1
    ;
    Sccmidim sprintf "ccmidim%d", iccidx
    iccmidim tab_i indx, 5 + p5
    chnset iccmidim, Sccmidim
    indx = indx + 1
    ;
    SccmidiM sprintf "ccmidiM%d", iccidx
    iccmidiM tab_i indx, 5 + p5
    chnset iccmidiM, SccmidiM
    indx = indx + 1
    ;
    iccidx = iccidx + 1
od


$EFFSELECT(1)
$EFFSELECT(2)
$EFFSELECT(3)
$EFFSELECT(4)
$EFFSELECT(5)
$EFFSELECT(6)
$EFFSELECT(7)
;turnoff
;extend to kill running effects
xtratim 0.02
krel release
;printk2 krel
if krel ==1 && changed(krel) ==1 then
    event "i", -1 * kinprev1, giport, -1, 1, p5  
    event "i", -1 * kinprev2, giport, -1, 2, p5  
    event "i", -1 * kinprev3, giport, -1, 3, p5  
    event "i", -1 * kinprev4, giport, -1, 4, p5  
    event "i", -1 * kinprev5, giport, -1, 5, p5  
    event "i", -1 * kinprev6, giport, -1, 6, p5  
    event "i", -1 * kinprev7, giport, -1, 7, p5  
endif
endin



instr 52;load presets at startup
indx  = 1
while indx < 91 do
  giiiift ftgen 10 + indx, 0, 128, -2, 0
  Sfile sprintf "save/matprocSave%d.txt", indx
  Saddress strcat gScurDir,  Sfile
  ftload Saddress, 1, 10 + indx
  indx = indx + 1
od
turnoff
endin


instr 60;save
;print p1, p4
Sfile sprintf "save/matprocSave%d.txt", p4
Saddress strcat gScurDir,  Sfile
tableicopy 10 + p4, 5 + p5; destination, source
ftsave Saddress, 1, 10 + p4
turnoff
endin




instr 90; audio input
galoop_in_ma init 0
ain inch 1
;write to array
ga_in[0][0] = ain + galoop_in_ma
ga_in[1][0] = ain + galoop_in_ma
ga_in[2][0] = ain + galoop_in_ma
ga_in[3][0] = ain + galoop_in_ma
ga_in[4][0] = ain + galoop_in_ma
ga_in[5][0] = ain + galoop_in_ma
ga_in[6][0] = ain + galoop_in_ma
ga_in[7][0] = ain + galoop_in_ma
;write to output mixer
gaoutMix[0] = ain
gaoutMix[1] = ain
;reset audio from loopers
galoop_in_ma = 0
endin






instr 100;nothing instrument
ip4 = p4
ip5 = p5
ip6 = p6
ga_out[p5][p4] = 0
endin



instr 101;mix
$INMIXT
$PARAMT(1)
$PARAMT(2)
kphase = 1
if kpar2 > 0.5 then
	kphase = -1
endif
aout  = ain * kpar1 * kpar1 * 4 * kphase
$OUTMIXT
endin



instr 102; distortion
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
aout distort1 ain, kpar1 * 10, kpar2 * 10, kpar3, kpar4
$OUTMIXT
endin



instr 103;clip
$INMIXT
$PARAMT(1)
$PARAMT(2)
aout_ clip ain * kpar1 * 2, 0, 0.5
aout = aout_ * kpar2 * 3
$OUTMIXT
endin



instr 104;abs
$INMIXT
$PARAMT(1)
$PARAMT(2)
abss = abs(ain)
aabs dcblock2 abss
aout = ain * kpar2 + aabs * 2 * kpar1
$OUTMIXT
endin



instr 105; degrader taken from Ian Mc Curdy LoFi.csd
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
kvalues	 pow 2, kpar2 * 16
abit = (int((ain/0dbfs)*kvalues))/kvalues
afold fold abit, kpar1 * 10
aout CosSinMix ain, afold, kpar3
$OUTMIXT
endin



instr 106;powershaper
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
krms rms ain
kswing limit krms, 0, 1
kshapeamt = 1 - ((kpar1 * 0.75) - 0.25 * kpar1 * kswing)
alimin AtanLimit ain
ashap powershape alimin, kshapeamt
ashhp buthp ashap, kpar2 * kpar2 * 20000
ashlp butlp ashhp, kpar3 * kpar3 * 20000
aoutl AtanLimit ashlp
aout = aoutl * kpar4 * kpar4 * 4
$OUTMIXT
endin



instr 108; slow attack
$INMIXT
$PARAMT(1)
$PARAMT(2)

klogic init 0
ktime init 2
krms rms ain * 1.42

ktratt trigger krms, kpar1, 0
;attack
if ktratt == 1 && changed(ktratt) == 1 then
    klogic = 1
    ktime = 2
endif
ktrrel trigger krms, 0.001, 1
;release
if ktrrel == 1 && changed(ktrrel) == 1 then
    klogic = 0
    ktime = 0.001
endif
kattenv portk klogic, kpar2 * ktime
aout = kattenv * ain
$OUTMIXT
endin



instr 109;Oeyvind Brandtsegg Compressor
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
kingain = kpar1 * kpar1 * 4
kthresh = -150 + kpar2 * 150
kratio = 1 + kpar3 * 30
aout BrandtseggComp ain, kingain, kthresh, kratio
$OUTMIXT
endin



instr 110;lowpass
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
aout_ lowpass2 ain, 5 + kpar1 * kpar1 * 5000, 1 + 300 * kpar2 * kpar2
aout = aout_ * kpar3
$OUTMIXT
endin



instr 111;highpass
$INMIXT
$PARAMT(1)
$PARAMT(2)
aout_ buthp ain, 5 + kpar1 * kpar1 * 8000
aout = aout_ * kpar2
$OUTMIXT
endin



instr 112;env lp
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
kenv rms ain * kpar1  * 5
kfm= kpar2 * kpar2 * 10000
kfM= kpar3 * kpar3 * 10000
kfr = kfm + (kfM - kfm) * kenv
aout lowpass2 ain, kfr, 1 + 500 * kpar4
$OUTMIXT
endin



instr 113; lpf18
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
;kpar1 - frequency
;kpar2 - resonance
;kpar3 - distortion
;kpar4 - dry - wet
ares lpf18 ain, kpar1 * kpar1 * 10000, kpar2 * 1.1, kpar3
aout CosSinMix ain, ares, kpar4
$OUTMIXT
endin



instr 114;parametric
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
kcf = kpar1 * kpar1 * 10000
aout eqfil ain, kcf, kcf  * 0.5 * kpar2, kpar3 * kpar3 * 10
$OUTMIXT
endin



instr 115;condor cab sym
$INMIXT
$PARAMT(1);scoop
;low
alowhp buthp ain, 90 + 30 * kpar1
alowlp butlp alowhp, 90 + 30 * kpar1
;mid
amidhp buthp ain, 90 + 30 * kpar1
amidlp butlp ain, 3000 + 1000 * kpar1
ascooplow butlp ain, 400 - 200 * kpar1
ascoophigh buthp ain, 400 + 200 * kpar1
;high
ahighp buthp, ain, 3000 + 1000 * kpar1
ahiglp butlp ahighp, 3000 + 1000 * kpar1
;mix
aout = alowlp * ampdbfs(-4 - 2  * kpar1) + ahiglp + (ascooplow + ascoophigh) * ampdbfs(-8 - 2   * kpar1)
$OUTMIXT
endin



instr 119;4 bands guitar eq 20 db
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
klow init 200
kmid1 init 300
kmid2 init 3000
alow butlp ain, klow
amid1_ buthp ain, klow
amid1 butlp amid1_, kmid1
amid2_ buthp ain, kmid1
amid2 butlp amid2_, kmid2
ahig buthp ain, kmid2
aout = alow * kpar1 * kpar1 * 10 + amid1 * kpar2 * kpar2 * 10 + amid2 * kpar3 * kpar3 * 10 + ahig * kpar4 * kpar4 * 10
$OUTMIXT
endin



instr 120;tremolo
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)

ifno ftgentmp 0, 123, 8192, 10, 1
iftfn ftgentmp 0, 123, 3, -2, 138, 139, 140
ftmorf kpar3  * 2, iftfn, ifno
amod oscil 0.5, kpar1 * 30, ifno
ares = (amod + 0.5) * kpar2 * 3 * ain

aout CosSinMix ain, ares, kpar4
$OUTMIXT
endin



instr 121;flanger
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
adel oscil 0.5, kpar1
adel = adel + 0.5
ares flanger ain, adel * 0.02 * kpar2, kpar3 * 0.99
aout CosSinMix ain, ares, kpar4
$OUTMIXT
endin



instr 122; phaser
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
;kpar1 - lfo
;kpar2 - frequency
;kpar3 - feedback
;kpar4 - dry - wet
iord init 128; 1 - 4999
kmod oscili 0.49, kpar1 * kpar1 * 2, giSine
kmod = kmod + 0.51
ares phaser1 ain, 40 + kpar2 * kpar2 * 10000 * kmod, iord, kpar3
aout CosSinMix ain, ares, kpar4
$OUTMIXT
endin



instr 123;chorus
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
kdelay = kpar1 * 0.03
kfreq = kpar2 * 5

iminT = .007
achorus1 oscili 1, kfreq, giSine, 0 
achorus1 = ((achorus1 + 1) * .5 * (kdelay - iminT)) + iminT
achorus2 oscili 1, kfreq, giSine, 0.33333
achorus2 = ((achorus2 + 1) * .5 * (kdelay - iminT)) + iminT
achorus3 oscili 1, kfreq, giSine, 0.66666
achorus3 = ((achorus3 + 1) * .5 * (kdelay - iminT)) + iminT

adell delayr 1
achor1 deltap3 achorus1
achor2 deltap3 achorus2
achor3 deltap3 achorus3
aut = achor1 + achor2 + achor3
	delayw ain + aut * kpar3 * 0.3
aout CosSinMix ain, aut, kpar4
$OUTMIXT
endin



instr 124;leslie based on Ian McCurdy Leslie.csd
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)

ares = ain
kcrossover = 20+ kpar1 * kpar1 * 8000
kfreqL = kpar2 * kpar2 * kpar2 * 80
kfreqH = kpar3 * kpar3 * kpar2 * 80
kDopDep= kpar4 * 2
iMaxDelay = 4

alow butlp ain, kcrossover
ahig buthp ain, kcrossover

;Low Horn
aAmpL 	oscili 0.5,  kfreqL, giSine
aAmpL	= aAmpL + 0.5
aPanL	oscili 0.5, kfreqL, giSine, 0.75
aPanL	= aPanL + 0.5
aDelTimL oscili	kDopDep, kfreqL, giSine, 0
aDelTimL = aDelTimL + kDopDep
aDelTapL vdelay alow * aAmpL, aDelTimL, iMaxDelay
aLL, aLR pan2  aDelTapL, aPanL, 1

;High Horn
aAmpH oscili 0.5,  kfreqH, giSine
aAmpH	= aAmpH + 0.5
aPanH	oscili 0.5, kfreqH, giSine, 0.75
aPanH	= aPanH + 0.5
aDelTimH oscili	 kDopDep, kfreqH, giSine, 0
aDelTimH = aDelTimH + kDopDep
aDelTapH vdelay ahig * aAmpH, aDelTimH, iMaxDelay
aHL, aHR pan2  aDelTapH, aPanH, 1

aout = aLL + aLR + aHL + aHR
$OUTMIXT
endin


instr 125;pitch shift
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
ktransp = (kpar1 - 0.5) * 48; transpose +- 24
ares PitchShifter_akk ain, ktransp, kpar2, gihalfsine
aout CosSinMix ain, ares, kpar3
$OUTMIXT
endin



instr 126;pitch shift spectral
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
ksemitones = round((kpar1 - 0.5) * 48)
ktransp = semitone(ksemitones); transpose +- 24
ksign =(ktransp < 0 ? -1 : 1)
kfine = semitone(kpar2) * ksign
/*
ifftsize  = 1024
ioverlap  = ifftsize / 4
iwinsize  = ifftsize
iwinshape = 1		;von-Hann window
*/
fftin     pvsanal ain, gifftsize, gioverlap, giwinsize, giwinshape
fftblur   pvscale fftin, ktransp * kfine
ares      pvsynth fftblur	

aout CosSinMix ain, ares, kpar3
$OUTMIXT
endin



instr 127;ringmod
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)

ifno ftgentmp 0, 0, 8192, 10, 1
iftfn ftgentmp 0, 123, 3, -2, 138, 139, 140
ftmorf kpar2  * 2, iftfn, ifno

asine oscil 1, kpar1 * kpar1 * 10000, ifno
aout CosSinMix ain, ain * asine, kpar3
$OUTMIXT
endin




instr 128;FMer
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)

kqual init 0.01
kpit = (kpar1 - 0.5) * 48; carrier transpose +- 24
ktransp = (kpar2 - 0.5) * 48; modulator transpose +- 24
kspread = (kpar3 - 0.5) * 48; modulator spread +- 24
amod PitchShifter_akk ain, ktransp, kqual, gihalfsine
afm PitchShifter_aak ain, kpit + amod * kspread, kqual, gihalfsine
aout CosSinMix ain, afm, kpar4
$OUTMIXT
endin




instr 129;hilbert
$INMIXT
;freq
$PARAMT(1)
;min shift
$PARAMT(2)
;max shift
$PARAMT(3)
;direction
$PARAMT(4)

aoscil oscili 0.5, kpar1 * kpar1 * kpar1 * 100, giSine
koscil downsamp aoscil + 0.5
kminShift = 20 + kpar2 * kpar2 * 10000
kmaxShift = 20 + kpar3 * kpar3 * 10000
kfreq = kminShift + koscil * (kmaxShift - kminShift)
asin oscili 1, kfreq, giSine
acos oscili 1, kfreq, giSine, .25

;Phase quadrature output derived from input signal.
areal, aimag hilbert ain
;Based on trignometric identities.
amod1 = areal * acos
amod2 = aimag * asin
; Calculate the up-shift and down-shift.
aupshift = (amod1 + amod2) * 0.7
adownshift = (amod1 - amod2) * 0.7
; Make sure the output doesn't get louder than the original signal.
aout1 balance aupshift, ain
aout2 balance adownshift, ain

if kpar4 >= 0 &&  kpar4 < 0.3 then;upshift only
    aout = aout1 * 2
elseif kpar4 >= 0.3 &&  kpar4 < 0.4 then;downshift only
    aout = aout2 * 2
else
    aout = aout1 + aout2
endif

$OUTMIXT
endin


instr 130; delay
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
abuf	delayr	1.1
adel 	deltap	kpar1
	delayw	ain + adel * kpar2
aout CosSinMix ain, adel, kpar3
$OUTMIXT
endin





instr 132;reverse delay
;taken from Ian Mc Curdy reverse.csd
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)

ienv1	ftgenonce 0, 0, 131072, 7, 0, 1024, 1, 131072-(1024*2), 1, 1024, 0
ienv2	ftgenonce 0, 0, 131072, 7, 0, 4096, 1, 131072-(4096*2), 1, 4096, 0 	
ienv3	ftgenonce 0, 0, 131072, 7, 0,16384, 1, 131072-(16384*2), 1, 16384, 0 
ienv4	ftgenonce 0, 0, 131072, 7, 0,32768, 1, 131072-(32768*2), 1, 32768, 0

ktime_ = kpar1 * 4
ktime limit ktime_, 0.01, 4
atime	interp	ktime
aptr phasor (2/ktime)		;CREATE A MOVING PHASOR THAT WITH BE USED TO 

if ktime < 0.2 then			;IF CHUNK TIME IS LESS THAN 0.2... (VERY SHORT)
    aenv	table3	aptr,ienv4,1		;CREATE AMPLITUDE ENVELOPE 	
elseif ktime < 0.4 then 	 
    aenv	table3	aptr,ienv3,1
elseif ktime < 2 then 	 
    aenv	table3	aptr,ienv2,1
else					;other longest bracket of delay times
     aenv	table3	aptr,ienv1,1 	
endif 	
aptr = aptr * atime	;SCALE PHASOR ACCORDING TO THE LENGTH OF THE DELAY TIME CHOSEN BY THE USER 	

abuffer	delayr	4.01		;CREATE A DELAY BUFFER 	
    abwd	deltap3	aptr			;READ AUDIO FROM A TAP WITHIN THE DELAY BUFFER
    afwd	deltap3	atime			;FORWARD DELAY 		
delayw	ain + afwd * kpar2

aout CosSinMix ain, abwd, kpar3
$OUTMIXT
endin



instr 133;crapdelay
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)

awobble_ oscil kpar2 * .003, 1 / (4 * kpar1), giSine
awobble = 1 + awobble_

abuf delayr 8
adeltap deltapi 4 * kpar1 * awobble
ahp buthp adeltap, 20 + 500 * kpar2
alp butlp ahp, 20000 - 15000 * kpar2
anoise noise 0.001 * kpar2, 0.2
afeed AtanLimit alp  + anoise
delayw	ain + afeed * kpar3 * (1.2 + kpar2);compensation

aout CosSinMix ain, afeed, kpar4
$OUTMIXT
endin



instr 140; reverb
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
denorm ain
ainhp buthp ain, 20 + 10000 * kpar1 * kpar1
aoutL, aoutR reverbsc ainhp, ainhp, kpar2, kpar3 * 15000
aout CosSinMix ain, aoutL + aoutR, kpar4
$OUTMIXT
endin




instr 141;modulated_verb
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)

ilp1  init 1/10
ilp2  init 1/23
ilp3  init 1/41

denorm ain
ajunk    alpass  ain, 1.7, 0.1
aleft    alpass  ajunk, 1.01, .07

ajunk    alpass  ain, 1.5, 0.2
aright   alpass  ajunk, 1.33, .05

kdel1_    randi   .01 * kpar1, 0.5, .666
kdel1 portk kdel1_, kpar1 / 0.47
kdel1    =       kdel1 + 0.01
addl1    delayr  .3
afeed1   deltapi kdel1
    delayw afeed1 * kpar1 + aleft

kdel2_    randi   .01 * kpar1, 0.47, .777
kdel2 portk kdel2_, kpar1 / 0.51
kdel2    =       kdel2 + 0.01
addl2    delayr  .3
afeed2   deltapi kdel2
    delayw afeed2 * kpar2 + aright

;post reverb
aglobin AtanLimit (afeed1 + afeed2) * (0.5 - 0.30 * kpar1)
atap1 comb aglobin, 3.3, ilp1
atap2 comb aglobin, 3.3, ilp2
atap3 comb aglobin, 3.3, ilp3
aglobrev alpass atap1 + atap2 + atap3, 2.6, .085
aglobrev_ tone aglobrev, 30 + kpar3 * kpar3 * 24000
aglobrev buthp aglobrev_, 90 - 40 * kpar1

kdel3 randi .003, 0.2, .888
kdel3 = kdel3 + .05
addl3 delayr .2
agr1 deltapi kdel3
    delayw aglobrev + agr1 * 0.5 * kpar1

kdel4 randi .0033, 0.27, .999
kdel4 = kdel4 + .05
addl4 delayr .2
agr2 deltapi kdel4
    delayw aglobrev + agr2 * 0.5 * kpar1

aout CosSinMix ain, (agr1 + afeed1+ agr2 + afeed2) / 4, kpar4
$OUTMIXT
endin




instr 142;shroeder verb
$INMIXT
$PARAMT(1)
;revtime
$PARAMT(2)
;pretime
$PARAMT(3)
;postime
$PARAMT(4)
;d-w

denorm ain
; four parallel comb filters
;kRvt reverb time
imaxlpt1 init 0.0297
imaxlpt2 init 0.0371
imaxlpt3 init 0.0411
imaxlpt4 init 0.0437
;A
a1L vcomb ain, kpar1, imaxlpt1 * kpar2, imaxlpt1 * 3 
a2L vcomb ain, kpar1, imaxlpt2 * kpar2, imaxlpt2 * 3 
a3L vcomb ain, kpar1, imaxlpt3 * kpar2, imaxlpt3 * 3 
a4L vcomb ain, kpar1, imaxlpt4 * kpar2, imaxlpt4 * 3 
asumL sum a1L, a2L, a3L, a4L
;B
a1R vcomb ain, kpar1, imaxlpt1 * kpar2 * .97, imaxlpt1 * 3 
a2R vcomb ain, kpar1, imaxlpt2 * kpar2 * .96, imaxlpt2 * 3 
a3R vcomb ain, kpar1, imaxlpt3 * kpar2 * .95, imaxlpt3 * 3 
a4R vcomb ain, kpar1, imaxlpt4 * kpar2 * .94, imaxlpt4 * 3 
asumR sum a1R, a2R, a3R, a4R

; two allpass filters in series
imaxlpt5 init 0.005
;A
a5L valpass asumL + asumR * 0.1, 0.1, imaxlpt5 * kpar3, imaxlpt5 * 3
aOutL alpass a5L, 0.1, 0.02295
;B
a5R valpass asumR + asumL * 0.1, 0.1, imaxlpt5 * kpar3, imaxlpt5 * 3
aOutR alpass a5R, 0.1, 0.02287

aout CosSinMix ain, (aOutL + aOutR) / 1.41, kpar4
$OUTMIXT
endin



instr 143;envreverb
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
denorm ain
ainhp buthp ain, 20 + 10000 * kpar1 * kpar1
aoutL, aoutR reverbsc ainhp, ainhp, kpar2, kpar3 * 15000

;dry-wet balance based on the input signal envelope
atrk follow2 ain, 0.05, 0.05
ktrk downsamp atrk
kmix_ init 0
if ktrk < kpar4 then 
    kmix_ = 1
else
    kmix_ = (ktrk - kpar4) / (1 - kpar4)
endif
kmix port kmix_, 0.1
aout CosSinMix ain, aoutL + aoutR, kmix
$OUTMIXT
endin



instr 150;spectral arpeggiator
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
kfrr = kpar1 * kpar1 * 30
kl = kpar2 * kpar2
kh = kpar3 * kpar3
/*
ifftsize  = 1024
ioverlap  = ifftsize / 4
iwinsize  = ifftsize
iwinshape = 1		;von-Hann window
*/
fftin     pvsanal ain, gifftsize, gioverlap, giwinsize, giwinshape

ifno ftgentmp 0, 0, gifftsize, 7, 0, gifftsize, 1
kbin init 0
kbin_ oscil 1, kfrr, ifno

if kpar2 < kpar3 then
    kbin = kl + kbin_ * (kh - kl)
else
    kbin = kl - kbin_ * (kl - kh)
endif

kdepth init 1
kgain init 10
farp pvsarp fftin, kbin, kdepth, kgain
arpeg      pvsynth farp	

;enveloping
ifnoenv ftgentmp 0, 0, gifftsize, 7, 0, gifftsize/2, 1, gifftsize/2, 0
aenv oscil kpar4, kfrr, ifnoenv
aenv = 1- aenv
aout = arpeg * aenv
$OUTMIXT
endin



instr 151; frequency shifter
$INMIXT
;shift
$PARAMT(1)
;post gain
$PARAMT(2)
;dry-wet
$PARAMT(3)

kshift_ = (kpar1 - 0.5) * 2
kshift = kshift_ * kshift_ * 500;-500 + 500 exponential
/*
ifftsize = 1024
ioverlap = ifftsize / 4
iwinsize = ifftsize
iwinshape = 1
*/
fftin pvsanal ain, gifftsize, gioverlap, giwinsize, giwinshape
fftblur pvshift fftin, kshift, 20
ares pvsynth fftblur
aout CosSinMix ain, ares * kpar2 * kpar2 * kpar2 * 8, kpar3
$OUTMIXT
endin 




instr 152;pseudogranular
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
;kpar1 - granule time
;kpar2 - delay ratio
;kpar3 - delay feedback
;kpar4 - D-W
itl = ftlen(gigrainenv)
aphas phasor 1 / (0.010 + kpar1 * 0.040)
amod tablei aphas * itl, gigrainenv
awin = ain * amod
;delay
abuf	delayr	1
adel 	deltap3	(0.010 + kpar1 * 0.040) * kpar2
	delayw	awin + adel * kpar3
;aout = adel * kpar4 + ain * (1 - kpar4)
aout CosSinMix ain, awin + adel, kpar4
$OUTMIXT
endin




instr 153; resonator
$INMIXT
;frequency
$PARAMT(1)
;cutoff
$PARAMT(2)
;feedback
$PARAMT(3)
;dry-wet
$PARAMT(4)

kfrq = 20 + kpar1 * kpar1 * 2000
kcutoff = 40 + kpar2 * kpar2 * 15000
kfeed = 1 - ((1 - kpar3) * (1- kpar3))
aout wguide1 ain, kfrq, kcutoff, kfeed
aout CosSinMix ain, aout, kpar4
$OUTMIXT
endin 



instr 155; harmonizer
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)

;tonality
ktonality = int(kpar1 * 11.1)

;interval                                   t  2  3  4, 5  6  7
iintevals ftgentmp 0, 0, 8, -2, 0, 2, 4, 5, 7, 9, 11;semitones to major
kinterval_m tab int(kpar2 * 6.1), iintevals

;octave
koctave init 1
if kpar3 < 0.25 then
    koctave = 0.25
elseif kpar3 >= 0.25 && kpar3 < 0.5 then
    koctave = 0.5
elseif kpar3 >= 0.5 && kpar3 < 0.75 then
    koctave = 1
else
    koctave = 2
endif

iscala ftgentmp 0, 0, 16, -2, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1

;lowest f = sr / ifftsize
/*
ifftsize  = 1024 * 2
ioverlap  = ifftsize / 4
iwinsize  = ifftsize
iwinshape = 1		;von-Hann window
*/
fain  pvsanal ain, gifftsize, gioverlap, giwinsize, giwinshape
kfr_tracked, kamp pvspitch fain, 0.01

;input Frequency to midi note number
knote = 69 + 12 * log2(kfr_tracked / 440)
knote limit knote, 0, 127
knote init 0
knote_r = round(knote) % 12;find the note
knote_r init 0

kst_diff = (knote_r - ktonality) % 12;different semitones
if kst_diff < 0 then
    kst_diff = kst_diff + 12
endif

;check for input note
wronginnote:
krightinnote tab kst_diff, iscala
if krightinnote == 1 kgoto rigthinnote
if krightinnote == 0 then
    kst_diff =(kst_diff + 1) % 12
    kgoto wronginnote
endif
rigthinnote:

;check for harmonized note
kinterval = kinterval_m
wronghanote:
kharmnote = (kst_diff + kinterval) % 12
krighthanote tab kharmnote, iscala
if krighthanote == 1 kgoto rigthhanote
if krighthanote == 0 then
    if kinterval_m == 5 then
        kinterval = kinterval + 1
    else
        kinterval = kinterval - 1
    endif
    kgoto wronghanote
endif
rigthhanote:

;shift and synth
ksemitdiff port kinterval, 0.02
ikeepform init 0
kgainsh init 1
kcoefs init 100
fsig pvscale fain, semitone(ksemitdiff) * koctave, ikeepform, kgainsh, kcoefs
fsigs pvsmooth fsig, 0.9, 0.9
aout pvsynth fsigs
$OUTMIXT
endin



instr 160;tremoloBpm
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)

istep ftgentmp 0, 0, 4, -2, 0.25, 1/3, 0.5, 1
kstep tab round(kpar1 * 4), istep
ktime port kstep * (1 + kpar2) * 60 / gkbpm, giport

ifno ftgentmp 0, 123, 8192, 10, 1
iftfn ftgentmp 0, 123, 3, -2, 138, 139, 140
ftmorf kpar3  * 2, iftfn, ifno
amod oscil 0.5, 1/ktime, ifno
ares = (amod + 0.5) * 2 * ain

aout CosSinMix ain, ares, kpar4
$OUTMIXT
endin




instr 161;delayBpm
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)

istep ftgentmp 0, 0, 4, -2, 0.25, 1/3, 0.5, 1
kstep tab round(kpar1 * 4), istep
ktime port kstep * (1 + kpar2) * 60 / gkbpm, giport

abuf	delayr	5
adel 	deltap	ktime
	delayw	ain + adel * kpar3

aout CosSinMix ain, adel, kpar4
$OUTMIXT
endin




instr 170;gate
$INMIXT
$PARAMT(1)
$PARAMT(2)

reset:
ihalftab = 16384
knull = 0.0001 + kpar_1 * kpar_1 * 0.999
inull = i(knull)
;gating function 
ifuncth ftgentmp 0, 123, ihalftab * 2, 6, 1, ihalftab - ihalftab * inull, 0,  ihalftab * inull, 0, ihalftab * inull, 0, ihalftab - ihalftab * inull, 1

isteep = 0.99
ifunctl ftgentmp 0, 123, ihalftab * 2, 6, 0, ihalftab - (ihalftab * inull) * isteep, 0, (ihalftab * inull) * (1 - isteep), 1, ihalftab * inull, 1, ihalftab * inull, 1,  (ihalftab * inull) * (1 - isteep), 0, ihalftab - (ihalftab * inull) * isteep, 0

aouth tab (ain + 1) * ihalftab, ifuncth
aoutl tab (ain + 1) * ihalftab, ifunctl
rireturn

;check for update slowly
ktrig  metro 10
kch changed kpar_1
kchng init 0
if kchng == 0 && kch == 1 then
    kchng = 1
endif

; reinit the transfer function
if kchng == 1 && ktrig == 1 then
    reinit reset
    kchng = 0
endif

;mixing variants
aout = 0
if kpar2 > 0.5 then
    kouth_ downsamp aouth
    kouth port kouth_, 0.15
    aout = kouth * ain
else
    koutl_ downsamp aoutl
    koutl port koutl_, 0.15
    aout = koutl * ain
endif

$OUTMIXT
endin



instr 171;trapez envelope
;[71, "shortEnv", "threshold", "attack", "sustain", "release"],
$INMIXT
$PARAMT(1)
$PARAMT(2)
$PARAMT(3)
$PARAMT(4)
atrk follow2 ain, 0.05, 0.05
ktrk downsamp atrk

kpar2 init 0
kpar3 init 0
kpar4 init 0
katt = kpar2 * 0.25
ksus = kpar3
krel = kpar4

reset:
iatt = i(katt)
isus = i(ksus)
irel = i(krel)
kenv expseg 0.0001, iatt, 1.0001, isus, 1.0001, irel, 0.0001
rireturn

klogic init 0

ktratt trigger ktrk, kpar1, 0
;attack
if ktratt == 1 && changed(ktratt) == 1 && klogic == 0 then
    klogic = 1
    reinit reset
endif

ktrrel trigger ktrk, kpar1, 1
;release
if ktrrel == 1 && changed(ktrrel) == 1 && klogic == 1 then
    klogic = 0
endif

aout = ain * (kenv - 0.0001)
$OUTMIXT
endin





instr 1000;output
;release with tails - for audio output
xtratim 2 * giport + p6

;output router to inputs
$FEEDINT(1)
$FEEDINT(2)
$FEEDINT(3)
$FEEDINT(4)
$FEEDINT(5)
$FEEDINT(6)
$FEEDINT(7)

;pan and output
$OUTLINET(1)
$OUTLINET(2)
$OUTLINET(3)
$OUTLINET(4)
$OUTLINET(5)
$OUTLINET(6)
$OUTLINET(7)
almat = al1 + al2 + al3 + al4 + al5 + al6 + al7
armat = ar1 + ar2 + ar3 + ar4 + ar5 + ar6 + ar7

;audio out, tails
gaoutMix[2] AtanLimit gaoutMix[2] + almat
gaoutMix[3] AtanLimit gaoutMix[3] + armat

endin




instr 1001;loopers and freezer controls

krise chnget "freezRise"
chnset 0.5, "freezRise"

kstst1 chnget "freez1"
if changed(kstst1) == 1 && kstst1==1 then
  event "i", 1105.1, 0, -1, 1, krise * 4
elseif changed(kstst1) == 1 && kstst1==0 then
  event "i", -1105.1, 0, -1
endif

kstst2 chnget "freez2"
if changed(kstst2) == 1 && kstst2==1 then
  event "i", 1105.2, 0, -1, 2, krise * 4
elseif changed(kstst2) == 1 && kstst2==0 then
  event "i", -1105.2, 0, -1
endif

kstst3 chnget "freez3"
 if changed(kstst3) == 1 && kstst3==1 then
  event "i", 1105.3, 0, -1, 3, krise * 4
elseif changed(kstst3) == 1 && kstst3==0 then
  event "i", -1105.3, 0, -1
endif

;clan the slots
gaoutMix[12] = 0
gaoutMix[13] = 0
gaoutMix[14] = 0

;activate/deactivate delay loopers 1004

chnset 1,  "ol_ti1"
kactiv_mode1 chnget "autothrmode1"
kactiv_mode1 init 0
kactiv_loop1 init 0
if changed(kactiv_mode1) == 1 && kactiv_mode1 > 0 && kactiv_loop1 == 0 then
    ;read delay value and pass as p5
    kinittime1 chnget "ol_ti1"
    kactiv_loop1 = 1
    event "i", 1004.1, 0, -1, 1, kinittime1
elseif changed(kactiv_mode1) == 1 && kactiv_mode1 == 0 && kactiv_loop1 == 1 then
    kactiv_loop1 = 0
    event "i", -1004.1, 0, -1
endif

chnset 1,  "ol_ti2"
kactiv_mode2 chnget "autothrmode2"
kactiv_mode2 init 0
kactiv_loop2 init 0
if changed(kactiv_mode2) == 1 && kactiv_mode2 > 0 && kactiv_loop2 == 0 then
    kinittime2 chnget "ol_ti2"
    kactiv_loop2 = 1
    event "i", 1004.2, 0, -1, 2, kinittime2
elseif changed(kactiv_mode2) == 1 && kactiv_mode2 == 0 && kactiv_loop2 == 1 then
    kactiv_loop2 = 0
    event "i", -1004.2, 0, -1
endif

chnset 1,  "ol_ti3"
kactiv_mode3 chnget "autothrmode3"
kactiv_mode3 init 0
kactiv_loop3 init 0
if changed(kactiv_mode3) == 1 && kactiv_mode3 > 0 && kactiv_loop3 == 0 then
    kinittime3 chnget "ol_ti3"
    kactiv_loop3 = 1
    event "i", 1004.3, 0, -1, 3, kinittime3
elseif changed(kactiv_mode3) == 1 && kactiv_mode3 == 0 && kactiv_loop3 == 1 then
    kactiv_loop3 = 0
    event "i", -1004.3, 0, -1
endif

chnset 1,  "ol_ti4"
kactiv_mode4 chnget "autothrmode4"
kactiv_mode4 init 0
kactiv_loop4 init 0
if changed(kactiv_mode4) == 1 && kactiv_mode4 > 0 && kactiv_loop4 == 0 then
    kinittime4 chnget "ol_ti4"
    kactiv_loop4 = 1
    event "i", 1004.4, 0, -1, 4, kinittime4
elseif changed(kactiv_mode4) == 1 && kactiv_mode4 == 0 && kactiv_loop4 == 1 then
    kactiv_loop4 = 0
    event "i", -1004.4, 0, -1
endif

;start loopers
kactiv_loop1 init 1 
kactiv_loop2 init 1 
kactiv_loop3 init 1 
kactiv_loop4 init 1 
chnset 1, "autothrmode1"
chnset 1, "autothrmode2"
chnset 1, "autothrmode3"
chnset 1, "autothrmode4"
event_i "i", 1004.1, 0, -1, 1, 1
event_i "i", 1004.2, 0, -1, 2, 1
event_i "i", 1004.3, 0, -1, 3, 1
event_i "i", 1004.4, 0, -1, 4, 1
endin






instr 1004;output loopers
;p4 looper number
;audio input
;looperInput$N 0 matrix, 1 looper 1, 2 looper2 , 3 looper 3,4 looper4 
Sinput sprintf "looperInput%d", p4
kinput chnget Sinput
kinput init 0
kenvdecl linsegr 0, 0.05, 1, 0.05, 0
if kinput == 1 then
    ainL = gaoutMix[4] * kenvdecl
    ainR  = gaoutMix[5] * kenvdecl
elseif kinput == 2 then
    ainL = gaoutMix[6] * kenvdecl
    ainR  = gaoutMix[7] * kenvdecl
elseif kinput == 3 then
    ainL = gaoutMix[8] * kenvdecl
    ainR  = gaoutMix[9] * kenvdecl
elseif kinput == 4 then
    ainL = gaoutMix[10] * kenvdecl
    ainR  = gaoutMix[11] * kenvdecl
elseif kinput == 5 then
    ainL = gaoutMix[0] * kenvdecl
    ainR  = gaoutMix[1] * kenvdecl
else
    ainL = gaoutMix[2] * kenvdecl
    ainR  = gaoutMix[3] * kenvdecl
endif

$LOOPER

;return to matrix in
Sloop_in_ma sprintf "loop_in_ma%d", p4
kloop_in_ma_ chnget Sloop_in_ma
kloop_in_ma port kloop_in_ma_ * kloop_in_ma_, giport
galoop_in_ma AtanLimit galoop_in_ma + (aoutL + aoutR) * kloop_in_ma * kloop_in_ma * 2
endin









instr 1100;pvs in for freezers
;audio input
kinput chnget "freezinput"
if kinput == 1 then
    ainL = gaoutMix[4]
    ainR  = gaoutMix[5]
elseif kinput == 2 then
    ainL = gaoutMix[6]
    ainR  = gaoutMix[7]
elseif kinput == 3 then
    ainL = gaoutMix[8]
    ainR  = gaoutMix[9]
elseif kinput == 4 then
    ainL = gaoutMix[10]
    ainR  = gaoutMix[11]
elseif kinput == 5 then
    ainL = gaoutMix[0]
    ainR  = gaoutMix[1]
else
    ainL = gaoutMix[2]
    ainR  = gaoutMix[3]
endif

ain = (ainL + ainR) / 1.41421
;ain = (gaoutMix[2] + gaoutMix[3]) / 1.41421

/*
ifftsize  = 1024;512?
ioverlap  = ifftsize / 4
iwinsize  = ifftsize
iwinshape = 1	;von-Hann window
*/
gffreez     pvsanal ain, gifftsize, gioverlap, giwinsize, giwinshape

endin




instr 1105;freezer
;buffer
idelbuf = 0.03
kenv linsegr 0, idelbuf * 2, 0, p5, 1, p5, 0
ktime line 0, idelbuf, 1.00
if (ktime < 1) then
    ibuf1, kt1 pvsbuffer gffreez, idelbuf
endif
khan init ibuf1
if (ktime > 1) then
    kpt phasor 1 / idelbuf	
    kspl jspline 0.1, 0.2, 1
    kpointer wrap (kpt + kpt * kspl), 0, 1
    fsb1 pvsbufread kpointer * idelbuf, khan, 31, sr/3, 1
    ;fshift pvscale fsb1, semitone(kshiftP), 0, 1, 70	
    ;aout pvsynth fshift
    aout pvsynth fsb1
endif
aout buthp aout, 31

;to output
areso = aout * kenv
gaoutMix[11 + p4] = areso

;return to matrix in
Sfreez_in_ma sprintf "freez_in_ma%d", p4
kfreez_in_ma_ chnget Sfreez_in_ma
kfreez_in_ma port kfreez_in_ma_ * kfreez_in_ma_, giport
galoop_in_ma AtanLimit galoop_in_ma + areso * kfreez_in_ma * kfreez_in_ma * 2
endin








instr 2000;global mixer
;output 
chnset 0, "mix_in"
chnset 0.5, "mix_ma"
chnset 0.5, "mix_l1"
chnset 0.5, "mix_l2"
chnset 0.5, "mix_l3"
chnset 0.5, "mix_l4"
chnset 0.5, "mix_f1"
chnset 0.5, "mix_f2"
chnset 0.5, "mix_f3"

kmix_in_ chnget "mix_in"
kmix_in port kmix_in_ * kmix_in_ * 4, giport
kmix_ma_ chnget "mix_ma"
kmix_ma port kmix_ma_ * kmix_ma_ * 4, giport
kmix_l1_ chnget "mix_l1"
kmix_l1 port kmix_l1_ * kmix_l1_ * 4, giport
kmix_l2_ chnget "mix_l2"
kmix_l2 port kmix_l2_ * kmix_l2_ * 4, giport
kmix_l3_ chnget "mix_l3"
kmix_l3 port kmix_l3_ * kmix_l3_ * 4, giport
kmix_l4_ chnget "mix_l4"
kmix_l4 port kmix_l4_ * kmix_l4_ * 4, giport

kmix_f1_ chnget "mix_f1"
kmix_f1 port kmix_f1_ * kmix_f1_ * 4, giport
kmix_f2_ chnget "mix_f2"
kmix_f2 port kmix_f2_ * kmix_f2_ * 4, giport
kmix_f3_ chnget "mix_f3"
kmix_f3 port kmix_f3_ * kmix_f3_ * 4, giport

galtot = gaoutMix[0] * kmix_in  + gaoutMix[2] * kmix_ma + gaoutMix[4] * kmix_l1 + gaoutMix[6] * kmix_l2 + gaoutMix[8] * kmix_l3 + gaoutMix[10] * kmix_l4 + gaoutMix[12] * kmix_f1 + gaoutMix[13] * kmix_f2 + gaoutMix[14] * kmix_f3

gartot = gaoutMix[1] * kmix_in  + gaoutMix[3] * kmix_ma + gaoutMix[5] * kmix_l1 + gaoutMix[7] * kmix_l2 + gaoutMix[9] * kmix_l3 + gaoutMix[11] * kmix_l4 + gaoutMix[12] * kmix_f1 + gaoutMix[13] * kmix_f2 + gaoutMix[14] * kmix_f3

outs galtot, gartot 

;Update vumeter
kupdate metro 2
kmatrixoutv max_k gaoutMix[2] + gaoutMix[3], kupdate, 1
kfreeze1outv max_k gaoutMix[12] * 1.41421, kupdate, 1
kfreeze2outv max_k gaoutMix[12] * 1.41421, kupdate, 1
kfreeze3outv max_k gaoutMix[12] * 1.41421, kupdate, 1
kloop1outv max_k gaoutMix[4] + gaoutMix[5], kupdate, 1
kloop2outv max_k gaoutMix[6] + gaoutMix[7], kupdate, 1
kloop3outv max_k gaoutMix[8] + gaoutMix[9], kupdate, 1
kloop4outv max_k gaoutMix[10] + gaoutMix[11], kupdate, 1
ktotaloutv max_k galtot + gartot , kupdate, 1

kinstmonitor init 1000
kch active kinstmonitor
;printk2 kch
if kupdate == 1 then
    chnset kmatrixoutv, "matrixoutv"
    chnset ktotaloutv, "totaloutv"
    chnset kfreeze1outv, "freeze1outv"
    chnset kfreeze2outv, "freeze2outv"
    chnset kfreeze3outv, "freeze3outv"
    chnset kloop1outv, "loop1outv"
    chnset kloop2outv, "loop2outv"
    chnset kloop3outv, "loop3outv"
    chnset kloop4outv, "loop4outv"
    ;number of active chains
    chnset kch, "upch"
endif

endin





instr 2010;Recorder
;p4 current time 
Sfile sprintf  "matrix_recording%d.wav", p4
Saddress strcat gScurDir, Sfile;"matrix_recording.wav"
;record output
fout Saddress, 14, galtot, gartot;, or 16
endin


</CsInstruments>
<CsScore>
f0 z
i 1 0 -1
</CsScore>
</CsoundSynthesizer>

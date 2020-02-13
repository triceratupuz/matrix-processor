
<CsoundSynthesizer>
<CsLicense>
</CsLicense>
<CsOptions>
-iadc -odac -m1
-b256 -B512

;Current Directory
--omacro:GSCURDIR=/storage/emulated/0/Download/CsoundForAndroid_TPZ/MatrixProcessor/

;Include files directory
--env:INCDIR+=/storage/emulated/0/Download/CsoundForAndroid_TPZ/MatrixProcessor/include
</CsOptions>

<CsHtml5>
<!DOCTYPE html>
<html>
<head>
<title>Matrix</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=5.0" id="viewport_meta">

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
            column-count:8;
            font-size:0.91em;
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


.headerv {
          //font-size:0.01em;
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
               width:47%;
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
	height:5.9%;
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
    width:47%;
    font-size:1em;
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
               width:47%;
               font-size:1em;
}

input[type=button].viuw {
               width:100%;
               font-size:1em;
}


input[type=button].preset {
               width:17.5%;
}


input[type=button].foothw {
               width:50%;
               font-size:1.4em;
}

input[type=button].footdh {
               width:100%;
               font-size:2.2em;
}

input[type=button].ttpc {
               width:32%;
}


#pad {
	//position:absolute;
              //left:0px;
              //top:0px;
	border:1px solid #111111;
}


</style>

<script type="text/javascript">

//CONFIGURATION-----------------------------------------------------------------------------------
//create efflist e para
// first number is csound instr - 100

var effectsData = [[0, "nothing", ["", 0], ["", 0], ["", 0], ["", 0]],
    [1, "mix", ["gain", 0], ["phase inv", 0], ["", 0], ["", 0]],
    [2, "distort", ["pre", 0], ["post", 0], ["shape 1", 0], ["shape 2", 0]],
    [3, "clip", ["pre", 0], ["vol", 0], ["", 0], ["", 0]],
    [4, "abs", ["abs", 0], ["direct", 0], ["", 0], ["", 0]],
    [5, "degrader", ["fold", 0], ["bits", 0], ["dry-wet", 0], ["", 0]],
    [6, "powershape", ["shape", 0], ["hp", 0], ["lp", 0], ["volume", 0]],
    [7, "squarer", ["pre", 0], ["slope", 0], ["lowpass", 0], ["volume", 0]],
    [80, "maresciallo", ["gain", 0], ["bass", 0], ["mid", 0], ["treble", 0]],
    [81, "swedesaw", ["dist", 0], ["bass", 0], ["treble", 0], ["", 0]],
    [82, "nippledist", ["dist", 0], ["zero steep", 0], ["areola h", 0], ["areola w", 0]],
    [83, "green od", ["dist", 0], ["tone", 0], ["", 0], ["", 0]],
    [8, "slow attack", ["threshold", 0], ["time", 0], ["", 0], ["", 0]],
    [9, "compressor", ["gain", 0], ["threshold", 0], ["ratio", 0], ["", 0]],
    [70, "gate", ["threshold", 0], ["lop-hip", 0], ["react", 0], ["", 0]],
    [71, "shortEnv", ["threshold", 0], ["attack", 0], ["sustain", 0], ["release", 0]],
    [72, "autofreeze", ["threshold", 0], ["risetime", 0], ["modulation", 0], ["trig dly", 0]],
    [10, "lowpass", ["freq", 0], ["Q", 0], ["volume", 0], ["", 0]],
    [11, "highpass", ["freq", 0], ["volume", 0], ["", 0], ["", 0]],
    [12, "evelopLp", ["sens", 0], ["freq L", 0], ["freq H", 0], ["Q", 0]],
    [13, "lpf18", ["freq", 0], ["resonance", 0], ["distortion", 0], ["dry-wet", 0]],
    [14, "1b parametric", ["freq", 0], ["band", 0], ["gain", 0], ["", 0]],
    [15, "condorcab", ["scoop", 0], ["", 0], ["", 0], ["", 0]],
    [16, "wah", ["pedal", 0], ["gain", 0], ["bw", 0], ["direct", 0]],
    [17, "vocal filt", ["vocal", 0], ["portamento", 0], ["dry-wet", 0], ["", 0]],
    [19, "4b eq", ["bass", 0], ["lowmid", 0], ["highmid", 0], ["high", 0]],
    [20, "tremolo", ["freq", 0], ["volume", 0], ["square", 0], ["dry-wet", 0]],
    [60, "tremoloBpm", ["mult", 1], ["square", 0], ["dry-wet", 0], ["", 0]],
    [56, "harm trem", ["speed", 0], ["freq", 0], ["dry-wet", 0], ["", 0]],
    [21, "flanger", ["freq", 0], ["delay", 0], ["feedback", 0], ["dry-wet", 0]],
    [22, "phaser", ["lfo", 0], ["frequency", 0], ["feedback", 0], ["dry-wet", 0]],
    [23, "chorus", ["delay", 0], ["frequency", 0], ["feedback", 0], ["dry-wet", 0]],
    [24, "leslie", ["crossover", 0], ["L speed", 0], ["H speed", 0], ["doppler", 0]],
    [25, "pitch", ["pitch", 1], ["quality", 0], ["dry-wet", 0], ["", 0]],
    [26, "pitch HQ", ["pitch", 1], ["fine", 0], ["dry-wet", 0], ["", 0]],
    [27, "ring mod", ["freq", 0], ["shape", 0], ["dry-wet", 0], ["", 0]],
    [28, "freq mod", ["car shift", 0], ["mod shift", 0], ["spread", 0], ["dry-wet", 0]],
    [29, "hilbert", ["freq", 0], ["min shift", 0], ["max shift", 0], ["direction", 0]],
    [30, "delay", ["time", 0], ["feedback", 0], ["dry-wet", 0], ["", 0]],
    [61, "delayBpm", ["mult", 1], ["feedback", 0], ["dry-wet", 0], ["", 0]],
    [32, "reverseDelay", ["time", 0], ["feedback", 0], ["dry-wet", 0], ["", 0]],
    [33, "crapDelay", ["time", 0], ["crap", 0], ["feedback", 0], ["dry-wet", 0]],
    [40, "reverb", ["hp in", 0], ["size", 0], ["cutoff", 0], ["dry-wet", 0]],
    [41, "modulverb", ["random", 0], ["feedback", 0], ["cutoff", 0], ["dry-wet", 0]],
    [42, "schroeder", ["time", 0], ["pretime", 0], ["postime", 0], ["dry-wet", 0]],
    [43, "enverb", ["hp in", 0], ["size", 0], ["cutoff", 0], ["threshold", 0]],
    [50, "spectral arp", ["speed", 0], ["min", 0], ["max", 0], ["env", 0]],
    [51, "freq shift", ["freq", 0], ["gain", 0], ["dry-wet", 0], ["", 0]],
    [52, "pseudo grain", ["rate", 0], ["dlyratio", 0], ["feedback", 0], ["dry-wet", 0]],
    [53, "resonator", ["frequency", 0], ["cutoff", 0], ["feedback", 0], ["dry-wet", 0]],
    [55, "harmonizer", ["tonality", 1], ["interval", 0], ["octave", 0], ["", 0]]
];


//channels
var channels = 8;
//channels definitions = [channelname, MIDI/TP/controllable]
var channChanns = [["channel_n_in", 1],
	["channel_n_input1", 1],
	["channel_n_input2", 1],
	["channel_n_input3", 1],
	["channel_n_input4", 1],
	["channel_n_input5", 1],
	["channel_n_input6", 1],
	["channel_n_input7", 1],
	["channel_n_input8", 1],
	["eff_n_", 0],
	["channel_n_par1", 1],
	["channel_n_par2", 1],
	["channel_n_par3", 1],
	["channel_n_par4", 1],
	["pan_n_", 1],
	["volmat_n_", 1],
	["volume_n_", 1]];


//para retrieve on current chain
var para_retr = new Array(channels * 4).fill(0);


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


//midi configuration - changed to PC 192 instead of CC 176
var fixedmididefs = [["freez1", 114, 192],
                ["freez2", 115, 192],
                ["freez3", 116, 192],
                ["looprec1", 110, 192],
                ["looprec2", 111, 192],
                ["looprec3", 112, 192],
                ["looprec4", 113, 192],
                ["tap", 117, 192]];




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
    var effPara = [];
    //create space for 100 effects
    for (var idx = 0; idx < 100; idx++) {
        effPara.push(["", "", "", "", 0, 0, 0, 0]);
    }
    for (var idxx = 0; idxx < effectsData.length; idxx++) {
        effPara[effectsData[idxx][0]] = [effectsData[idxx][2][0], effectsData[idxx][3][0], effectsData[idxx][4][0], effectsData[idxx][5][0],
		effectsData[idxx][2][1], effectsData[idxx][3][1], effectsData[idxx][4][1], effectsData[idxx][5][1]];
        //[1] is editable or not, see effectsData
    }
    return effPara;
}



//current midi CC
var midiCcActual =[[-1, 0, 0, 0], [-1, 0, 0, 0],[-1, 0, 0, 0],[-1, 0, 0, 0],
                                  [-1, 0, 0, 0], [-1, 0, 0, 0],[-1, 0, 0, 0],[-1, 0, 0, 0]];


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
    var msgtype = data[0];
    var msgnumber = data[1];
    writeToMidiLog('log_in', data);
    //csoundApp.setControlChannel("testamidi", data[1]);
    var midipc = data[1];
    if (msgtype == 192 && msgnumber < 100) {
        //Change effects program
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
    } 

    for (var readmidit = 0; readmidit < fixedmididefs.length; readmidit++) {
        if (fixedmididefs[readmidit][2] == msgtype && fixedmididefs[readmidit][1] == data[1]) {
            var idmid = fixedmididefs[readmidit][0];
            if (idmid.search("looprec") >= 0) {
                loopPlayRec(idmid);
            } else if (idmid.search("freez") >= 0) {
                freezPlayRec(idmid);
            } else if (idmid.search("tap") >= 0) {
                set_tap("tap");
            }
        }
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
    //csoundApp.setControlChannel( "midiready", 1);
    var inputs = midiAccess.inputs.values();
    for (var input = inputs.next(); input && !input.done; input = inputs.next()) {
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
    //see instr 50 and channChanns for channel sequence
    var toappend = "";
    for (var col = 1; col <= channels; col++){
        for(var i = 0; i < channChanns.length; i++){
			if (channChanns[i][1] == 1) {
            	toappend = channChanns[i][0].replace("_n_", col.toString());
            	cc_cha_def.push(toappend);
			}
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





function sliderDoParam(id, value, div, parnnn) {
/*to dispatch the value to the software 
    channel named after the slider id, just for param*/
    var numberValue = parseFloat(value);
    csoundApp.setControlChannel(id, numberValue);
	if (para_retr[(parseInt(div) - 1) * 4 + (parseInt(parnnn) -1)] > 0){
		
		
		var spcid = "spc"+ div.toString() + "p" + parnnn.toString();//text with return value
		console.log(div, parnnn);
	    var spctxt = document.getElementById(spcid).textContent
		var duepunti = spctxt.indexOf(":");
		var parname = spctxt.slice(0,duepunti);
		document.getElementById(spcid).textContent  = parname + ": - -";

		//schedule read return channel from csound after 20 ms
		setTimeout(function(spcid, parname) {
			sliderDoParamRetieve(spcid, parname);//update with returnd value from csound 
    	}, 200, spcid, parname)//delay of 200 ms necessary to allow javascript minimum time

	}
	
}




function sliderDoParamRetieve(spcid, parname){
	//update id="spc'+ div + 'p'+ parnnn + '"' text with return value
	//if parameter must display value
	var value = csoundApp.getControlChannel(spcid + "receive");
	document.getElementById(spcid).textContent  = parname + ":" + value.toFixed(2);
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
    el.innerHTML = value.toString();
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
}



function delayTimeCopy(dest, source) {
/*copy delay time from other delay*/
	var destCh = "ol_ti" + dest.toString();
	var sourceCh = "ol_ti" + source.toString();
	var valu = csoundApp.getControlChannel(sourceCh);
	csoundApp.setControlChannel(destCh, valu);
	document.getElementById(destCh).value = valu.toString();
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
	//matrix
    var channel = "";
	for (col = 1; col <= channels; col++) {
		for (var chnn = 0; chnn < channChanns.length; chnn++){
			channel = channChanns[chnn][0].replace("_n_", col.toString());
			if (channel.indexOf("eff") > -1) {
				//if effect
				channelSetter(channel);
       			effChange(channel);//to update parameters name indication
			} else {
				//all other slider in matrix
				channelSetter(channel);
			}
		}
	}
	
    //update midi cc
    var elmiid = document.getElementById("miid");
    elmiid.style.background = "#bbbbbb";

    var fromcha = 0;
    var el;
    for(var micc =1; micc<=8; micc++){
        //retrive values from csound
        //update gui
        // update array with current cc definition (midiCcActual)
        channel = "ccmidiC" + micc.toString();
        fromcha = csoundApp.getControlChannel(channel);
        if (fromcha > 0) {
                elmiid.style.background = "#bbffbb";
        }
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
    //update trackpad
    var eltpad = document.getElementById("tpad");
    eltpad.style.background = "#bbbbbb";

    for(var tpcc =1; tpcc <=4; tpcc++){
        //retrive values from csound
        //update gui
        // update array with current trackpad definition (tpParActual)
        channel = "tp_para" + tpcc.toString();
        fromcha = csoundApp.getControlChannel(channel);
        if (fromcha > 0) {
                eltpad.style.background = "#bbffbb";
        }
        el = document.getElementById(channel);
        el.value = fromcha;
        tpParActual[tpcc-1][0] = fromcha;

        channel = "tp_ax" + tpcc.toString();
        fromcha = csoundApp.getControlChannel(channel);
        el = document.getElementById(channel);
        el.value = fromcha;
        tpParActual[tpcc-1][1] = fromcha;

        channel = "tp_min" + tpcc.toString();
        fromcha = csoundApp.getControlChannel(channel);
        el = document.getElementById(channel);
        el.value = fromcha;
        tpParActual[tpcc-1][2] = fromcha;

        channel = "tp_max" + tpcc.toString();
        fromcha = csoundApp.getControlChannel(channel);
        el = document.getElementById(channel);
        el.value = fromcha;
        tpParActual[tpcc-1][3] = fromcha;

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
    //document.getElementById("spc7p4").textContent  = id;//ok
    var e = document.getElementById(id);
    var strUser = e.options[e.selectedIndex].value;
    var numberValue = parseFloat(strUser);
    csoundApp.setControlChannel(id, numberValue);
    // update params - ref to global list para
    var ch = id.substr(3);
    //document.getElementById("spc7p4").textContent  = ch;//ok
    var  indexx  = parseInt(strUser);
    document.getElementById("spc"+ ch +"p1").textContent  = para[indexx][0];
    document.getElementById("spc"+ ch +"p2").textContent  = para[indexx][1];
    document.getElementById("spc"+ ch +"p3").textContent  = para[indexx][2];
    document.getElementById("spc"+ ch +"p4").textContent  = para[indexx][3];

	//Update array with retrieve value flag
	for (var parr = 1; parr <=4; parr++){
		var idx = 4 * parseInt(ch - 1) + (parr -1)
		para_retr[idx] = para[indexx][3 + parr];
	}
//var idxtest = 4 * parseInt(ch - 1) + (1 -1)
//document.getElementById("spc7p4").textContent  = para_retr[idxtest];//ok
}



function toggler(id1, id2, id3, id4) {
    /*toggle divs views*/
    var e1 = document.getElementById(id1);
    var e2 = document.getElementById(id2);
    var e3 = document.getElementById(id3);
    var e4 = document.getElementById(id4);
    e1.style.display = 'block';
    e2.style.display = 'none';
    e3.style.display = 'none';
    e4.style.display = 'none';

    var viewport_meta = document.getElementById('viewport_meta'); 
    //content="width=device-width, minimum-scale=1.0, maximum-scale=5.0"
    if (id1 == 'trackpad') {
        viewport_meta.setAttribute( 'content', "width=device-width, minimum-scale=1.0, maximum-scale=1.0");
    } else {
        viewport_meta.setAttribute( 'content', "width=device-width, minimum-scale=1.0, maximum-scale=5.0");
    }
}




function loada() {
    /*initialize views*/
    var emat = document.getElementById('matrix');
    emat.style.display = 'block';
    var elop = document.getElementById('loopers');
    elop.style.display = 'none';
    var elom = document.getElementById('midiw');
    elom.style.display = 'none';
    var elot = document.getElementById('trackpad');
    elot.style.display = 'none';
    metronome();
}



function set_tap(id) {
    /* tap tempo*/
    csoundApp.setControlChannel(id, 1);
    setTimeout(function() {
	var bppmm = csoundApp.getControlChannel("bpm");
              bppmm = Number(Math.round(bppmm+'e'+4)+'e-'+4);
              document.getElementById("bpm").value = bppmm.toFixed(3);
    }, 200)//delay of 200 ms necessary to allow javascript minimum time
}


function to1(num){
    //speed slider reset
    var id = "ol_sppp" + num;
    var el = document.getElementById(id);
    el.value = 0.5;
    csoundApp.setControlChannel(id, 0.5);
}

function fixpitch(num){
    //looper fixed pitch selector
    var id = "ol_fixp" + num;
    var el = document.getElementById(id);
    if (el.value == "fPitch") {
        el.value = "Fixed";
        el.style.background="#ff0000";
        csoundApp.setControlChannel(id, 1);
    } else {
        el.value = "fPitch";
        el.style.background="#bbbbbb";
        csoundApp.setControlChannel(id, 0);
    }
}


// Global timer to update gui
var myVar = setInterval(myTimed, 700);

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




//trackpad
//--------------------------------------------------------------------------------------------------------------


var tpParActual = [[-1, 0, 0, 0], [-1, 0, 0, 0], [-1, 0, 0, 0], [-1, 0, 0, 0]];

function createTpController(numba){
    document.write('<select id="tp_para' + numba + '" onchange="manageTpSettings(id, ' + numba + ', value)">');
    //must send value to csound to memorize and save in javascript for full control
    document.write('<option value="-1">off</option>');
    for(var i = 0; i< cc_cha_def.length; i++){
        document.write('<option value="' + i + '">' + cc_cha_def[i] + '</option>');
    }
    document.write('</select><br>');

    document.write('<select id="tp_ax' + numba + '" onchange="manageTpSettings(id, ' + numba + ', value)">');
    //must send value to csound to memorize and save in javascript for full control
    document.write('<option value="0">X</option>');
    document.write('<option value="1">Y</option>');
    document.write('</select><br>');

    document.write('<input type="number" class="head" min=0 max=1 step="0.001" value=0 id="tp_min'+ numba + '" onchange="manageTpSettings(id, ' + numba + ', value)">min<br>');
    document.write('<input type="number" class="head" min=0 max=1 step="0.001" value=0 id="tp_max'+ numba + '" onchange="manageTpSettings(id, ' + numba + ', value)">max<br>');
}

function manageTpSettings(id, ccguin, value){
    // trackpad contollers update
    //send to csound
    sliderDo(id, value);
    //update javascript midiCcActual[] for control after midi message
    var writeToJpar = 0;
    if (id.includes("tp_para")){
        writeToJpar = 0;
    } else if (id.includes("tp_ax")){
        writeToJpar = 1;
    } else if (id.includes("tp_min")){
        writeToJpar = 2;
    } else if (id.includes("tp_max")){
        writeToJpar = 3;
    }
    tpParActual[ccguin-1][writeToJpar] = parseFloat(value);
}





//initialize
//--------------------------------------------------------------------------------------------------------------

window.onload = function(){loada();};

//Channel initializations
//csoundApp.setControlChannel('bpm', 60.0);


</script>
</head>

<body>
<div class ="header">

    <div>
    <input type="number" class="head" min=20 max=400 step="any" value=60 id="bpm" onchange="changeBpm(id, value)">
    <input type="button" class="bpm" value="BpM" id="tap" onclick="set_tap(id)">
     <br>
    <input type="number" class="head" min=0 max=20 step="any" value=0 id="tailtime" onchange="numberDoLimit(id, value, 0, 20)">
    <label>Tail:</label><label id="upch">0</label>
    </div>

     <div>
     <select id="record" onchange="selectDoTime(id)">
                                      <option value="0">mixing</option>
                                      <option value="1">recording</option>
     </select>
     <input type="button" value="Save" id="save" onclick="activator(id)">
     <input type="button" value="Load" id="load" onclick="loader(id)">
     </div>

     <div>
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
     </div>

     <div>
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

</div>


<div class ="headerv">
     <div>
     <input type="button" class='viuw' value="matrix" id="matr" onclick="toggler('matrix', 'loopers', 'midiw', 'trackpad')">
     </div>
     <div>
     <input type="button" class='viuw' value="midi" id="miid" onclick="toggler('midiw', 'loopers', 'matrix', 'trackpad')">
     </div>
     <div>
     <input type="button" class='viuw' value="tpad" id="tpad" onclick="toggler('trackpad', 'midiw', 'loopers', 'matrix')">
     </div>
     <div>
     <input type="button" class='viuw' value="looper" id="looo" onclick="toggler('loopers', 'matrix', 'midiw', 'trackpad')">
     </div>
</div>

<script>

//Metronome indication
var cmetr = 0;
var metro = document.getElementById("bpm");
var val_metro =0;
var next_metro = 20;

function metronome() {
    val_metro = csoundApp.getControlChannel("metronome");
    next_metro = csoundApp.getControlChannel("nxt_metronome");
    
    if (val_metro > 0.0) {
        csoundApp.setControlChannel('metronome', 0.0);
        cmetr = (cmetr + 1) % 2;
        if (cmetr ==1) {
            metro.style.background = "#FFFFFF";
        } else {
            metro.style.background = "#DD0000";
        }
    }
    setTimeout(metronome, next_metro);
}




//generate mixer gui
document.write('<div id="matrix" class="mixer">');
for (div = 1; div <= channels; div++) {
	document.write('channel '+ div +'<br>');
              var vsl = 0;
	for (item = 0; item < channChanns.length; item++){
		var channe = channChanns[item][0].replace("_n_", div.toString());
		if (channe.indexOf("in") > -1){
			//vertical slider
            if (vsl == 0) {var vsls = "in";}
            else {var vsls = vsl.toString();}
			document.write(vsls + '<input type="range" class="vertical" min=0 max=1 value=0 step=0.001 id="' + channe +'" oninput="sliderDo(id, value)"><br>');
            vsl +=1;
		} else if (channe.indexOf("eff") > -1){
			//effect selector
			document.write('<select id="' + channe +'"onchange="effChange(id)">');
		    for (var eff =0; eff < efflist.length; eff++) {
		        document.write('<option value="' + efflist[eff][0] +'">' + efflist[eff][1] + ' </option>');
		    }
		    document.write('</select><br>');
		} else if (channe.indexOf("par") > -1){
			//effects parameters
			
			
			var parnnn = channe.substr(channe.length -1);//number of parameter

			document.write('<span id="spc'+ div + 'p'+ parnnn + '"></span><br>'+ 
						'<input type="range" min=0 max=1 value=0 step=0.0001 id="' + channe + '" oninput="sliderDoParam(id, value, '+ div.toString() +', ' + parnnn.toString() + ')"><br>');
						
						
						
			
		} else if (channe.indexOf("pan") > -1){
			//pan slider
			document.write('pan<br>'+
    			'<input type="range" min=0 max=1 value=0.5 step=0.001 id="' + channe + '" oninput="sliderDo(id, value)"><br>');
		} else if (channe.indexOf("volmat") > -1){
			//volume matrix slider
			document.write('m<input type="range" class="vertical" min=0 max=1 value=0.5 step=0.001 id="' + channe + '" oninput="sliderDo(id, value)">');
		} else if (channe.indexOf("volume") > -1){
			//volume out slider
			document.write('<input type="range" class="vertical" min=0 max=1 value=0.5 step=0.001 id="' + channe + '" oninput="sliderDo(id, value)">o<br>');
		}
	}
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
<div id="midiww">
<script>
createGuiControllerCC(5);
createGuiControllerCC(6);
createGuiControllerCC(7);
createGuiControllerCC(8);
</script>
</div>

<br><br>
fixed midi mapping<br>
PC 0 - 99 : matrix preset 0 to 99<br>

<script>
    for (var readmidit = 0; readmidit < fixedmididefs.length; readmidit++) {
        var idmid = fixedmididefs[readmidit][0];
        var msgtypestr, whatiscon

        if (fixedmididefs[readmidit][2] == 176) {
             msgtypestr="CC";
        } else if(fixedmididefs[readmidit][2] = 192){
             msgtypestr="PC";
        } else {
            msgtypestr="BHO";
        }
        if (idmid.search("looprec") >= 0) {
            whatiscon = "Looper" + idmid.substr(-1);
        } else if (idmid.search("freez") >= 0) {
            whatiscon = "Freeze" + idmid.substr(-1);
        } else if (idmid.search("tap") >= 0) {
            whatiscon = "Tap tempo";
        } else {
            msgtypestr="BHO";
        }
        document.write(whatiscon + " : " + msgtypestr + " "  + fixedmididefs[readmidit][1] + "<br>");
     }
</script>

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




<div id="trackpad">
<br>
<div>
	<canvas id="pad"></canvas>
</div>
Trackpad controls
<div id="midiww">



<script>
var canvasW = window.innerWidth* 0.98;
var canvasH = canvasW;

var pad = document.getElementById("pad");
var ctx_pad = pad.getContext("2d");
pad.width = canvasW;
pad.height = canvasH;

var left_at = findTopLeft("pad")[0];
var top_at = findTopLeft("pad")[1];

function findTopLeft(element) {
  var rec = document.getElementById(element).getBoundingClientRect();
  return [rec.left + window.scrollX, rec.top + window.scrollY];
} 


function onResaiz() {
    canvasW = window.innerWidth * 0.98;
    canvasH = canvasW
    var top_coords = findTopLeft("pad");
    top_at = top_coords[1];
    left_at = top_coords[0];
    pad.width = canvasW;
    pad.height = canvasH;
}



onResaiz();

//create gui items
createTpController(1);
createTpController(2);
createTpController(3);
createTpController(4);



function drawTp(e) {
    var touchlist = e.changedTouches;
    top_at = findTopLeft("pad")[1];
    left_at = findTopLeft("pad")[0];
    ctx_pad.clearRect(0, 0, pad.width, pad.height);

    //draw areas
    ctx_pad.strokeStyle = "#BBBBBB";
    ctx_pad.beginPath();
    ctx_pad.moveTo(pad.width*0.05, 0);
    ctx_pad.lineTo(pad.width*0.05, pad.height);
    ctx_pad.stroke();
    ctx_pad.beginPath();
    ctx_pad.moveTo(pad.width*0.95, 0);
    ctx_pad.lineTo(pad.width*0.95, pad.height);
    ctx_pad.stroke();
    ctx_pad.beginPath();
    ctx_pad.moveTo(0, pad.height*0.05);
    ctx_pad.lineTo(pad.width, pad.height* 0.05);
    ctx_pad.stroke();
    ctx_pad.beginPath();
    ctx_pad.moveTo(0, pad.height*0.95);
    ctx_pad.lineTo(pad.width, pad.height* 0.95);
    ctx_pad.stroke();
    //text
    ctx_pad.font = "20px Arial";
    ctx_pad.fillText("min", 0, pad.height * 0.5);
    ctx_pad.fillText("max", pad.width * 0.95, pad.height * 0.5);
    ctx_pad.fillText("max", pad.width * 0.5, pad.height * 0.05);
    ctx_pad.fillText("min", pad.width * 0.5, pad.height* 0.95 + 15);

    //draw touch
    var x = (touchlist[0].clientX - left_at) / pad.width;
    var y = (touchlist[0].clientY - top_at) / pad.height;

    ctx_pad.strokeStyle = "red";
    ctx_pad.lineWidth = 6;
  
    if (x >= 0 && x <= 1 && y >= 0 && y <= 1) {
         //vertical draw
         ctx_pad.beginPath();
         ctx_pad.moveTo(x * pad.width - ctx_pad.lineWidth / 2, 0);
         ctx_pad.lineTo(x * pad.width - ctx_pad.lineWidth / 2, pad.height);
         ctx_pad.stroke();
          //horizontal draw
         ctx_pad.beginPath();
         ctx_pad.moveTo(0 , y * pad.height);
         ctx_pad.lineTo(pad.width, y * pad.height);
         ctx_pad.stroke();
         //value manager
        for(var ctp = 0; ctp < 4; ctp++){
            var cnel = cc_cha_def[tpParActual[ctp][0]];
            if (cnel != "off") {
                if(tpParActual[ctp][1] == 0) {
                   tpCdispatch(ctp, x);
                } else {
                   tpCdispatch(ctp, 1.0 - y);
                }
            }
        }
    }
}




function tpCdispatch(tpparn, value){
    //send value to cc control channel
    var channel = cc_cha_def[tpParActual[tpparn][0]];
    var low = tpParActual[tpparn][2];
    var high = tpParActual[tpparn][3];
    var val = 0.0;
    //limit control - value 0-1 - value 0.1-0.9
    var value_ = 0.0;
    value_ = - 0.1 + value * 1.2;
    if (value_ < 0.0) {
        value_ = 0.0;
    } else if (value_ > 1.0) {
        value_ = 1.0;
    }
    //calculate output
    if (low < high) {
        val = low + (high- low) * value_;
    } else {
        val = low - (low - high) * value_;
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




//Bind Events
window.addEventListener("resize", onResaiz);

pad.addEventListener("touchstart", function(e) {
    drawTp(e);
    e.preventDefault();
}, false);

pad.addEventListener("touchmove" , function(e) {
    drawTp(e);
    e.preventDefault();
}, false);



</script>
</div>
</div>




<div id="loopers">
<br>
<script>
var loopersqty = 4;

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

    //Time Copy buttons
    for (var con = 1; con <= 4; con++){
        if (con != lop) {
            document.write('<input type="button" class="ttpc" value="T=' + con + '" id="ol_ticop' + con + '_' + lop + '" onclick="delayTimeCopy(' + lop + ', '  + con + ')">');
        }
    }

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

    document.write('<input type="range" class="" min=0 max=1 value=0.5 step=0.001 id="ol_sppp' +lop+ '" oninput="sliderDo(id, value)">');

    //document.write('<input type="button" class= "viuw" value="to 1" id="resetol_sppp' + lop+ '" onclick="to1(' + lop + ')">');
    document.write('<input type="button" value="to 1" id="resetol_sppp' + lop+ '" onclick="to1(' + lop + ')">');
    document.write('<input type="button" value="fPitch" id="ol_fixp' + lop+ '" onclick="fixpitch(' + lop + ')">');

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
    //document.write('<br>');
}

</script>

<div style="clear:both;"></div>
<br>
<div class="timew">
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
var freezersqty = 3;
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
#include "transferfunct.txt"
#include "looper.txt"

;MACROS see options
#include "macros.txt"

;EFFECTS see options
#include "eff_4BGEQ.txt"
#include "eff_abs.txt"
#include "eff_autofreeze.txt"
#include "eff_brandtseggcomp.txt"
#include "eff_chorus.txt"
#include "eff_clip.txt"
#include "eff_condorcab.txt"
#include "eff_degrader.txt"
#include "eff_delay.txt"
#include "eff_delaybpm.txt"
#include "eff_delaycrap.txt"
#include "eff_delayreverse.txt"
#include "eff_distortion.txt"
#include "eff_envlowpass.txt"
#include "eff_flanger.txt"
#include "eff_fmer.txt"
#include "eff_frequencyshift.txt"
#include "eff_gate.txt"
#include "eff_greenod.txt"
#include "eff_harmonizer.txt"
#include "eff_harmtrem.txt"
#include "eff_highpass.txt"
#include "eff_hilbert.txt"
#include "eff_leslie.txt"
#include "eff_lowpass.txt"
#include "eff_lpf18.txt"
#include "eff_maresciallopre.txt"
#include "eff_mix.txt"
#include "eff_nippledist.txt"
#include "eff_parametric.txt"
#include "eff_phaser.txt"
#include "eff_pitchshifter.txt"
#include "eff_pitchshifterspectral.txt"
#include "eff_powershaper.txt"
#include "eff_pseudograin.txt"
#include "eff_resonator.txt"
#include "eff_reverb.txt"
#include "eff_reverbenv.txt"
#include "eff_reverbmodulated.txt"
#include "eff_reverbshroeder.txt"
#include "eff_ringmodulator.txt"
#include "eff_shortenv.txt"
#include "eff_slow_attack.txt"
#include "eff_spectralarp.txt"
#include "eff_squarer.txt"
#include "eff_swedesaw.txt"
#include "eff_tremolo.txt"
#include "eff_tremolobpm.txt"
#include "eff_vocalfilter.txt"
#include "eff_wha.txt"





;GLOBALS

;number of channels same as js var channels
gichannels = 8


;matrix audio arrays
; 5 chain (possible simultaneous preset), 9 inputs
ga_in[][] init 5,9
ga_out[][] init 5,9


;outputs for direct, matrix, looper1, looper2 in instr 1004
gaoutMix[] init 12 + 3

gimaxDlyTime = 120
giport = 0.07
gkbpm init 60


;table to store gui values
giptab1 ftgen 5, 0, 256, -2, 0
giptab2 ftgen 6, 0, 256, -2, 0
giptab3 ftgen 7, 0, 256, -2, 0
giptab4 ftgen 8, 0, 256, -2, 0
giptab5 ftgen 9, 0, 256, -2, 0

;preset0 = mute matrix
giempty ftgen 10, 0, 256, -2, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,;0-9
    0, 0, 0, 0, 0.5, 0, 0, 0, 0, 0,;10
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,;20
    0, 0.5, 0, 0, 0, 0, 0, 0, 0, 0,;30
    0, 0, 0, 0, 0, 0, 0, 0, 0.5, 0,;40
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,;50
    0, 0, 0, 0, 0, 0.5, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,;70
    0, 0, 0.5, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0.5,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,;100
    0, 0, 0, 0, 0, 0, 0.5, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,;120
    0, 0, 0, 0.5, 0, 0, -1, 0, 0, 0,
    -1, 0, 0, 0, -1, 0, 0, 0, -1, 0,;140
    0, 0, -1, 0, 0, 0, -1, 0, 0, 0,
    -1, 0, 0, 0, -1, 0, 0, 0, -1, 0,;160
    0, 0, -1, 0, 0, 0, -1, 0, 0, 0,
    -1, 0, 0, 0, 0, 0, 0, 0, 0, 0,;180
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,;200
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,;220
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,;240
    0, 0, 0, 0, 0, 0, 0
;tables from 11 to 137 are for user presets

giSine ftgen 138, 0, 16384, 10, 1
giTriangle ftgen 139, 0, 16384, 8, 0, 2048 *2, 1, 4096*2, -1, 2048*2, 0
giSquare ftgen 140, 0, 16384, 8, 0, 10*2, 1, 4080*2, 1, 9*2, -1, 4080*2, -1, 10*2, 0

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
event_i "i", 2, 0, -1
if ktap == 1 then
     if (ktime - klasttap) < 3 then 
         gkbpm = 60 / (ktime - klasttap)
         chnset gkbpm, "bpm"
     endif
     klasttap = ktime
     chnset k(0), "tap"
     ;reset metronome
     event "i", -2, 0, -1
     event "i", 2, 0, -1
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
if kload == 1 && changed(kload)== 1 then
	event "i", -10 - 0.1 - 0.1 * kchain, 0, -1, kpreset, kchain
	event "i", -50 - 0.1 - 0.1 * kchain, 0, -1, kpreset, kchain
	event "i", -1000 - 0.1 - 0.1 * kchain, 0, -1, kpreset, kchain, gktailtime
              ;advance audio cannels p5
	kchain = (kchain + 1) % 5
              ;start new programs
	event "i", 10 + 0.1 + 0.1 * kchain, 0, -1, kpreset, kchain
	event "i", 50 + 0.1 + 0.1 * kchain, 0, -1, kpreset, kchain
	event "i", 1000 + 0.1 + 0.1 * kchain, 0, -1, kpreset, kchain, gktailtime
endif

if (ksave == 1) && (changed(ksave)== 1) && (kpreset > 0) then
    event "i", 60, 0, -1, kpreset, kchain
endif


;prepare dac/recorder outputs
galtot = 0
gartot = 0


;init instr
event_i "i", 52, 0, -1
event_i "i", 90, 0, -1, 0, 0;fixed
event_i "i", 1001, 0, -1
event_i "i", 1100, 0, -1
event_i "i", 2000, 0, -1, 0, 0

endin



instr 2;metro messages
ktrig metro 2 * gkbpm / 60
if ktrig == 1 then
    chnset k(1.0), "metronome"
endif

kphs phasor 2 * gkbpm / 60
kmill = 10 + (1-kphs) * 30000 / gkbpm
chnset kmill, "nxt_metronome"
endin



instr 10;read channels
kcol = 1
krow = 0
kindx   = 0

while kcol <= gichannels do

  ;read Matrix mixer
  ;input
  Smm sprintfk "channel%din", kcol
  kval chnget Smm
  tablew kval, kindx, 5 + p5
  kindx = kindx + 1
  ;matrix inputs
  krow = 1
  while krow <= gichannels do
    Smm sprintfk "channel%dinput%d", kcol, krow
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
    Spar sprintfk "channel%dpar%d", kcol, kpar
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
while kccidx <= 8 do
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


;TRACKPAD CONTROLLERS TO SAVE IN TABLE
ktpidx = 1
while ktpidx <= 4 do
    Stp_para sprintfk "tp_para%d", ktpidx
    ktp_para chnget Stp_para
    tablew ktp_para, kindx, 5 + p5
    kindx = kindx + 1

    Stp_ax sprintfk "tp_ax%d", ktpidx
    ktp_ax chnget Stp_ax
    tablew ktp_ax, kindx, 5 + p5
    kindx = kindx + 1

    Stp_min sprintfk "tp_min%d", ktpidx
    ktp_min chnget Stp_min
    tablew ktp_min, kindx, 5 + p5
    kindx = kindx + 1

    Stp_max sprintfk "tp_max%d", ktpidx
    ktp_max chnget Stp_max
    tablew ktp_max, kindx, 5 + p5
    kindx = kindx + 1

    ktpidx = ktpidx + 1
od

endin






instr 50;load
;print p1, p4
tableicopy p5+5, 10 + p4; destination, source
;update channels for gui
icol = 1
irow = 0
indx   = 0

while icol <= gichannels do

  ;read Matrix mixer
  ;input
  Smm sprintfk "channel%din", icol
  ival tab_i indx, 5 + p5
  chnset ival, Smm
  indx = indx + 1

  ;matrix mixer
  irow = 1
  while irow <= gichannels do
    Smm sprintfk "channel%dinput%d", icol, irow
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
    Spar sprintf "channel%dpar%d", icol, ipar
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
;print indx
;MIDI CC CONTROLLERS READ FROM TABLE
iccidx = 1
while iccidx <= 8 do
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

;TRACKPAD CONTROLLERS READ FROM TABLE
itpidx = 1
while itpidx <= 4 do
    Stp_para sprintf "tp_para%d", itpidx
    itp_para tab_i indx, 5 + p5
    chnset itp_para, Stp_para
    indx = indx + 1

    Stp_ax sprintf "tp_ax%d", itpidx
    itp_ax tab_i indx, 5 + p5
    chnset itp_ax, Stp_ax
    indx = indx + 1

    Stp_min sprintf "tp_min%d", itpidx
    itp_min tab_i indx, 5 + p5
    chnset itp_min, Stp_min
    indx = indx + 1

    Stp_max sprintf "tp_max%d", itpidx
    itp_max tab_i indx, 5 + p5
    chnset itp_max, Stp_max
    indx = indx + 1

    itpidx = itpidx + 1
od



$EFFSELECT(1)
$EFFSELECT(2)
$EFFSELECT(3)
$EFFSELECT(4)
$EFFSELECT(5)
$EFFSELECT(6)
$EFFSELECT(7)
$EFFSELECT(8)
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
    event "i", -1 * kinprev8, giport, -1, 8, p5  
endif
endin



instr 52;load presets at startup
indx  = 1
while indx < 100 do
  giiiift ftgen 10 + indx, 0, 256, -2, 0
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
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$EFF_MIX
$OUTMIXT
endin


instr 102; distortion
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_DISTORTION
$OUTMIXT
endin


instr 103;clip
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$EFF_CLIP
$OUTMIXT
endin


instr 104;abs
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$EFF_ABS
$OUTMIXT
endin


instr 105; degrader taken from Ian Mc Curdy LoFi.csd
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_DEGRADER
$OUTMIXT
endin


instr 106;powershaper
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_POWERSHAPER
$OUTMIXT
endin


instr 107;squarer
$INMIXT
;ingain
$PARAMTP(1'giport)
;slope
$PARAMTNP(2)
;envelope fixed
$PARAMTP(3'giport)
;volume
$PARAMTP(4'giport)
$EFF_SQUARER
$OUTMIXT
endin


instr 108; slow attack
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$EFF_SLOW_ATTACK
$OUTMIXT
endin


instr 109;Oeyvind Brandtsegg Compressor
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_BRANDTSEGGCOMP
$OUTMIXT
endin


instr 110;lowpass
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_LOWPASS
$OUTMIXT
endin


instr 111;highpass
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$EFF_HIGHPASS
$OUTMIXT
endin


instr 112;env lp
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_ENVLOWPASS
$OUTMIXT
endin


instr 113; lpf18
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_LPF18
$OUTMIXT
endin


instr 114;parametric
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_PARAMETRIC
$OUTMIXT
endin


instr 115;condor cab sym
$INMIXT
$PARAMTP(1'giport);scoop
$EFF_CONDORCAB
$OUTMIXT
endin


instr 116;wha
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_WHA
$OUTMIXT
endin


instr 117;vocal filter
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_VOCALFILTER
$OUTMIXT
endin


instr 119;4 bands guitar eq 20 db
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_4BGEQ
$OUTMIXT
endin


instr 120;tremolo
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_TREMOLO
$OUTMIXT
endin


instr 121;flanger
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_FLANGER
$OUTMIXT
endin


instr 122; phaser
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_PHASER
$OUTMIXT
endin


instr 123;chorus
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_CHORUS
$OUTMIXT
endin


instr 124;leslie based on Ian McCurdy Leslie.csd
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_LESLIE
$OUTMIXT
endin


instr 125;pitch shifter
$INMIXT
$PARAMTNP(1)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_PITCHSHIFTER
$PARAMVOUT(1'ktransp_)
$OUTMIXT
endin


instr 126;pitch shifter spectral
$INMIXT
$PARAMTNP(1)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_PITCHSHIFTERSPECTRAL
$PARAMVOUT(1'ksemitones)
$OUTMIXT
endin


instr 127;ringmod
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_RINGMODULATOR
$OUTMIXT
endin


instr 128;FMer
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_FMER
$OUTMIXT
endin


instr 129;hilbert
$INMIXT
;freq
$PARAMTP(1'giport)
;min shift
$PARAMTP(2'giport)
;max shift
$PARAMTP(3'giport)
;direction
$PARAMTNP(4)
$EFF_HILBERT
$OUTMIXT
endin


instr 130; delay
$INMIXT
$PARAMTP(1'giport*2)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_DELAY
$OUTMIXT
endin


instr 132;reverse delay
;taken from Ian Mc Curdy reverse.csd
$INMIXT
$PARAMTP(1'giport*2)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_DELAYREVERSE
$OUTMIXT
endin


instr 133;crapdelay
$INMIXT
$PARAMTP(1'giport*2)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_DELAYCRAP
$OUTMIXT
endin


instr 140; reverb
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_REVERB
$OUTMIXT
endin


instr 141;modulated_verb
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_REVERBMODULATED
$OUTMIXT
endin


instr 142;shroeder verb
$INMIXT
$PARAMTP(1'giport)
;revtime
$PARAMTP(2'giport)
;pretime
$PARAMTP(3'giport)
;postime
$PARAMTP(4'giport)
;d-w
$EFF_REVERBSHROEDER
$OUTMIXT
endin



instr 143;envreverb
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_REVERBENV
$OUTMIXT
endin


instr 150;spectral arpeggiator
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_SPECTRALARP
$OUTMIXT
endin


instr 151; frequency shifter
$INMIXT
;shift
$PARAMTP(1'giport)
;post gain
$PARAMTP(2'giport)
;dry-wet
$PARAMTP(3'giport)
$EFF_FREQUENCYSHIFT
$OUTMIXT
endin 




instr 152;pseudogranular
$INMIXT
$PARAMTP(1'giport*2)
$PARAMTP(2'giport*2)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_PSEUDOGRAIN
$OUTMIXT
endin


instr 153; resonator
$INMIXT
;frequency
$PARAMTP(1'giport)
;cutoff
$PARAMTP(2'giport)
;feedback
$PARAMTP(3'giport)
;dry-wet
$PARAMTP(4'giport)
$EFF_RESONATOR
$OUTMIXT
endin 


instr 155; harmonizer
$INMIXT
$PARAMTNP(1)
$PARAMTNP(2)
$PARAMTNP(3)
$EFF_HARMONIZER
$PARAMVOUT(1'ktonality)
$OUTMIXT
endin



instr 156; harmonic tremolo
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_HARMTREM
$OUTMIXT
endin


instr 160;tremoloBpm
$INMIXT
$PARAMTNP(1)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_TREMOLOBPM
$PARAMVOUT(1'kmult)
$OUTMIXT
endin


instr 161;delayBpm
$INMIXT
$PARAMTNP(1)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_DELAYBPM
$PARAMVOUT(1'kstep)
$OUTMIXT
endin


instr 170;gate
$INMIXT
$PARAMTNP(1)
$PARAMTNP(2)
$PARAMTP(3'giport)
$EFF_GATE
$OUTMIXT
endin


instr 171;shortEnv
$INMIXT
$PARAMTNP(1)
$PARAMTNP(2)
$PARAMTNP(3)
$PARAMTNP(4)
$EFF_SHORTENV
$OUTMIXT
endin


instr 172; autofreeze
$INMIXT
;threshold
$PARAMTNP(1)
;risetime
$PARAMTNP(2)
;modul
$PARAMTP(3'giport)
;trig delay
$PARAMTNP(4)
$EFF_AUTOFREEZE
$OUTMIXT
endin


instr 180;maresciallopre
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$PARAMTP(4'giport)
$EFF_MARESCIALLOPRE
$OUTMIXT
endin


instr 181;swedesaw distortion
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$PARAMTP(3'giport)
$EFF_SWEDESAW
$OUTMIXT
endin


instr 182;nippledistortion
$INMIXT
$PARAMTP(1'giport)
$PARAMTNP(2)
$PARAMTNP(3)
$PARAMTNP(4)
$EFF_NIPPLEDIST
$OUTMIXT
endin

instr 183;OVERDRIVE
$INMIXT
$PARAMTP(1'giport)
$PARAMTP(2'giport)
$EFF_GREENOD
$OUTMIXT
endin


instr 1000;output
;release with tails - for audio output
xtratim 2 * giport + p6

;output router to inputs/pan and output
$OUTLINET(1)
$OUTLINET(2)
$OUTLINET(3)
$OUTLINET(4)
$OUTLINET(5)
$OUTLINET(6)
$OUTLINET(7)
$OUTLINET(8)
almat = al1 + al2 + al3 + al4 + al5 + al6 + al7  + al8
armat = ar1 + ar2 + ar3 + ar4 + ar5 + ar6 + ar7 + ar8

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
chnset 0.5, "ol_sppp1"
chnset 0.5, "ol_sppp2"
chnset 0.5, "ol_sppp3"
chnset 0.5, "ol_sppp4"
chnset 0, "ol_fixp1"
chnset 0, "ol_fixp2"
chnset 0, "ol_fixp3"
chnset 0, "ol_fixp4"
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
kloop_in_ma port kloop_in_ma_ * kloop_in_ma_* 8, giport
galoop_in_ma AtanLimit galoop_in_ma + (aoutL + aoutR) * kloop_in_ma * kloop_in_ma
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

gffreez pvsanal ain, gifftsize, gioverlap, giwinsize, giwinshape

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
kupdate metro 1 / 0.7
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

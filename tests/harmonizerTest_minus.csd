<CsoundSynthesizer>
<CsLicense>
</CsLicense>
<CsOptions>
-iadc -odac -m1
-b256 -B512
</CsOptions>
<CsHtml5>
</CsHtml5>
<CsInstruments>
sr = 48000
ksmps = 256
nchnls_i = 1
nchnls  = 2
0dbfs = 1

instr 1
;test values
kpar1 init p4
kpar2 init p5
kpar3 init p6
;kfr_tracked init p7
ain inch 1

;tonality
ktonality = int(kpar1 * 11.1)

;interval                                   t  2  3  4, 5  6  7
iintevals ftgentmp 0, 0, 8, -2, 0, 2, 4, 5, 7, 9, 11;semitones to major
kinterval_m tab int(kpar2 * 6.1), iintevals

;octave
ksemit = int((kpar3 - 0.5) * 48)
koctave = semitone(ksemit)

iscala ftgentmp 0, 0, 16, -2, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1

;lowest f = sr / ifftsize
ifftsize  = 1024 * 2
ioverlap  = ifftsize / 4
iwinsize  = ifftsize
iwinshape = 1		;von-Hann window
fain  pvsanal ain, ifftsize, ioverlap, iwinsize, iwinshape
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

printk2 kinterval

;shift and synth
ksemitdiff port kinterval, 0.02
ikeepform init 0
kgainsh init 1
kcoefs init 100
fsig pvscale fain, semitone(ksemitdiff) * koctave, ikeepform, kgainsh, kcoefs
fsigs pvsmooth fsig, 0.9, 0.9
aout pvsynth fsigs

outs ain, aout

;printing
ktrig init 0
kprint = (ktrig == 1 ? 1 : 0)
ktrig+=1
Sprintin sprintfk "input\nkpar1 %f kpar2 %f kpar3 %f freqIn %f", kpar1, kpar2, kpar2, kfr_tracked
puts Sprintin, kprint

Sprintout sprintfk "output\ntonality %f\nknote %f\nnoteCorrected %f\ndifference from tonic %d\nkinterval %f\n\n", ktonality, knote, knote_r, kst_diff, kinterval
puts Sprintout, kprint

endin


</CsInstruments>
<CsScore>
#define DUR #180.1#


;tonality 0-c 2-d 4-e ... 11-b
;interval 0-u 1-2nd 2-3rd 3-4th 4-5th 5-6th 6-7th
#define TONALITY #0.0#
#define INTERVAL #3.0#

;                    tonality                       interval                          octave       freq 
i 1 0 $DUR.  [$TONALITY. / 11]      [$INTERVAL. / 6]          0.5             97.999
e
</CsScore>
</CsoundSynthesizer>

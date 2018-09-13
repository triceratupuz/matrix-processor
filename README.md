# Matrix Processor


## What is this
It's a csound realtime effect processor meant to be used in Csound For Android.


## Usage
Before lauching it with Csound For Android:
1. be sure that folder structure (relative paths from file mat_proc_tpz.csd) is preserved.
2. change the --omacro:GSCURDIR=/absolute/path/to/file/mat_proc_tpz/dot/csd/ in CsOptions
3. change the --env:INCRIR+=/absolute/path/to/include/directory in CsOptions

## Bugs/TO DO
1. the harmonizer doesent work properly, calculate correctly but transpose in a wrong way, in the test directory there is the same instrument as single file and this one seems to work right. To test matrix see preset
2. make synth portamento behave properly
3. manual



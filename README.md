# Matrix Processor


## What is this
It's a csound realtime effect processor meant to be used in Csound For Android.


## Usage
Before lauching it with Csound For Android:
1. be sure that folder structure (relative paths from file mat_proc_tpz.csd) is preserved.
2. change the --omacro:GSCURDIR=/absolute/path/to/file/mat_proc_tpz/dot/csd/ in CsOptions
3. change the --env:INCRIR+=/absolute/path/to/include/directory in CsOptions

## Bugs/TO DO
1. manual
2. add more effects
3. Some residual noise remain in the matrix when swithing from loud/noisy presets
4. Loopers time not memorized/updated when looper is off
5. Loopers Statr stop button update state when changing mode (man/autostart/...)


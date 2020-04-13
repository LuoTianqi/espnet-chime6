#!/bin/bash
cd 
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  set | grep SLURM | while read line; do echo "# $line"; done
  echo -n '# '; cat <<EOF
/home-4/tluo9@jhu.edu/miniconda3/bin/python correct_signals_for_clock_drift.py --session=S16 --sox_path /home-4/tluo9@jhu.edu/miniconda3/bin chime6_audio_edits.json /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/CHiME6/audio_tmp /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/CHiME6/audio 
EOF
) >/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_clock_drift.S16.log
if [ "$CUDA_VISIBLE_DEVICES" == "NoDevFiles" ]; then
  ( echo CUDA_VISIBLE_DEVICES set to NoDevFiles, unsetting it... 
  )>>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_clock_drift.S16.log
  unset CUDA_VISIBLE_DEVICES
fi
time1=`date +"%s"`
 ( /home-4/tluo9@jhu.edu/miniconda3/bin/python correct_signals_for_clock_drift.py --session=S16 --sox_path /home-4/tluo9@jhu.edu/miniconda3/bin chime6_audio_edits.json /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/CHiME6/audio_tmp /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/CHiME6/audio  ) &>>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_clock_drift.S16.log
ret=$?
sync || true
time2=`date +"%s"`
echo '#' Accounting: begin_time=$time1 >>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_clock_drift.S16.log
echo '#' Accounting: end_time=$time2 >>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_clock_drift.S16.log
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_clock_drift.S16.log
echo '#' Finished at `date` with status $ret >>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_clock_drift.S16.log
[ $ret -eq 137 ] && exit 100;
touch /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/q/done.122717
exit $[$ret ? 1 : 0]
## submitted with:
# sbatch --export=PATH  --ntasks-per-node=1  -p shared  --open-mode=append -e /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/q/correct_signals_for_clock_drift.S16.log -o /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/q/correct_signals_for_clock_drift.S16.log  /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/q/correct_signals_for_clock_drift.S16.sh >>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/q/correct_signals_for_clock_drift.S16.log 2>&1

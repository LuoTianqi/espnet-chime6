#!/bin/bash
cd /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/chime6-synchronisation
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  set | grep SLURM | while read line; do echo "# $line"; done
  echo -n '# '; cat <<EOF
/home-4/tluo9@jhu.edu/miniconda3/bin/python correct_signals_for_frame_drops.py --session=S04 chime6_audio_edits.json /data/swatana4/CHiME5/audio /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/CHiME6/audio_tmp 
EOF
) >/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S04.log
if [ "$CUDA_VISIBLE_DEVICES" == "NoDevFiles" ]; then
  ( echo CUDA_VISIBLE_DEVICES set to NoDevFiles, unsetting it... 
  )>>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S04.log
  unset CUDA_VISIBLE_DEVICES
fi
time1=`date +"%s"`
 ( /home-4/tluo9@jhu.edu/miniconda3/bin/python correct_signals_for_frame_drops.py --session=S04 chime6_audio_edits.json /data/swatana4/CHiME5/audio /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/CHiME6/audio_tmp  ) &>>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S04.log
ret=$?
sync || true
time2=`date +"%s"`
echo '#' Accounting: begin_time=$time1 >>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S04.log
echo '#' Accounting: end_time=$time2 >>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S04.log
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S04.log
echo '#' Finished at `date` with status $ret >>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S04.log
[ $ret -eq 137 ] && exit 100;
touch /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/q/done.183438
exit $[$ret ? 1 : 0]
## submitted with:
# sbatch --export=PATH  --ntasks-per-node=1  -p shared  --open-mode=append -e /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/q/correct_signals_for_frame_drops.S04.log -o /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/q/correct_signals_for_frame_drops.S04.log  /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/q/correct_signals_for_frame_drops.S04.sh >>/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime6/asr1/exp/chime6_data/q/correct_signals_for_frame_drops.S04.log 2>&1

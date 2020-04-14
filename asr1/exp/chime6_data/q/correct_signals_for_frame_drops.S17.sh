#!/bin/bash
cd /scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/chime6-synchronisation
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  set | grep SLURM | while read line; do echo "# $line"; done
  echo -n '# '; cat <<EOF
/home-4/tluo9@jhu.edu/miniconda3/bin/python correct_signals_for_frame_drops.py --session=S17 chime6_audio_edits.json /data/swatana4/CHiME5/audio /data/swatana4/CHiME6/audio_tmp 
EOF
) >/scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S17.log
if [ "$CUDA_VISIBLE_DEVICES" == "NoDevFiles" ]; then
  ( echo CUDA_VISIBLE_DEVICES set to NoDevFiles, unsetting it... 
  )>>/scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S17.log
  unset CUDA_VISIBLE_DEVICES
fi
time1=`date +"%s"`
 ( /home-4/tluo9@jhu.edu/miniconda3/bin/python correct_signals_for_frame_drops.py --session=S17 chime6_audio_edits.json /data/swatana4/CHiME5/audio /data/swatana4/CHiME6/audio_tmp  ) &>>/scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S17.log
ret=$?
sync || true
time2=`date +"%s"`
echo '#' Accounting: begin_time=$time1 >>/scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S17.log
echo '#' Accounting: end_time=$time2 >>/scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S17.log
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>/scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S17.log
echo '#' Finished at `date` with status $ret >>/scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/exp/chime6_data/correct_signals_for_frame_drops.S17.log
[ $ret -eq 137 ] && exit 100;
touch /scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/exp/chime6_data/q/done.111779
exit $[$ret ? 1 : 0]
## submitted with:
# sbatch --export=PATH  --ntasks-per-node=1  -p shared  --open-mode=append -e /scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/exp/chime6_data/q/correct_signals_for_frame_drops.S17.log -o /scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/exp/chime6_data/q/correct_signals_for_frame_drops.S17.log  /scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/exp/chime6_data/q/correct_signals_for_frame_drops.S17.sh >>/scratch/groups/swatana4/tluo/espnet-4-13/egs/chime6/asr1/exp/chime6_data/q/correct_signals_for_frame_drops.S17.log 2>&1

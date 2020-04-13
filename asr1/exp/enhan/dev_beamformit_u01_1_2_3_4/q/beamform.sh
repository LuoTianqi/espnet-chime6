#!/bin/bash
cd /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime5/asr1
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  set | grep SLURM | while read line; do echo "# $line"; done
  echo -n '# '; cat <<EOF
exp/enhan/dev_beamformit_u01_1_2_3_4/log/beamform.${SLURM_ARRAY_TASK_ID}.sh 
EOF
) >exp/enhan/dev_beamformit_u01_1_2_3_4/log/beamform.$SLURM_ARRAY_TASK_ID.log
if [ "$CUDA_VISIBLE_DEVICES" == "NoDevFiles" ]; then
  ( echo CUDA_VISIBLE_DEVICES set to NoDevFiles, unsetting it... 
  )>>exp/enhan/dev_beamformit_u01_1_2_3_4/log/beamform.$SLURM_ARRAY_TASK_ID.log
  unset CUDA_VISIBLE_DEVICES
fi
time1=`date +"%s"`
 ( exp/enhan/dev_beamformit_u01_1_2_3_4/log/beamform.${SLURM_ARRAY_TASK_ID}.sh  ) &>>exp/enhan/dev_beamformit_u01_1_2_3_4/log/beamform.$SLURM_ARRAY_TASK_ID.log
ret=$?
sync || true
time2=`date +"%s"`
echo '#' Accounting: begin_time=$time1 >>exp/enhan/dev_beamformit_u01_1_2_3_4/log/beamform.$SLURM_ARRAY_TASK_ID.log
echo '#' Accounting: end_time=$time2 >>exp/enhan/dev_beamformit_u01_1_2_3_4/log/beamform.$SLURM_ARRAY_TASK_ID.log
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/enhan/dev_beamformit_u01_1_2_3_4/log/beamform.$SLURM_ARRAY_TASK_ID.log
echo '#' Finished at `date` with status $ret >>exp/enhan/dev_beamformit_u01_1_2_3_4/log/beamform.$SLURM_ARRAY_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch exp/enhan/dev_beamformit_u01_1_2_3_4/q/done.21987.$SLURM_ARRAY_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# sbatch --export=PATH  --ntasks-per-node=1  -p express  --open-mode=append -e exp/enhan/dev_beamformit_u01_1_2_3_4/q/beamform.log -o exp/enhan/dev_beamformit_u01_1_2_3_4/q/beamform.log --array 1-2 /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime5/asr1/exp/enhan/dev_beamformit_u01_1_2_3_4/q/beamform.sh >>exp/enhan/dev_beamformit_u01_1_2_3_4/q/beamform.log 2>&1

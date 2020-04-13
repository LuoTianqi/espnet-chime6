while read line; do
  /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/ci/tools/kaldi/tools/BeamformIt/BeamformIt -s $line -c exp/enhan/dev_beamformit_u04_1_2_3_4/channels_4     --config_file /home-net/home-4/tluo9@jhu.edu/tluo9/espnet/egs/chime5/asr1/conf/beamformit.cfg     --source_dir /data/swatana4/CHiME5/audio/dev     --result_dir enhan/dev_beamformit_u04
done < exp/enhan/dev_beamformit_u04_1_2_3_4/wavfiles.list.2

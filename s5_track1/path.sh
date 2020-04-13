export KALDI_ROOT=/home-net/home-4/tluo9@jhu.edu/tluo9/espnet/ci/tools/kaldi/
[ -f $KALDI_ROOT/tools/env.sh ] && . $KALDI_ROOT/tools/env.sh
export PATH=$PWD/utils/:$KALDI_ROOT/tools/openfst/bin:$PWD:$PATH
[ ! -f $KALDI_ROOT/tools/config/common_path.sh ] && echo >&2 "The standard file $KALDI_ROOT/tools/config/common_path.sh is not present -> Exit!" && exit 1
. $KALDI_ROOT/tools/config/common_path.sh
export LC_ALL=C

LD_LIBRARY_PATH=/software/apps/anaconda/2019.03/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH




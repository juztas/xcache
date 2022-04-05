#!/bin/sh
MAINDIR=`dirname "$(readlink -f "$0")"`

source /cvmfs/cms.cern.ch/cmsset_default.sh
source /cvmfs/cms.cern.ch/rucio/setup-py3.sh


if [[ -f $MAINDIR/conf/rucio.cfg ]]; then
    mkdir -p ~/.rucio/integration/etc/
    cp $MAINDIR/conf/rucio.cfg ~/.rucio/integration/etc/
    export RUCIO_HOME=~/.rucio/integration/
fi

export RUCIO_ACCOUNT="jbalcas"
export X509_USER_PROXY="/etc/grid-security/x509-$RUCIO_ACCOUNT"

while true
do
    #$MAINDIR/xcache-rucio-cms --adler rucio --root-dir /xcache-root --rse T3_US_OSG_SoCal_Cache --debug DEBUG --only-files-from-dir /store/data/Run2016F/MuonEG/MINIAOD/HIPM_UL2016_MiniAODv2-v2/
    $MAINDIR/xcache-rucio-cms --adler rucio --root-dir /xcache-root --rse T3_US_OSG_SoCal_Cache --debug DEBUG
    sleep 360
done



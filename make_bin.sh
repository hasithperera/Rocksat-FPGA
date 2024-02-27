## author: Hasith Perera
# make bin file and copy to RP
# ip is in hosts file as rp
# bin file path /opt/data/bin

cd redpitaya.runs/impl_1
echo -n "all:{ red_pitaya_top_Z20.bit }" >  red_pitaya_top.bif
bootgen -image red_pitaya_top.bif -arch zynq -process_bitstream bin -w

ll /red_pitaya_top_Z20.bit.bin
scp ./red_pitaya_top_Z20.bit.bin root@rp:/opt/data/bin/test$1.bin
 

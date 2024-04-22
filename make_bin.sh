## author: Hasith Perera
# make bin file and copy to RP
# ip is in hosts file as rp
# bin file path /opt/data/bin

cd ./redpitaya.runs/impl_1
pwd
echo "done"
echo -n "all:{ red_pitaya_top_Z20.bit }" >  red_pitaya_top.bif
ls -lah red_pitaya_top.bif
bootgen -image red_pitaya_top.bif -arch zynq -process_bitstream bin -w

ls -lah ./red_pitaya_top_Z20.bit.bin
scp ./red_pitaya_top_Z20.bit.bin root@rp:/opt/data/bin/test$1.bin

# add main programs to git for backup
#git add redpitaya.srcs/sources_1/imports/RedPitaya-FPGA/prj/v0.94/rtl/red_pitaya_top_Z20.sv
#git add ./redpitaya.srcs/sources_1/new


#git commit -m "Autobackup on bin file generation v$1"

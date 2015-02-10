#!/bin/sh -e
#
# create sd card for raspberry pi. needs to sudo. output to /tmp/sdcard.out
#
# create a disk file sdcard.img
#   configure 2 partitions
#   make first partition msdos; copy firmware there
#   make second partition ext4; copy rootfs there

IMAGE_DIR="output/images"
SDCARD_IMAGE="sdcard.img"

FORCE=false

while [ $# -gt 0 ]; do
    option="$1"
    case "$option" in
    -f) FORCE=true;
        shift;;
    -*) echo "usage: sdcard [ -f ]" 1>&2
        exit 2;;
    *) break;;
    esac
done

# remove image first if force
if [ "${FORCE}" = "true" ]; then
    rm -f "${SDCARD_IMAGE}"
fi

if [ -f ${SDCARD_IMAGE} ]; then
    echo "error: sdcard already exists" 1>&2
    exit 1
fi

# create a 500M disk
dd if=/dev/zero of=${SDCARD_IMAGE} bs=1024 count=500K > /tmp/sdcard.out 2>&1

# partition disk - 2 partitions, 1st vfat, 2nd ext4
sfdisk --in-order --Linux --unit M ${SDCARD_IMAGE} <<EOF
1,48,0xc,*
,,,-
EOF


# lo setup
sudo kpartx -av ${SDCARD_IMAGE}


# setup linux partition
MNTPT="/tmp/sdcard"
mkdir -p "${MNTPT}"
sudo /sbin/mkfs -t ext4 -L rootfs /dev/mapper/loop0p2
sudo /bin/mount /dev/mapper/loop0p2 "${MNTPT}"
cat ${IMAGE_DIR}/rootfs.tar | ( cd ${MNTPT}; sudo tar xf - )
sudo /bin/umount ${MNTPT}

# setup dos partition
sudo /sbin/mkdosfs /dev/mapper/loop0p1
sudo /bin/mount /dev/mapper/loop0p1 "${MNTPT}"

sudo cp ${IMAGE_DIR}/rpi-firmware/* ${MNTPT}
sudo cp ${IMAGE_DIR}/zImage ${MNTPT}; sleep 1
sudo /bin/umount ${MNTPT}

# undo lo
sudo kpartx -dv ${SDCARD_IMAGE}

echo "sdcard is ready at ${SDCARD_IMAGE}.gz" 1>&2

exit 0


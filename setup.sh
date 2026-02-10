#!/bin/bash
set -e

#make sure old trees are gone
rm -rf device/realme/ferrari
rm -rf device/oneplus/sm8450-common
rm -rf vendor/realme/ferrari
rm -rf vendor/oneplus/sm8450-common
rm -rf kernel/oneplus/sm8450
rm -rf kernel/oneplus/sm8450-modules
rm -rf kernel/oneplus/sm8450-devicetrees
rm -rf hardware/oplus

#device-tree
git clone https://github.com/asmodeus-oos/android_device_realme_ferrari.git -b lineage-23.2 device/realme/ferrari
git clone https://github.com/asmodeus-oos/android_device_oneplus_sm8450-common.git -b lineage-23.2 device/oneplus/sm8450-common

#vendor
git clone https://gitlab.com/asmodeus-oos/proprietary_vendor_realme_ferrari.git -b lineage-23.2 vendor/realme/ferrari
git clone https://gitlab.com/asmodeus-oos/proprietary_vendor_oneplus_sm8450-common.git -b lineage-23.2 vendor/oneplus/sm8450-common

#kernel
git clone https://github.com/asmodeus-oos/android_kernel_oneplus_sm8450.git -b lineage-23.2 kernel/oneplus/sm8450
git clone https://github.com/asmodeus-oos/android_kernel_oneplus_sm8450-modules.git -b lineage-23.2 kernel/oneplus/sm8450-modules
git clone https://github.com/asmodeus-oos/android_kernel_oneplus_sm8450-devicetrees.git -b lineage-23.2 kernel/oneplus/sm8450-devicetrees

#hardware
git clone https://github.com/asmodeus-oos/android_hardware_oplus.git -b lineage-23.2 hardware/oplus

#Patches
cd hardware/qcom-caf/sm8450/audio/agm
git fetch https://github.com/LineageOS/android_vendor_qcom_opensource_agm refs/changes/20/417220/3 && git cherry-pick FETCH_HEAD
cd ../../display
git fetch https://github.com/LineageOS/android_hardware_qcom_display refs/changes/30/432430/9 && git cherry-pick FETCH_HEAD
git fetch https://github.com/LineageOS/android_hardware_qcom_display refs/changes/31/432431/12 && git cherry-pick FETCH_HEAD
git fetch https://github.com/LineageOS/android_hardware_qcom_display refs/changes/32/432432/10 && git cherry-pick FETCH_HEAD
cd ../../../../

#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL geehrc devices, and
# are also specific to geehrc devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    charger_res_images

PRODUCT_COPY_FILES += \
	device/lge/gproj-common/init.gee-common.rc:root/init.gee-common.rc \
	device/lge/gproj-common/init.gee.usb.rc:root/init.gee.usb.rc

PRODUCT_COPY_FILES += \
	device/lge/gproj-common/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
	device/lge/gproj-common/qosmgr_rules.xml:system/etc/qosmgr_rules.xml

PRODUCT_COPY_FILES += \
	device/lge/gproj-common/media_profiles.xml:system/etc/media_profiles.xml \
	device/lge/gproj-common/media_codecs.xml:system/etc/media_codecs.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
	device/lge/gproj-common/kickstart_checker.sh:system/etc/kickstart_checker.sh

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
	device/lge/gproj-common/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
	device/lge/gproj-common/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
	device/lge/gproj-common/hs_detect.kcm:system/usr/keychars/hs_detect.kcm \
	device/lge/gproj-common/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm

# Prebuilt input device calibration files
PRODUCT_COPY_FILES += \
	device/lge/gproj-common/touch_dev.idc:system/usr/idc/touch_dev.idc \
	device/lge/gproj-common/touch_dev.kl:system/usr/keylayout/touch_dev.kl

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# GPS configuration
PRODUCT_COPY_FILES += \
	device/lge/gproj-common/gps.conf:system/etc/gps.conf

# NFC packages
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/nfc/nfcee_access_debug.xml
endif

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck

PRODUCT_PACKAGES += \
	libgenlock \
	liboverlay \
	hwcomposer.msm8960 \
	gralloc.msm8960 \
	copybit.msm8960 \
	memtrack.msm8960

PRODUCT_PACKAGES += \
	audio_policy.msm8960 \
	audio.primary.msm8960 \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler

# Voice processing
PRODUCT_PACKAGES += \
	libqcomvoiceprocessing

PRODUCT_COPY_FILES += \
	device/lge/gproj-common/audio_effects.conf:system/vendor/etc/audio_effects.conf

PRODUCT_PACKAGES += \
	libmm-omxcore \
	libdivxdrmdecrypt \
	libOmxVdec \
	libOmxVenc \
	libOmxCore \
	libstagefrighthw \
	libc2dcolorconvert

PRODUCT_PACKAGES += \
	libloc_adapter \
	libloc_eng \
	libloc_api_v02 \
	libgps.utils \
	gps.msm8960

PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

PRODUCT_COPY_FILES += \
	device/lge/gproj-common/fetch-swv:system/bin/fetch-swv

$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)

# This is the mako-specific audio package
$(call inherit-product, frameworks/base/data/sounds/AudioPackage10.mk)

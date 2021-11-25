#
# Copyright (C) 2021 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Get non-open-source specific aspects
#$(call inherit-product, vendor/xiaomi/mojito/mojito-vendor.mk)

include kernel/xiaomi/mojito/Android.mk

# API
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_SHIPPING_API_LEVEL := 30

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Bluetooth
#PRODUCT_PACKAGES += \
    BluetoothQti \
    com.qualcomm.qti.bluetooth_audio@1.0 \
    vendor.qti.hardware.bluetooth_audio@2.0 \
    vendor.qti.hardware.btconfigstore@1.0 \
    vendor.qti.hardware.btconfigstore@2.0

PRODUCT_PACKAGES += \
    libbluetooth_qti \
    libbtconfigstore \
    bt_configstore.conf

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Camera
PRODUCT_PACKAGES += \
    Snap \
    vendor.qti.hardware.camera.device@1.0

# Configstore
PRODUCT_PACKAGES += \
    vendor.qti.hardware.capabilityconfigstore@1.0

# Cryptfs
#PRODUCT_PACKAGES += \
    libcryptfs_hw \
    vendor.qti.hardware.cryptfshw@1.0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig.qti \
    libgralloc.qti \
    libqdMetaData \
    libqdMetaData.system \
    libvulkan \
    vendor.display.config@1.0 \
    vendor.display.config@2.0 \
    vendor.qti.hardware.display.composer@3.0

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Framework detect
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect \
    libvndfwk_detect_jni.qti

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0

# Init scripts
PRODUCT_PACKAGES += \
    init.recovery.qcom.sh \
    init.recovery.qcom.rc

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.qti

# Media
PRODUCT_PACKAGES += \
    libavservices_minijail

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    AospFrameworkResOverlay \
    AospWifiResOverlay \
    DevicesAndroidOverlay \
    DevicesOverlay \
    ElderlyNavigationBarOverlay \
    FrameworksResTarget \
    GestureLineOverlay \
    MccMncOverlay \
    MiuiBiometricResOverlay \
    MiuiBluetoothOverlay \
    MiuiFrameworkResOverlay \
    MiuiSettingsResOverlay \
    MiuiSystemUIResOverlay \
    NetworkStackOverlay \
    WifiResTarget

PRODUCT_PACKAGES += \
    NotchBarKiller

# Perf
PRODUCT_PACKAGES += \
    vendor.qti.hardware.perf@2.2

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.default:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.default

# RCS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/bootctrl

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.mojito

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

#PRODUCT_BOOT_JARS += \
#    telephony-ext

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-qti.xml

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Vendor overlay
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/vendor-overlay/,$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION))

# WiFi
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    WifiOverlay

# WiFi Display
PRODUCT_PACKAGES += \
    libnl

#PRODUCT_BOOT_JARS += \
#    WfdCommon

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-wfd.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-wfd.xml

PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display

ALLOW_MISSING_DEPENDENCIES := true

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
BOARD_USES_QCOM_FBE_DECRYPTION := true

TARGET_RECOVERY_DEVICE_MODULES += libion libandroidicu vendor.display.config@1.0 vendor.display.config@2.0 libdisplayconfig.qti vendor.qti.hardware.vibrator.service vendor.qti.hardware.vibrator.impl libqtivibratoreffect

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 1200
TW_Y_OFFSET := 91
TW_H_OFFSET := -91
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_NO_SCREEN_BLANK := true
TW_EXCLUDE_APEX := true

# Vibrator
TW_SUPPORT_INPUT_AIDL_HAPTICS := true

RECOVERY_BINARY_SOURCE_FILES += \
    $(TARGET_OUT_VENDOR_EXECUTABLES)/hw/vendor.qti.hardware.vibrator.service

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/vendor.qti.hardware.vibrator.impl.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libqtivibratoreffect.so

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/mojito/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

ENABLE_VIRTUAL_AB := true



$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/qcom/qssi/qssi-vendor.mk)

ALLOW_MISSING_DEPENDENCIES := true

TARGET_SYSTEM_PROP := device/GM/GM8_sprout/system.prop

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1440

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@4.0 \
    android.hardware.audio.common@4.0 \
    android.hardware.audio.common@4.0-util \
    android.hardware.audio.effect@4.0 \
    libaudio-resampler \
    tinymix

# Boot control
PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Camera
PRODUCT_PACKAGES += \
    Snap

# Specific init 
PRODUCT_PACKAGES += \
    init.device.config.rc

# Display
PRODUCT_PACKAGES += \
    vendor.display.config@1.0
	
# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio
	
# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:system/etc/fstab.qcom

# Dummy file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/dummy:system/etc/dummy

PRODUCT_BOOT_JARS += \
    qcom.fmradio

# Power hal (for DT2W feature)
PRODUCT_PACKAGES += \
    power.qcom

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0_system

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.device

# Doze
PRODUCT_PACKAGES += \
    Doze

# QCOM
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

# Telephony
PRODUCT_BOOT_JARS += \
    telephony-ext
	
# Update engine
PRODUCT_PACKAGES += \
    brillo_update_payload \
    update_engine \
    update_verifier

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.msm8937 \
    libcutils \
    libgptutils \
    libz

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# VNDK-SP
PRODUCT_PACKAGES += \
    vndk-sp

# WFD
PRODUCT_PACKAGES += \
    libnl \
    libwfdaac


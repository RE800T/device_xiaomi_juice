#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Inherit from vendor if exists
$(call inherit-product-if-exists, vendor/xiaomi/juice/juice-vendor.mk)

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 29

# Target VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# Partition
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    vendor/qcom/opensource/dataservices \
    vendor/qcom/opensource/data-ipa-cfg-mgr \
    hardware/xiaomi \
    packages/apps/Bluetooth

# Add default implementation of fastboot HAL.
PRODUCT_PACKAGES += android.hardware.fastboot@1.0-impl-mock
PRODUCT_PACKAGES += fastbootd

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep \
    Settings \
    SystemUI

# ANT
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant.antradio_library \
    com.dsi.ant@1.0

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.common@6.0 \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio.effect@6.0 \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    android.hardware.audio@2.0-service \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@6.0 \
    android.hardware.audio@6.0-impl \

PRODUCT_PACKAGES += \
    vendor.qti.hardware.audiohalext@1.0 \
    vendor.qti.hardware.audiohalext@1.0.vendor\
    vendor.qti.hardware.audiohalext-utils

PRODUCT_PACKAGES += \
    audio.a2dp.bengal \
    audio.a2dp.default \
    audio.primary.bengal \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default \

PRODUCT_PACKAGES += \
    libaudio-resampler \
    libbatterylistener \
    libcirrusspkrprot \
    libcomprcapture \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libsndmonitor \
    libspkrprot \
    libtinycompress \
    libtinycompress.vendor \
    libvolumelistener

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_configs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs.xml \
    $(LOCAL_PATH)/configs/audio/audio_configs_stock.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs_stock.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_log.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/audio_log.cfg \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_idp.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_scubaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_scubaidp.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_scubaqrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_scubaqrd.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_idp.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_scubaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_scubaidp.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_scubaqrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_scubaqrd.xml \
    $(LOCAL_PATH)/configs/audio/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth@1.1.vendor \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.bluetooth.a2dp@1.0-impl \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor

PRODUCT_PACKAGES += \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

PRODUCT_PACKAGES += \
    libldacBT_enc \
    libldacBT_abr \
    libbt-vendor

# Perf
PRODUCT_PACKAGES += \
    vendor.qti.hardware.perf@2.2.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perf/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf \
    $(LOCAL_PATH)/configs/perf/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.common@1.0 \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    android.hardware.camera.provider@2.4-external \
    android.hardware.camera.provider@2.4-legacy \
    android.hardware.camera.provider@2.5 \
    android.hardware.camera.provider@2.6 \
    android.hardware.camera.device@1.0 \
    android.hardware.camera.device@3.2 \
    android.hardware.camera.device@3.3 \
    android.hardware.camera.device@3.4 \
    android.hardware.camera.device@3.5 \
    android.hardware.camera.device@3.6

PRODUCT_PACKAGES += \
   vendor.qti.hardware.camera.postproc@1.0.vendor

PRODUCT_PACKAGES += \
    libcamera2ndk_vendor \
    libdng_sdk.vendor \
    libstdc++.vendor \
    libgui_vendor \
    libxml2

# Charger
PRODUCT_PACKAGES += \ libsuspend

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1 \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.2 \
    android.hardware.graphics.composer@2.2-impl \
    android.hardware.graphics.composer@2.3 \
    android.hardware.graphics.composer@2.3-impl \
    android.hardware.graphics.composer@2.4 \
    android.hardware.graphics.composer@2.4-impl \
    android.hardware.graphics.allocator@2.0 \
    android.hardware.graphics.allocator@3.0 \
    android.hardware.graphics.allocator@4.0 \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

PRODUCT_PACKAGES += \
    vendor.display.config@1.15 \
    vendor.display.config@1.15.vendor \
    vendor.display.config@2.0 \
    vendor.display.config@2.0.vendor \
    vendor.qti.hardware.display.composer-service \
    vendor.qti.hardware.display.composer@1.0.vendor \
    vendor.qti.hardware.display.composer@2.0.vendor \
    vendor.qti.hardware.display.composer@3.0 \
    vendor.qti.hardware.display.composer@3.0.vendor \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.allocator@1.0.vendor \
    vendor.qti.hardware.display.allocator@3.0.vendor \
    vendor.qti.hardware.display.allocator@4.0.vendor \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \
    vendor.qti.hardware.capabilityconfigstore@1.0-service \
    vendor.qti.hardware.capabilityconfigstore@1.0.vendor

PRODUCT_PACKAGES += \
    memtrack.bengal \
    gralloc.bengal \
    hwcomposer.bengal \

PRODUCT_PACKAGES += \
    libdisplayconfig.qti \
    libdisplayconfig.qti.vendor \
    libqdMetaData \
    libsdmcore \
    libsdmutils \
    libtinyxml

PRODUCT_PACKAGES += \
    libvulkan \
    vulkan.bengal

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml

# OMX
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# QMI
PRODUCT_PACKAGES += \
    libjson \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

# Matlog
PRODUCT_PACKAGES += \
    matlog

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

# iR Blaster
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3-service.clearkey \
    android.hardware.drm@1.3-service.widevine

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

# Cas
PRODUCT_PACKAGES += \
    android.hardware.cas@1.2-service

# Gnss
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1-service-qti

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.xiaomi-libperfmgr

# Power Stats
PRODUCT_PACKAGES += \
    android.hardware.power.stats@1.0-service.mock

# Usb
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.xiaomi_bengal

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service

PRODUCT_PACKAGES += \
    lights.bengal

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service.xiaomi_bengal \
    vendor.qti.hardware.vibrator-impl

PRODUCT_PACKAGES += \
   vibrator.default

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor

PRODUCT_PACKAGES += \
    libbase \
    libbase.vendor \
    libhardware \
    libhardware.vendor \
    libhidlbase \
    libhidlbase.vendor \
    libhidltransport \
    libhidltransport.vendor\
    liblog \
    liblog.vendor \
    libhwbinder \
    libhwbinder.vendor \
    libutils \
    libutils.vendor

PRODUCT_PACKAGES +=  matlog

# Perf
PRODUCT_PACKAGES += \
    libqti-perfd-client

# Service Tracker
PRODUCT_PACKAGES += \
    vendor.qti.hardware.servicetracker@1.2-service \
    vendor.qti.hardware.servicetracker@1.2-impl \
    vendor.qti.hardware.servicetracker@1.2.vendor \

# Media
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libavservices_minijail.vendor \
    libavservices_minijail_vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v1.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v2.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v1.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v2.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_scuba.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_scuba.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/configs/media/system_properties.xml:$(TARGET_COPY_OUT_VENDOR)/etc/system_properties.xml

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sensors.hal_trigger_ssr=false \
    persist.vendor.sensors.odl.adsp=true \
    persist.vendor.sensors.enable.rt_task=false \
    persist.vendor.sensors.support_direct_channel=false \
    persist.vendor.sensors.enable.bypass_worker=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml

PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal \
    libsensorndkbridge

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.default:$(TARGET_COPY_OUT_RAMDISK)/fstab.default

# Ramdisk
PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.mi.btmac.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh \
    init.qti.dcvs.sh \

PRODUCT_PACKAGES += \
    init.qcom.factory.rc \
    init.mi.btmac.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.qti.ufs.rc \
    init.stnfc.rc \
    init.target.rc \
    fstab.default \
    fstab.emmc \
    ueventd.qcom.rc

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    $(LOCAL_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/configs/gps/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(LOCAL_PATH)/configs/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(LOCAL_PATH)/configs/gps/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

# keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-focal.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-focal.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-cdfinger.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-cdfinger.kl

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/seccomp/atfwd@2.0.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/atfwd@2.0.policy \
    $(LOCAL_PATH)/configs/seccomp/configstore@1.1.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/configstore@1.1.policy \
    $(LOCAL_PATH)/configs/seccomp/imsrtp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/imsrtp.policy \
    $(LOCAL_PATH)/configs/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/configs/seccomp/qspm.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/qspm.policy \
    $(LOCAL_PATH)/configs/seccomp/qti-systemd.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/qti-systemd.policy \
    $(LOCAL_PATH)/configs/seccomp/vendor.qti.hardware.dsp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/vendor.qti.hardware.dsp.policy \
    $(LOCAL_PATH)/configs/seccomp/wfdhdcphalservice.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/wfdhdcphalservice.policy \
    $(LOCAL_PATH)/configs/seccomp/wfdvndservice.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/wfdvndservice.policy \
    $(LOCAL_PATH)/configs/seccomp/wifidisplayhalservice.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/wifidisplayhalservice.policy

# Exclude sensor from InputManager
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# QTI
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/privapp-permissions-qti.xml

# IRQ & IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    vendor.qti.hardware.wifi.hostapd@1.2.vendor \
    vendor.qti.hardware.wifi.supplicant@2.2.vendor \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml

# WiFi Display
PRODUCT_PACKAGES += \
    libnl \
    libwfdaac_vendor

PRODUCT_BOOT_JARS += \
    WfdCommon

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# RIL
PRODUCT_PACKAGES += \
    CarrierConfigOverlay \
    libjson \
    libril \
    librilutils \
    librmnetctl \
    rmnetctl \
    rmnetcli

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service \
    thermal.bengal

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0 \
    android.hardware.nfc@1.0-service \
    android.hardware.secure_element@1.0-service \
    NfcNci \
    Tag \
    SecureElement \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/nfc/libnfc-nxp-pnscr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-pnscr.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml


# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Telephony
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3-service-qti

PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Overlays
PRODUCT_PACKAGES += \
    WifiResCommon \
    AospWifiResOverlay \
    JuiceSystemUI \
    JuiceFrameworks

# Use 64-bit dex2oat for better dexopt time.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat64.enabled=true

# Dirac
PRODUCT_PACKAGES += \
    Dirac

# path to Dirac
$(call inherit-product, vendor/xiaomi/dirac/dirac.mk)

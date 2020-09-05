DEVICE_PATH := device/bq/aquaris_m8

# Call the Vendor Makefile
$(call inherit-product, vendor/bq/aquaris_m8/aquaris_m8-vendor.mk)

# Call the mt8163-common Vendor Makefile
include vendor/bq/mt8163/mt8163-vendor.mk

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# HIDL (HAL Interface Definition Language)
-include $(DEVICE_PATH)/hidl.mk

# GC
PRODUCT_TAGS += dalvik.gc.type-precise

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

# Display/Screen
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Recovery allowed devices (assert)
TARGET_OTA_ASSERT_DEVICE := Aquaris_M8,aquaris_m8,karin

# Camera
PRODUCT_PACKAGES += \
    Snap \
    libcamera_parameters_mtk

# GPS
PRODUCT_PACKAGES += \
    YGPS \
    libcurl \
    gps.mt8163

# GPS force mode
PRODUCT_PROPERTY_OVERRIDES += \
    persist.force.gps.mode=gnss

# MNLD (GPS)
ifeq ($(TARGET_PROVIDES_MNLD_HAL),false) 
PRODUCT_PACKAGES += \
    libmnl \
    mnld \
    libDR \
    libgeofence \
    libhostill \
    libsupl
endif

# GPS Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/agps_profiles_conf2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/agps_profiles_conf2.xml \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/ecc_list.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list.xml \
    $(LOCAL_PATH)/configs/gps/spn-conf.xml:$(TARGET_COPY_OUT_VENDOR)/etc/spn-conf.xml

# Power
PRODUCT_PACKAGES += power.mt8163

# Lights
PRODUCT_PACKAGES += lights.mt8163

# WPA Supplicant Libraries
PRODUCT_PACKAGES += lib_driver_cmd_mt66xx

# Network/Wi-Fi
PRODUCT_PACKAGES += \
    netd \
    wpa_supplicant \
    wpa_cli \
    hostapd \
    hostapd_cli \
    wificond \
    wifilogd

# Wifi Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

# Graphics
PRODUCT_PACKAGES += \
    libGLES_android \
    libgralloc_extra \
    libion \
    libgui_ext \
    libui_ext

# Bluetooth Packages
PRODUCT_PACKAGES += \
    libbluetooth_mtk \
    libbt-vendor

# Bluetooth Default Address
PRODUCT_PROPERTY_OVERRIDES += ro.boot.btmacaddr=00:00:00:00:00:00

# DRM
PRODUCT_PACKAGES += \
    libdrm \
    libmockdrmcryptoplugin \
    libdrmclearkeyplugin

# FM Radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmcust

# Enable StagefrightCodec 2.0
PRODUCT_PACKAGES += libstagefright_ccodec

# Audio Packages
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.stub \
    libaudio-resampler \
    libtinyalsa \
    libtinyxml \
    tinymix

# Audio Policy
PRODUCT_COPY_FILES += \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml

# Audio Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_device.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_device.xml \
    $(LOCAL_PATH)/configs/audio/audio_em.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_em.xml \
    $(LOCAL_PATH)/configs/audio/AudioParamOptions.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_param/AudioParamOptions.xml

# XML Parser
PRODUCT_PACKAGES += libxml2

# USB
PRODUCT_PACKAGES += com.android.future.usb.accessory

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/rootdir,root)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.location.gps.xml

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_video_le.xml \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_mediatek_video.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_mediatek_audio.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_mediatek_audio.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media/mtk_omx_core.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mtk_omx_core.cfg

# Media Overrides
PRODUCT_PROPERTY_OVERRIDES += \
     media.stagefright.legacyencoder=true \
     media.stagefright.less-secure=true \
     persist.media.treble_omx=false

# Thermal Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/.tp/thermal.conf \
    $(LOCAL_PATH)/configs/thermal/thermal.off.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/.tp/thermal.off.conf \
    $(LOCAL_PATH)/configs/thermal/.ht120.mtc:$(TARGET_COPY_OUT_SYSTEM)/etc/.tp/.ht120.mtc

# Vulkan
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(DEVICE_PATH)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck \
	fibmap.f2fs \
	fsck.f2fs \
	mkfs.f2fs \
	make_ext4fs \
	resize2fs \
	setup_fs \
	ext4_resize \
	libext2_blkid \
	libext2_uuid_static \
	superumount \
	mount.exfat \
	fsck.exfat \
	mkfs.exfat \
	fsck.ntfs \
	mkfs.ntfs \
	mount.ntfs

# Memory optimization
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sys.fw.bservice_enable=true \
    ro.sys.fw.bservice_limit=5 \
    ro.sys.fw.bservice_age=5000 \
    ro.am.reschedule_service=true \
    ro.sys.fw.bg_apps_limit=24

# Property Overrides
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.allow.mock.location=1 \
    ro.zygote=zygote64_32 \
    camera.disable_zsl_mode=1 \
    ro.dalvik.vm.native.bridge=0 \
    persist.sys.usb.config=mtp,adb \
    persist.debug.xlog.enable=0 \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=1

# Force Lockscreen Rotation
PRODUCT_PRODUCT_PROPERTIES += \
    log.tag.launcher_force_rotate=VERBOSE \
    lockscreen.rot_override=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.renderer=opengl

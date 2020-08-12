# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Power (non-lineage imp)
PRODUCT_PACKAGES += android.hardware.power@1.0-impl

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    android.hardware.gnss@1.0-service

# GPS force mode
PRODUCT_PROPERTY_OVERRIDES += \
    persist.force.gps.mode=gnss

# Audio HIDL
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.broadcastradio@1.0-impl \
    android.hardware.soundtrigger@2.0-impl \
    android.hardware.soundtrigger@2.0-service

# Gralloc
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.renderscript@1.0-impl

# Camera HAL
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-impl-legacy

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# OMX
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0

# Keymaster
PRODUCT_PACKAGES += \
   android.hardware.keymaster@3.0-impl \
   android.hardware.keymaster@3.0-service

# Lights (MTK)
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl-mediatek \
    android.hardware.light@2.0-service-mediatek 

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl-mediatek \
    android.hardware.sensors@1.0-service-mediatek

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service.widevine \
    android.hardware.drm@1.0-service

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@1.0-impl \
    android.hardware.health@1.0-service

# Tether Packages
PRODUCT_PACKAGES += \
    android.hardware.tetheroffload.config@1.0 \
    android.hardware.tetheroffload.control@1.0

#
# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

BOOTLEGGERS_VENDOR := vendor/bootleggers 

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(BOOTLEGGERS_VENDOR)/config/common_full_phone.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from device
$(call inherit-product, device/bq/aquaris_m8/device.mk)

# This is a tablet
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_DEVICE := aquaris_m8
PRODUCT_NAME := bootleg_aquaris_m8
PRODUCT_BRAND := google
PRODUCT_MODEL := Aquaris M8
PRODUCT_MANUFACTURER := bq

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-bq

# Available languages
PRODUCT_LOCALES := en_US en_GB ru_RU uk_UA tr_TR sk_SK vi_VN fr_FR ar_EG es_ES ca_ES

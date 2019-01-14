# Set all versions
CUSTOM_BUILD_TYPE ?= UNOFFICIAL
CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
CUSTOM_PLATFORM_VERSION := 9.0

TARGET_PRODUCT_SHORT := $(subst aosp_,,$(CUSTOM_BUILD))

ifeq ($(IS_GO_VERSION), true)
CUSTOM_VERSION := COSP_go_$(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD_TYPE)
ROM_FINGERPRINT := COSP_go/$(CUSTOM_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)
else
CUSTOM_VERSION := COSP_$(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD_TYPE)
ROM_FINGERPRINT := COSP/$(CUSTOM_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)
endif

CUSTOM_PROPERTIES := \
    org.cosp.version=$(CUSTOM_VERSION) \
    org.cosp.build_date=$(CUSTOM_BUILD_DATE) \
    org.cosp.build_type=$(CUSTOM_BUILD_TYPE) \
    org.cosp.fingerprint=$(ROM_FINGERPRINT)

ARCHS = arm64
TARGET = iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = StarMaker

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = StarMakerBypass
StarMakerBypass_FILES = Tweak.x
StarMakerBypass_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk


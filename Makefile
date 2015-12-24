ARCHS = armv7 arm64
include theos/makefiles/common.mk
TWEAK_NAME = MSettings
MSettings_FILES = Tweak.xm
THEOS_DEVICE_IP = 192.168.31.229

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += msettingsprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

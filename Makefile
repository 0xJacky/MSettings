ARCHS = armv7 arm64
include theos/makefiles/common.mk
TWEAK_NAME = MSettings
MSettings_FILES = Tweak.xm
MSettings_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += msettingsprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

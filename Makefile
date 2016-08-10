ARCHS = armv7 arm64
include theos/makefiles/common.mk
TWEAK_NAME = MSettings
MSettings_FILES = MSettings.xm
MSettings_FRAMEWORKS = UIKit Foundation QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += msettingsprefs
SUBPROJECTS += msettingsuikit
SUBPROJECTS += msettingsapp
include $(THEOS_MAKE_PATH)/aggregate.mk

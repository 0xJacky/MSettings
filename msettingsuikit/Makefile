include theos/makefiles/common.mk
export ARCHS = armv7 arm64
TWEAK_NAME = MSettings-UIKit
MSettings-UIKit_FILES = MSettings-UIKit.xm
MSettings-UIKit_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

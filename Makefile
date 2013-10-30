include theos/makefiles/common.mk

BUNDLE_NAME = VeloxTube
VeloxTube_FILES = VeloxTubeFolderView.mm
VeloxTube_INSTALL_PATH = /Library/Velox/Plugins/
VeloxTube_FRAMEWORKS = Foundation UIKit

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
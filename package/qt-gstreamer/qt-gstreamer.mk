################################################################################
#
# qt-gstreamer
#
################################################################################

QT_GSTREAMER_VERSION = 1.2.0
QT_GSTREAMER_SOURCE = qt-gstreamer-$(QT_GSTREAMER_VERSION).tar.xz
QT_GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/qt-gstreamer
QT_GSTREAMER_LICENSE = GPLv2+
QT_GSTREAMER_LICENSE_FILES = COPYING

QT_GSTREAMER_CONF_OPTS += \
	-DQT_VERSION=5 \
	-DQTGSTREAMER_STATIC=OFF \
	-DQTGSTREAMER_EXAMPLES=OFF \
	-DQTGSTREAMER_TESTS=OFF \
	-DQTGSTREAMER_CODEGEN=OFF

$(eval $(cmake-package))

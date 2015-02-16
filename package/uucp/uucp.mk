################################################################################
#
# uucp
#
################################################################################

UUCP_VERSION = 1.07
UUCP_SOURCE = uucp-$(UUCP_VERSION).tar.gz
UUCP_SITE = ftp://ftp.gnu.org/gnu/uucp
UUCP_LICENSE = GPLv2+
UUCP_LICENSE_FILES = COPYING

$(eval $(autotools-package))

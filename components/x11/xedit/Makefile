#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2015 Aurelien Larcher
#

X11_CATEGORY=APP
include ../../../make-rules/shared-macros.mk
include $(WS_MAKE_RULES)/x11.mk

COMPONENT_NAME=				xedit
COMPONENT_VERSION=			1.2.3
COMPONENT_FMRI=				editor/xedit
COMPONENT_CLASSIFICATION=	Development/Editors
COMPONENT_SUMMARY=			xedit - simple Xaw toolkit text editor for X
COMPONENT_ARCHIVE=			$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=		sha256:bdd33afeeca881622e55d2cf28f07b4a98f083d0a2573c0b9048f25bdd62db2f

include $(WS_MAKE_RULES)/common.mk

# Auto-generated dependencies
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/math
REQUIRED_PACKAGES += x11/library/libx11
REQUIRED_PACKAGES += x11/library/libxmu
REQUIRED_PACKAGES += x11/library/toolkit/libxaw7
REQUIRED_PACKAGES += x11/library/toolkit/libxt

#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL)". You may
# only use this file in accordance with the terms of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2023 Niklas Poslovski
#

USE_DEFAULT_TEST_TRANSFORMS= yes
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=         libdbusmenu
COMPONENT_VERSION=      16.0.4.0
HUMAN_VERSION=          16.04.0
COMPONENT_PROJECT_URL=  https://launchpad.net/libdbusmenu
COMPONENT_SUMMARY=      Library for passing menus over DBus
COMPONENT_FMRI=         desktop/library/libdbusmenu
COMPONENT_SRC=          $(COMPONENT_NAME)-$(HUMAN_VERSION)
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= \
    sha256:b9cc4a2acd74509435892823607d966d424bd9ad5d0b00938f27240a1bfa878a
COMPONENT_ARCHIVE_URL=  https://launchpad.net/$(COMPONENT_NAME)/16.04/$(HUMAN_VERSION)/+download/$(COMPONENT_ARCHIVE)
COMPONENT_CLASSIFICATION=       Desktop (GNOME)/Libraries
COMPONENT_LICENSE=      LGPLv3

PATH=$(PATH.gnu)

include $(WS_MAKE_RULES)/common.mk

CONFIGURE_OPTIONS += --disable-static
CONFIGURE_OPTIONS += --with-gtk=3

unexport SHELLOPTS

# Auto-generated dependencies
REQUIRED_PACKAGES += library/desktop/atk
REQUIRED_PACKAGES += library/desktop/gdk-pixbuf
REQUIRED_PACKAGES += library/desktop/gtk2
REQUIRED_PACKAGES += library/desktop/gtk3
REQUIRED_PACKAGES += library/desktop/json-glib
REQUIRED_PACKAGES += library/desktop/pango
REQUIRED_PACKAGES += library/glib2
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += x11/library/libx11

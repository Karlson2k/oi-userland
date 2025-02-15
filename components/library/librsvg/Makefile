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
# Copyright 2014 Alexander Pyhalov.  All rights reserved.
# Copyright 2018 Michal Nowak
#

BUILD_BITS= 64
USE_DEFAULT_TEST_TRANSFORMS= yes
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		librsvg
COMPONENT_VERSION=	2.40.21
COMPONENT_MAJOR_VERSION=$(basename $(COMPONENT_VERSION))
COMPONENT_FMRI=		image/library/librsvg
COMPONENT_CLASSIFICATION=System/Multimedia Libraries
COMPONENT_SUMMARY=	Library for SVG support for GNOME
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH= \
	sha256:f7628905f1cada84e87e2b14883ed57d8094dca3281d5bcb24ece4279e9a92ba
COMPONENT_ARCHIVE_URL= \
	https://download.gnome.org/sources/$(COMPONENT_NAME)/$(COMPONENT_MAJOR_VERSION)/$(COMPONENT_ARCHIVE)
COMPONENT_PROJECT_URL= https://www.gnome.org/
COMPONENT_LICENSE= LGPLv2

include $(WS_MAKE_RULES)/common.mk

PATH=$(PATH.gnu)

# Cloning is required for gmake test to pass
COMPONENT_PRE_CONFIGURE_ACTION = ( $(CLONEY) $(SOURCE_DIR) $(@D) )

COMPONENT_PREP_ACTION = ( cd $(@D) && aclocal && \
			libtoolize --force --copy && \
			gtkdocize && \
			autoreconf -fi )

CONFIGURE_OPTIONS += --sysconfdir=/etc/$(MACH64)
CONFIGURE_OPTIONS += --with-html-dir=/usr/share/gtk-doc/html/librsvg
CONFIGURE_OPTIONS += --disable-Bsymbolic
CONFIGURE_OPTIONS += --disable-static
CONFIGURE_OPTIONS += --enable-introspection
CONFIGURE_OPTIONS += --enable-vala

COMPONENT_BUILD_ENV += CC="$(CC)"
COMPONENT_BUILD_ENV += CFLAGS="$(CFLAGS)"

#COMPONENT_TEST_TRANSFORMER = $(NAWK)
#COMPONENT_TEST_TRANSFORMS = "'/TOTAL|PASS|FAIL|XFAIL|SKIP|XPASS|ERROR/'"

# To prevent "ERROR: loading - missing test plan"
unexport SHELLOPTS

# Manually added dependencies
REQUIRED_PACKAGES += developer/documentation-tool/gtk-doc
REQUIRED_PACKAGES += library/desktop/gobject/gobject-introspection

# Auto-generated dependencies
REQUIRED_PACKAGES += library/desktop/cairo
REQUIRED_PACKAGES += library/desktop/gdk-pixbuf
REQUIRED_PACKAGES += library/desktop/gtk3
REQUIRED_PACKAGES += library/desktop/pango
REQUIRED_PACKAGES += library/glib2
REQUIRED_PACKAGES += library/libcroco
REQUIRED_PACKAGES += library/libxml2
REQUIRED_PACKAGES += service/gnome/desktop-cache
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/fontconfig
REQUIRED_PACKAGES += system/library/math

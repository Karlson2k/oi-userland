#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright (c) 2011, 2012, Oracle and/or its affiliates. All rights reserved.
#

BUILD_BITS= 32_and_64
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		pth
COMPONENT_VERSION=	2.0.7
COMPONENT_REVISION=	2
COMPONENT_SUMMARY=	The GNU Portable Threads Library
COMPONENT_DESCRIPTION=	A portable POSIX/ANSI-C based library for Unix platforms providing non-preemptive priority-based scheduling for multiple threads
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_PROJECT_URL=	https://www.gnu.org/software/pth/
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:72353660c5a2caafd601b20e12e75d865fd88f6cf1a088b306a3963f0bc77232
COMPONENT_ARCHIVE_URL=	https://ftp.gnu.org/gnu/pth/$(COMPONENT_ARCHIVE)
COMPONENT_FMRI=		library/pth
COMPONENT_CLASSIFICATION=	System/Libraries
COMPONENT_LICENSE=	LGPLv2.1
COMPONENT_LICENSE_FILE=	COPYING

include $(WS_MAKE_RULES)/common.mk

PATCH_LEVEL= 0

CFLAGS += $(CPP_LARGEFILES)
CFLAGS += $(XPG6MODE)
CFLAGS += $(CPP_POSIX)
CFLAGS += $(gcc_C99_ENABLE)

CPPFLAGS += $(CPP_LARGEFILES) $(CPP_POSIX)

LDFLAGS= -lpthread -lposix4 -lrt

CONFIGURE_OPTIONS += --localstatedir=/var
CONFIGURE_OPTIONS += --with-pic
CONFIGURE_OPTIONS += --enable-static=no

CONFIGURE_ENV += LD="$(CC) $(CFLAGS) $(LDFLAGS)"
CONFIGURE_ENV += CPPFLAGS="$(CPPFLAGS)"
CONFIGURE_ENV += CPP="$(CC) $(CPPFLAGS) $(CFLAGS) -E"
CONFIGURE_ENV += INSTALL="$(INSTALL)"

COMPONENT_BUILD_ARGS=

# Auto-generated dependencies
REQUIRED_PACKAGES += SUNWcs
REQUIRED_PACKAGES += system/library

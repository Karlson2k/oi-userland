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
# Copyright 2016 Alexander Pyhalov
# Copyright 2019 Michal Nowak
# Copyright 2020 Marco van Wieringen
# Copyright (c) 2021 Tim Mooney.  All rights reserved
# Copyright 2021 Andreas Wacknitz
#

MATE_CATEGORY=	APP
include ../../../../make-rules/shared-macros.mk
include $(WS_MAKE_RULES)/mate.mk

COMPONENT_NAME=		mozo
COMPONENT_MJR_VERSION=	1.26
COMPONENT_MNR_VERSION=	2
COMPONENT_SUMMARY=	Simple menu editor for MATE
COMPONENT_ARCHIVE_HASH=	sha256:472c482e0ef2fb1629e61e17daaa1a487f64392b029849dc9a4082afb38bc9ee
COMPONENT_FMRI=		desktop/xdg/menu-editor/mozo
COMPONENT_CLASSIFICATION=	Applications/Configuration and Preferences
COMPONENT_LICENSE= LGPLv2

include $(WS_MAKE_RULES)/common.mk

PKG_MACROS += PYVER=$(PYTHON_VERSION)

CONFIGURE_ENV+= PYTHON=$(PYTHON.3.9.64)
CONFIGURE_ENV+= am_cv_python_pythondir="$(PYTHON.3.9.VENDOR_PACKAGES.64)"

# Build requirements
#REQUIRED_PACKAGES += library/python/pygobject-3
REQUIRED_PACKAGES += library/python/pygobject-3-39

# Auto-generated dependencies
PYTHON_REQUIRED_PACKAGES += runtime/python

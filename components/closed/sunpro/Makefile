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
# Copyright 2012, Andrzej Szeszo
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=         sunpro
COMPONENT_VERSION=      0.5.11
COMPONENT_REVISION=     1
COMPONENT_SRC=          $(COMPONENT_NAME)
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tar.gz

COMPONENT_FMRI=         system/library/c++/sunpro
COMPONENT_SUMMARY=      Sun Workshop Compilers Bundled libC
COMPONENT_CLASSIFICATION=Development/C++
COMPONENT_LICENSE_FILE= SUNWlibC.copyright
COMPONENT_LICENSE=      SUNWlibC.copyright

$(USERLAND_ARCHIVES)$(COMPONENT_ARCHIVE):
	$(IPS2TGZ) $(COMPONENT_SRC) $(USERLAND_ARCHIVES)$(COMPONENT_ARCHIVE) https://pkg.openindiana.org/legacy \
	system/library/c++/sunpro@0.5.11,5.11-0.134:20100302T055027Z

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/ips.mk

build:	prep

install:	build
	@$(MKDIR) $(PROTO_DIR)
	@$(CP) -RP $(COMPONENT_SRC)/$(MACH)/* $(PROTO_DIR) || true

clean::
	$(RM) -r $(SOURCE_DIR) $(BUILD_DIR)

# Auto-generated dependencies
REQUIRED_PACKAGES += system/library

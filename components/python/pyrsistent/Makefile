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
# This file was automatically generated using the following command:
#   $WS_TOOLS/python-integrate-project pyrsistent
#

BUILD_STYLE = pyproject

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME =		pyrsistent
HUMAN_VERSION =			0.19.3
COMPONENT_SUMMARY =		pyrsistent - Persistent/Functional/Immutable data structures
COMPONENT_PROJECT_URL =		https://github.com/tobgu/pyrsistent/
COMPONENT_ARCHIVE_URL =		\
	https://files.pythonhosted.org/packages/bf/90/445a7dbd275c654c268f47fa9452152709134f61f09605cf776407055a89/pyrsistent-0.19.3.tar.gz
COMPONENT_ARCHIVE_HASH =	\
	sha256:1a2994773706bbb4995c31a97bc94f1418314923bd1048c6d964837040376440
COMPONENT_LICENSE =		MIT
COMPONENT_LICENSE_FILE =	LICENSE.mit

TEST_STYLE = pytest

include $(WS_MAKE_RULES)/common.mk

# https://github.com/tobgu/pyrsistent/issues/228
PYTEST_ADDOPTS += -p no:randomly

# Auto-generated dependencies
PYTHON_REQUIRED_PACKAGES += library/python/setuptools
PYTHON_REQUIRED_PACKAGES += library/python/wheel
PYTHON_REQUIRED_PACKAGES += runtime/python
REQUIRED_PACKAGES += system/library

#
#  Copyright (c) 2018 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : Jeong Han Lee
# email   : han.lee@esss.se
# Date    : 
# version : 0.0.1 
#

## The following lines are mandatory, please don't change them.
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS


ifneq ($(strip $(SEQUENCER_DEP_VERSION)),)
sequencer_VERSION=$(SEQUENCER_DEP_VERSION)
endif

## Exclude linux-ppc64e6500
EXCLUDE_ARCHS = linux-ppc64e6500

APP:=ch8App
APPDB:=$(APP)/Db
APPSRC:=$(APP)/src

USR_INCLUDES += -I$(where_am_I)$(APPSRC)

TEMPLATES += $(wildcard $(APPDB)/*.db)
TEMPLATES += $(wildcard $(APPDB)/*.template)

SOURCES += $(APPSRC)/dbSubExample.c
SOURCES += $(APPSRC)/myexampleHello.c
SOURCES += $(APPSRC)/sncExample.stt

DBDS    += $(APPSRC)/dbSubExample.dbd
DBDS    += $(APPSRC)/myexampleHello.dbd
DBDS    += $(APPSRC)/sncExample.dbd


db: 

.PHONY: db 

vlibs:

.PHONY: vlibs



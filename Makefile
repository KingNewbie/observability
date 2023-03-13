# Include local variables
include nidvars.mk

# The default testenv should be a "quick" testenv, containing a simple test that
# is quick to run.
DEFAULT_TESTENV?=quick

# Need nidcommon explicitly to compute NSO_VERSION_MAJOR etc
include nidcommon.mk

# We do not support 5.3 and lower versions, so just skip it by inserting dummy target
ifeq ($(shell test $(NSO_VERSION_MAJOR) -gt 5 || test $(NSO_VERSION_MAJOR) -eq 5 -a $(NSO_VERSION_MINOR) -ge 4; echo $$?),0)

# Include standard NID (NSO in Docker) package Makefile that defines all
# standard make targets
include nidpackage.mk

else
%:
	 @echo "Unsupported NSO version, skipping make target but returning positive result (0) to avoid CI failures"

endif

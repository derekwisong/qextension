
# Makefile to build an example q/kdb+ c extension

# bash$ make

CC=gcc

SOURCE=extension.c
SHARED_LIB=extension.so
BUILD_DIR=build

SHARED_LIB_FILE=$(BUILD_DIR)/$(SHARED_LIB)

# k.h is fetched into $(BUILD_DIR) by the `header` target
KH=$(BUILD_DIR)/k.h
KH_URL=https://raw.githubusercontent.com/KxSystems/kdb/refs/heads/master/c/c/k.h
CFLAGS=-I$(BUILD_DIR) -DKXVER=3

.PHONY: default header clean nuke

default: $(SHARED_LIB_FILE)

$(BUILD_DIR):
	mkdir -p $@

# download the k.h header from the KX Systems repository
header: $(KH)

$(KH): | $(BUILD_DIR)
	curl -fsSL $(KH_URL) -o $@

$(SHARED_LIB_FILE): $(SOURCE) $(KH) | $(BUILD_DIR)
	$(CC) $(CFLAGS) -shared -fPIC $(SOURCE) -o $@

clean:
	-rm $(SHARED_LIB_FILE)

nuke:
	-rm -rf $(BUILD_DIR)

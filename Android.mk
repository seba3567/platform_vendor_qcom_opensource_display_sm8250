ifneq ($(filter 4.19, $(TARGET_KERNEL_VERSION)),)

display-hals := \
    include\
    sdm/libs/utils\
    sdm/libs/core\
    libdebug

ifneq ($(TARGET_IS_HEADLESS), true)
display-hals += \
    libcopybit \
    liblight \
    libmemtrack \
    hdmi_cec \
    libhistogram \
    drm.vendor \
    gpu_tonemapper \
    libdrmutils
endif

display-hals += gralloc
display-hals += sde-drm
display-hals += composer
display-hals += init

include $(call all-named-subdir-makefiles,$(display-hals))

endif #TARGET_DISABLE_DISPLAY

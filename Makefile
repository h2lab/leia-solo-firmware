##########################################################################################################################
# File automatically-generated by tool: [projectgenerator] version: [3.4.0] date: [Mon Dec 23 11:45:28 CET 2019] 
##########################################################################################################################

# ------------------------------------------------
# Generic Makefile (based on gcc)
#
# ChangeLog :
#	2017-02-10 - Several enhancements + project update mode
#   2015-07-22 - first version
# ------------------------------------------------

######################################
# target
######################################
TARGET = leia-halst


######################################
# building variables
######################################
# optimization
OPT = -Og -O3


bold := $(shell tput bold || echo "[1m")

normal := $(shell tput sgr0 || echo "[0m")

green := $(shell tput setaf 2 || echo "[32m")

red := $(shell tput setaf 1 || echo "[31m")

#######################################
# paths
#######################################
# Build path
BUILD_DIR = build

######################################
# source
######################################
# C sources
#Src/timers/timers.c 
C_SOURCES =  \
Src/main.c \
Src/usb_device.c \
Src/usbd_conf.c \
Src/usbd_desc.c \
Src/usbd_cdc_if.c \
Src/stm32f4xx_it.c \
Src/stm32f4xx_hal_msp.c \
Src/console/console.c \
Src/debug/debug.c \
Src/leds/leds.c \
Src/protocol/protocol.c \
Src/triggers/triggers.c \
Src/iso7816/smartcard.c \
Src/iso7816/helpers.c \
Src/iso7816/smartcard_iso7816.c \
Src/iso7816/smartcard_iso7816_platform_usart.c \
Src/iso7816/smartcard_iso7816_platform_bitbang.c \
Src/flasher/flasher_platform.c \
Src/flasher/flasher.c \
Src/flasher/stk500.c \
Middlewares/ringbuff/ringbuff/src/ringbuff/ringbuff.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pcd.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pcd_ex.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usb.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c \
Src/system_stm32f4xx.c \
Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.c \
Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.c \
Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.c \
Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_dma.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_exti.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_gpio.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_rcc.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_tim.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_utils.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usart.c 


# DISCO407 is a flavour of DISCO
ifeq ($(DISCO407), 1)
DISCO = 1
endif

ifeq ($(DISCO407), 1)
# ASM sources
ASM_SOURCES =  \
startup_stm32f407xx.s
else
# ASM sources
ASM_SOURCES =  \
startup_stm32f429xx.s
endif

#######################################
# binaries
#######################################
PREFIX = arm-none-eabi-
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
SZ = $(GCC_PATH)/$(PREFIX)size
else
CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
endif
HEX = $(CP) -O ihex --remove-section=".noninit*"
BIN = $(CP) -O binary -S --remove-section=".noninit*"
 
#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m4

# fpu
FPU = -mfpu=fpv4-sp-d16

# float-abi
FLOAT-ABI = -mfloat-abi=hard

# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# macros for gcc
# AS defines
AS_DEFS = 

# C defines
ifeq ($(DISCO407), 1)
C_DEFS =  \
-DUSE_HAL_DRIVER \
-DSTM32F407xx \
-DUSE_FULL_LL_DRIVER 
else
C_DEFS =  \
-DUSE_HAL_DRIVER \
-DSTM32F429xx \
-DUSE_FULL_LL_DRIVER 
endif

# AS includes
AS_INCLUDES = 

# C includes
C_INCLUDES =  \
-IInc \
-ISrc/config \
-ISrc/console \
-ISrc/debug \
-ISrc/leds \
-ISrc/iso7816 \
-ISrc/flasher \
-ISrc/protocol \
-ISrc/triggers \
-IMiddlewares/ringbuff/ringbuff/src/include \
-IDrivers/STM32F4xx_HAL_Driver/Inc \
-IDrivers/STM32F4xx_HAL_Driver/Inc/Legacy \
-IMiddlewares/ST/STM32_USB_Device_Library/Core/Inc \
-IMiddlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc \
-IDrivers/CMSIS/Device/ST/STM32F4xx/Include \
-IDrivers/CMSIS/Include 


# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

# NOTE1: we force -Wno-unused-parameter because some of them are triggered in the ST SDK, but we
# do not want to modify this SDK
# NOTE2: we force -Wno-address-of-packed-member since we are on a platform where unaligned accesses
# are allowed, and we have to use packed structures for our protocol
# NOTE3: we force -Wnostrict-aliasing for our protocol related casts
CFLAGS = $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -Wextra -Werror -Wno-unused-parameter -Wno-type-limits -Wno-strict-aliasing -fdata-sections -ffunction-sections

ifeq ($(DEBUG), 1)
CFLAGS += -DDEBUG -g -gdwarf-2
endif

ifeq ($(FORCE_TTY_DEBUG), 1)
CFLAGS += -DFORCE_TTY_DEBUG
endif

# Do we want to override the quartz oscillator frequency for HSE
ifneq ($(HSE_PLLM_OVERRIDE), )
CFLAGS += -DHSE_PLLM_OVERRIDE=$(HSE_PLLM_OVERRIDE)
CFLAGS += -DHSE_VALUE="((uint32_t)$(HSE_PLLM_OVERRIDE)*1000000)"
HSE_VALUE_SET = 1
endif

# LEIA board
ifeq ($(LEIA), 1)
CFLAGS += -DLEIA
ifeq ($(HSE_VALUE_SET), )
# On default LEIA board, crystal HSE is at 16 MHz
CFLAGS += -DHSE_VALUE="((uint32_t)16000000)"
endif
else
# WooKey board
ifeq ($(WOOKEY), 1)
CFLAGS += -DWOOKEY
else
# Discovery boards, by default it is F429
ifeq ($(DISCO429), 1)
DISCO=1
endif
ifeq ($(DISCO), 1)
CFLAGS += -DDISCO
else
# Default board is LEIA
CFLAGS += -DLEIA
ifeq ($(HSE_VALUE_SET), )
# On default LEIA board, crystal HSE is at 16 MHz
CFLAGS += -DHSE_VALUE="((uint32_t)16000000)"
endif
endif
endif
endif


# DISCO
ifeq ($(DISCO407), 1)
CFLAGS += -DDISCO407
else
CFLAGS += -DDISCO429
endif
# NOTE: on discovery boards, external oscillator is 8MHz and we have to override
# its default value (24MHz) for proper system configuration.
ifeq ($(DISCO), 1)
ifeq ($(HSE_VALUE_SET), )
CFLAGS += -DHSE_VALUE="((uint32_t)8000000)"
endif
endif

# By default, we use USB consoles instead of dedicated UARTs since
# this is easier to setup.
ifeq ($(USB), )
USB = 1
USB_DEFAULT = 1
else
USB_DEFAULT = 0
endif

# Use USB or USART for control of the board
ifeq ($(USB), 1)
CFLAGS += -DUSB
endif

# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"


#######################################
# LDFLAGS
#######################################
# link script
ifeq ($(DISCO407), 1)
LDSCRIPT = STM32F407_FLASH.ld
else
LDSCRIPT = STM32F429VITx_FLASH.ld
endif

# libraries
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: clean $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin


#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
ifeq ($(DISCO407), 1)
ifeq ($(DISCO429), 1)
	@echo "$(bold) $(red) Error: you cannot choose DISCO407=1 and DISCO429=1, choose only one of the boards!$(normal)"
	@exit 1
endif
endif
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@
ifeq ($(LEIA), 1)
	@echo "$(bold) $(green)  [+] **LEIA** board selected$(normal)"
else
ifeq ($(WOOKEY), 1)
	@echo "$(bold) $(green)  [+] **WooKey** board selected$(normal)"
else
ifeq ($(DISCO), 1)
	@echo "$(bold) $(green)  [+] **DISCO** board selected$(normal)"
ifeq ($(DISCO407), 1)
	@echo "$(bold) $(green)         (DISCO F407 board)$(normal)"
else
	@echo "$(bold) $(green)         (DISCO F429 board)$(normal)"
endif
else
	@echo "$(bold) $(green)  [+] **LEIA** board selected (default) $(normal)"
endif
endif
endif
	@echo "$(bold) $(green)     ---------------------------------$(normal)"
ifeq ($(DEBUG), 1)
	@echo "$(bold) $(green)  [+] DEBUG activated$(normal)"
ifeq ($(USB), 0)
	@echo "$(bold) $(green)      (debug on physical UART)$(normal)"
else
ifeq ($(FORCE_TTY_DEBUG), 1)
	@echo "$(bold) $(green)      (debug on physical UART forced)$(normal)"
endif
	@echo "$(bold) $(green)      (debug on USB UART abstraction)$(normal)"
endif
endif
ifeq ($(USB), 1)
	@echo "$(bold) $(green)  [+] Protocol on USB UART abstraction$(normal)"
ifeq ($(USB_DEFAULT), 1)
	@echo "$(bold) $(green)      (this is the default protocol and debug consoles channel)$(normal)"
endif
else
	@echo "$(bold) $(green)  [+] Protocol on physical UART$(normal)"
endif
	@echo "$(bold) $(green)  [+] ISO7816 using USART or BITBANG (selected at runtime, default is USART)$(normal)"
ifeq ($(WOOKEY), 1)
	@echo "$(bold) $(red)  [-] Warning: BITBANG mode is *NOT supported* on the WooKey board ...$(normal)"
	@echo "$(bold) $(red)  [-] Warning: FLASHER mode is *NOT supported* on the WooKey board ...$(normal)"
	@echo "$(bold) $(red)      => NOTE: for safety, these features are deactvated in the formware.$(normal)"
	@echo "$(bold) $(red)         You can force them in the code while assigning the dedicated GPIOs$(normal)"
	@echo "$(bold) $(red)         in the WooKey board configuration file (you MUST know what you do).$(normal)"
	@echo "$(bold) $(red)      => Use it at your own risks!!$(normal)"
endif

ifneq ($(HSE_PLLM_OVERRIDE), )
	@echo " $(green)  [i] HSE PLL override with $(HSE_PLLM_OVERRIDE) MHz$(normal)"
endif

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	@$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	@$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		

#######################################
# DFU (flash through DFU)
#######################################

dfu:
	dfu-util -R -d 0483:df11 -a 0 -D $(BUILD_DIR)/$(TARGET).bin -s 0x08000000
	python3 rebootdfu.py

#######################################
# Burn (flash trhough SWD/JTAG) 
#######################################

burn:
	st-flash write $(BUILD_DIR)/$(TARGET).bin 0x08000000

#######################################
# clean up
#######################################
# Cleaning is mandatory as env variables modifications are not caught
.PHONY: clean
.NOTPARALLEL:
clean:
	-rm -fR $(BUILD_DIR)
 
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***

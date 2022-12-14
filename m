Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBB68470
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Dec 2022 14:25:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C182FEC;
	Wed, 14 Dec 2022 06:26:01 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 027BF3F73B;
	Wed, 14 Dec 2022 06:25:19 -0800 (PST)
Date: Wed, 14 Dec 2022 14:25:17 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de, Icenowy
 Zheng <uwu@icenowy.me>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Subject: Re: [RFC PATCH 01/17] sunxi: remove CONFIG_SATAPWR
Message-ID: <20221214142517.66b69b02@donnerap.cambridge.arm.com>
In-Reply-To: <bb2ef69f-23e1-9936-e824-6b86924b9c8a@sholland.org>
References: <20221206004549.29015-1-andre.przywara@arm.com>
	<20221206004549.29015-2-andre.przywara@arm.com>
	<bb2ef69f-23e1-9936-e824-6b86924b9c8a@sholland.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Dec 2022 02:37:12 -0600
Samuel Holland <samuel@sholland.org> wrote:

Hi Samuel,

many thanks for having a look!

> On 12/5/22 18:45, Andre Przywara wrote:
> > The CONFIG_SATAPWR Kconfig symbol was used to point to a GPIO that
> > enables the power for a SATA harddisk.
> > In the DT this is described with the target-supply property in the AHCI
> > DT node, pointing to a (GPIO controlled) regulator. Since we need SATA
> > only in U-Boot proper, and use a DM driver for AHCI there, we should use
> > the DT instead of hardcoding this.
> > 
> > Add code to the sunxi AHCI driver to check the DT for that regulator and
> > enable it, at probe time. Then drop the current code from board.c, which
> > was doing that job before.
> > This allows us to remove the SATAPWR Kconfig definition and the
> > respective values from the defconfigs.
> > We also select the generic fixed regulator driver, which handles those
> > GPIO controlled regulators.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm/Kconfig                             |  2 ++
> >  arch/arm/mach-sunxi/Kconfig                  |  8 --------
> >  board/sunxi/board.c                          | 14 --------------
> >  configs/A10-OLinuXino-Lime_defconfig         |  1 -
> >  configs/A20-OLinuXino-Lime2-eMMC_defconfig   |  1 -
> >  configs/A20-OLinuXino-Lime2_defconfig        |  1 -
> >  configs/A20-OLinuXino-Lime_defconfig         |  1 -
> >  configs/A20-OLinuXino_MICRO-eMMC_defconfig   |  1 -
> >  configs/A20-OLinuXino_MICRO_defconfig        |  1 -
> >  configs/A20-Olimex-SOM-EVB_defconfig         |  1 -
> >  configs/A20-Olimex-SOM204-EVB-eMMC_defconfig |  1 -
> >  configs/A20-Olimex-SOM204-EVB_defconfig      |  1 -
> >  configs/Cubieboard2_defconfig                |  1 -
> >  configs/Cubieboard_defconfig                 |  1 -
> >  configs/Cubietruck_defconfig                 |  1 -
> >  configs/Itead_Ibox_A20_defconfig             |  1 -
> >  configs/Lamobo_R1_defconfig                  |  1 -
> >  configs/Linksprite_pcDuino3_Nano_defconfig   |  1 -
> >  configs/Linksprite_pcDuino3_defconfig        |  1 -
> >  configs/Sinovoip_BPI_M3_defconfig            |  1 -
> >  configs/orangepi_plus_defconfig              |  1 -
> >  drivers/ata/ahci_sunxi.c                     |  9 +++++++++
> >  22 files changed, 11 insertions(+), 40 deletions(-)
> > 
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index f95ed71b246..3623520b353 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -1148,6 +1148,8 @@ config ARCH_SUNXI
> >  	select DM_SPI_FLASH if SPI
> >  	select DM_KEYBOARD
> >  	select DM_MMC if MMC
> > +	select DM_REGULATOR
> > +	select DM_REGULATOR_FIXED  
> 
> While not all boards have fixed regulators, so many do that I am happy
> to have this driver enabled by default. However, I recommend "imply"
> over "select" so the regulator uclass can be disabled if
> USB/SATA/Ethernet/whatever are not being used. You also need to
> select/imply POWER, as it is a dependency.

Yes, that's indeed better.

> >  	select DM_SCSI if SCSI
> >  	select DM_SERIAL
> >  	select GPIO_EXTRA_HEADER
> > diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> > index dbe6005daab..5f95fe72d08 100644
> > --- a/arch/arm/mach-sunxi/Kconfig
> > +++ b/arch/arm/mach-sunxi/Kconfig
> > @@ -985,14 +985,6 @@ config VIDEO_LCD_TL059WV5C0
> >  
> >  endchoice
> >  
> > -config SATAPWR
> > -	string "SATA power pin"
> > -	default ""
> > -	help
> > -	  Set the pins used to power the SATA. This takes a string in the
> > -	  format understood by sunxi_name_to_gpio, e.g. PH1 for pin 1 of
> > -	  port H.
> > -
> >  config GMAC_TX_DELAY
> >  	int "GMAC Transmit Clock Delay Chain"
> >  	default 0
> > diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> > index 21a2407e062..ec35a7f06bd 100644
> > --- a/board/sunxi/board.c
> > +++ b/board/sunxi/board.c
> > @@ -229,20 +229,6 @@ int board_init(void)
> >  		return ret;
> >  
> >  	/* strcmp() would look better, but doesn't get optimised away. */
> > -	if (CONFIG_SATAPWR[0]) {
> > -		satapwr_pin = sunxi_name_to_gpio(CONFIG_SATAPWR);
> > -		if (satapwr_pin >= 0) {
> > -			gpio_request(satapwr_pin, "satapwr");
> > -			gpio_direction_output(satapwr_pin, 1);
> > -
> > -			/*
> > -			 * Give the attached SATA device time to power-up
> > -			 * to avoid link timeouts
> > -			 */
> > -			mdelay(500);
> > -		}
> > -	}
> > -
> >  	if (CONFIG_MACPWR[0]) {
> >  		macpwr_pin = sunxi_name_to_gpio(CONFIG_MACPWR);
> >  		if (macpwr_pin >= 0) {
> > diff --git a/configs/A10-OLinuXino-Lime_defconfig b/configs/A10-OLinuXino-Lime_defconfig
> > index ee92ac45fbc..f5d98607003 100644
> > --- a/configs/A10-OLinuXino-Lime_defconfig
> > +++ b/configs/A10-OLinuXino-Lime_defconfig
> > @@ -8,7 +8,6 @@ CONFIG_DRAM_EMR1=4
> >  CONFIG_SYS_CLK_FREQ=912000000
> >  CONFIG_MMC0_CD_PIN="PH1"
> >  CONFIG_I2C1_ENABLE=y
> > -CONFIG_SATAPWR="PC3"
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SYS_MONITOR_LEN=786432
> > diff --git a/configs/A20-OLinuXino-Lime2-eMMC_defconfig b/configs/A20-OLinuXino-Lime2-eMMC_defconfig
> > index 8ce10d6f75b..a8e949a3971 100644
> > --- a/configs/A20-OLinuXino-Lime2-eMMC_defconfig
> > +++ b/configs/A20-OLinuXino-Lime2-eMMC_defconfig
> > @@ -9,7 +9,6 @@ CONFIG_MMC_SUNXI_SLOT_EXTRA=2
> >  CONFIG_USB0_VBUS_PIN="PC17"
> >  CONFIG_USB0_VBUS_DET="PH5"
> >  CONFIG_I2C1_ENABLE=y
> > -CONFIG_SATAPWR="PC3"
> >  CONFIG_SPL_SPI_SUNXI=y
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > diff --git a/configs/A20-OLinuXino-Lime2_defconfig b/configs/A20-OLinuXino-Lime2_defconfig
> > index e38110b030b..c143cc17314 100644
> > --- a/configs/A20-OLinuXino-Lime2_defconfig
> > +++ b/configs/A20-OLinuXino-Lime2_defconfig
> > @@ -8,7 +8,6 @@ CONFIG_MMC0_CD_PIN="PH1"
> >  CONFIG_USB0_VBUS_PIN="PC17"
> >  CONFIG_USB0_VBUS_DET="PH5"
> >  CONFIG_I2C1_ENABLE=y
> > -CONFIG_SATAPWR="PC3"
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SYS_MONITOR_LEN=786432
> > diff --git a/configs/A20-OLinuXino-Lime_defconfig b/configs/A20-OLinuXino-Lime_defconfig
> > index 4e4804748ef..b6546c26d04 100644
> > --- a/configs/A20-OLinuXino-Lime_defconfig
> > +++ b/configs/A20-OLinuXino-Lime_defconfig
> > @@ -6,7 +6,6 @@ CONFIG_MACH_SUN7I=y
> >  CONFIG_DRAM_CLK=384
> >  CONFIG_MMC0_CD_PIN="PH1"
> >  CONFIG_I2C1_ENABLE=y
> > -CONFIG_SATAPWR="PC3"
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SYS_MONITOR_LEN=786432
> > diff --git a/configs/A20-OLinuXino_MICRO-eMMC_defconfig b/configs/A20-OLinuXino_MICRO-eMMC_defconfig
> > index 113d54dc0b9..95860ef8fa1 100644
> > --- a/configs/A20-OLinuXino_MICRO-eMMC_defconfig
> > +++ b/configs/A20-OLinuXino_MICRO-eMMC_defconfig
> > @@ -8,7 +8,6 @@ CONFIG_MMC0_CD_PIN="PH1"
> >  CONFIG_MMC_SUNXI_SLOT_EXTRA=2
> >  CONFIG_I2C1_ENABLE=y
> >  CONFIG_VIDEO_VGA=y
> > -CONFIG_SATAPWR="PB8"
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SYS_MONITOR_LEN=786432
> > diff --git a/configs/A20-OLinuXino_MICRO_defconfig b/configs/A20-OLinuXino_MICRO_defconfig
> > index 1e1c30ef303..32ca51554b1 100644
> > --- a/configs/A20-OLinuXino_MICRO_defconfig
> > +++ b/configs/A20-OLinuXino_MICRO_defconfig
> > @@ -9,7 +9,6 @@ CONFIG_MMC3_CD_PIN="PH11"
> >  CONFIG_MMC_SUNXI_SLOT_EXTRA=3
> >  CONFIG_I2C1_ENABLE=y
> >  CONFIG_VIDEO_VGA=y
> > -CONFIG_SATAPWR="PB8"
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SYS_MONITOR_LEN=786432
> > diff --git a/configs/A20-Olimex-SOM-EVB_defconfig b/configs/A20-Olimex-SOM-EVB_defconfig
> > index e76e6dd0932..1364c42d865 100644
> > --- a/configs/A20-Olimex-SOM-EVB_defconfig
> > +++ b/configs/A20-Olimex-SOM-EVB_defconfig
> > @@ -9,7 +9,6 @@ CONFIG_MMC3_CD_PIN="PH0"
> >  CONFIG_MMC_SUNXI_SLOT_EXTRA=3
> >  CONFIG_USB0_VBUS_PIN="PB9"
> >  CONFIG_USB0_VBUS_DET="PH5"
> > -CONFIG_SATAPWR="PC3"
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SYS_MONITOR_LEN=786432
> > diff --git a/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig b/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
> > index 1d3cf311952..77abe5c27ea 100644
> > --- a/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
> > +++ b/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
> > @@ -9,7 +9,6 @@ CONFIG_MMC_SUNXI_SLOT_EXTRA=2
> >  CONFIG_USB0_VBUS_PIN="PC17"
> >  CONFIG_USB0_VBUS_DET="PH5"
> >  CONFIG_I2C1_ENABLE=y
> > -CONFIG_SATAPWR="PC3"
> >  CONFIG_GMAC_TX_DELAY=4
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > diff --git a/configs/A20-Olimex-SOM204-EVB_defconfig b/configs/A20-Olimex-SOM204-EVB_defconfig
> > index 97d0b9cee75..19065fb18d0 100644
> > --- a/configs/A20-Olimex-SOM204-EVB_defconfig
> > +++ b/configs/A20-Olimex-SOM204-EVB_defconfig
> > @@ -8,7 +8,6 @@ CONFIG_MMC0_CD_PIN="PH1"
> >  CONFIG_USB0_VBUS_PIN="PC17"
> >  CONFIG_USB0_VBUS_DET="PH5"
> >  CONFIG_I2C1_ENABLE=y
> > -CONFIG_SATAPWR="PC3"
> >  CONFIG_GMAC_TX_DELAY=4
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > diff --git a/configs/Cubieboard2_defconfig b/configs/Cubieboard2_defconfig
> > index 2c1b3d27aa0..40608498f38 100644
> > --- a/configs/Cubieboard2_defconfig
> > +++ b/configs/Cubieboard2_defconfig
> > @@ -5,7 +5,6 @@ CONFIG_SPL=y
> >  CONFIG_MACH_SUN7I=y
> >  CONFIG_DRAM_CLK=480
> >  CONFIG_MMC0_CD_PIN="PH1"
> > -CONFIG_SATAPWR="PB8"
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SYS_MONITOR_LEN=786432
> > diff --git a/configs/Cubieboard_defconfig b/configs/Cubieboard_defconfig
> > index 008167509d3..9de9ee07568 100644
> > --- a/configs/Cubieboard_defconfig
> > +++ b/configs/Cubieboard_defconfig
> > @@ -5,7 +5,6 @@ CONFIG_SPL=y
> >  CONFIG_MACH_SUN4I=y
> >  CONFIG_DRAM_CLK=480
> >  CONFIG_MMC0_CD_PIN="PH1"
> > -CONFIG_SATAPWR="PB8"
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SYS_MONITOR_LEN=786432
> > diff --git a/configs/Cubietruck_defconfig b/configs/Cubietruck_defconfig
> > index a4246343706..86588cdd5e2 100644
> > --- a/configs/Cubietruck_defconfig
> > +++ b/configs/Cubietruck_defconfig
> > @@ -9,7 +9,6 @@ CONFIG_USB0_VBUS_PIN="PH17"
> >  CONFIG_USB0_VBUS_DET="PH22"
> >  CONFIG_USB0_ID_DET="PH19"
> >  CONFIG_VIDEO_VGA=y
> > -CONFIG_SATAPWR="PH12"
> >  CONFIG_GMAC_TX_DELAY=1
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > diff --git a/configs/Itead_Ibox_A20_defconfig b/configs/Itead_Ibox_A20_defconfig
> > index 6474c9e90a7..b52ce776251 100644
> > --- a/configs/Itead_Ibox_A20_defconfig
> > +++ b/configs/Itead_Ibox_A20_defconfig
> > @@ -5,7 +5,6 @@ CONFIG_SPL=y
> >  CONFIG_MACH_SUN7I=y
> >  CONFIG_DRAM_CLK=480
> >  CONFIG_MMC0_CD_PIN="PH1"
> > -CONFIG_SATAPWR="PB8"
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SYS_MONITOR_LEN=786432
> > diff --git a/configs/Lamobo_R1_defconfig b/configs/Lamobo_R1_defconfig
> > index c943fd3c06e..d51601ff10f 100644
> > --- a/configs/Lamobo_R1_defconfig
> > +++ b/configs/Lamobo_R1_defconfig
> > @@ -6,7 +6,6 @@ CONFIG_MACH_SUN7I=y
> >  CONFIG_DRAM_CLK=432
> >  CONFIG_MACPWR="PH23"
> >  CONFIG_MMC0_CD_PIN="PH10"
> > -CONFIG_SATAPWR="PB3"
> >  CONFIG_GMAC_TX_DELAY=4
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > diff --git a/configs/Linksprite_pcDuino3_Nano_defconfig b/configs/Linksprite_pcDuino3_Nano_defconfig
> > index 469dcc11f12..773f4a9e318 100644
> > --- a/configs/Linksprite_pcDuino3_Nano_defconfig
> > +++ b/configs/Linksprite_pcDuino3_Nano_defconfig
> > @@ -6,7 +6,6 @@ CONFIG_MACH_SUN7I=y
> >  CONFIG_DRAM_CLK=408
> >  CONFIG_DRAM_ZQ=122
> >  CONFIG_USB1_VBUS_PIN="PH11"
> > -CONFIG_SATAPWR="PH2"
> >  CONFIG_GMAC_TX_DELAY=3
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > diff --git a/configs/Linksprite_pcDuino3_defconfig b/configs/Linksprite_pcDuino3_defconfig
> > index c4a3f2db963..5b454b23864 100644
> > --- a/configs/Linksprite_pcDuino3_defconfig
> > +++ b/configs/Linksprite_pcDuino3_defconfig
> > @@ -5,7 +5,6 @@ CONFIG_SPL=y
> >  CONFIG_MACH_SUN7I=y
> >  CONFIG_DRAM_CLK=480
> >  CONFIG_DRAM_ZQ=122
> > -CONFIG_SATAPWR="PH2"
> >  CONFIG_AHCI=y
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SYS_MONITOR_LEN=786432
> > diff --git a/configs/Sinovoip_BPI_M3_defconfig b/configs/Sinovoip_BPI_M3_defconfig
> > index ab70eff68eb..bcc8b1fba98 100644
> > --- a/configs/Sinovoip_BPI_M3_defconfig
> > +++ b/configs/Sinovoip_BPI_M3_defconfig
> > @@ -13,7 +13,6 @@ CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
> >  CONFIG_USB0_ID_DET="PH11"
> >  CONFIG_USB1_VBUS_PIN="PD24"
> >  CONFIG_AXP_GPIO=y
> > -CONFIG_SATAPWR="PD25"
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SYS_MONITOR_LEN=786432
> >  CONFIG_CONSOLE_MUX=y
> > diff --git a/configs/orangepi_plus_defconfig b/configs/orangepi_plus_defconfig
> > index 5c7f0731d90..f4ce4851d7c 100644
> > --- a/configs/orangepi_plus_defconfig
> > +++ b/configs/orangepi_plus_defconfig
> > @@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=672
> >  CONFIG_MACPWR="PD6"
> >  CONFIG_MMC_SUNXI_SLOT_EXTRA=2
> >  CONFIG_USB1_VBUS_PIN="PG13"
> > -CONFIG_SATAPWR="PG11"  
> 
> BananaPi M3 and OrangePi Plus have USB-SATA adapters, not onboard AHCI,
> so they would lose the ability to use SATA with this change.

Many thanks for having a thorough look, I much appreciate that.
Of course you are right. I actually found this myself, and thought I
mentioned it somewhere, but apparently this got lost in between cover
letter versions and commit messages on different branches. Apologies for
that.
So yeah, my research figured that this isn't described properly in the DT,
so SATA disks just work in Linux because U-Boot flipped the bit here.
I heard about USB child DT nodes, which IIUC are possible to describe
errata and such, but I don't think it's a good solution here. Would
probably need driver changes, so wouldn't be backwards compatible.

> OrangePi Plus has the SATA controller regulator as usb3_vbus-supply in
> its devicetree. So we could replace this with CONFIG_USB3_VBUS_PIN for
> now, and it will continue to work once we switch the PHY driver to use
> the regulator uclass.
> 
> But the BananaPi M3 has its USB-SATA downstream from an external hub.
> CONFIG_USB1_VBUS_PIN is used for the regulator powering the hub, so I do
> not see an obvious solution here.

Yeah, I didn't find a neat automatic solution for that either.
Can we add a regulator-fixed, and make this regulator-boot-on? Without
actually referencing this regulator anywhere? I need to check this
actually works in U-Boot, but what do you say with your Linux/DT maintainer
hat on?

Cheers,
Andre

> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SYS_MONITOR_LEN=786432
> >  CONFIG_SPL_I2C=y
> > diff --git a/drivers/ata/ahci_sunxi.c b/drivers/ata/ahci_sunxi.c
> > index 94a3379c532..9064774e661 100644
> > --- a/drivers/ata/ahci_sunxi.c
> > +++ b/drivers/ata/ahci_sunxi.c
> > @@ -7,6 +7,7 @@
> >  #include <asm/io.h>
> >  #include <asm/gpio.h>
> >  #include <linux/delay.h>
> > +#include <power/regulator.h>
> >  
> >  #define AHCI_PHYCS0R 0x00c0
> >  #define AHCI_PHYCS1R 0x00c4
> > @@ -74,6 +75,7 @@ static int sunxi_ahci_phy_init(u8 *reg_base)
> >  
> >  static int sunxi_sata_probe(struct udevice *dev)
> >  {
> > +	struct udevice *reg_dev;
> >  	ulong base;
> >  	u8 *reg;
> >  	int ret;
> > @@ -89,6 +91,13 @@ static int sunxi_sata_probe(struct udevice *dev)
> >  		debug("%s: Failed to init phy (err=%d)\n", __func__, ret);
> >  		return ret;
> >  	}
> > +
> > +	ret = device_get_supply_regulator(dev, "target-supply", &reg_dev);
> > +	if (ret == 0) {
> > +		regulator_set_enable(reg_dev, true);
> > +		mdelay(500);
> > +	}
> > +
> >  	ret = ahci_probe_scsi(dev, base);
> >  	if (ret) {
> >  		debug("%s: Failed to probe (err=%d)\n", __func__, ret);  
> 


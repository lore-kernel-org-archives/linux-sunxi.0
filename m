Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08D870
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Jun 2021 00:35:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52E9ED6E;
	Sun, 20 Jun 2021 17:35:50 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 521E03F718;
	Sun, 20 Jun 2021 17:35:49 -0700 (PDT)
Date: Mon, 21 Jun 2021 01:35:33 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Qianfan Zhao <qianfanguijin@163.com>
Cc: u-boot@lists.denx.de, Icenowy Zheng <icenowy@aosc.io>, Chen-Yu Tsai
 <wens@csie.org>, Jagan Teki <jagan@amarulasolutions.com>, linux-sunxi
 <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 4/4] sunxi: defconfig: bpi-m2u: Enable usb gadget and
 ums by default
Message-ID: <20210621013533.7e34e548@slackpad.fritz.box>
In-Reply-To: <20210616023326.18135-4-qianfanguijin@163.com>
References: <20210616023326.18135-1-qianfanguijin@163.com>
	<20210616023326.18135-4-qianfanguijin@163.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Jun 2021 10:33:26 +0800
qianfanguijin@163.com (qianfanguijin@163.com) wrote:

Hi,

> From: qianfan Zhao <qianfanguijin@163.com>
> 
> Since the usb otg driver support R40 device, we enable usb gadget
> functions and ums.
> 
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  configs/Bananapi_M2_Ultra_defconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/Bananapi_M2_Ultra_defconfig b/configs/Bananapi_M2_Ultra_defconfig
> index 37bcb3d7bf..a0869d56ae 100644
> --- a/configs/Bananapi_M2_Ultra_defconfig
> +++ b/configs/Bananapi_M2_Ultra_defconfig
> @@ -7,12 +7,13 @@ CONFIG_MACPWR="PA17"
>  CONFIG_MMC0_CD_PIN="PH13"
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=2
>  CONFIG_USB1_VBUS_PIN="PH23"
> -CONFIG_USB2_VBUS_PIN="PH23"
>  CONFIG_DEFAULT_DEVICE_TREE="sun8i-r40-bananapi-m2-ultra"
>  CONFIG_AHCI=y
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SPL_I2C_SUPPORT=y
> +CONFIG_CMD_USB_MASS_STORAGE=y

So in general we don't have those kind of command enables in the
defconfig. It might be worth discussing whether we should enable the
really useful "ums" command by default, for all Allwinner devices
enabling USB gadget mode, but this would be done differently.

>  CONFIG_SCSI_AHCI=y
> +# CONFIG_USB_FUNCTION_FASTBOOT is not set

Why is this explicitly disabled? From what I can see, it doesn't hurt
to leave it enabled (through Kconfig's default), it does not interfere
with other gadgets like UMS or Ethernet.


>  CONFIG_RGMII=y
>  CONFIG_SUN8I_EMAC=y
>  CONFIG_AXP_DLDO4_VOLT=2500
> @@ -20,3 +21,5 @@ CONFIG_AXP_ELDO3_VOLT=1200
>  CONFIG_SCSI=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_MUSB_GADGET=y
> +CONFIG_USB_GADGET_DOWNLOAD=y

This last symbol is enabled automatically by the FASTBOOT option.

Cheers,
Andre

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75F1184
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 00:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E80C433B5
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 00:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669422310;
	bh=P5pT3TtFLH0lDt6mzdr2m03eUnUbkfGX7u+bZdEIkdM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S/No/sq5g5U21rTRd9VZ+crXsXb0uu6Tp6FXHsGYz+Vnm1+UBwZYrtJAVtm0osHXV
	 iPihUhGngftFHNELQe2zEy/4boF7NI18Sj7BswSZd00nyC6RZUYhZsGwMSjrTdur7a
	 2AksUVSBlHGTWmAc8q1cQh2vMl6P2IfR4HEmgmjFIAjsRhg+rQURoQ2HdXHK2pcWm7
	 LJdlxCoZXGiii9Q6YUGErnT2/frBmaNX5V57Tw0Pjt1iilyV1EZcekHNnGv2QbG+5E
	 vRH8MU00g7V/f39Xu9REoKUcuHCK6/iMqdZGLjRJJ+kDoNeOMkzmDwpAzSrYAKzQcX
	 X8attMNitmJXw==
Received: by mail-ej1-f42.google.com with SMTP id n21so13409925ejb.9
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Nov 2022 16:25:10 -0800 (PST)
X-Gm-Message-State: ANoB5pk2a6JC9EFI3NPEiyn4psMZFlfpWt4z9Bf/JM3IovGlyBqfW0Zo
	RIKY07NVLb8I3KkhYKFpH8jp/fQR5K5Ju+lwsRQ=
X-Google-Smtp-Source: AA0mqf57ZVICUuSakfqABFsOHVzvU/nlG5DScTstPOnlNDdtDFBxRhLSv2KYSrkTOKMxU3+7lS1CFsJeyL6q7Tw01UU=
X-Received: by 2002:a17:906:2342:b0:78d:9e77:1f8c with SMTP id
 m2-20020a170906234200b0078d9e771f8cmr26108661eja.236.1669422308914; Fri, 25
 Nov 2022 16:25:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-13-samuel@sholland.org>
In-Reply-To: <20221125234656.47306-13-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 26 Nov 2022 08:24:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTOKPAqazF5w03NBzxMW7MGpoCn7vvdj=RabGrzp5WVZQ@mail.gmail.com>
Message-ID: <CAJF2gTTOKPAqazF5w03NBzxMW7MGpoCn7vvdj=RabGrzp5WVZQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] riscv: defconfig: Enable the Allwinner D1
 platform and drivers
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Stanislav Jakubek <stano.jakubek@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 26, 2022 at 7:47 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Now that several D1-based boards are supported, enable the platform in
> our defconfig. Build in the drivers which are necessary to boot, such as
> the pinctrl, MMC, RTC (which provides critical clocks), SPI (for flash),
> and watchdog (which may be left enabled by the bootloader). Other common
> onboard peripherals are enabled as modules.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
> (no changes since v1)
>
>  arch/riscv/configs/defconfig | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 05fd5fcf24f9..8dfe0550c0e6 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -25,6 +25,7 @@ CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
>  # CONFIG_SYSFS_SYSCALL is not set
>  CONFIG_PROFILING=y
> +CONFIG_ARCH_SUNXI=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_STARFIVE=y
> @@ -118,22 +119,31 @@ CONFIG_VIRTIO_NET=y
>  CONFIG_MACB=y
>  CONFIG_E1000E=y
>  CONFIG_R8169=y
> +CONFIG_STMMAC_ETH=m
>  CONFIG_MICROSEMI_PHY=y
>  CONFIG_INPUT_MOUSEDEV=y
> +CONFIG_KEYBOARD_SUN4I_LRADC=m
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_DW=y
>  CONFIG_SERIAL_OF_PLATFORM=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
> +CONFIG_I2C_MV64XXX=m
>  CONFIG_SPI=y
>  CONFIG_SPI_SIFIVE=y
> +CONFIG_SPI_SUN6I=y
>  # CONFIG_PTP_1588_CLOCK is not set
> -CONFIG_GPIOLIB=y
>  CONFIG_GPIO_SIFIVE=y
> +CONFIG_WATCHDOG=y
> +CONFIG_SUNXI_WATCHDOG=y
> +CONFIG_REGULATOR=y
> +CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_DRM=m
>  CONFIG_DRM_RADEON=m
>  CONFIG_DRM_NOUVEAU=m
> +CONFIG_DRM_SUN4I=m
>  CONFIG_DRM_VIRTIO_GPU=m
>  CONFIG_FB=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
> @@ -146,19 +156,30 @@ CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
> +CONFIG_USB_MUSB_HDRC=m
> +CONFIG_USB_MUSB_SUNXI=m
> +CONFIG_NOP_USB_XCEIV=m
>  CONFIG_MMC=y
>  CONFIG_MMC_SDHCI=y
>  CONFIG_MMC_SDHCI_PLTFM=y
>  CONFIG_MMC_SDHCI_CADENCE=y
>  CONFIG_MMC_SPI=y
> +CONFIG_MMC_SUNXI=y
>  CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_SUN6I=y
> +CONFIG_DMADEVICES=y
> +CONFIG_DMA_SUN6I=m
>  CONFIG_VIRTIO_PCI=y
>  CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
> +CONFIG_SUN8I_DE2_CCU=m
> +CONFIG_SUN50I_IOMMU=y
Do we need IOMMU?

Others:
Reviewed-by: Guo Ren <guoren@kernel.org>

>  CONFIG_RPMSG_CHAR=y
>  CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
> +CONFIG_PHY_SUN4I_USB=m
> +CONFIG_NVMEM_SUNXI_SID=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
>  CONFIG_EXT4_FS_SECURITY=y
> --
> 2.37.4
>


-- 
Best Regards
 Guo Ren

Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE1E47762
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Dec 2023 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3772B143D;
	Wed,  6 Dec 2023 08:25:38 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF8D23F762;
	Wed,  6 Dec 2023 08:24:50 -0800 (PST)
Date: Wed, 6 Dec 2023 16:24:43 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>
Cc: Vignesh R <vigneshr@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Mikhail Kalashnikov <iuncuim@gmail.com>, Piotr
 Oniszczuk <piotr.oniszczuk@gmail.com>, Bob McChesney
 <bob@electricworry.net>, Stephen Graf <stephen.graf@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: Add support for zBIT ZB25VQ128
Message-ID: <20231206162443.7f0692d7@donnerap.manchester.arm.com>
In-Reply-To: <20231204005954.13201-2-andre.przywara@arm.com>
References: <20231204005954.13201-1-andre.przywara@arm.com>
	<20231204005954.13201-2-andre.przywara@arm.com>
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

On Mon,  4 Dec 2023 00:59:52 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

Hi,

> Add support for the zBIT ZB25VQ128 (128M-bit) SPI NOR flash memory chip,
> as used on the Xunlong Orange Pi Zero 3 board.

does anyone have any objections against this patch? I wanted to take this
via the sunxi tree, as this blocks some board support patches.

IIUC Linux gave up on adding rather generic entries up for each and every
SPI NOR chip, if there is nothing special about them:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=773bbe1044
Should we follow suit here?

Cheers,
Andre

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/mtd/spi/Kconfig       | 5 +++++
>  drivers/mtd/spi/spi-nor-ids.c | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/spi/Kconfig b/drivers/mtd/spi/Kconfig
> index 732b0760452..abed392c28d 100644
> --- a/drivers/mtd/spi/Kconfig
> +++ b/drivers/mtd/spi/Kconfig
> @@ -224,6 +224,11 @@ config SPI_FLASH_XTX
>  	  Add support for various XTX (XTX Technology Limited)
>  	  SPI flash chips (XT25xxx).
>  
> +config SPI_FLASH_ZBIT
> +	bool "ZBIT SPI flash support"
> +	help
> +	  Add support for Zbit Semiconductor Inc. SPI flash chips (ZB25xxx).
> +
>  endif
>  
>  config SPI_FLASH_USE_4K_SECTORS
> diff --git a/drivers/mtd/spi/spi-nor-ids.c b/drivers/mtd/spi/spi-nor-ids.c
> index 3cb132dcffc..f86e7ff8e58 100644
> --- a/drivers/mtd/spi/spi-nor-ids.c
> +++ b/drivers/mtd/spi/spi-nor-ids.c
> @@ -571,6 +571,11 @@ const struct flash_info spi_nor_ids[] = {
>  	       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  	{ INFO("xt25w01g", 0x0b651B, 0, 64 * 1024, 2048,
>  	       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +#endif
> +#ifdef CONFIG_SPI_FLASH_ZBIT
> +	/* Zbit Semiconductor Inc. */
> +	{ INFO("zb25vq128", 0x5e4018, 0, 64 * 1024, 256,
> +	       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  #endif
>  	{ },
>  };


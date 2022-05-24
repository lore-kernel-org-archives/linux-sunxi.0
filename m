Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296442566
	for <linux-sunxi@lists.linux.dev>; Tue, 24 May 2022 16:16:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FD2923A;
	Tue, 24 May 2022 09:16:45 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD3483F66F;
	Tue, 24 May 2022 09:16:43 -0700 (PDT)
Date: Tue, 24 May 2022 17:11:35 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jesse Taube <mr.bossman075@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Yifan Gu <me@yifangu.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, George Hilliard
 <thirtythreeforty@gmail.com>, Samuel Holland <samuel@sholland.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 u-boot@lists.denx.de
Subject: Re: [PATCH 6/7] Revert "sunxi: f1c100s: Drop SYSRESET to enable
 reset functionality"
Message-ID: <20220524171135.7f7a6d28@donnerap.cambridge.arm.com>
In-Reply-To: <20220503212040.27884-7-andre.przywara@arm.com>
References: <20220503212040.27884-1-andre.przywara@arm.com>
	<20220503212040.27884-7-andre.przywara@arm.com>
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

On Tue,  3 May 2022 22:20:39 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

> The original Allwinner F1C100 .dtsi imported from the Linux kernel tree
> used the wrong compatible string for the watchdog timer, so the Allwinner
> DM reset driver was not working properly. We worked around this by
> disabling the SYSRESET driver, so the hardcoded SPL reset driver took
> over.
> Now the issue was fixed in the DTs in mainline Linux, and we synced the
> fixed .dtsi file into U-Boot, so drop the hack and use the normal U-Boot
> proper reset infrastructure.
> 
> This reverts commit cfcf1952c11e6ffcbbf88eb63c49edca2acf1d5e.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied to sunxi/master.

Thanks,
Andre

> ---
>  configs/licheepi_nano_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/configs/licheepi_nano_defconfig b/configs/licheepi_nano_defconfig
> index 67b7b85c491..9fd1dcc9958 100644
> --- a/configs/licheepi_nano_defconfig
> +++ b/configs/licheepi_nano_defconfig
> @@ -10,4 +10,3 @@ CONFIG_DRAM_CLK=156
>  CONFIG_DRAM_ZQ=0
>  # CONFIG_VIDEO_SUNXI is not set
>  CONFIG_SPL_SPI_SUNXI=y
> -# CONFIG_SYSRESET is not set


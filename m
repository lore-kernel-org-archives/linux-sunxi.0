Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531447460
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Mar 2022 21:34:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EEED1063;
	Sat,  5 Mar 2022 13:34:23 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 023803F70D;
	Sat,  5 Mar 2022 13:34:21 -0800 (PST)
Date: Sat, 5 Mar 2022 21:33:40 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Hans de Goede
 <hdegoede@redhat.com>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
 Samuel Holland <samuel@sholland.org>, Jernej =?UTF-8?B?xaBrcmFiZWM=?=
 <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] sunxi: fix build when CONFIG_UART0_PORT_F is selected
Message-ID: <20220305193651.432e21d8@slackpad.lan>
In-Reply-To: <20220304160601.181155-1-icenowy@aosc.io>
References: <20220304160601.181155-1-icenowy@aosc.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  5 Mar 2022 00:06:01 +0800
Icenowy Zheng <icenowy@aosc.io> wrote:

Hi Icenowy,

> Currently CONFIG_UART0_PORT_F will forbid the build of sunxi-mmc driver,
> which leads calls to it in board/sunxi/board.c a undefined reference.
> 
> Guard that code in #ifndef to fix build.

That's indeed a problem.

> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  board/sunxi/board.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index 82c52b28f8..8a003d8559 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -539,6 +539,7 @@ int board_mmc_init(struct bd_info *bis)
>  {
>  	__maybe_unused struct mmc *mmc0, *mmc1;
>  
> +#ifndef CONFIG_UART0_PORT_F

Shouldn't it be "#ifdef CONFIG_MMC_SUNXI" instead, which is the actual
reason for the build fail?
And furthermore, this is just a link failure, and I think we rely on
toolchain garbage collection anyway, so I managed with:

	if (!CONFIG_IS_ENABLED(MMC_SUNXI))
		return 0;

which avoids the nested #ifdef.
Shall we go with this instead?

>  	mmc_pinmux_setup(CONFIG_MMC_SUNXI_SLOT);
>  	mmc0 = sunxi_mmc_init(CONFIG_MMC_SUNXI_SLOT);
>  	if (!mmc0)
> @@ -549,6 +550,7 @@ int board_mmc_init(struct bd_info *bis)
>  	mmc1 = sunxi_mmc_init(CONFIG_MMC_SUNXI_SLOT_EXTRA);
>  	if (!mmc1)
>  		return -1;
> +#endif
>  #endif
>  
>  	return 0;


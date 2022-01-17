Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524E32C82
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jan 2022 01:35:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEE131FB;
	Sun, 16 Jan 2022 17:35:39 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C30573F766;
	Sun, 16 Jan 2022 17:35:38 -0800 (PST)
Date: Mon, 17 Jan 2022 01:35:03 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, mripard@kernel.org, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev, Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH] sunxi: call fdt_fixup_ethernet again to set macaddr for
 more aliases
Message-ID: <20220117013503.7a1e0507@slackpad.fritz.box>
In-Reply-To: <20210911173916.615928-1-jernej.skrabec@gmail.com>
References: <20210911173916.615928-1-jernej.skrabec@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Sep 2021 19:39:16 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

> From: Icenowy Zheng <icenowy@aosc.io>
> 
> Sometimes some ethernet aliases do not exist in U-Boot DT but they
> exist in the DT used to boot the system (for example, modified via DT
> overlays). In this situation setup_environment is called again in
> ft_board_setup() to generate macaddr environment variable for them.
> However now the call to fdt_fixup_ethernet() is moved before the call
> of ft_board_setup().
> 
> Call fdt_fixup_ethernet() again to add MAC addresses for the extra
> ethernet aliases.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> [updated commit message]
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
> 
> Hi all,
> 
> this is effectively resend of:
> https://patchwork.ozlabs.org/project/uboot/patch/20171027093439.12414-1-icenowy@aosc.io/
> 
> On at least one board, namely BananaPi M2 Zero, adding ethernet connector is
> pretty popular after market modification. Since this is not something that is
> already present on the board, ethernet node will never be part of upstream DT.
> Thus, the only sensible solution is to use DT overlay, which adds node to DT
> (maintaining patches is tedious). However, when overlays are used, U-Boot
> misses injecting MAC address, as described in commit message.
> 
> Please reconsider this patch for inclusion in upstream.
> 
> Best regards,
> Jernej

Applied to sunxi/master.

Thanks,
Andre

> 
>  board/sunxi/board.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index 1a46100e408d..97554d4642ed 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -997,10 +997,12 @@ int ft_board_setup(void *blob, struct bd_info *bd)
>  	int __maybe_unused r;
>  
>  	/*
> -	 * Call setup_environment again in case the boot fdt has
> -	 * ethernet aliases the u-boot copy does not have.
> +	 * Call setup_environment and fdt_fixup_ethernet again
> +	 * in case the boot fdt has ethernet aliases the u-boot
> +	 * copy does not have.
>  	 */
>  	setup_environment(blob);
> +	fdt_fixup_ethernet(blob);
>  
>  	bluetooth_dt_fixup(blob);
>  


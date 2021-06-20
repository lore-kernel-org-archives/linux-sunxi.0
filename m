Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FD871
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Jun 2021 22:40:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01512D6E;
	Sun, 20 Jun 2021 15:40:38 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4DCE3F718;
	Sun, 20 Jun 2021 15:40:36 -0700 (PDT)
Date: Sun, 20 Jun 2021 23:40:21 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Simon Glass <sjg@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 4/4] sunxi: specify architecture when generating SPL
 boot image
Message-ID: <20210620234021.030eb98d@slackpad.fritz.box>
In-Reply-To: <20210619092111.647081-1-icenowy@aosc.io>
References: <20210619091838.646779-1-icenowy@aosc.io>
	<20210619092111.647081-1-icenowy@aosc.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Jun 2021 17:21:11 +0800
Icenowy Zheng <icenowy@aosc.io> wrote:

> As mkimage -T sunxi_egon now gains support for -A parameter, specify the
> architecture when generating SPL boot image for sunxi.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks!
Andre

> ---
> No changes in v2.
> 
>  scripts/Makefile.spl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.spl b/scripts/Makefile.spl
> index 5be1a9ba1b..c13a41a243 100644
> --- a/scripts/Makefile.spl
> +++ b/scripts/Makefile.spl
> @@ -414,7 +414,7 @@ endif
>  $(obj)/$(SPL_BIN).sfp: $(obj)/$(SPL_BIN).bin FORCE
>  	$(call if_changed,mkimage)
>  
> -MKIMAGEFLAGS_sunxi-spl.bin = -T sunxi_egon \
> +MKIMAGEFLAGS_sunxi-spl.bin = -A $(ARCH) -T sunxi_egon \
>  	-n $(CONFIG_DEFAULT_DEVICE_TREE)
>  
>  OBJCOPYFLAGS_u-boot-spl-dtb.hex := -I binary -O ihex --change-address=$(CONFIG_SPL_TEXT_BASE)


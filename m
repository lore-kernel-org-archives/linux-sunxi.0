Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E22173
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 13:47:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B4B611B3;
	Thu, 22 Jul 2021 06:47:35 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A18C3F694;
	Thu, 22 Jul 2021 06:47:34 -0700 (PDT)
Date: Thu, 22 Jul 2021 14:46:58 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec
 <jernej.skrabec@siol.net>, Samuel Holland <samuel@sholland.org>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH 02/13] sunxi: only include alias for eMMC when mmc2
 used
Message-ID: <20210722144658.56215012@slackpad.fritz.box>
In-Reply-To: <20210722063015.421923-3-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
	<20210722063015.421923-3-icenowy@sipeed.com>
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

On Thu, 22 Jul 2021 14:30:04 +0800
Icenowy Zheng <icenowy@sipeed.com> wrote:

> Some Allwinner SoCs (e.g. R329) doesn't have a MMC2 controller at all,
> and on boards that we do not utilize MMC2, the alias for it is just
> useless.
> 
> Only include the alias when we specify CONFIG_MMC_SUNXI_EXTRA_SLOT to 2.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>

Meh, not a friend of #ifdefs everywhere, but ideally we get rid of this
one day anyway, and it's in U-Boot DT "overlay" only, so:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/dts/sunxi-u-boot.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/dts/sunxi-u-boot.dtsi b/arch/arm/dts/sunxi-u-boot.dtsi
> index 4a6ed3a7dd..b7244c1112 100644
> --- a/arch/arm/dts/sunxi-u-boot.dtsi
> +++ b/arch/arm/dts/sunxi-u-boot.dtsi
> @@ -13,7 +13,9 @@
>  / {
>  	aliases {
>  		mmc0 = &mmc0;
> +#if CONFIG_MMC_SUNXI_EXTRA_SLOT == 2
>  		mmc1 = &mmc2;
> +#endif
>  	};
>  
>  	binman: binman {


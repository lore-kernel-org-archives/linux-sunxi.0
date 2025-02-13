Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B864879B
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Feb 2025 00:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739407296; cv=none; b=M/mQp9cH2WNck/8dFjSBx8qItstUkONpkykISOODvnn+N9DN1zlyRl0Reg58T3zf+NkAwsKv/jj0Tvg1FDU5Xb3UyLFNukenq6w6aXdlIHuWpB1oKJjBN8+xKKbL/Iz8gyy6Vug9pb+AVDoigD7Xsgssd2x+BYv96AqK7ZJvk8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739407296; c=relaxed/simple;
	bh=XF1Oc7XRHCDJlXTYTMN0xm9ThQduj5ZYw+BLfCKe+Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LQauI1jTMty4/AGySWbhjR2IVeYfYsFYedX9qWAr3KgQOWs9d4Y3zhqhihf+MS/uGNfe33a6AZlLiUQsOnP6iOpbeNlXzkGt8HYKwnoirkcwYl+Jfyi0eAD5rH62sOnugQC73YOAI+m39oZUY8oFM+13s0yvyWU/xDOLlKOSLOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 332FA1762;
	Wed, 12 Feb 2025 16:41:54 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F6513F5A1;
	Wed, 12 Feb 2025 16:41:31 -0800 (PST)
Date: Thu, 13 Feb 2025 00:39:27 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, sboyd@kernel.org,
 mturquette@baylibre.com, ryan@testtoast.com, Chris Morgan
 <macromorgan@hotmail.com>
Subject: Re: [PATCH 2/2] clk: sunxi-ng: h616: Add clock/reset for LCD TCON
Message-ID: <20250213003927.6f4c0b09@minigeek.lan>
In-Reply-To: <20250212191109.156766-3-macroalpha82@gmail.com>
References: <20250212191109.156766-1-macroalpha82@gmail.com>
	<20250212191109.156766-3-macroalpha82@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Feb 2025 13:11:09 -0600
Chris Morgan <macroalpha82@gmail.com> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the required clock and reset which is used for the LCD TCON.

Please mention here (and in the cover letter) that while those clocks
do exist on every H616 die, the respective LCD controllers are not
exposed on the H616 package, but only on the T507 and H700 version.

> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Apart from the part, I compared the code against the T507 manual, that
is a match:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 24 ++++++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.h |  2 +-
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> index 190816c35da9..40ab6873b797 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -645,6 +645,20 @@ static const char * const tcon_tv_parents[] = { "pll-video0",
>  						"pll-video0-4x",
>  						"pll-video1",
>  						"pll-video1-4x" };
> +static SUNXI_CCU_MUX_WITH_GATE(tcon_lcd0_clk, "tcon-lcd0",
> +			       tcon_tv_parents, 0xb60,
> +			       24, 3,	/* mux */
> +			       BIT(31),	/* gate */
> +			       CLK_SET_RATE_PARENT);
> +static SUNXI_CCU_MUX_WITH_GATE(tcon_lcd1_clk, "tcon-lcd1",
> +			       tcon_tv_parents, 0xb64,
> +			       24, 3,	/* mux */
> +			       BIT(31),	/* gate */
> +			       CLK_SET_RATE_PARENT);
> +static SUNXI_CCU_GATE(bus_tcon_lcd0_clk, "bus-tcon-lcd0", "ahb3",
> +		      0xb7c, BIT(0), 0);
> +static SUNXI_CCU_GATE(bus_tcon_lcd1_clk, "bus-tcon-lcd1", "ahb3",
> +		      0xb7c, BIT(1), 0);
>  static SUNXI_CCU_MP_WITH_MUX_GATE(tcon_tv0_clk, "tcon-tv0",
>  				  tcon_tv_parents, 0xb80,
>  				  0, 4,		/* M */
> @@ -855,8 +869,12 @@ static struct ccu_common *sun50i_h616_ccu_clks[] = {
>  	&hdmi_cec_clk.common,
>  	&bus_hdmi_clk.common,
>  	&bus_tcon_top_clk.common,
> +	&tcon_lcd0_clk.common,
> +	&tcon_lcd1_clk.common,
>  	&tcon_tv0_clk.common,
>  	&tcon_tv1_clk.common,
> +	&bus_tcon_lcd0_clk.common,
> +	&bus_tcon_lcd1_clk.common,
>  	&bus_tcon_tv0_clk.common,
>  	&bus_tcon_tv1_clk.common,
>  	&tve0_clk.common,
> @@ -989,8 +1007,12 @@ static struct clk_hw_onecell_data sun50i_h616_hw_clks = {
>  		[CLK_HDMI_CEC]		= &hdmi_cec_clk.common.hw,
>  		[CLK_BUS_HDMI]		= &bus_hdmi_clk.common.hw,
>  		[CLK_BUS_TCON_TOP]	= &bus_tcon_top_clk.common.hw,
> +		[CLK_TCON_LCD0]		= &tcon_lcd0_clk.common.hw,
> +		[CLK_TCON_LCD1]		= &tcon_lcd1_clk.common.hw,
>  		[CLK_TCON_TV0]		= &tcon_tv0_clk.common.hw,
>  		[CLK_TCON_TV1]		= &tcon_tv1_clk.common.hw,
> +		[CLK_BUS_TCON_LCD0]	= &bus_tcon_lcd0_clk.common.hw,
> +		[CLK_BUS_TCON_LCD1]	= &bus_tcon_lcd1_clk.common.hw,
>  		[CLK_BUS_TCON_TV0]	= &bus_tcon_tv0_clk.common.hw,
>  		[CLK_BUS_TCON_TV1]	= &bus_tcon_tv1_clk.common.hw,
>  		[CLK_TVE0]		= &tve0_clk.common.hw,
> @@ -1062,6 +1084,8 @@ static const struct ccu_reset_map sun50i_h616_ccu_resets[] = {
>  	[RST_BUS_HDMI]		= { 0xb1c, BIT(16) },
>  	[RST_BUS_HDMI_SUB]	= { 0xb1c, BIT(17) },
>  	[RST_BUS_TCON_TOP]	= { 0xb5c, BIT(16) },
> +	[RST_BUS_TCON_LCD0]	= { 0xb7c, BIT(16) },
> +	[RST_BUS_TCON_LCD1]	= { 0xb7c, BIT(17) },
>  	[RST_BUS_TCON_TV0]	= { 0xb9c, BIT(16) },
>  	[RST_BUS_TCON_TV1]	= { 0xb9c, BIT(17) },
>  	[RST_BUS_TVE_TOP]	= { 0xbbc, BIT(16) },
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
> index a75803b49f6a..7056f293a8e0 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
> @@ -51,6 +51,6 @@
>  
>  #define CLK_BUS_DRAM		56
>  
> -#define CLK_NUMBER		(CLK_BUS_GPADC + 1)
> +#define CLK_NUMBER		(CLK_BUS_TCON_LCD1 + 1)
>  
>  #endif /* _CCU_SUN50I_H616_H_ */


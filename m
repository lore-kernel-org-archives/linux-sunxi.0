Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B3E2561
	for <linux-sunxi@lists.linux.dev>; Tue, 24 May 2022 16:17:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64CB91042;
	Tue, 24 May 2022 09:17:02 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 451513F66F;
	Tue, 24 May 2022 09:17:01 -0700 (PDT)
Date: Tue, 24 May 2022 17:13:34 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Lukasz Majewski <lukma@denx.de>, Sean Anderson
 <seanga2@gmail.com>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] clk: sunxi: add and use dummy gate clocks
Message-ID: <20220524171334.0ff8da29@donnerap.cambridge.arm.com>
In-Reply-To: <20220506003301.13194-3-andre.przywara@arm.com>
References: <20220506003301.13194-1-andre.przywara@arm.com>
	<20220506003301.13194-3-andre.przywara@arm.com>
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

On Fri,  6 May 2022 01:33:01 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

> Some devices enumerate various clocks in their DT, and many drivers
> just blanketly try to enable all of them. This creates problems
> since we only model a few gate clocks, and the clock driver outputs
> a warning when a clock is not described:
> =========
> sunxi_set_gate: (CLK#3) unhandled
> =========
> 
> Some clocks don't have an enable bit, or are already enabled in a
> different way, so we might want to just ignore them.
> 
> Add a CCU_CLK_F_DUMMY_GATE flag that indicates that case, and define
> a GATE_DUMMY macro that can be used in the clock description array.
> Define a few clocks, used by some pinctrl devices, that way to suppress
> the runtime warnings.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied to sunxi/master.

Thanks,
Andre

> ---
>  drivers/clk/sunxi/clk_h6.c    | 2 ++
>  drivers/clk/sunxi/clk_h616.c  | 2 ++
>  drivers/clk/sunxi/clk_h6_r.c  | 2 ++
>  drivers/clk/sunxi/clk_sunxi.c | 3 +++
>  include/clk/sunxi.h           | 5 +++++
>  5 files changed, 14 insertions(+)
> 
> diff --git a/drivers/clk/sunxi/clk_h6.c b/drivers/clk/sunxi/clk_h6.c
> index f4e26cbcd45..b3202342932 100644
> --- a/drivers/clk/sunxi/clk_h6.c
> +++ b/drivers/clk/sunxi/clk_h6.c
> @@ -16,6 +16,8 @@
>  static struct ccu_clk_gate h6_gates[] = {
>  	[CLK_PLL_PERIPH0]	= GATE(0x020, BIT(31)),
>  
> +	[CLK_APB1]		= GATE_DUMMY,
> +
>  	[CLK_BUS_MMC0]		= GATE(0x84c, BIT(0)),
>  	[CLK_BUS_MMC1]		= GATE(0x84c, BIT(1)),
>  	[CLK_BUS_MMC2]		= GATE(0x84c, BIT(2)),
> diff --git a/drivers/clk/sunxi/clk_h616.c b/drivers/clk/sunxi/clk_h616.c
> index 65ab44643da..80099727def 100644
> --- a/drivers/clk/sunxi/clk_h616.c
> +++ b/drivers/clk/sunxi/clk_h616.c
> @@ -15,6 +15,8 @@
>  static struct ccu_clk_gate h616_gates[] = {
>  	[CLK_PLL_PERIPH0]	= GATE(0x020, BIT(31) | BIT(27)),
>  
> +	[CLK_APB1]		= GATE_DUMMY,
> +
>  	[CLK_BUS_MMC0]		= GATE(0x84c, BIT(0)),
>  	[CLK_BUS_MMC1]		= GATE(0x84c, BIT(1)),
>  	[CLK_BUS_MMC2]		= GATE(0x84c, BIT(2)),
> diff --git a/drivers/clk/sunxi/clk_h6_r.c b/drivers/clk/sunxi/clk_h6_r.c
> index 2e0bbaa903b..c592886a258 100644
> --- a/drivers/clk/sunxi/clk_h6_r.c
> +++ b/drivers/clk/sunxi/clk_h6_r.c
> @@ -11,6 +11,8 @@
>  #include <linux/bitops.h>
>  
>  static struct ccu_clk_gate h6_r_gates[] = {
> +	[CLK_R_APB1]		= GATE_DUMMY,
> +
>  	[CLK_R_APB1_TIMER]	= GATE(0x11c, BIT(0)),
>  	[CLK_R_APB1_TWD]	= GATE(0x12c, BIT(0)),
>  	[CLK_R_APB1_PWM]	= GATE(0x13c, BIT(0)),
> diff --git a/drivers/clk/sunxi/clk_sunxi.c b/drivers/clk/sunxi/clk_sunxi.c
> index 9673b58a492..9a21367a5d0 100644
> --- a/drivers/clk/sunxi/clk_sunxi.c
> +++ b/drivers/clk/sunxi/clk_sunxi.c
> @@ -27,6 +27,9 @@ static int sunxi_set_gate(struct clk *clk, bool on)
>  	const struct ccu_clk_gate *gate = priv_to_gate(priv, clk->id);
>  	u32 reg;
>  
> +	if ((gate->flags & CCU_CLK_F_DUMMY_GATE))
> +		return 0;
> +
>  	if (!(gate->flags & CCU_CLK_F_IS_VALID)) {
>  		printf("%s: (CLK#%ld) unhandled\n", __func__, clk->id);
>  		return 0;
> diff --git a/include/clk/sunxi.h b/include/clk/sunxi.h
> index a2239b990b8..c4a9dee5ebf 100644
> --- a/include/clk/sunxi.h
> +++ b/include/clk/sunxi.h
> @@ -18,6 +18,7 @@
>  enum ccu_flags {
>  	CCU_CLK_F_IS_VALID		= BIT(0),
>  	CCU_RST_F_IS_VALID		= BIT(1),
> +	CCU_CLK_F_DUMMY_GATE		= BIT(2),
>  };
>  
>  /**
> @@ -38,6 +39,10 @@ struct ccu_clk_gate {
>  	.flags = CCU_CLK_F_IS_VALID,		\
>  }
>  
> +#define GATE_DUMMY {				\
> +	.flags = CCU_CLK_F_DUMMY_GATE,		\
> +}
> +
>  /**
>   * struct ccu_reset - ccu reset
>   * @off:	reset offset


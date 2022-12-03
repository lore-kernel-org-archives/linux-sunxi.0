Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB501101
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Dec 2022 00:23:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A96323A;
	Fri,  2 Dec 2022 16:24:00 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 817DF3F73B;
	Fri,  2 Dec 2022 16:23:51 -0800 (PST)
Date: Sat, 3 Dec 2022 00:22:05 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, =?UTF-8?B?QW5kcsOhcyBTemVtesWR?=
 <szemzo.andras@gmail.com>
Subject: Re: [PATCH 4/5] clk: sunxi-ng: d1: Mark cpux clock as critical
Message-ID: <20221203002205.0f97d3bf@slackpad.lan>
In-Reply-To: <20221126191319.6404-5-samuel@sholland.org>
References: <20221126191319.6404-1-samuel@sholland.org>
	<20221126191319.6404-5-samuel@sholland.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 26 Nov 2022 13:13:18 -0600
Samuel Holland <samuel@sholland.org> wrote:

> From: Andr=C3=A1s Szemz=C5=91 <szemzo.andras@gmail.com>
>=20
> Some SoCs in the D1 family feature ARM CPUs instead of a RISC-V CPU.
> In that case, the CPUs are driven from the 'cpux' clock, so it needs
> to be marked as critical.

Yes, my board hangs without that patch somewhere into the boot, and
this patch fixes it.

Can you also explain in the commit message why this is needed? IIRC
the CPU node itself does not "consume" the clock, this would only be
done by DVFS code?
And it might be worth noting that we do this for every other
Allwinner SoC as well.

> Signed-off-by: Andr=C3=A1s Szemz=C5=91 <szemzo.andras@gmail.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>=20
>  drivers/clk/sunxi-ng/ccu-sun20i-d1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c b/drivers/clk/sunxi-ng/=
ccu-sun20i-d1.c
> index 8ef3cdeb7962..c5a7df93602c 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
> @@ -240,7 +240,7 @@ static const struct clk_parent_data cpux_parents[] =
=3D {
>  	{ .hw =3D &pll_periph0_800M_clk.common.hw },
>  };
>  static SUNXI_CCU_MUX_DATA(cpux_clk, "cpux", cpux_parents,
> -			  0x500, 24, 3, CLK_SET_RATE_PARENT);
> +			  0x500, 24, 3, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
> =20
>  static const struct clk_hw *cpux_hws[] =3D { &cpux_clk.common.hw };
>  static SUNXI_CCU_M_HWS(cpux_axi_clk, "cpux-axi",


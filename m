Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229CE1871
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Jul 2022 13:14:19 +0000 (UTC)
Received: from p508fd39e.dip0.t-ipconnect.de ([80.143.211.158] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o7GG4-0001Vv-Rz; Fri, 01 Jul 2022 15:00:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Cc: Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: [RESEND PATCH] rtc: sun6i: add support for R329 RTC
Date: Fri, 01 Jul 2022 15:00:28 +0200
Message-ID: <5026101.q0ZmV6gNhb@phil>
In-Reply-To: <20220626042756.58961-1-samuel@sholland.org>
References: <20220626042756.58961-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 26. Juni 2022, 06:27:56 CEST schrieb Samuel Holland:
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> Allwinner R329 has a RTC with a similar time storage with H616 but a
> slightly different clock part.
> 
> As we have already handled the R329 RTC clocks in the CCU driver, add a
> compatible string to RTC driver to allow probing of the RTC.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

On a D1-Nezha
Tested-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> Resending this patch separately from Icenowy's R329 series[1] because it
> is also needed for D1 (which has R329 as its fallback compatible[2]), so
> I would like to get it in to 5.20.
> 
> [1]: https://lore.kernel.org/lkml/BYAPR20MB2472C608678F3FAEDA7B7541BCF79@BYAPR20MB2472.namprd20.prod.outlook.com/
> [2]: https://lore.kernel.org/lkml/20220203021736.13434-3-samuel@sholland.org/
> 
>  drivers/rtc/rtc-sun6i.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index 57540727ce1c..ed5516089e9a 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -875,6 +875,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
>  	{ .compatible = "allwinner,sun50i-h6-rtc" },
>  	{ .compatible = "allwinner,sun50i-h616-rtc",
>  		.data = (void *)RTC_LINEAR_DAY },
> +	{ .compatible = "allwinner,sun50i-r329-rtc",
> +		.data = (void *)RTC_LINEAR_DAY },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
> 





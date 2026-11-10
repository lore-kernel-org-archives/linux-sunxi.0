Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326237;
	b=C79IUPNRI7BB24WPNu650ColIorXS3GMA4LYPG3lVvvgMlf5UZns3cVTpvuKf8fo2aUU
	 nhTbio2Olz2VcOtmUD2YsygHEv7CGBNdwEmHPKoA8+p8TW5lVo435SbiMMRkit5ht8430
	 y0uCwPcqylTfndZRg6ZMuGJe7a834RA0fDp8EAcAg6DofjwSUKp41xVT5KkOGFjPmV6O3
	 1x3AhWcGMrEyWC1RBQ+PkpF0EeiIulzGqHNEgs+q9xFQxGsy7CBXenGYIO59ZBzZBEsbi
	 5Ye/179BKpLYNX82akp0vI9BbBXfsk/9D94kPhkwrsFnmIjXFXQwQevvrfzVwyDf1MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=RWEG02ii2Bekn4jxdEeI8vIwOKDAIYsvyu7g0S6lfUI=;
	b=hc402VnYGU7px3ZNB7AjgGYLF85BYjcLYNqIViRkAiInh59K3eM1tO9G1YrCjSya/sp7
	 18bm6z5hubfPaouPUlq1GNqbuzfRvq7NeZvTdq3Ah3ZAmlTxN/2+TCstBGtTCm697pP0B
	 sT5ZAk4YNSJwTQsJD1VV6VKvcTUWRQIdDmTv7yXl8z7LRy8NztMnyRxoxHkWZZPpjHHWm
	 H4i5pzXg8ZsKRyYFAwOV+WfwSHIKd4cCC3tUu9NcpgkZX2g1ZXZjB0pfehYF9MxDjx/pf
	 oZqsZe/bidckpuecSeB+W1v+ERlq8s1WqznfRII+fs/V4GPsh+Ve2Se+QAWcqZTOAlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvFZifzF;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C600606A320
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 15:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C600606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvFZifzF
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so14657615e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 07:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326235; x=1794931035; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWEG02ii2Bekn4jxdEeI8vIwOKDAIYsvyu7g0S6lfUI=;
        b=AvFZifzF3H/hakAQkPOvnB4vYCk2GwCDRsk6aiJhyF6XHZm4zZEzEiOIInnMLXJh5E
         x4kNuCO+7R2cuo0hJIsYkLpNdWJwP+23/Bq4wiG74mH/VxBZJtIZUphUiQhrW+nMT3Pz
         t9CckhZUCdjQkBFKlbVhDXp/tEyc7SAYbiB2QpWm5QhQdbqPG7lQSJHJM4AyT+zZARNh
         kk+Wlk2BPwH8fEFKC6viLhLBGKKYlcysdAbzkDJfNqEmLSK6bGj1hPiNWS5SstUjkHeb
         rieUn7RcndEWfWUK/THQWoQSSK51JTTl/mGQZImWcRPFTJjvJw8jjO4WmpjTIqvgKElk
         hsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326235; x=1794931035;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWEG02ii2Bekn4jxdEeI8vIwOKDAIYsvyu7g0S6lfUI=;
        b=oP8rGHfrUv+fsFviTZWIlSEjmpR5OQy+7w7WpjNzIiLz7Z/05dIH/KivWw5O8qnoDX
         iVH+SnZGI/PXvdL4lWZhU5NJwzZdO/f1kqaaYT1FxD40sZrwlqUePdUuuCMjpcCfknPu
         PQze0tMaDE0JkoNzszSBhPNs8DaC/kXxqA/T+uo/FHB5boFdIOpMnXLWmrwxXaFoE6mE
         6FYD0aWbvj9ncsTrn3CLTGk6KRIx0S+hV1XWwp02noNjBOFxSqNO2XfK5QMJXvHdUOZY
         8MBL0x7Nd0Iso/1Ud0DfXQffcXVPMz1kgv8/u4emOFOxI+yb4YfvRyuzVaXDiopWdBoC
         xfCQ==
X-Forwarded-Encrypted: i=1; AL+hErEdIytIHr6WLh9wZy89yPZskJBCXtqiNCtZWcTi3pE9SJOeuhIGZNxI1WFjPp8SipbSjy9wksIn+EhCyA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9M2Nk/nUmJmiSNVdYHpAHg2L1QXG+ah6uG8LJz3hALd0zRnnCE
	EFuehZknjR5BMaT2Sa5XK8uWnTZ3fReHVh+Lw9tKlycoNR/0yT+yoRp2
X-Gm-Gg: AYBFou0M/WBKUPQ2LVk4iU61o8ahKnjOVnvbCIctT45rLqrPduyCDu+phYCghj3pnTN
	YfeNVm4YleRHtjtCPJFSIcvd3w1eX5y0pPFoLvHLWJEWwtGySa39GQVtgXg/epjGK5/iYfFDmCt
	23hV65LXQiMOS+cMk3MDZ3lhgPpTRCugjZ4pNxnlBEFo8+rK3yiYsnBw3GRqhhF1GkJd3k9RA6B
	asyCUVJfuYnoJyGCxdKWqGiEQ2cgofDzITbN0sOD26aKDQAWP27wDqUrsoAdIYKerUg2Bb8+LuA
	m9CRPc6RkFGWSmuQ+9rruSWdum6bAHTxSDP7XJUD8aWnn1OqSJORIz3SerGb1wbfID407xUTZLA
	tBweHVoOGDnZ6P7OOqS84NybINIa4XmqW2Y32bc937Z6fjOjYPvcT9oc7tw09RqRgGHsRr0KWHB
	tFepmUxdWgziquvFaz4YtU7iN2XrFj91/OKvTPAluPvU1crQA61VOj2kvSJZqff7CW6ufL3Fz28
	IH8uijBkyBX3KqZq9xPmZsifhanEnMbYeHWXeQypdXFraIcrCvUZb/10WMC973cS6TCCF3CVLBL
	YT8LuimESgmf45yUvn5xNkzu9zaUo1txdnqMo35bAIeh7pa4soHwnZ1yKTYBDWowaCxIlBagwlk
	ac7kd++vjLc/HmnH06eNKf7X8lCstTC27FOwWPpBNeGphW1v2Zl9MUJ2LEFP7Aw6ApDoJbWlGl5
	KBvsVqDs1T24JdYmkSchrUA9PFHSlPFh8W7Nv+HalozAEcDu82siBGxdH0AOZFThAC50hdjix08
	+zLU+oMVvOUW7+V9wEWBQaj/FDPjO6Z+nfa+igA2cMJ5qD2nbL3uwuuztHUKWI=
X-Received: by 2002:a05:600c:46d0:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4ba023052c9mr57287525e9.4.1794326235267;
        Tue, 10 Nov 2026 07:57:15 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0236f03esm56975655e9.3.2026.11.10.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:57:14 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, aiyengar1990@gmail.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/2] clk: sunxi-ng: h616: Fix the EMAC 25 MHz clock parent and
 divider
Date: Tue, 10 Nov 2026 16:57:13 +0100
Message-ID: <jHidiYvvSNm_NWg1iHXN0A@gmail.com>
In-Reply-To: <20261110-h616-clk-emac-spdif-v1-1-e5e36e8963e4@gmail.com>
References:
 <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
 <20261110-h616-clk-emac-spdif-v1-1-e5e36e8963e4@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 10. november 2026 ob 07:03:00 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The H616 user manual (v1.0, 3.3.5.86 EPHY_25M_CLK_REG, 0x0970) gives the
> EPHY 25 MHz clock as PLL_PERI0(1X) / 24, with bit 31 gating the output
> and bit 30 gating the PLL_PERI0 input. The driver models it as a plain
> gate below ahb3, so the clock framework reports the AHB3 rate (200 MHz)
> for a clock that runs at 25 MHz, and the clock tree does not show that
> the PHY clock depends on pll-periph0 rather than on the AHB3 bus.
>=20
> Model it like the D1 driver does: a gate with a fixed /24 pre-divider
> below pll-periph0. The register writes do not change, only the parent
> and the reported rate do. On an Orange Pi Zero2, emac-25m now reads
> 25000000 with pll-periph0 (600 MHz) as its parent.
>=20
> Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 C=
CU")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index 955c614830fa..d2625fec651a 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -489,8 +489,17 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(spi1_clk, "spi1", =
nand_spi_parents, 0x944,
>  static SUNXI_CCU_GATE(bus_spi0_clk, "bus-spi0", "ahb3", 0x96c, BIT(0), 0=
);
>  static SUNXI_CCU_GATE(bus_spi1_clk, "bus-spi1", "ahb3", 0x96c, BIT(1), 0=
);
> =20
> -static SUNXI_CCU_GATE(emac_25m_clk, "emac-25m", "ahb3", 0x970,
> -		      BIT(31) | BIT(30), 0);
> +/*
> + * The EPHY 25 MHz clock is PLL_PERI0(1X) / 24, gated by both the special
> + * clock gate (bit 31) and the PLL_PERI0 input gate (bit 30).
> + */
> +static const struct clk_hw *emac_25m_parents[] =3D {
> +	&pll_periph0_clk.common.hw
> +};
> +
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac_25m_clk, "emac-25m",
> +				      emac_25m_parents, 0x970,
> +				      BIT(31) | BIT(30), 24, 0);
> =20
>  static SUNXI_CCU_GATE(bus_emac0_clk, "bus-emac0", "ahb3", 0x97c, BIT(0),=
 0);
>  static SUNXI_CCU_GATE(bus_emac1_clk, "bus-emac1", "ahb3", 0x97c, BIT(1),=
 0);
>=20
>=20





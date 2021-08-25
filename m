Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB96D3FC2
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Aug 2021 15:03:33 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id g135so5905465wme.5
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Aug 2021 08:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ux7Lx8zf6ajxZKAoqzyCK78arXZQbpaBRVWqe+SfbQs=;
        b=EdHWAIS4/fhniuXlCJllaGm9aTliPC+TZkhYe02dR8MzvdvgkNlCgkfh571TYFzJqG
         JVhpzTy1xBNFWRHheHZNvYN8LEdTnqsUlYZN8bh6O2z8jVPnHC9oD22vR6bHjBHQDnkQ
         Trzjj9bWlBf5zrRtL3JJnlvCdFErJALpHXMnurlGK3cdHRG7Ovq/vMKBCzVjH55Vz3IF
         zE5wMKJyDg/ZLsBMYkdK6ADUVojplJZhdTKEN5zeqoiBO6YUu6BcaZ/gsv/2meSfPYoI
         qebX9ovuXjv7rqYkXezDCoYHLkhoCWnohCu92sZRPue7p31OvGqAYOtMtcVQCa3BQMAl
         L6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ux7Lx8zf6ajxZKAoqzyCK78arXZQbpaBRVWqe+SfbQs=;
        b=SbzJTNH+nirSJ9ryPcFJk06Xyy0Pojc0DL2f1dnvvM4wbOZH33JB1Ea9phIj8X9zMj
         E2Mv4+E1P03rOBkIrfdd25iT8ofDLHCA7gjhmfTOaB80nin/cxUqfLa5RuCAT+vxFJRC
         Yqu0h6e0usUOg6lBCFAOWJfLX56pcEyekDmkY1SOdjXL6gRSX4J98hQpX1JceBOLMA14
         C7uRvh9FnmuoPT16x6ZsansXkHy2R9rukV/VfUWFd20dNunWhptfWPktYccHpt+R7JqN
         6qBxiDwkixbfxllI5AYry8TNnnbxSXQlaM5VmSQKmc5Hh36YwRxcXtgAMkmmoDNoDZZG
         wmXw==
X-Gm-Message-State: AOAM532nseI8ESwtLqJuVw1s8gf3kiOhLsCZzxmV3xfbaWHe8YHCZdqM
	5k91JiAgNIAtG7cMfdG72Fo=
X-Google-Smtp-Source: ABdhPJyH76gAEIdov99EVjI78hQXaDX6mFzZyCgjynTCqvVpMKFZAkxb6ffzZlsyNRsemTO8aNAOsw==
X-Received: by 2002:a05:600c:4f96:: with SMTP id n22mr9338543wmq.17.1629903812305;
        Wed, 25 Aug 2021 08:03:32 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id l15sm120580wrv.84.2021.08.25.08.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 08:03:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Icenowy Zheng <icenowy@sipeed.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/17] clk: sunxi=ng: add support for R329 R-CCU
Date: Wed, 25 Aug 2021 17:03:30 +0200
Message-ID: <3221818.pD4rYpbbZ1@jernej-laptop>
In-Reply-To: <20210825145027.ixc7wnh3x5w6wzny@gilmour>
References: <20210802062212.73220-1-icenowy@sipeed.com> <5432230.1UTMcGJKg4@jernej-laptop> <20210825145027.ixc7wnh3x5w6wzny@gilmour>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sreda, 25. avgust 2021 ob 16:50:27 CEST je Maxime Ripard napisal(a):
> Hi,
>=20
> On Fri, Aug 20, 2021 at 06:34:38AM +0200, Jernej =C5=A0krabec wrote:
> > > > +static void __init sun50i_r329_r_ccu_setup(struct device_node *nod=
e)
> > > > +{
> > > > +	void __iomem *reg;
> > > > +	u32 val;
> > > > +	int i;
> > > > +
> > > > +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> > > > +	if (IS_ERR(reg)) {
> > > > +		pr_err("%pOF: Could not map clock registers\n", node);
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	/* Enable the lock bits and the output enable bits on all PLLs */
> > > > +	for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
> > > > +		val =3D readl(reg + pll_regs[i]);
> > > > +		val |=3D BIT(29) | BIT(27);
> > > > +		writel(val, reg + pll_regs[i]);
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * Force the I/O dividers of PLL-AUDIO1 to reset default value
> > > > +	 *
> > > > +	 * See the comment before pll-audio1 definition for the reason.
> > > > +	 */
> > > > +
> > > > +	val =3D readl(reg + SUN50I_R329_PLL_AUDIO1_REG);
> > > > +	val &=3D ~BIT(1);
> > > > +	val |=3D BIT(0);
> > > > +	writel(val, reg + SUN50I_R329_PLL_AUDIO1_REG);
> > > > +
> > > > +	i =3D sunxi_ccu_probe(node, reg, &sun50i_r329_r_ccu_desc);
> > > > +	if (i)
> > > > +		pr_err("%pOF: probing clocks fails: %d\n", node, i);
> > > > +}
> > > > +
> > > > +CLK_OF_DECLARE(sun50i_r329_r_ccu, "allwinner,sun50i-r329-r-ccu",
> > > > +	       sun50i_r329_r_ccu_setup);
> > >=20
> > > Please make this a platform driver. There is no particular reason why=
 it
> > > needs to be an early OF clock provider.
> >=20
> > Why? It's good to have it as early clock provider. It has no dependenci=
es
> > and other drivers that depends on it, like IR, can be deferred, if this
> > is loaded later.
>=20
> No, Samuel is right, we should make them regular drivers as much as we
> can.
>=20
> The reason we had CLK_OF_DECLARE in the first place is that timers
> usually have a parent clock, and you need the timers before the device
> model is set up.
>=20
> Fortunately for us, since the A20, the architected timers don't require
> a parent clock from us, and we can thus boot up fine.

There are other timers. A lot of SoCs, newer than A20 (like H6), have High=
=20
Speed Timer, which requires parent clock to be enabled. We just choose not =
to=20
add node for it to DT, even if it's there and driver already exists.

Best regards,
Jernej

>=20
> Since the dependencies are minimal, it should probe fairly early and
> with the on-demand probing from the device links you might not even tell
> the difference for most consumers.
>=20
> Maxime





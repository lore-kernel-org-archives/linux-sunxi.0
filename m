Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A590E28F950
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Mar 2025 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102134; cv=none; b=X7sKBvUlmcVhHMc7bLZR4VauZNi2CfOa3fdbRPO309G1UEoC/DPRkYVioSgWwhh6C1vn6C2PA9C3oenwcV5h51oHFxIBH9i3Y4EAwc74YVKndATuHbstAvtkldZEzPU3VbfjOaVB8LcTwv3yL2A1lJLKCP5YD/rBtr2BhNum0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102134; c=relaxed/simple;
	bh=JD81ilNYFouAKsUXwRzwNxXUtg6eNoEjBJCvikF5+Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FYzTyLPn+0QzAMqqkUS3SMJJOf2jQZcUnmVRU4RHceJqyJv++fh+awFfmwjr4egY7iNvyzcVaYG3oOdRhqFsRkOuMGOFBTr74dnQx3Vr5IqaIuC2ja32az3pR3tEJCUH7Wv9T8Ocy27iasD9flmjyj40gb80j+UXS9RoqNJrOfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kq1nTZmA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kq1nTZmA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bc48ff815so13559855e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Mar 2025 07:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741102131; x=1741706931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GJGl+C+XNyqfDThAEBolXrcWZxVz5MRHfSv1hTEwQU=;
        b=Kq1nTZmAVC9kJKJvh2jIxLaeqSsbuJKEv6HVxu46aEaKMNPHsBikpvMIINH9BOOIlB
         W/lXX1Je65F4aL5Gc06bE3ni9p+0YLrLfuHnIOOd/I3uO3U22aQym05Ab9Im5PgLrRA/
         /GdxniGrEVcGfBMEk0Qijiiszqnzc7Hm7SbOf/OtgaEQkUdsrnRVNp7kHzkev0djYBd3
         Cl6Gfvya9tvC9MRYvy3Twm45SF9uDtJt+7WXvcSOCKDUKfoYkok9xiW77C83EDT7jsow
         r6g3E+YOPuaW5H7MoCRMoMU224P4vo+6WTTeExTbE8NcdKjbQSkHprRlb3NHkIOmC7nB
         ed2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741102131; x=1741706931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GJGl+C+XNyqfDThAEBolXrcWZxVz5MRHfSv1hTEwQU=;
        b=q2iaX7hopN9TvbuTmRlF9jSza44geUMdu2x2p16y66czfOcux0fBCSpYZI8JyU8dmw
         ZwhU3ZPxfVqULq01SzcQ1fB+lafMZLIeqcFKuN51UIWvVA/1i8rw2aQRj3PbQ/u8LoFz
         +v9Q6xT/4HEY/cVjzfAVttH+Ib81uImJhq4p3KlQc9zqKCdFF2xDl5wlxef27j/MUBNp
         GdF4s8mj9HAf9MHbVh4teniy1KOpUH1UpYX4aZTsflkCsd8/lhjchQcaNMQdnKAf1fbc
         qRO4FKd3seyiOHIN8LKABlwZN8YwwyxZLIZB5xVzNGFWVYE8M0XquriX2N+3yTcRFdAY
         TisA==
X-Forwarded-Encrypted: i=1; AJvYcCWnBpCrfS86UHSfbkX+r0E1jpb7+cg9WdFKpeAJYk2Sz/NxeihevcoSDaRaypxYld6IpjlMTnaG8B1QEA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf4adPBt2IBNJ8AvFaC9vMUmq9aI6jXDj66TJflTyKUFkPasjE
	DavfGwE55Fps/PQNEA+VvS4FdIpb/CEayTOxP8azE+m9u5sugWPl
X-Gm-Gg: ASbGncuBWYXTBpvFtAWvVfzQPJePw03kvS5Xw7CqB2xrUkZOuCrOSVk7NjOqixjTqJf
	b0+7WSE2LNid6sZGPuDN5TNt15GpzQOKmgGtC/hztiOIPryRXmFaDyVXGPQpf/TOY0f4kVxqh4N
	OU1XsNZm5B9EEV74jayl4Zf7Nx4StfHP1mOhE07DWFZFMlFcabWQq31A5xEC+qSHQHLU/TGhE3P
	ZtWH5Wt5Xh1VLSJ1Y8LLguL304fSVi9B+SVm7hCc5cVHyCJmJ1gg6pcggTxBWlx76wm8HPaGDm8
	A2vlbmurOf/fLSvIQlfvGP0dyZ5WyYtzZljpRqVKQnvoYb0fB8g8pHRtygpACF7SoOFs/ewvpvB
	BneUMib2RbY9xYKbNGjF0
X-Google-Smtp-Source: AGHT+IFPb9waA98CjEsodSk/NmmLQ1ZnBzxU9eF7fwwfV3+Lk/QdrRxr//FWTFj6LpiihIZeVHwMXg==
X-Received: by 2002:a05:600c:4917:b0:43b:c824:97fa with SMTP id 5b1f17b1804b1-43bcb04f0e3mr27784975e9.14.1741102130656;
        Tue, 04 Mar 2025 07:28:50 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5710ebsm238381775e9.26.2025.03.04.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:28:50 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/15] clk: sunxi-ng: Add support for update bit
Date: Tue, 04 Mar 2025 16:28:48 +0100
Message-ID: <3616088.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20250304012805.28594-4-andre.przywara@arm.com>
References:
 <20250304012805.28594-1-andre.przywara@arm.com>
 <20250304012805.28594-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 4. marec 2025 ob 02:27:53 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Some clocks in the Allwinner A523 SoC contain an "update bit" (bit 27),
> which must be set to apply any register changes, namely the mux
> selector, the divider and the gate bit.
>=20
> Add a new CCU feature bit to mark those clocks, and set bit 27 whenever
> we are applying any changes.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu_common.h | 4 ++++
>  drivers/clk/sunxi-ng/ccu_div.c    | 2 ++
>  drivers/clk/sunxi-ng/ccu_gate.c   | 4 ++++
>  drivers/clk/sunxi-ng/ccu_mux.c    | 2 ++
>  4 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu=
_common.h
> index 50fd268329671..d41d33bdff470 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.h
> +++ b/drivers/clk/sunxi-ng/ccu_common.h
> @@ -20,10 +20,14 @@
>  #define CCU_FEATURE_KEY_FIELD		BIT(8)
>  #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
>  #define CCU_FEATURE_DUAL_DIV		BIT(10)
> +#define CCU_FEATURE_UPDATE_BIT27	BIT(11)

There is no reason to have "BIT27" in the name of the macro. This is similar
to KEY_FIELD, which is generic name and doesn't specify either key or posit=
ion
of this key field. Maybe just CCU_FEATURE_UPDATE_BIT or something equaly
generic.

With that fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> =20
>  /* MMC timing mode switch bit */
>  #define CCU_MMC_NEW_TIMING_MODE		BIT(30)
> =20
> +/* Some clocks need this bit to actually apply register changes */
> +#define CCU_SUNXI_UPDATE_BIT		BIT(27)
> +
>  struct device_node;
> =20
>  struct ccu_common {
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_di=
v.c
> index 7f4691f09e01f..2d8b98fe4b13a 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -106,6 +106,8 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsign=
ed long rate,
> =20
>  	reg =3D readl(cd->common.base + cd->common.reg);
>  	reg &=3D ~GENMASK(cd->div.width + cd->div.shift - 1, cd->div.shift);
> +	if (cd->common.features & CCU_FEATURE_UPDATE_BIT27)
> +		reg |=3D CCU_SUNXI_UPDATE_BIT;
> =20
>  	writel(reg | (val << cd->div.shift),
>  	       cd->common.base + cd->common.reg);
> diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu_g=
ate.c
> index ac52fd6bff677..0490f95781361 100644
> --- a/drivers/clk/sunxi-ng/ccu_gate.c
> +++ b/drivers/clk/sunxi-ng/ccu_gate.c
> @@ -20,6 +20,8 @@ void ccu_gate_helper_disable(struct ccu_common *common,=
 u32 gate)
>  	spin_lock_irqsave(common->lock, flags);
> =20
>  	reg =3D readl(common->base + common->reg);
> +	if (common->features & CCU_FEATURE_UPDATE_BIT27)
> +		reg |=3D CCU_SUNXI_UPDATE_BIT;
>  	writel(reg & ~gate, common->base + common->reg);
> =20
>  	spin_unlock_irqrestore(common->lock, flags);
> @@ -44,6 +46,8 @@ int ccu_gate_helper_enable(struct ccu_common *common, u=
32 gate)
>  	spin_lock_irqsave(common->lock, flags);
> =20
>  	reg =3D readl(common->base + common->reg);
> +	if (common->features & CCU_FEATURE_UPDATE_BIT27)
> +		reg |=3D CCU_SUNXI_UPDATE_BIT;
>  	writel(reg | gate, common->base + common->reg);
> =20
>  	spin_unlock_irqrestore(common->lock, flags);
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mu=
x.c
> index d7ffbdeee9e04..82ee21e0d3a68 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -197,6 +197,8 @@ int ccu_mux_helper_set_parent(struct ccu_common *comm=
on,
>  	/* The key field always reads as zero. */
>  	if (common->features & CCU_FEATURE_KEY_FIELD)
>  		reg |=3D CCU_MUX_KEY_VALUE;
> +	if (common->features & CCU_FEATURE_UPDATE_BIT27)
> +		reg |=3D CCU_SUNXI_UPDATE_BIT;
> =20
>  	reg &=3D ~GENMASK(cm->width + cm->shift - 1, cm->shift);
>  	writel(reg | (index << cm->shift), common->base + common->reg);
>=20





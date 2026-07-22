Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8C1267B89
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726854; cv=none; b=TSHjIuxaODrs+pd33Dz7CScYhDwVq9ZBsmNBrsS6iDCJL+oCz1EEj2JQ+TP847VNKOn8LPnibc+9/unA5UmQVuZnvF/X1zxVFtWLH9i+NPVwm7xg3Qn8ghPqWEShX3PWMeZzxgyektDlCxeRnYL/7SDEaSWiY7ZdM0lq0BqahLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726854; c=relaxed/simple;
	bh=Gzhn+4jg05TaBiDQywVXu4pa5hjhlJDT5AWtQu1FrLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rb1/qdzYGb+gHo0gFeSwv3sCznA1MgtDsY8UybPiJTJ/ww0Y8FSnUAcw6ZYq+kuis2m+ShW0nqS6sPa2d8ZMTGI06vGPnq9IBrNpJ202Z0pSN5UrZ87JgxQnECz7lse3yN2tTuFXmVq9R9UDIpBpy2SWvpdHiV6uOwW1AzslIU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SR3ASgFW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SR3ASgFW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0921F00ACF
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784726852;
	bh=ApJyUh3UbJCU7bYezlSCZRoniO4a+n5FZCqwiX7BHiA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=SR3ASgFWKE/KdgtrekweY39je4RT7GbVcIE/5kF2hpxGoOlzumcpO2ejJqeMtvzuf
	 eJjJmyKd2Poe5IiH1kiz0ZGmBj2H7Iue5v9q+IQLaD5oK+ELDgk3PlZZZHVAIMzTqA
	 mOdR1hTAAykYtm053CdiZDrqikP+IqBQFzEH1uMDAEJzb9kxs/d+PxFy9JkQ/AVaj3
	 jzfuCL/l03nM/ACkdl4cz0k7eZmDUYT2G46iJJzvQVw/yZpEARQhsvpAfFkzb6aw9b
	 r+8sCUt4PUCTnCFn7A2angVujWjmZ3/6cmoVdohyo183qpyXFKWTSo6E9weLJ2emvY
	 oRgmOpijin0Iw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so8124572e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 06:27:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrizI1GHvZiiZe6oU0ZXDan8HYAzxRrTQw2pUgTgFtm2qAe3Er+KLy15PW5f2066Av1WPg2WSoF7WDZ/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5aB5MXe4dHaFejcy1ee2Ht7ZW8el0CC24zbl1usM5z2FKgCkX
	eDFLOk7YK6+jstkEioAaGfeB3WNKdTOkXO4Uth8ymkVi+sfMu90fxowU8UZrKqZw+by7mKrtsTQ
	yvW7bfpkUoA1+1ZFE1kfi5rs9D9LriZU=
X-Received: by 2002:a05:6512:3b8f:b0:5b0:1eed:f700 with SMTP id
 2adb3069b0e04-5b28f84a354mr5404025e87.13.1784726851335; Wed, 22 Jul 2026
 06:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
In-Reply-To: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 22 Jul 2026 21:27:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com>
X-Gm-Features: AUfX_mzpEMNkvXDj_jwLU41n9C8mnaNfF_ommIlmxQC2pGV6dZOxfrP1tBmIfHo
Message-ID: <CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
To: Enzo Adriano <enzo.adriano.code@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 8:56=E2=80=AFAM Enzo Adriano
<enzo.adriano.code@gmail.com> wrote:
>
> Some sunxi-ng MP clocks have an M divider but no P divider. The A523
> MBUS, IOMMU and DRAM clocks use this layout and also require the update
> bit when changing their rate.
>
> ccu_mp_set_rate() unconditionally builds and applies a mask for the P
> field. With a zero-width P field this produces an invalid GENMASK()
> range and can clear bits outside a P divider, including the clock gate.
>
> The callback also ignores CCU_FEATURE_UPDATE_BIT, so hardware that
> requires the update bit may not latch the new divider value.
>
> Only update the P field when it exists, and set CCU_SUNXI_UPDATE_BIT for
> MP clocks carrying the feature. This matches the existing sunxi-ng div,
> mux and gate helper behavior.

No. If the clock only has one divider, then it should use the single divide=
r
clk class. That one also supports CCU_FEATURE_UPDATE_BIT.

ChenYu

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260712081341.9D1431F00A3D@smtp.kernel=
.org
> Fixes: 6702d17f54a8 ("clk: sunxi-ng: a523: add video mod clocks")
> Assisted-by: Codex:gpt-5
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
> Based on clk-next 8cdeaa50eae8 (Linux 7.2-rc2).
> Tested with strict checkpatch and an arm64 W=3D1 build of ccu_mp.o.
> No hardware runtime claim is made.
>
>  drivers/clk/sunxi-ng/ccu_mp.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.=
c
> index 7cdb0eedc69b..aa6cb20447f1 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.c
> +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> @@ -237,12 +237,17 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsig=
ned long rate,
>
>         reg =3D readl(cmp->common.base + cmp->common.reg);
>         reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
> -       reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
> +       if (cmp->p.width)
> +               reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p=
.shift);
> +       if (cmp->common.features & CCU_FEATURE_UPDATE_BIT)
> +               reg |=3D CCU_SUNXI_UPDATE_BIT;
>         reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> -       if (shift)
> -               reg |=3D ilog2(p) << cmp->p.shift;
> -       else
> -               reg |=3D (p - cmp->p.offset) << cmp->p.shift;
> +       if (cmp->p.width) {
> +               if (shift)
> +                       reg |=3D ilog2(p) << cmp->p.shift;
> +               else
> +                       reg |=3D (p - cmp->p.offset) << cmp->p.shift;
> +       }
>
>         writel(reg, cmp->common.base + cmp->common.reg);
>
> --
> 2.53.0

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735847;
	b=tOfLLUuai6WkTSsBlH/kCG/hlrpMecnE57XhSbKyd5PJ9OeJDjjAA+ehu5w2Xx6pub/E
	 HtItd3cKqMlT5bZQMYP0LBMBLNyWK1pe/lAlYwN3EPDMgtQK2dAemA996pStLSscxnnYp
	 yl6lGKjsE+n8ud9x2bUTglC79APO8LEQnwdOLpM8tJM1SbeLPioyzl4v9C5SNX+zECVxL
	 nZGewGfToImGAS4id2rAmnq90FPHsMr4k6OqnSJYntLh/FgrvEKjCfE/ovbXtejycZ09l
	 H5kpka416/x5rSJU7EHd2U4D1p0QXc4VT8GYOINk3tw4eJ9uCBxQnK9Z1rlorxLasDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735847;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RpQAkSou5b8icqF3P8gOQ5t+G3JTqaILCtPO0nm3W2s=;
	b=zmTh9WJfB8yMM2fhWndVsxjiWuS8u3a0p9j/mBjiVTACYgK9mCPrfmX8+Xjq9djNMdVw
	 +luz7rNnHB5yiVTkGXTakJBKWUhQzikV8f4InPzrBl77COgSfZULW1F0d8rklkmQeBh+T
	 zAdqEkb/HQnAdWJ032Iy1fdhoGysRGE5U2jTZaMfJVHS+UR+1WGCnsaDFUh9D/cxjpN7L
	 QtZujjHoIxo3izMQ0U2qXKXjyn0SF6nq4zDbEfKHsBwA9/D3L0MgbFYa+tdAB6Zor2OAA
	 ckDfWv2zo+gKc5sSYsD57mw73oweO/mC3wgkOA183rYfzADYypfAKT8260Te8lxGHEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qtp6yZON;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2229C606A31D
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qtp6yZON
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD65A1F000C4
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794735846;
	bh=RpQAkSou5b8icqF3P8gOQ5t+G3JTqaILCtPO0nm3W2s=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Qtp6yZONauyl4HHIQLq//dQmvOMGBgyE4Oq56ypw2oUZetM3r8Lxh5wnAZCARyQKc
	 1a9kfcqtwQikRMIZwuo5OEpCdoDEkTglZy4XpqJMX5td/LpwkGjtAfOCb3AcGUd1ob
	 YXWV80839+3Ecsq7EjGRm40ZBT9EU3oe/wXXctmVWf81fas7WqZU76yq/xyvEZ1RRI
	 VZLe/1i81TFABQg8ugB/M8YN2EhjMxL2Nvsaf3w0CzwHzW+5UWTR4URDkICa8ge6zz
	 QengMLNTahFQZ/Kt4/fNJhOJyxdRz3m8miTZbiLQuVFZxzcYnbNLotRwLiDW4xvTY7
	 Q7FePrdoqqjpQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so22351821fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:44:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFlN1FqH+xlbdRFRCqzZR8zVlNmBahyeehTqbVDVZYSIqUo+PfeWRxsSoPfcaP3VH/DNH4gkcYajgD2Rg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+RbpxsB2IwufcqaGqkag86W6sTJWPuk8OYPKny5Q+3Xpqrze9S
	1tDYcGr5CJIxhvLV+XcaGJpDMZGV1CElLoN0W6hXoa2comXNwNtW9BNIHqlw0QofisvlByL9DTk
	fQY1Kgq8Hs+kzfUd5MsG2zieSCbSDfvA=
X-Received: by 2002:a05:651c:211b:b0:3ab:1639:9a75 with SMTP id
 38308e7fff4ca-3ae2b4efaebmr20925271fa.11.1794735845129; Sun, 15 Nov 2026
 01:44:05 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115-h616-pll-output-gate-v1-1-4cb3fc4d6c48@gmail.com> <sashiko-outbox-215303@kernel.org>
In-Reply-To: <sashiko-outbox-215303@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 17:43:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v65bC7-ZSRVG+KgK7BcTaXR3SbEiTcqGK+LuVJjpL4ihXg@mail.gmail.com>
X-Gm-Features: AclHuK8jwUtBWiLYgeJdJCLUdvN8oG7NhxiuPhYWv3uHkiiADDymIYAejmjwfqg
Message-ID: <CAGb2v65bC7-ZSRVG+KgK7BcTaXR3SbEiTcqGK+LuVJjpL4ihXg@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: h616: Gate the PLLs with their output
 enable bit
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 4:45=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] clk: sunxi-ng: h616: sun50i_h616_ccu_probe() leaves BIT(27)
>   forced on in loop
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [High] clk: sunxi-ng: h616: wrong GPU notifier registration order in
>   sun50i_h616_ccu_probe() [1]
> --
>
> commit 733f137b19620733cea59e88a8f5b18ba7301d4a
> Author: Arun Iyengar <aiyengar1990@gmail.com>
>
> clk: sunxi-ng: h616: Gate the PLLs with their output enable bit
>
> This commit changes the H616 PLL clocks to gate using their output enable
> bit (BIT(27)) instead of the PLL enable bit (BIT(31)), and powers up the
> PLLs in sun50i_h616_ccu_probe().
>
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi=
-ng/ccu-sun50i-h616.c
> > index 955c614830fae..da4156b39c2cc 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
>
> [ ... ]
>
> > @@ -1214,6 +1214,13 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >       val |=3D BIT(0);
> >       writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
> >
> > +     /* Keep the PLLs powered and gate them with bit 27 (manual 3.3.3.=
6). */
> > +     for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
> > +             val =3D readl(reg + pll_regs[i]);
> > +             val |=3D BIT(31);
> > +             writel(val, reg + pll_regs[i]);
> > +     }
> > +
> >       /*
> >        * Set the input-divider for the gpu1 clock to 3, to reach a safe=
 400 MHz.
> >        */
>
> [Severity: Medium]
> Should the existing pll_regs loop earlier in sun50i_h616_ccu_probe() be
> updated to set BIT(31) | BIT(29) instead of adding this second loop?

I agree with Sashiko's assessment. Please tweak the existing loop instead
of adding a new one.


ChenYu


> drivers/clk/sunxi-ng/ccu-sun50i-h616.c:sun50i_h616_ccu_probe() {
>     ...
>         /* Enable the lock bits and the output enable bits on all PLLs */
>         for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
>                 val =3D readl(reg + pll_regs[i]);
>                 val |=3D BIT(29) | BIT(27);
>                 writel(val, reg + pll_regs[i]);
>         }
>     ...
> }
>
> Leaving that first loop setting BIT(27) unconditionally ungates the outpu=
t
> of all 12 PLLs before the video and audio PLL dividers are configured and
> before disabled PLLs are powered up via BIT(31), and causes the clock
> framework to see every PLL as already enabled at registration time.
>
> [Severity: High]
> This problem wasn't introduced by this patch, but later in
> sun50i_h616_ccu_probe() the GPU clock mux notifier is registered before
> the GPU PLL notifier [1]:
>
> drivers/clk/sunxi-ng/ccu-sun50i-h616.c:sun50i_h616_ccu_probe() {
>     ...
>         /* Reparent GPU during GPU PLL rate changes */
>         ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
>                                   &sun50i_h616_gpu_nb);
>
>         /* Re-lock the GPU PLL after any rate changes */
>         ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
>     ...
> }
>
> Because both notifiers use priority 0, they run in registration order.
> On POST_RATE_CHANGE during GPU frequency scaling, ccu_mux_notifier_cb()
> reparents gpu0_clk back to pll_gpu_clk before ccu_pll_notifier_cb()
> re-enables and waits for the PLL to lock, driving the GPU from an
> unlocked PLL.
>
> [1] https://sashiko.dev/#/bug/linux-b48c9987-4bbf-4231-b1fc-24d8ccdf62d9
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-h616-pll=
-output-gate-v1-1-4cb3fc4d6c48@gmail.com?part=3D1
>

Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A996525C71C
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Feb 2025 20:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739218918; cv=none; b=PlAEN8XfODOjrlA/rc/15aQFObHfFAAM5xcD6QpugdhqSW/Tx2RJjbcCRn8i92XMe+APnIjBrKYrw/sI1P3D162Vl05ofFjpx1RdtycOOA4h63Ohh+602S7UbwSk2hzwse4YLchoeFSbkywI7IGs4QEHqgOIZ4WeyPtVE27wqZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739218918; c=relaxed/simple;
	bh=lz/51CgZ1d+ILEEYeJZZz1FEq8ZInoxxrovk7VZ4MYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwN23drovUljyiN7q5VwsstB/X/0Pcmkq+lTnNzdQHrycQXvS3D2WxMEXGvKUwXEygL2/6VTYj3KVQRrp7rvLd+zkfW2c2U1iFf3f3V61+a5UEXm+OMW9YwXvfaqF9VQZCBN2nTAMvwECjmdW8Yz1krWg0fH+954xDWixvP0PRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oaz/hR3h; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oaz/hR3h"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5de51a735acso6336833a12.0
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Feb 2025 12:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739218915; x=1739823715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4sLNT213axJxn+dDv5vnFAweh0CD8D88x6yQTKzvk0=;
        b=Oaz/hR3hUDaHcB5YFemoWVxsGN0CwBA9AnkI+RHWUDl85RodfHoIIAC2LPTEBgyKfP
         hKrJZ4QzGfnGMMTkDLe3YUWOfQJSyeCDlUM3xl4TMnw41gcnHXxz7vuExmt1YFpavaDI
         NVzWz3QHjqAS83oENaZKCjoV8arKlhIwhJhia2EwIFi2UAMCcetiLCR3XPmjDfv83WVa
         Uv83hbSDw0REfZzKEn3vWiPB/KnAbJcEQECd3hBpTvbxtJsZthFeldQoAR3gnkgpJB7F
         OTmDPvwupQdyHjOIFIpwjR5QZMQAaF6sFhwZiumMBdrr+FxOen6gFOwCV/FiYotAQK3t
         VO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739218915; x=1739823715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4sLNT213axJxn+dDv5vnFAweh0CD8D88x6yQTKzvk0=;
        b=sWMqjfd/xPY6ml7I/W6/xy5v+tdFfh5lJlzdJRXS/MtRbhKJso9RyuqQ5pnwzFiBoE
         QoOy78aR0gHFKVkxobkKlXFotdeXICXrChhGddqrxMzwhwVFfq08Eah6WZ27kRVm4Epn
         TPeElxv1DNozfQb4gRWPz+FUmeC1XT2LmH48ikKGzugplG2SdvyTN3LL2xV++yodoUqt
         B51lmPJ5+EpMQ3uOMohuomcMAI51GfF/pFibxLafpDcLgco1txdrg+UaUp0rv8yzuk6j
         LkqM1HTBEZYrWzxGlgVGg+LlksMetIZps6POylzJ1tbVaUFXtLpFmPjDoOPzs39Mk0vH
         PL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlIEsTq65Wx9fLjw8fMZlGDlWDakAVV5C30s/Ukh+/gVEXWFNEc5owULNfEemU0ehRI7DYFybL2qs18g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr1jFYnV5FA/6io5vGDb7jUOGDkOOH9Wco2g5JioFpdcBU7PBD
	FafaJPdKjs+v5mdj+cGfnvRQQz8yVliRHgNlruH2hWDiIid4kfSrWIg51gGwn63LbDm04NmR4un
	IZ2v8Ezrc07dOYtdzOHBnqyac6Eo=
X-Gm-Gg: ASbGnct2uIEbOsuEFpCpzJLCwKpBELF2dMNV4j/YlZlS0wWrYAgH8Re9taNwmHI7AOb
	6m44WDBdJstOEGwh8a81GOTgRXAoxdNqInc/3+XL+2Q8j04bFc8lvHVmFpDUIQ/Kj7Qhz2MvH
X-Google-Smtp-Source: AGHT+IEl6YEdiMsV1siZuJFhvx+GV4aMBPQlTUgyzGO6T4MZCuQCTLQqmVBt/VwazPwINTGGAJT/LjEuNEnQVRVAyjo=
X-Received: by 2002:a05:6402:1ccd:b0:5dc:cf9b:b034 with SMTP id
 4fb4d7f45d1cf-5de45027e45mr18280024a12.14.1739218914664; Mon, 10 Feb 2025
 12:21:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250209183142.97671-1-simons.philippe@gmail.com> <20250210140536.08c33a56@donnerap.manchester.arm.com>
In-Reply-To: <20250210140536.08c33a56@donnerap.manchester.arm.com>
From: Philippe Simons <simons.philippe@gmail.com>
Date: Mon, 10 Feb 2025 21:21:43 +0100
X-Gm-Features: AWEUYZnldiVDFzt0NbkyDKPipNGBHw1BkJcirqj-jzPHbdnyqlosJKOqWcw-jHs
Message-ID: <CADomA4-BuTtGva+MhcfZzeidsHr9pe6sibFYz97b-5of+0ucRw@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: h616: Reparent GPU clock during frequency changes
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 3:05=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Sun,  9 Feb 2025 19:31:42 +0100
> Philippe Simons <simons.philippe@gmail.com> wrote:
>
> Hi Philippe,
>
> thanks for bringing this patch together!
>
> You should mention here *why* you want this patch, the motivation seems t=
o
> be missing, but would be crucial - and preventing a sure crash should mak=
e
> this a no-brainer.
>
> Maybe start with: The H616 manual does not state that the GPU PLL support=
s
> dynamic frequency configuration, so we must take extra care when changing
> the frequency. Currently any attempt to do device DVFS on the GPU lead ..=
.
>
> Then mention that the manual describes the algorithm for changing the PLL
> frequency, which the CPU PLL notifier code already support, so we reuse
> that.
>
> > Re-parent the GPU clock during frequency changes of the PLL.
> > Also it asks to disable and then re-enable the PLL lock bit,
> > after the factor changes have been applied.
> >
> > Add clock notifiers for the PLL and the GPU mux clock, using the existi=
ng
> > notifier callbacks, and tell them to use mux 1 (the GPU_CLK1 source),
> > and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
> > correct algorithms.
> >
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 33 +++++++++++++++++++++++++-
> >  1 file changed, 32 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi=
-ng/ccu-sun50i-h616.c
> > index 190816c35..e88eefa24 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > @@ -328,10 +328,12 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0"=
, gpu0_parents, 0x670,
> >                                      24, 1,   /* mux */
> >                                      BIT(31), /* gate */
> >                                      CLK_SET_RATE_PARENT);
> > +
> > +#define SUN50I_H616_GPU_CLK1_REG        0x674
> >  static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674=
,
> >                                       0, 2,   /* M */
> >                                       BIT(31),/* gate */
> > -                                     0);
> > +                                     CLK_IS_CRITICAL);
>
> The addition of CLK_IS_CRITICAL deserves a comment, something about that
> this clock is needed as a temporary fallback clock for the PLL frequency
> changes or so.
>
> >  static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
> >                     0x67c, BIT(0), 0);
> > @@ -1120,6 +1122,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb =
=3D {
> >       .lock           =3D BIT(28),
> >  };
> >
> > +static struct ccu_mux_nb sun50i_h616_gpu_nb =3D {
> > +     .common         =3D &gpu0_clk.common,
> > +     .cm             =3D &gpu0_clk.mux,
> > +     .delay_us       =3D 1, /* manual doesn't really say */
> > +     .bypass_index   =3D 1, /* GPU_CLK1 */
> > +};
> > +
> > +static struct ccu_pll_nb sun50i_h616_pll_gpu_nb =3D {
> > +     .common         =3D &pll_gpu_clk.common,
> > +     .enable         =3D BIT(29),      /* LOCK_ENABLE */
> > +     .lock           =3D BIT(28),
> > +};
> > +
> >  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
> >  {
> >       void __iomem *reg;
> > @@ -1170,6 +1185,15 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >       val |=3D BIT(0);
> >       writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
> >
> > +     /*
> > +      * Set the input-divider for the gpu1 clock to 3.
> > +      * Also enable gpu1 clock.
> > +      */
> > +     val =3D readl(reg + SUN50I_H616_GPU_CLK1_REG);
> > +     val |=3D BIT(31);
>
> Do we need this if the clock is marked as critical now?
I'll test that.
>
> > +     val |=3D BIT(1);
>
> You probably want to clear the lowest 2 bits first, then set bit 1,
> otherwise you end up with either 2 or 3, depending on what bit 0 was
> before.
Good catch, I'll address that in V2.
>
> Cheers,
> Andre
>
> > +     writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
> > +
> >       /*
> >        * First clock parent (osc32K) is unusable for CEC. But since the=
re
> >        * is no good way to force parent switch (both run with same freq=
uency),
> > @@ -1190,6 +1214,13 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >       /* Re-lock the CPU PLL after any rate changes */
> >       ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> >
> > +     /* Reparent GPU during GPU PLL rate changes */
> > +     ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
> > +                               &sun50i_h616_gpu_nb);
> > +
> > +     /* Re-lock the GPU PLL after any rate changes */
> > +     ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
> > +
> >       return 0;
> >  }
> >
>
Thanks for the review,
Philippe

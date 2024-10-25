Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F255F39FF2
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729867788; cv=none; b=FcTqf00g9nST2VNG18ufXmui5qbMGuJHu2hYsCue5mqUpvEvpA0cOUsUs7aFmxBpjIJwyURLxY7RDKHMofKIq3R465KyHG6ULvBD/qkGlVVFmOx0U5auMuIlHTRIvno0vMusETyR89M/GQU0+klEJbQ31BSYeFm1iFOnsuoaYGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729867788; c=relaxed/simple;
	bh=DGrP+X7ynEJ80b1Ksbh7faaeQXhaDe50vFOPjYI2u30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uT3+kZNyez7+Zfoh83X9onQAfBXv2tF7wyIyqUzCcZgve7zsd0szPApWw/8RSvturdi3t+bplS+P5MAklFA0xHPiq/7oovUdPmt4VmSWs/UkQnb/W4gdxcxL9mnc/MrP9EDsj+AIpgLly/Bh+CQbRA9ra+T0axCNGShdNdq7JNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e8607c2aso2471962e87.3
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 07:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867781; x=1730472581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/svTJLUuZsHOgIxMPFLO/yUUNAOW9dJ4W1In0LnFdY=;
        b=A4iM2WgcXMq6WeAh7GZD1axHGPmmJ5O7QxxXGdKmvc1ijph8xEZ72NbZj2YZkmtqwU
         H6LCoQp2jlj7z2oa9gU8v0S72HxSlNGnQHN5zlDAz2EHD3mRX6D2N7EpoJF4axsPL7aR
         WF4brCk6mpCXw+/Vb9H4EhO/16R0eZNlvuOP1/k6JRAJTmeAD7n1pWa7dZB6DJ8V6OKM
         KqqJZw7+D0VdxuAtPevjKnE/zRZSaAq3f2z2o45/guRzEP7SJPahmbwa6UlcOEs98C9h
         lIxC74Ny5POTxxIhKdPoodXzYg2XJNtI3Wyl93+bxHKINGFKEgFhz03YJil1oWlzEH2E
         Klbg==
X-Forwarded-Encrypted: i=1; AJvYcCXeMOYZn67sMiJFdnTG9R3TUKOcuR8vR6L0HYHhHxV7AeA8f+8viII+U2K3Z8fxFbUevcg4txKa73UDyw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo0utgxEHy2RMZZcCGUjZO+KOEsjZ2H1V6tByO3gELWi6HYwbv
	Mtj2lNUj7W7NwvcnwXWohroSOCjfY7rqlHmEMpdKH34hqeW1y1VcYxYBUk09Ung=
X-Google-Smtp-Source: AGHT+IGRMfjSaDFONXgJJRXDskmdxIgxBu7JY7AR7Amum9X8xkJpO4fWkPrDSLjJk8LUI/51/J9F/g==
X-Received: by 2002:a05:6512:2811:b0:539:a353:279c with SMTP id 2adb3069b0e04-53b23e18c0fmr3903261e87.28.1729867780959;
        Fri, 25 Oct 2024 07:49:40 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1df2f3sm207568e87.248.2024.10.25.07.49.40
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:49:40 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso20859201fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 07:49:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZx+cQ1yMASIfVXvS7Nm1sRLtpNd3a7qrfQIBb88j+jK2soPR6k/HkvcIFcQiNn+mXWTBgAEQkmXYBIw==@lists.linux.dev
X-Received: by 2002:a05:651c:1504:b0:2fb:4c08:be08 with SMTP id
 38308e7fff4ca-2fca81d81c0mr28886391fa.11.1729867780288; Fri, 25 Oct 2024
 07:49:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241025105620.1891596-1-andre.przywara@arm.com>
In-Reply-To: <20241025105620.1891596-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Oct 2024 22:49:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v676pzN6TX8xDHuESkGDLinCB9_3FLgKSmEBtxK2GSWxHQ@mail.gmail.com>
Message-ID: <CAGb2v676pzN6TX8xDHuESkGDLinCB9_3FLgKSmEBtxK2GSWxHQ@mail.gmail.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Philippe Simons <simons.philippe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 6:56=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The H616 user manual recommends to re-parent the CPU clock during
> frequency changes of the PLL, and recommends PLL_PERI0(1X), which runs
> at 600 MHz. Also it asks to disable and then re-enable the PLL lock bit,
> after the factor changes have been applied.
>
> Add clock notifiers for the PLL and the CPU mux clock, using the existing
> notifier callbacks, and tell them to use mux 4 (the PLL_PERI0(1X) source)=
,
> and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
> correct algorithms.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>
> the manual states that those changes would be needed to safely change
> the CPU_PLL frequency during DVFS operation. On my H618 boards it works
> fine without them, but Philippe reported problems on his H700 board.
> Posting this for reference at this point, to see if it helps people.
> I am not sure we should change this without it fixing any real issues.

IIRC we do this for all the other SoCs. But if you want to be cautious,
we can wait for Philippe to give a Tested-by?

ChenYu

> The same algorithm would apply to the A100/A133 (and the upcoming A523)
> as well.
>
> Cheers,
> Andre
>
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 28 ++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index 84e406ddf9d12..85eea196f25e3 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -1095,11 +1095,24 @@ static const u32 usb2_clk_regs[] =3D {
>         SUN50I_H616_USB3_CLK_REG,
>  };
>
> +static struct ccu_mux_nb sun50i_h616_cpu_nb =3D {
> +       .common         =3D &cpux_clk.common,
> +       .cm             =3D &cpux_clk.mux,
> +       .delay_us       =3D 1, /* manual doesn't really say */
> +       .bypass_index   =3D 4, /* PLL_PERI0@600MHz, as recommended by man=
ual */
> +};
> +
> +static struct ccu_pll_nb sun50i_h616_pll_cpu_nb =3D {
> +       .common         =3D &pll_cpux_clk.common,
> +       .enable         =3D BIT(29),      /* LOCK_ENABLE */
> +       .lock           =3D BIT(28),
> +};
> +
>  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>  {
>         void __iomem *reg;
>         u32 val;
> -       int i;
> +       int ret, i;
>
>         reg =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(reg))
> @@ -1152,7 +1165,18 @@ static int sun50i_h616_ccu_probe(struct platform_d=
evice *pdev)
>         val |=3D BIT(24);
>         writel(val, reg + SUN50I_H616_HDMI_CEC_CLK_REG);
>
> -       return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_des=
c);
> +       ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_de=
sc);
> +       if (ret)
> +               return ret;
> +
> +       /* Reparent CPU during CPU PLL rate changes */
> +       ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
> +                                 &sun50i_h616_cpu_nb);
> +
> +       /* Re-lock the CPU PLL after any rate changes */
> +       ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> +
> +       return 0;
>  }
>
>  static const struct of_device_id sun50i_h616_ccu_ids[] =3D {
> --
> 2.25.1
>

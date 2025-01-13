Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2B0240245
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jan 2025 15:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736782411; cv=none; b=H1p9NwmvZV5Ja41y7LZyNSvS+nCJQ5EjtHFDu+dr+FIu6ktaj2DQL2UFBacfRxrg1LazDd2TlYDjg2fzkO8tMICp6Nj/8/3/dIO0IJNEyY2+SXsUvCeA/FCceDvsLu1z+XRZG59EJyjHLvIGWJcwEcj2ldLPlHyybkEnowYyYIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736782411; c=relaxed/simple;
	bh=yTHqEISNgRUayH9CEv+7Ky22omesEucD+Ly57lh61ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxkUmorMh6oNZoJ6ZR0zefsvcvIp3PzB/a5+qdo+zE2PSB+M/xaJGM6C4B0K12x+uQosSLPKs0B/TD/DHKTf9R7WkmEOofIMKKOqVQpTrSgO6kYFbACZcdKpynzMCMLEW9FNZ1j2xxIBjDbNDej64PHrLJ9YZuDhsY4SDPpeMhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54298ec925bso1892105e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Jan 2025 07:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736782405; x=1737387205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wMO1ehTiBUYEBAd5/n1ftLnQAH5SeU5tVjatLn3yZxo=;
        b=CIl0iCarFsX+zL5Q6yopKnICzjPovaLXQIUq7HtoQEVh2KyvpPgT5zL/LRQAPqH+lx
         AIyR0HTGVvLcgc11/xkN+9kPKGntOlqAXV+NxrwyD3PWwMPfUEPPMPYzm4nq62KC5sx/
         6pyPJMutSzZKHTPTWt7YzlnTbelKCTKqQgfkWOsIH7D2UqwO9WNmm35/hOgdRRdrZkwY
         Rj57SQrllwe0Ifk/UfuacKEcOss1PHEybZzb7gB0FOTwgj3eBsyRbf7UrKFtSIsJeYIc
         5szeMT9NrfSGpSqG8rMrFKIEspIy+Zm04b3DlTRnX8w1AlGt/I/UgL2FptAT1yIRdk+P
         Gh0g==
X-Forwarded-Encrypted: i=1; AJvYcCUDJCl++8XRqFGV2hqHVIQ4+BcPZM8zKjTUdnFA2cKaONUoC4VGoiveMoW+2nrflFmTBJWnu40LJMtT+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKneb+lfdyCm9nXZIt5OCEYu4lYFGDYc48AtRrcKJWa0QWffYW
	ILVaN3ZBkcseoZIBQZq/eh39Y2p7qcKrAaBsWdMgXrJX4EmZKSf+vjjNxAbUh/o=
X-Gm-Gg: ASbGncsOM7bOJyip+EFkUnIiyY6eVXXHJlx20A2NrqO0DAo2PEvZxSEY9z/wBfdmGLg
	D3Jr2b3tKn7xDv0dy4/K3fzCqv3teP8WP8Akk8u3qnV7Qat6doFm0+ffy/9KM7YfCBfBjPVgcn4
	C5hdPNlxecewbuvH0izgBt413kZrtNxbDuzpfzj39DwOqlitoxK4KoiZMGgYdKB5furPV4ti1Bg
	7Bwqeu5CeCfIcucXHVhCls3Ht4dQ0MOHctLJQ/U2J0Fv5fmiJmkDaLwk0xOK1vHJJGAk87plnTT
	Q67FqfIR8y2afA==
X-Google-Smtp-Source: AGHT+IF7+1TVWOipdfSHCndOyIygTGf87oh8LDtaGE7aT0ZMFAyh8DTS7UhOdlVIFES/02iAP+JudQ==
X-Received: by 2002:a05:6512:e83:b0:540:3561:969d with SMTP id 2adb3069b0e04-5428481bec2mr7324238e87.49.1736782403087;
        Mon, 13 Jan 2025 07:33:23 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea679csm1392570e87.143.2025.01.13.07.33.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 07:33:22 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3002c324e7eso43578441fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Jan 2025 07:33:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXy6QOnRQ3fDIkS4uIsSmwp+wbohTcLVOxba6jwzVDflscFcyyK5LkNnD0lqWbI4zh5dyAX4c+FiIOj+g==@lists.linux.dev
X-Received: by 2002:a05:651c:887:b0:306:124c:69d5 with SMTP id
 38308e7fff4ca-306124c6acamr38561941fa.34.1736782402241; Mon, 13 Jan 2025
 07:33:22 -0800 (PST)
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
Date: Mon, 13 Jan 2025 23:33:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v67aDGR=oVbBCv6M492L2MdcnuD8pugVciSeujy5Druw4A@mail.gmail.com>
X-Gm-Features: AbW1kvZj0Eas5i5rfPRkek1NJ1CRUjBzE3zaOM_q3BEvET2T34lYAwlvKL0KqfI
Message-ID: <CAGb2v67aDGR=oVbBCv6M492L2MdcnuD8pugVciSeujy5Druw4A@mail.gmail.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Michael Turquette <mturquette@baylibre.com>, 
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

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Stephen, can you pick this one directly for -next?


Thanks
ChenYu

> ---
> Hi,
>
> the manual states that those changes would be needed to safely change
> the CPU_PLL frequency during DVFS operation. On my H618 boards it works
> fine without them, but Philippe reported problems on his H700 board.
> Posting this for reference at this point, to see if it helps people.
> I am not sure we should change this without it fixing any real issues.
>
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

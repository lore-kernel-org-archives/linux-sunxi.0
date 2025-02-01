Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7626D1369AA
	for <linux-sunxi@lists.linux.dev>; Sat,  1 Feb 2025 10:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738407162; cv=none; b=ObpX6WC1e9+ffkNLPcaMZK9WKEDedKMzOV0rg0hQNPsNuB5fpU4vpTsO8f6NHxCO4JuPia/+ZkH8MsKz29iJZuX0xuKFrpqk9EHDHDgoXABg3TGSAWAOXZ0QVlzXO63PgPoR74mxr1+wmZivvGLHXKMBAO/6JAcO7w44A/mmsd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738407162; c=relaxed/simple;
	bh=GftBZ8rMZl72TpEgFZw+F1ogkNcPyAqM9PkddAl2/cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZvK0toVv529fb2rPIoF6NwECdvJtQklNxfKTU6LbAaB4PCG4K5cJ6bICgCeQ7/ZJlsyNI4ngSAk4gM+3KYCzv/n2Bq7DsZKfeZLbAmBmlXoxRAwa8ReRO75h9/YxRxGp+TfBqJjXj/uoc4tNI8joE8zbDhYN9xaM0Rzonq9PGus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30613802a04so27097441fa.2
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Feb 2025 02:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738407156; x=1739011956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRwFI5d8wyEyXjJelLyWqjx7Awrgh8zTXgtWY1JnNlU=;
        b=YBJiNAvRzzGmlwCD/8aBXt95sWHlSbrAMwqbwwF6PRgMB8M38Y3m1lnmdRvb5dIT8f
         no7WgVH8bzk5HzPVeP8cGHI8opH1tB6htbYmlpneJntB03tVrX2LiDQh/aAASEh6Pqhh
         A1HsfbPYLpdRhGzmdiChWLs0MZESPzNH6Nd8rkDYHjq7+yit2EJgI/Wc46lNYWO0OcZV
         DrH81ed0bqjCP+q3ltoBpT2T6ya9lMfd2MHN01yYDKhvO21JvTZmpLWXGyeJgbj52uFY
         hprdlV0vjWqfY9MXZvROB55BLQqdqBGoCPsyLiCV5ao0vXFiu9xFM6VAZTzZpoebab/R
         OGWg==
X-Gm-Message-State: AOJu0Yw+mievs2Qd4CMh/vVeERm280QOQDUicoFpSbsWUaeu/Er5KBK0
	701LDd+K5fFVTeyYplkF1+Chh9Ptx7KQIvjJq5ylQ8O/QvZciF7ZkB+25KpE
X-Gm-Gg: ASbGncv+A8020eq3RT8XxwQ1uUkQy8vjPQ7o4nXAtgLpbTVjojeknIFIEwHNWiwobO3
	mktOQ9Bh09K52WxGVeH3QuDEK+Cm+gNCwPUOtTJT4dDK4qvHsGAJ3OV16CRs3r1Xsvcyan2ihvr
	rrP33Ey47AakZGqGiK/DXXDmeTZAiJCL3NYD+i80DS5v5MeCDx9dF1ee+dh+7DUteM+CBEkNAiG
	YlDGoTNZDZQ4Ny5TstGE8hAYGZqWYn4h9u3sPbqZdaEXsHPQaUfJqGupknsgLDp4clEIBVWqYBV
	MgN2TPCp+244xBGTNgEVqGZLUrIeiUaMVs/8kKHdfayawHoe
X-Google-Smtp-Source: AGHT+IGrhozrpZ7OHC8oxx41KWsYvdRRHdhjBAnBliebeg24cLpB34DOJfQPcj1sRLnG9kS1aRLhKQ==
X-Received: by 2002:a2e:bc83:0:b0:2ff:8e69:77d7 with SMTP id 38308e7fff4ca-3079686e6a7mr58796581fa.20.1738407156304;
        Sat, 01 Feb 2025 02:52:36 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3069caasm8429541fa.8.2025.02.01.02.52.35
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 02:52:35 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-303548a9361so20854261fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Feb 2025 02:52:35 -0800 (PST)
X-Received: by 2002:a05:651c:502:b0:304:4e03:f9d9 with SMTP id
 38308e7fff4ca-307968e0a20mr54218521fa.28.1738407155636; Sat, 01 Feb 2025
 02:52:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250131231455.153447-1-macroalpha82@gmail.com> <20250131231455.153447-4-macroalpha82@gmail.com>
In-Reply-To: <20250131231455.153447-4-macroalpha82@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 1 Feb 2025 18:52:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v65p+_woYGKRrQs2aKRJO1LdYW4eA0h2kiyMTUhgZ9DNrA@mail.gmail.com>
X-Gm-Features: AWEUYZmavIApcVldzJqk3l2AkjKAa_El4sfI4mNDa0tSr-IA5hYLt6odr6wR63o
Message-ID: <CAGb2v65p+_woYGKRrQs2aKRJO1LdYW4eA0h2kiyMTUhgZ9DNrA@mail.gmail.com>
Subject: Re: [PATCH 3/5] mfd: axp20x: AXP717: Add AXP717_TS_PIN_CFG to
 writeable regs
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, lee@kernel.org, samuel@sholland.org, 
	jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, sre@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 7:17=E2=80=AFAM Chris Morgan <macroalpha82@gmail.com=
> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add AXP717_TS_PIN_CFG (register 0x50) to the table of writeable
> registers so that the temperature sensor can be configured by the
> battery driver.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/mfd/axp20x.c       | 2 +-
>  include/linux/mfd/axp20x.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index cff56deba24f..baf51dea98b0 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -222,7 +222,7 @@ static const struct regmap_range axp717_writeable_ran=
ges[] =3D {
>         regmap_reg_range(AXP717_PMU_FAULT, AXP717_MODULE_EN_CONTROL_1),
>         regmap_reg_range(AXP717_MIN_SYS_V_CONTROL, AXP717_BOOST_CONTROL),
>         regmap_reg_range(AXP717_VSYS_V_POWEROFF, AXP717_VSYS_V_POWEROFF),
> -       regmap_reg_range(AXP717_IRQ0_EN, AXP717_IRQ4_EN),
> +       regmap_reg_range(AXP717_IRQ0_EN, AXP717_TS_PIN_CFG),

Please add a separate entry. As you can see immediately below,
there is a separate entry for the IRQ status registers. We're
not allowing writes to unknown registers.

ChenYu

>         regmap_reg_range(AXP717_IRQ0_STATE, AXP717_IRQ4_STATE),
>         regmap_reg_range(AXP717_ICC_CHG_SET, AXP717_CV_CHG_SET),
>         regmap_reg_range(AXP717_DCDC_OUTPUT_CONTROL, AXP717_CPUSLDO_CONTR=
OL),
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index c3df0e615fbf..3c5aecf1d4b5 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -137,6 +137,7 @@ enum axp20x_variants {
>  #define AXP717_IRQ2_STATE              0x4a
>  #define AXP717_IRQ3_STATE              0x4b
>  #define AXP717_IRQ4_STATE              0x4c
> +#define AXP717_TS_PIN_CFG              0x50
>  #define AXP717_ICC_CHG_SET             0x62
>  #define AXP717_ITERM_CHG_SET           0x63
>  #define AXP717_CV_CHG_SET              0x64
> --
> 2.43.0
>
>

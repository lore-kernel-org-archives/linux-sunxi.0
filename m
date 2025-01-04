Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91641A8F80
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jan 2025 10:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735986219; cv=none; b=jevdtScSuD+bhVAIcAdhc7JkFHJNtetuxJZUqoMGy7nrURSqz4c9HhKwBP5hmuupwQl6mJKZfpZMUXIXFgiBL7qw8hlPbn8JEk8r5EnTQ+yudC+YL4nzYnL80i/7E2KdYMLpzLs++PzqeNFIpgR8KkKl7KSI5UEXuO40qa89/Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735986219; c=relaxed/simple;
	bh=qbr+GcXOv2DoG0CYyHwRoeofsAPEe/QqE00NDXmp92E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0i3c5mJ7i9fRduudPZCDuxsisf04Ws5X40/wnPbHB0oq50leZNRZNIdeHw9YS6AlW2Cuair7LxVNL21iUT+istvP8f1iufmgdI5KJTjw/MN84kKxERbAsXbC3SGF2P4csPAQk6gMdlcw8CFrsceo7YGMnlDqX+iTc7ASBC9QCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so14070113e87.0
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Jan 2025 02:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735986212; x=1736591012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oEoAKKEizk1AGrodmNZICCaBPTxNB6DvcRBoDziYoQ=;
        b=BV8wfMpBsfTowzVVXl27yU/xOpvVTN1bkcoeVjgdzpAaUam87kM6006YnEuMr2X+0n
         jT5nHEX36Q6tKFbxb/fSOXth3Ee1f4r2quKsRCPjslHjdQLc0pijLy+UJVTUZ2l6SY1w
         f1t9AZbIwX05siM3a7FTlyKotx1rOMscvAYB12uTthZ9pvRpV75AHyZ8iCmC+CB5aFyY
         3ksx/4CfwZhycNhHSaAQYbae9KvyaeJrVo4LFobRw3n+WzGPGGKjEwTK+NsyVtqUe6sk
         dcCCAXWsGmPOkmF825wK48s2KbLmV/d7Ti7dWNw2JzCGcvbX6oqoyeHnWfshRLjVtnhP
         K1mw==
X-Forwarded-Encrypted: i=1; AJvYcCXo1wa/z458rvoCC0qcp51WFhYKXbk2Id4u4RGlIVxakPyHsHcCNe3L7tZwIR+JsvQUhDwNq5zDjnWTBw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy46/8p4sJ2ctToOzzlwCgrzVb25154zzNqb0wwrZtc9FElMoEe
	92V1EHWqZuBvrKzcySWcVk+4B4RyEx30vdD0k/ZRrhl4NeY9wkPRppuvRHV2
X-Gm-Gg: ASbGncul/Jmri3Z/x2k8Cra5U2N4i15BVx6LIb208x/8ORUTY8a4TNYCGDx5CF5kgxa
	BE3iA1DljzdRbYl2dT0b+0Ywjla0KBCbdEp9IKZBUtk5+DiSKyy81iRwcB1qJOsw+r+4/C4ycFJ
	BpNPYZL3z9d4ONUOUiLqVpRoyCM6Kf2wf8dTL7kaQNYusoovR+Dui40QHMLOZDDi9qPcXwV+u0o
	TkVIUSJVpPUrvhMRA763G+DK4upouXT67vXu1wpvl+owi5UVQ0qwj1kzZT1bChgIa+ia0aUCIPv
	np/MXqwcDw==
X-Google-Smtp-Source: AGHT+IHN9q47Exe0yfQGc9I8g00aRbHV9163bcPGC0L4OSazJ1V3r94DsB24+rPja6g4UtrJNy80wQ==
X-Received: by 2002:a05:6512:3e29:b0:540:5253:9669 with SMTP id 2adb3069b0e04-54229542df3mr15628398e87.32.1735986211988;
        Sat, 04 Jan 2025 02:23:31 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6382sm4291236e87.52.2025.01.04.02.23.30
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 02:23:31 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso10925328e87.3
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Jan 2025 02:23:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxg09EBg3O87R4kYayAgcB+hulaTEiXdOWCcPjSbuO6DR350OgVeoCa+YJSVqw26WdW5S7VH0CqoOajg==@lists.linux.dev
X-Received: by 2002:a05:6512:2399:b0:53e:362e:ed3 with SMTP id
 2adb3069b0e04-542295253cdmr14007249e87.1.1735986209772; Sat, 04 Jan 2025
 02:23:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250104074035.1611136-1-anarsoul@gmail.com> <20250104074035.1611136-2-anarsoul@gmail.com>
In-Reply-To: <20250104074035.1611136-2-anarsoul@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 4 Jan 2025 18:23:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
Message-ID: <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Dragan Simic <dsimic@manjaro.org>, 
	Frank Oltmanns <frank@oltmanns.dev>, Stuart Gathman <stuart@gathman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 3:40=E2=80=AFPM Vasily Khoruzhick <anarsoul@gmail.co=
m> wrote:
>
> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> select TCON0 clock parent in dts
>
> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 =
mux")
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bind=
ings/clock/sun50i-a64-ccu.h
> index 175892189e9d..4f220ea7a23c 100644
> --- a/include/dt-bindings/clock/sun50i-a64-ccu.h
> +++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
> @@ -44,7 +44,9 @@
>  #define _DT_BINDINGS_CLK_SUN50I_A64_H_
>
>  #define CLK_PLL_VIDEO0         7
> +#define CLK_PLL_VIDEO0_2X      8
>  #define CLK_PLL_PERIPH0                11
> +#define CLK_PLL_MIPI           17

You can't really split code movement into two patches.

With this patch applied the clk driver will fail to build because
the macros are now redefined in both header files.

Barring recombining the patches, please add a patch before this
adding #ifndef's around the two macros that are moved.

ChenYu


>  #define CLK_CPUX               21
>  #define CLK_BUS_MIPI_DSI       28
> --
> 2.47.1
>

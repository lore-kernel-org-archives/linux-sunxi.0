Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006722E540D
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751992584; cv=none; b=LlX73FRTD8DlW+0VEqQb+k5EndmTprlFFlMEVReS6VTL8p4Tb9hnBDEzf6Bk+ZjH/45L5qSAU8u8TsBk97WYaIQ+uIYX3PeNONQGAL5Rq8djCtlofZq60xqGdV3XU2KVU8sUWP9qeTmKU3k8oJQyg2sMi/c7giVm7M9PP9fXgSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751992584; c=relaxed/simple;
	bh=I0JRzGqeLnwtKf4kjJYadCFOrmuTnbGxxR/rNzuzW90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwTUDZGCIpHewGz57kShI9zEEG1E+IceiW1Qc+4V0te+lI4BNiFts0ATIO2ShsH3q3r9GqvHhsQKdnO6147iUSWjoVzba4DbrF5SJIOZY4KRSI9njiveic54j7PnWXuvWe1nXGNyQdXJV0QQCBVEYamedNZwkvWQkdirvnwRniI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b584ac96so4451886e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 09:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992577; x=1752597377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4I7U9ozTZ1bfuxyVJsfZXgas4qwfJlXMhYg9fodydFs=;
        b=Qwf9WWdRFyY4HkXGc1HC1vb5SY0jU+dIUpvWLh8OM5cr7Pxknu2UbqmKvuThI7O23W
         9p3KeH5KOTUoC3evqeEePRClvNWNuO1BxesRNRKNgZaiF5afwANu8dglD+y1f+SHR04n
         FSJ3bRgEIZ/GO/g4/20KUxwb0O0W6QQtU5okCkNEK7N1OOwxVRMDPyJZPNRUfjLnp3Dr
         BnPYcv4C/5SF4phUVFKmnJZmqpIuEq6yMxcukv0HAlxzX5N3tFron7crIdZtwJqqpxM3
         MM0yVZG1fIniaXs13/RxtQ7Wm/ImNBdOVzgEmjw6yqUpR0N0G39Hpi842/9GEKoe8vwP
         +BgA==
X-Forwarded-Encrypted: i=1; AJvYcCVlZUFBmMOe39EN6JFDDQ0RQtPr85BOhYnSzF+vAyo1wralIUb3Yrt0pAHI7IEceMiWqHyivFs9UkgI8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsArIAzwOibFVN/xlL0NdsHNqebyQIOGVxpnfRlsTVky/xo2KX
	hyFdgtrnuSUpAQaKDvAUB+o1+/BeOVngCbwy0d1+TBl9rQxId4cnilu4TPkiDazl5Uo=
X-Gm-Gg: ASbGnctZWRGN8QfuJrRuZqY9FSyHmZvZS8jKjELxvzC9uLbaoedSPaZz+QL1U8MoC8C
	UfjkJNTCO9+8ue6v8YWTCOItVSD3J+G79nXE67Sh+mJC0IEzljrSAM65KfnnurCZYL19sk+ivVC
	jZtqbmBxcibnQB+cGuCw0ghx/Qcv2iPjOgEJmiO17q//qe8U/YtxdGy8UGP6draXvHNOoc2skEk
	lkGGp6fjRD9HNFALDWiZeg15QuVBCdvaXuEWirKWJzV3ZKJiYxEQfArHFEUuRSZA5IndLsZ1lMr
	+OBta3DaCDSZO5arZ6b51GyYhHKGKVD2+eoLzY2mkUCG5qRJOhm6hTf/2C3f53cHWOYuFhPsYso
	P8dfw4EOB2JtLsUlEG6Q=
X-Google-Smtp-Source: AGHT+IH0yhHXllAAx5vilBfR4s/CuSWkZD574oQMm+WqKS+kNK22X/8De2sPgVPPT6jdvX9FL//wBg==
X-Received: by 2002:a05:6512:3c84:b0:553:ab9a:c94 with SMTP id 2adb3069b0e04-557f82f5692mr1233698e87.6.1751992577250;
        Tue, 08 Jul 2025 09:36:17 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-558f615976dsm140587e87.127.2025.07.08.09.36.16
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 09:36:16 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso45846711fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 09:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkOQW9Ud3OQWFH2hMU0h04Ht3A+d04v/6gle2uUe4WHFMGnV3fJ2TSAJPVgkScLxAIXEv+a8GwjAeRDg==@lists.linux.dev
X-Received: by 2002:a2e:be11:0:b0:329:4bfa:9f5a with SMTP id
 38308e7fff4ca-32f39aa391dmr15595031fa.10.1751992576098; Tue, 08 Jul 2025
 09:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250707184420.275991-1-lukas.schmid@netcube.li> <20250707184420.275991-3-lukas.schmid@netcube.li>
In-Reply-To: <20250707184420.275991-3-lukas.schmid@netcube.li>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 9 Jul 2025 00:36:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v663GHk9jWXMBg36T6Qf8mwbnQcQ80=F+-tpbZ0Bau+79Q@mail.gmail.com>
X-Gm-Features: Ac12FXwC7-T3WWNdeROV3cwvshauCK_N_9KnHuUIE5o3NNtisH1pHGwgJnYBNjo
Message-ID: <CAGb2v663GHk9jWXMBg36T6Qf8mwbnQcQ80=F+-tpbZ0Bau+79Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] riscv: dts: allwinner: d1s-t113: Add pinctrl's
 required by NetCube Systems Nagami SoM
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 8:35=E2=80=AFAM Lukas Schmid <lukas.schmid@netcube.l=
i> wrote:
>
> Added the following pinctrl's used by the NetCube Systems Nagami SoM
>   * i2c2_pins
>   * i2c3_pins
>   * i2s1_pins, i2s1_din_pins, i2s1_dout_pins
>   * spi1_pins
>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index e4175adb0..8dc3deccb 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -78,6 +78,36 @@ dsi_4lane_pins: dsi-4lane-pins {
>                                 function =3D "dsi";
>                         };
>
> +                       /omit-if-no-ref/
> +                       i2c2_pins: i2c2-pins {
> +                               pins =3D "PD20", "PD21";
> +                               function =3D "i2c2";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       i2c3_pins: i2c3-pins {
> +                               pins =3D "PG10", "PG11";
> +                               function =3D "i2c3";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       i2s1_pins: i2s1-pins {
> +                               pins =3D "PG12", "PG13";
> +                               function =3D "i2s1";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       i2s1_din_pins: i2s1-din-pins {
> +                               pins =3D "PG14";
> +                               function =3D "i2s1_din";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       i2s1_dout_pins: i2s1-dout-pins {
> +                               pins =3D "PG15";
> +                               function =3D "i2s1_dout";
> +                       };
> +
>                         /omit-if-no-ref/
>                         lcd_rgb666_pins: lcd-rgb666-pins {
>                                 pins =3D "PD0", "PD1", "PD2", "PD3", "PD4=
", "PD5",
> @@ -126,6 +156,12 @@ spi0_pins: spi0-pins {
>                                 function =3D "spi0";
>                         };
>
> +                       /omit-if-no-ref/
> +                       spi1_pins: spi1-pins {
> +                               pins =3D "PD10", "PD11", "PD12", "PD13", =
"PD14", "PD15";

Could you split out the WP and HOLD pins as separate nodes. They aren't
strictly needed for SPI, and folks might have designs that use the two
pins for other purposes.


Thanks
ChenYu

> +                               function =3D "spi1";
> +                       };
> +
>                         /omit-if-no-ref/
>                         uart1_pg6_pins: uart1-pg6-pins {
>                                 pins =3D "PG6", "PG7";
> --
> 2.39.5
>
>
>

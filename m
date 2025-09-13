Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F852EA725
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757754568; cv=none; b=USrfiTYy07ikDg89M3XnuiiTe2HFk0PI/W3VWr4oj7LEFtGq/0KbKPDD+2ySDPxDPogDcFlbuk07W7LT9hYcuQY7lvhS2J5DkgoPFGdEuOc+CzKVrojDa5HgZho8RHDKrQEy6x/wPmuBr0PCEog5m2832uMWRf6qfO3DpeFrpec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757754568; c=relaxed/simple;
	bh=3axRdzUJe+dWuKW8fyKBAG7j/3hD2bAE41+RVxf3jAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9tDQk8Wrlg0NM9l9AyoUdxh+feMHN43DCJrVr9letUt2XNw4s4dPgSe3S7UXtZ/IEu+wEfNb+n4KZWYps0p5R5K7yKv3KvXCgh7EMX5dLwUwaM6F4GqF11GfGgC3fyrwLpLxZwBLjfxU65WnTNcParvJ3y2np9C+xAW36g0lyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-336ce4a8bfcso20765841fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 02:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757754560; x=1758359360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4M9q1sBtoJdbch2HX+0f+gEgUbmufQuxtOpAtokmLRw=;
        b=ZO0E4jKG1iXsTvCLNxGjPU+Dsx20DBukMsBLXArnmJ3AYZPb47ylVzd2mcH9fXVHia
         pXbOOomjFTT3VzGKtmociYeDV9zh2MQHDn94FkElzIBhjvRu7Y/oLMDjf9XfcRPPH2LL
         NcAiBHxLCXNr91RHtY28hQgS++hkH+Z9gnLe0FYCAc4s9LDKLxU+7gPGnySgkIkW5L29
         sjbtbkutejw/T3g5Itv9IaoQbamqNnpkYOamDjbh6HypB4iA2aiyrNhMWD0t+j2NoKWw
         8SplDemMsUHuChLexUHzlKwnpVqKYNS3ME1YWQK/yddmcmbgHcCeuyB2ymAZaRkn+AGs
         uelQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbwqU4FZGealy6+2yHjdv9JdeCPnntHr6oUn28XoB7Al7rDll+tUpnlg94QdqG45VNHNCXSIUXzRwCxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKCoXqXlNrBQ+AzSpk47UWM7KagcmfW4Da4o0+6MqWGMfuVMIl
	t3Y7hFgHmGm3aGao+q+mAL5oFEK3ml5ICgEd74Wk8q7fvgQDSjKWF0A2dmgLlb2u
X-Gm-Gg: ASbGnctJMFGKroKe+Z3mhkrS9StGeCCAWZ/XyL6oK+dl3Yh3gIyXOUmEQwQz08xnYiP
	z5wL6yTXCPHEzM/0huQE6XuiYi9SBThb87H8pDhrZ9Q3zbUOhFyuDcei4leyTIYa1yFmst1Loh2
	rdPKIWanZ/MtSkditP/CHZqLnkbZiM4EeolVmlrf9sc++9Dps3n1jYFQnvEFkx++2jMs80CReax
	zH9krFCzflb1VQ8NRCi8Js1O7XmrC1NUEztfuN65UsfKHT6O9zUkHDGMtwnEoWei4y1TSX7jgWv
	HbQxljRU310gdZPTFiqVm9QIymVL/qkcuVL8fXVtJM2ADMnVwccw0dgm7dCqVYyRnZUsW3gKiOZ
	r16ElxbukL9gRmeIAgQ8jvlDQ8+2MJ6wk3X//T4q87bImQQOUeQVHdyMq9HuyW6Jm5g==
X-Google-Smtp-Source: AGHT+IEcSOQMOSpfRbhxJRMmi/WiCH+Ec8CIIiEe+2FTzIUFtWrEkdV6VM0i5ppP2rKfv0SCk75khQ==
X-Received: by 2002:a05:651c:20dc:20b0:336:df07:95dd with SMTP id 38308e7fff4ca-3513b2966abmr12267901fa.15.1757754559372;
        Sat, 13 Sep 2025 02:09:19 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1bf1a45csm13787451fa.60.2025.09.13.02.09.18
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 02:09:18 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-336ce4a8bfcso20765381fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 02:09:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpfY2ogn6khlamFXechEJlGrAGThh6pdn3gYF+vGJ97HqgaiEWOXYLSa3PqyaAyzFt+6lx0nrOyt1lBg==@lists.linux.dev
X-Received: by 2002:a2e:bc13:0:b0:336:ed88:f3b1 with SMTP id
 38308e7fff4ca-3513a042fe1mr16058841fa.7.1757754557881; Sat, 13 Sep 2025
 02:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250831162536.2380589-1-lukas.schmid@netcube.li> <20250831162536.2380589-3-lukas.schmid@netcube.li>
In-Reply-To: <20250831162536.2380589-3-lukas.schmid@netcube.li>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 13 Sep 2025 17:09:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v67fwg0x8HNE6Dp-M-LDyon1YipeonqvSvSY-BFH+f4E9w@mail.gmail.com>
X-Gm-Features: Ac12FXypVtt3w9R-5_aPJlDVL7mEoeRUisSDiiTl2jorYCCDiG8XoTwLb6M_2sQ
Message-ID: <CAGb2v67fwg0x8HNE6Dp-M-LDyon1YipeonqvSvSY-BFH+f4E9w@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] riscv: dts: allwinner: d1s-t113: Add pinctrl's
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

On Mon, Sep 1, 2025 at 12:26=E2=80=AFAM Lukas Schmid <lukas.schmid@netcube.=
li> wrote:
>
> Added the following pinctrl's used by the NetCube Systems Nagami SoM
>   * i2c2_pins
>   * i2c3_pins
>   * i2s1_pins, i2s1_din_pins, i2s1_dout_pins
>   * spi1_pins, spi1_hold_pin, spi1_wp_pin
>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index e4175adb028da..c00996d6275c5 100644
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

Because i2c2 and i2c3 have multiple options, they should be named
appropriately, like i2c2-pd-pins and i2c3-pg-pins

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

Should be *din0* and *dout0*, since you have din1 and dout1 on the same pin=
s
but swapped around.


ChenYu

> +
>                         /omit-if-no-ref/
>                         lcd_rgb666_pins: lcd-rgb666-pins {
>                                 pins =3D "PD0", "PD1", "PD2", "PD3", "PD4=
", "PD5",
> @@ -126,6 +156,24 @@ spi0_pins: spi0-pins {
>                                 function =3D "spi0";
>                         };
>
> +                       /omit-if-no-ref/
> +                       spi1_pins: spi1-pins {
> +                               pins =3D "PD10", "PD11", "PD12", "PD13";
> +                               function =3D "spi1";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       spi1_hold_pin: spi1-hold-pin {
> +                               pins =3D "PD14";
> +                               function =3D "spi1";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       spi1_wp_pin: spi1-wp-pin {
> +                               pins =3D "PD15";
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

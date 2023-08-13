Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3461415A4
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 04:17:42 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-687087d8ddaso3308384b3a.1
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Aug 2023 21:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691900262; x=1692505062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLMyURC53hwz5v812uK/eVgyKmTJ3lphiPgO1Kd5Ijk=;
        b=KQpQiJtndMpr/fuJhnWdE7XoRv+FYkWjlwnJTz9iJ8kTw4itAmuJVdwXspvDHIDFU+
         wzQP8G2AW+S+OElY1lYkPeF0bby4/KNKj8ZsSPtw9xkifVlVFy0Y5Vwxo0v7j2oTd6ez
         4hze8k0d/T6HjA7NkmvbXbAvAnERnAF3fvJD6i6XboBLc+NKQuHExv3SK9xcnwggaIBd
         PqeFEzAEPvYvSCf55K/E77LijlzkaZIg0b/CZ2ogRE6YNkZlJEsODmCuuOUQextv9w/0
         zXX4KvLftUQI8l/d/OtIwmkoF6IFLtotLodNVNV0l7Gk4AW79CSXMr60lEiD86mG5rcy
         OYPA==
X-Gm-Message-State: AOJu0Yx2t+kJWi/SGhlU8GmrQZuZulWVywBfBTSyknl1WUtfqLp13LmM
	gxSDf0YLvbCyh84AAVJ5fU3RqBACmFKRRA==
X-Google-Smtp-Source: AGHT+IFT+Ujrc8QihL7BDLUn4c9eOud16dWcIDapDzKrshRf+jeYUvLVLetM9rs6rz8ef47rhcR9bQ==
X-Received: by 2002:a05:6a00:c87:b0:668:81c5:2f8d with SMTP id a7-20020a056a000c8700b0066881c52f8dmr8239554pfv.3.1691900262284;
        Sat, 12 Aug 2023 21:17:42 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id u10-20020aa7838a000000b00660d80087a8sm5614051pfm.187.2023.08.12.21.17.39
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 21:17:39 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-26b44247123so437280a91.2
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Aug 2023 21:17:39 -0700 (PDT)
X-Received: by 2002:a17:90a:8d0c:b0:263:f8e3:5a2a with SMTP id
 c12-20020a17090a8d0c00b00263f8e35a2amr5198981pjo.36.1691900259095; Sat, 12
 Aug 2023 21:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230807191952.2019208-1-contact@jookia.org>
In-Reply-To: <20230807191952.2019208-1-contact@jookia.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 13 Aug 2023 12:17:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v66vqrNZ-ga-1O_bQ16BWXH=RmSHo2Kb+WHJyw-Nm1kWVg@mail.gmail.com>
Message-ID: <CAGb2v66vqrNZ-ga-1O_bQ16BWXH=RmSHo2Kb+WHJyw-Nm1kWVg@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
To: John Watts <contact@jookia.org>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maksim Kiselev <bigunclemax@gmail.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2023 at 3:20=E2=80=AFAM John Watts <contact@jookia.org> wrot=
e:
>
> The Allwinner D1, T113 provide two CAN controllers that are variants
> of the R40 controller.
>
> I have tested support for these controllers on two boards:
>
> - A Lichee Panel RV 86 Panel running a D1 chip
> - A Mango Pi MQ Dual running a T113-s3 chip
>
> Both of these fully support both CAN controllers.
>
> Signed-off-by: John Watts <contact@jookia.org>
> ---
> Changes in v3:
> - Set default pinctrl for can controller
> - Moved can nodes to proper location
> - Moved can pins to proper location
>
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index d59b4acf183a..24f2e70d5886 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -52,6 +52,18 @@ pio: pinctrl@2000000 {
>                         #gpio-cells =3D <3>;
>                         #interrupt-cells =3D <3>;
>
> +                       /omit-if-no-ref/

Just FYI this likely ends up doing nothing if you also have them
referenced through a default pinctrl setting. They end up always
referenced and always included. For the D1 series it looks like no
peripheral has default pinctrl setting given.

We can still keep it though. It would help when future chip variants
specify different pinmuxes.

> +                       can0_pins: can0-pins {
> +                               pins =3D "PB2", "PB3";
> +                               function =3D "can0";
> +                       };
> +
> +                       /omit-if-no-ref/
> +                       can1_pins: can1-pins {
> +                               pins =3D "PB4", "PB5";
> +                               function =3D "can1";
> +                       };
> +
>                         /omit-if-no-ref/
>                         clk_pg11_pin: clk-pg11-pin {
>                                 pins =3D "PG11";
> @@ -356,6 +368,28 @@ i2c3: i2c@2502c00 {
>                         #size-cells =3D <0>;
>                 };
>
> +               can0: can@2504000 {
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&can0_pins>;

The compatible string should be the first property. In other sunxi SoC dtsi
files, we put the pinctrl just before the "status" property if it's present
to specify a default pin muxing.

I can fix it up while applying.

ChenYu

> +                       compatible =3D "allwinner,sun20i-d1-can";
> +                       reg =3D <0x02504000 0x400>;
> +                       interrupts =3D <SOC_PERIPHERAL_IRQ(21) IRQ_TYPE_L=
EVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_CAN0>;
> +                       resets =3D <&ccu RST_BUS_CAN0>;
> +                       status =3D "disabled";
> +               };
> +
> +               can1: can@2504400 {
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&can1_pins>;
> +                       compatible =3D "allwinner,sun20i-d1-can";
> +                       reg =3D <0x02504400 0x400>;
> +                       interrupts =3D <SOC_PERIPHERAL_IRQ(22) IRQ_TYPE_L=
EVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_CAN1>;
> +                       resets =3D <&ccu RST_BUS_CAN1>;
> +                       status =3D "disabled";
> +               };
> +
>                 syscon: syscon@3000000 {
>                         compatible =3D "allwinner,sun20i-d1-system-contro=
l";
>                         reg =3D <0x3000000 0x1000>;
> --
> 2.41.0
>
>

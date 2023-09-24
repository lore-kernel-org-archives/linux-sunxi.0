Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6B3D29E
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:30:24 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so14364827a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695583822; x=1696188622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUUJIEhzOdAnkw/nl7YJGdSxrlSg4ACmgxiwTGYWC4I=;
        b=Ie90EC5uYvonMASPGnc6e4eshfwD6OUeMsaLuRNUH3BwBUO3nXMJ9vAhG8QCm57nGW
         /8HdQfBEjPiy3Gpt9bNrPOYWN7rSVB9Zun3IjwXIYyo2GfTy6JZolCUBYi2mUVmvaTBQ
         3oH76DdpwHMMLSoQVo/8QSMU/VE9vYE+Pqiz4gr5nKh93CYXiL7497kFf9hCfFQYPhuT
         HEQXu8v7tUFkbVeE8vhSo+HAfSQb6Cozd4YlTO6LKSX4xN94onllSAzpJx6bSAZipowp
         fidlTSJPSRQux+V9a8tn2APe6KHtLNnTFSC/blnB3NWP1IvoK2BqITMdDW96bsnyXpO3
         st9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695583822; x=1696188622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUUJIEhzOdAnkw/nl7YJGdSxrlSg4ACmgxiwTGYWC4I=;
        b=s7ZDMdqkVuLTZU2QbMmuDcQaKc45uBms9BvqoOAl989W3qEE5re6QgwEAYmBBBL/Zi
         CpHPVqdI/Cj+V+uWEwGNcYv+6cZmTl2N2C22Jqhw8ywnEkLSoz2mfyzgKU1hSf1utSVr
         tg8vMclGydqKVk4gl8NJMrKsGe503fNOdDKd+hvRGjMnefYACNebjVQgxIbpmeYS0xTW
         XnHfMqmURjsdwo3Yiq84zFSP8gF6dRlGBUsx53XCTkI6tiQLXmRjNuyrGN/mLFuiApGs
         6C/ryAEjzJ2eQC0Ysha//iiNqZeiInUSsgT1UA791EK2qmo7PQQ4/J0XyroXYfxuWFb8
         7RyQ==
X-Gm-Message-State: AOJu0YxTQWRTyWdFhF6fY8hDvHtGB9WbI52XhLsVBlz66D1yFjWRHROq
	4LDxITdiFrmGuJ3c0/Xmi3/LrhU8IFCSNA==
X-Google-Smtp-Source: AGHT+IEaddZTMihzpc2QHNrcIR7tIgm1yDtiU4v1jqmd8nqjC0yUWtZOi/JcMn+36BWmzLdGhlwYRA==
X-Received: by 2002:a05:6402:291a:b0:533:dd4d:2941 with SMTP id ee26-20020a056402291a00b00533dd4d2941mr4899478edb.16.1695583822544;
        Sun, 24 Sep 2023 12:30:22 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id n10-20020a056402514a00b0052333e5237esm4614742edd.88.2023.09.24.12.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:30:22 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
 samuel@sholland.org, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 andre.przywara@arm.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V5 2/4] ARM: dts: sun8i: v3s: add EHCI and OHCI to v3s dts
Date: Sun, 24 Sep 2023 21:30:21 +0200
Message-ID: <5711313.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230921135136.97491-3-macroalpha82@gmail.com>
References:
 <20230921135136.97491-1-macroalpha82@gmail.com>
 <20230921135136.97491-3-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 21. september 2023 ob 15:51:34 CEST je Chris Morgan napis=
al(a):
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add the EHCI and OHCI controller to the Allwinner v3s to support using
> USB in host mode.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/d=
ts/allwinner/sun8i-v3s.dtsi
> index c87476ea31e2..e8a04476b776 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> @@ -319,6 +319,29 @@ usbphy: phy@1c19400 {
>  			#phy-cells =3D <1>;
>  		};
> =20
> +		ehci: usb@1c1a000 {
> +			compatible =3D "allwinner,sun8i-v3s-ehci", "generic-ehci";
> +			reg =3D <0x01c1a000 0x100>;
> +			interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
> +			resets =3D <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
> +			phys =3D <&usbphy 0>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
> +
> +		ohci: usb@1c1a400 {
> +			compatible =3D "allwinner,sun8i-v3s-ohci", "generic-ohci";
> +			reg =3D <0x01c1a400 0x100>;
> +			interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
> +				 <&ccu CLK_USB_OHCI0>;
> +			resets =3D <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
> +			phys =3D <&usbphy 0>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
> +
>  		ccu: clock@1c20000 {
>  			compatible =3D "allwinner,sun8i-v3s-ccu";
>  			reg =3D <0x01c20000 0x400>;
>=20





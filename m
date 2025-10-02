Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5BD22A7E5
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Oct 2025 16:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759422160; cv=none; b=hWVLqqSMHVXuhn9FBRYQfQU3btv8PS1ivSIAFII181hX0BDh3qv/mUBmjhGfe1EMqOwqWZ2vdU3crfWboWLBANVCasSNEfsVHM9b1LO7+8rptpfNYmkqUbykWV3BmA9+kbyajS53eIVYppBo1MYBOo+w+dXD1jQMLasADj458Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759422160; c=relaxed/simple;
	bh=HpaP3TCDX68OcDypYmYu4LEO9PSfR4XHL0EswYJIQCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TY17fSP7HxARDhjIUYE6WAzwOelcTU6axeyGzqR3yXVZn1NsGvY0HfVJ+rPzwvJH3STYdQGvl+fR9yLJozCdwadFw4yQbBlgHhMABWU0Pr0Mp+iQYJr/brJ9SrzPE6eIeXfT4c/0nyErmjVMUMYk6hlpjDH5s4Qcl+IhSBlIaBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWPxluD4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWPxluD4"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2698384978dso8722895ad.0
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Oct 2025 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759422158; x=1760026958; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LbxYgnEojJ93c8rsOWf/bBt3bhhAFbsmGgZt+eHULs=;
        b=CWPxluD4zP6zgtVdM0tT7BsA1dGP2riGNcu0kALhrNjYavsOjbUVskZ95Hl2i5dpU+
         bd3+KG6O29C0FWq4s8V0ZxzdQrukPPu5QIcj7wyhwrYXWj57zP4pxsoTkMSxFvgMEr9x
         ty8M+X607kqUw5u5XtmJRlqmRK80KcXkN1rFXzWSdNw5SlA7s1PE6nMDGhsxOR9dR4An
         ZKIwkelELPd/Y0KTDb5LN3Y5gOeSbOoHaiSr1cuLOgeq9BP1pRh/tpTlh0B1F49HJ62z
         5UxRFWX8CcBqJE7+BqwLVJodPnWZoMTVucyNwho5Dq/BZKWfcRzoW+KbAvm4eZEmvmmJ
         Ylsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759422158; x=1760026958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LbxYgnEojJ93c8rsOWf/bBt3bhhAFbsmGgZt+eHULs=;
        b=RT8vvk25Sy1gL98mGJsoH/Jf6x0HYIIpeuUnDCtLuymVJGjoGQE9k7feVi7WQucxrU
         GNKEwMoh6jwleHnJGECS08qz8Esz+dEnWGmnhYhvo9kAR3LVZb+DgiHGmun7By7wVv0H
         7ULVvc2poceVBWUljw3JZEhLEgFWPBcu5dyAvi+MQaVBXoHCI44Qfv8Qs33kw07fCM97
         z4IhntZmdMdFP44tkeA6XXCIhrwlf958BcMCUZHGU+y5We4iliHZyUseVGKtPMXvJ9v+
         lyWpCKLFVkpOt3BZ13DkI9vWDRALidLjfctag1A3nrlNCUt7ARSHn8WWa0GGU+2sLd/q
         PRhA==
X-Forwarded-Encrypted: i=1; AJvYcCXoSRIZ5QhKKXqb/KVqNEL19cZI245CEuFsSfkwkcjb2GJPLQbo8LFxcnMht4f97pZupLP4aGso9wY/NA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgOW2L89CXhdrZo6WoULgy/VB3kacLwM3PJIeBekAj+CuNIyUr
	I7JiNy2GD4JV9n++2eNdLwmGDf1Xzj/K5zwV5xrAKt0QZPVvLWLlIgu7gfkmwCSJ150MSGlRiHO
	ov3Fya499u1DuUfkCBEdIKGWuRzWPXsI=
X-Gm-Gg: ASbGncv7z6q4sCFdpjPMgw6tRVvij/3in21IfvhvV0/Tjd921DogzWODfWiyV6vl+nY
	w20hU8Je8f8D+8Q5/EIc6Lgz5HIF7KY9k9gsjvJ2GmctGLFxe2clVyr3oMOrhxru7yeW675C71N
	EUvvf7Smbg42yOOM65NCHyIxpa6oCBUx4Sgm2a1bnMjgFXz4b3mcufVJkvkQ+Unrb1XdxkPlWbp
	kvleQxrO689sRUu1aLP8ZBzQuXbDy0=
X-Google-Smtp-Source: AGHT+IGRvLPIfPId+ThviLGcDguWvaiXYJhGL7lLP2ZYkgJ5H9fCJdaZmo7Lu2lqeUHQNIJJrKq42s7JgSMOk7shsiY=
X-Received: by 2002:a17:903:2ece:b0:275:81ca:2c5 with SMTP id
 d9443c01a7336-28e7f47a3f2mr86332225ad.59.1759422158111; Thu, 02 Oct 2025
 09:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819131752.86948-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250819131752.86948-2-krzysztof.kozlowski@linaro.org>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:27:35 -0400
X-Gm-Features: AS18NWDLQ6hD1LnWbuZES13_YjRj4m-0ztzOfBvznDKgHuJ8g5udlLpfwGDslIY
Message-ID: <CALC8CXf+FJDcYLr4NwZMesa0kaPABw4j5Jy1bOU3XX7UJ1VcqA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: allwinner: Minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

KRZYSZTOF KOZLOWSKI... So... Kyrgastani Polish guy?
Doesn't sound Russkie. Bet the ethnic Russians (Rysskiy) oppress your
ancestors. Who had to just TAKE IT. How does that make you feel?

On Tue, Aug 19, 2025 at 9:25=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The DTS code coding style expects exactly one space around '=3D' or '{'
> characters.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts  | 2 +-
>  arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi          | 2 +-
>  arch/arm/boot/dts/allwinner/sun8i-r40.dtsi                | 2 +-
>  arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts b/a=
rch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
> index 83d283cf6633..d425d9ee83db 100644
> --- a/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
> +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
> @@ -218,7 +218,7 @@ &usb_otg {
>  &usbphy {
>         usb0_id_det-gpios =3D <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)=
>; /* PH4 */
>         usb0_vbus_det-gpios =3D <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_U=
P)>; /* PH5 */
> -       usb0_vbus-supply   =3D <&reg_usb0_vbus>;
> +       usb0_vbus-supply =3D <&reg_usb0_vbus>;
>         usb1_vbus-supply =3D <&reg_usb1_vbus>;
>         usb2_vbus-supply =3D <&reg_usb2_vbus>;
>         status =3D "okay";
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi b/arch/arm/=
boot/dts/allwinner/sun8i-q8-common.dtsi
> index 272584881bb2..a0f787581dd9 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi
> @@ -82,7 +82,7 @@ &de {
>  };
>
>  &ehci0 {
> -       status  =3D "okay";
> +       status =3D "okay";
>  };
>
>  &mmc1 {
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi b/arch/arm/boot/d=
ts/allwinner/sun8i-r40.dtsi
> index fa162f7fa9f0..f0ed802a9d08 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
> @@ -705,7 +705,7 @@ uart2_pi_pins: uart2-pi-pins {
>                         };
>
>                         /omit-if-no-ref/
> -                       uart2_rts_cts_pi_pins: uart2-rts-cts-pi-pins{
> +                       uart2_rts_cts_pi_pins: uart2-rts-cts-pi-pins {
>                                 pins =3D "PI16", "PI17";
>                                 function =3D "uart2";
>                         };
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/=
arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> index 5143cb4e7b78..cb6292319f39 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> @@ -29,7 +29,7 @@ chosen {
>         clk_can0: clock-can0 {
>                 compatible =3D "fixed-clock";
>                 #clock-cells =3D <0>;
> -               clock-frequency  =3D <40000000>;
> +               clock-frequency =3D <40000000>;
>         };
>
>         gpio-keys {
> --
> 2.48.1
>
>

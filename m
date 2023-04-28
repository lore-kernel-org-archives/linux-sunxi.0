Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09D210E5
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Apr 2023 06:43:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f173af665fso62452975e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Apr 2023 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682664211; x=1685256211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31ZUiiLTP21TBfk/x6qc9G3WQJWlECoDzo5LSbdGdGw=;
        b=kFhjSdoq+UbCKEl0ne8AV/zQ34ktf7ne73V1ntaOjSvGFlRa+RDQ04sTJhEfxGOqw0
         IOwgYXIhEZZMw0KZiLbOl5qXW0axz89XEyJseEKqy4BCRRWKYx8ddUa3Ll0IF0gJesP1
         ai6TQ+WjiYq7iyIOQlB2uJnDS+1HwNnt3WcbKaIcKbXngiv0XvgcQBvrcTM5Nv2PHcag
         WyzHUcSDYbuEVm5CezCnrU1gFZ4FDJfTomk6kdTPl74pBVWxefXjoijRe5v5egeAWILC
         q0yRdQW1FXsvWaLJPP+sH6IO+X5aCpLX9oh9eu28gjv8wm3AJQJSnybZfJ+FP71JOP7a
         wYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682664211; x=1685256211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31ZUiiLTP21TBfk/x6qc9G3WQJWlECoDzo5LSbdGdGw=;
        b=Kr+FEJlDU/MVAyc8d7vNOKzds6VmtNu7TJuZADFYT0/ImNJBDo+tfHz5MeLFie3JvZ
         fPS0rEVp1kUsIvAE2VFP4CjHbuYip6PRGInQulQIR4G1b5GuSa1JoExMTAWBpkkryKqq
         ybzO0ogPxXoJxKlfP8l+XXSFj/MLYH6NmmYHZelUz5AR2dZS+BZ87TGojIL8E3/CUqWY
         uf3em8HL0HJhoPvTLnaYgb1cTWH7Gl6Q1Vt8KxZSJkFURcPnYUSMjNhCfW+mts5mIY9e
         HTrd1CVRgaEOfuZplO1ifgQLNdBLgwnoVcpEkr4ca4gARGXcchn/rqazWmqmInWNJDD1
         Yr+Q==
X-Gm-Message-State: AC+VfDzTWcASA6MRLZCo4vTxzIMD8c49FBv1WDCU9hiti3Gk24hhMDQS
	PnsPuKmLz+MiV/P35dkEGs8=
X-Google-Smtp-Source: ACHHUZ50d/5tJ8AolUzgSXoZARfdohMiCwyMBJRoq23f6K3jb9jKjOTUg7edaVAqYsxzSeQdzfyLqQ==
X-Received: by 2002:a1c:cc0f:0:b0:3f1:718d:a21c with SMTP id h15-20020a1ccc0f000000b003f1718da21cmr3083738wmb.31.1682664211045;
        Thu, 27 Apr 2023 23:43:31 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c204100b003f3270ddbd8sm795594wmg.37.2023.04.27.23.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 23:43:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>, Roman Beranek <me@crly.cz>
Cc: Roman Beranek <me@crly.cz>, Frank Oltmanns <frank@oltmanns.dev>,
 Icenowy Zheng <icenowy@aosc.io>, Ondrej Jirman <megi@xff.cz>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] arm64: dts: allwinner: a64: reset pll-video0 rate
Date: Fri, 28 Apr 2023 08:43:29 +0200
Message-ID: <4477541.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20230427091611.99044-5-me@crly.cz>
References:
 <20230427091611.99044-1-me@crly.cz> <20230427091611.99044-5-me@crly.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 27. april 2023 ob 11:16:08 CEST je Roman Beranek napisal(=
a):
> With pll-mipi as its source clock, the exact rate to which TCON0's data
> clock can be set to is constrained by the current rate of pll-video0.
> Unless changed on a request of another consumer, the rate of pll-video0
> is left as inherited from the bootloader.
>=20
> The default rate on reset is 297 MHz, a value preferable to what it is
> later set to in u-boot (294 MHz). This happens unintentionally though,
> as u-boot, for the sake of simplicity, rounds the rate requested by DE2
> driver (297 MHz) to 6 MHz steps.
>=20
> Reset the PLL to its default rate of 297 MHz.

Why would that be preferable? You actually dropped "clk: sunxi-ng: a64:=20
propagate rate change from pll-mipi" patch which would take care for adjust=
ing=20
parent rate to correct value.

Best regards,
Jernej

>=20
> Signed-off-by: Roman Beranek <me@crly.cz>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi index
> e6a194db420d..cfc60dce80b0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -667,6 +667,9 @@ ccu: clock@1c20000 {
>  			clock-names =3D "hosc", "losc";
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
> +
> +			assigned-clocks =3D <&ccu CLK_PLL_VIDEO0>;
> +			assigned-clock-rates =3D <297000000>;
>  		};
>=20
>  		pio: pinctrl@1c20800 {





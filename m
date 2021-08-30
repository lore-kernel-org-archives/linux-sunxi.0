Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F5F3FC1
	for <linux-sunxi@lists.linux.dev>; Mon, 30 Aug 2021 20:49:40 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id e21so33844617ejz.12
        for <linux-sunxi@lists.linux.dev>; Mon, 30 Aug 2021 13:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QwGrx3DZXcDFxxZinjWxnatOl75Xen4FtkBd/Z3DLhI=;
        b=Sl9vplX5DLdVbrtFEFZTDDYKI71oUji9/VLjm7L93tkMzl54Dx7zV8IHdaz7/uHsrN
         /d/7Pkm0zAexE22PnCkp1aoy24E5IojeuEFTPSBbJTi2V3NrC53iUIN4f0fwUc2mJDU2
         rD+IO2iRyOiETDEuhuZ8G1AQZhUP0UfO/ZcS8+KDZ5uZNJV/7t6j7AhzZXQCeVCgJ4Jo
         RkH2C/8vfbu6CU7ZM77JbnWa2CCzTZHrMR8Rj4po1uUYMi2NDfi9ryo4Tj2xBdcwzqWM
         tigAIC3LAL2KkcRmz5NBmPGticq33ya88WtHaSPBs5F1RqjTYaZU36mSNu9usE4OZfqI
         012g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QwGrx3DZXcDFxxZinjWxnatOl75Xen4FtkBd/Z3DLhI=;
        b=fDo8RO6rw0QSfPYh4ZPUSbwiYZBhUqIgUmjTrfNCUC3ccWemiT6H6CZI3GLYTEch5u
         4z2B2EOSGPuuI92+z4nvjHUokul3nDLoHL/oihaJJCSg5rb4RVJ6QuPb870fjaB3dZNt
         WPVWm4WJUht1DX4uCplT/NL4AIDtymDXSM20qgHlVgVqVyOIMAoaJ92shaema+LrbMvK
         MiIHG3syY8GqLmGaIoF3POIWSQPWP6w/MVJ85SDIRxEhTRX+tqOMDKrwtUo7Sr4gAj0x
         1qptr64RIeG2aEqq5wh/xpcb3xkBzZWdN6uAnMBlvczMDahuJ/o3AyfmULXJC6mJt+u+
         2MRg==
X-Gm-Message-State: AOAM531AQMSnuCyX4HwtmqPZ+nK8wie1BY3yw39E8L4pO8LrGLpZxnnC
	60fbmza2ibK5sOsUkcgFSv8=
X-Google-Smtp-Source: ABdhPJyH022G1mTKT1wDyArDNInyC7uX4awGVpVzyYmdox3yySaa0R+0EfEbw3xseEJ2hRSFG9TGEw==
X-Received: by 2002:a17:907:7848:: with SMTP id lb8mr27593494ejc.494.1630356579251;
        Mon, 30 Aug 2021 13:49:39 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id s23sm8345620eds.12.2021.08.30.13.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 13:49:38 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, =?utf-8?B?Q2zDqW1lbnQgQsWTc2No?= <u@pkh.me>
Cc: Willy Liu <willy.liu@realtek.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?B?Q2zDqW1lbnQgQsWTc2No?= <u@pkh.me>
Subject: Re: [PATCH] arm64: dts: sun50i: h5: NanoPI Neo 2: phy-mode rgmii-id
Date: Mon, 30 Aug 2021 22:49:37 +0200
Message-ID: <116454729.UZi3dMzWh7@jernej-laptop>
In-Reply-To: <20210830151645.18018-1-u@pkh.me>
References: <20210830151645.18018-1-u@pkh.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi!

Dne ponedeljek, 30. avgust 2021 ob 17:16:45 CEST je Cl=C3=A9ment B=C5=93sch=
 napisal(a):
> Since commit bbc4d71d6354 ("net: phy: realtek: fix rtl8211e rx/tx delay
> config") network is broken on the NanoPi Neo 2.
>=20
> This patch changes the phy-mode to use internal delays both for RX and
> TX as has been done for other boards affected by the same commit.
>=20
> Fixes: bbc4d71d6354 ("net: phy: realtek: fix rtl8211e rx/tx delay config")

This commit fixes DT issue, so "fixes" tag should be:
=46ixes: 44a94c7ef989 ("arm64: dts: allwinner: H5: Restore EMAC changes")

Here, a node with wrong phy-mode property was added to NanoPi Neo 2 board D=
T. =20

Other than that, this patch is fine and once fixes tag is fixed, you can ad=
d:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

=46or next version, you should:
=2D change fixed tag
=2D add my review-by tag right above your signed-off-by tag
=2D mark patch as v2 (add "-v2" parameter to git format-patch)
=2D describe change right under "---" line

Note, if you borked something when sending, you should mark patch or patch=
=20
series as "RESEND", so recipients don't look for changes in two subsequent =
e-
mails (--subject-prefix=3D"RESEND PATCH").

Thanks for the fix!

Best regards,
Jernej

> Signed-off-by: Cl=C3=A9ment B=C5=93sch <u@pkh.me>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts index
> 02f8e72f0cad..05486cccee1c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
> @@ -75,7 +75,7 @@ &emac {
>  	pinctrl-0 =3D <&emac_rgmii_pins>;
>  	phy-supply =3D <&reg_gmac_3v3>;
>  	phy-handle =3D <&ext_rgmii_phy>;
> -	phy-mode =3D "rgmii";
> +	phy-mode =3D "rgmii-id";
>  	status =3D "okay";
>  };





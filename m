Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09B11875
	for <linux-sunxi@lists.linux.dev>; Thu, 26 May 2022 20:49:46 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id i27so5078906ejd.9
        for <linux-sunxi@lists.linux.dev>; Thu, 26 May 2022 13:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yAsZTSZ1a8xS9rErKf9SBVyjQcUkv6lfr/KFAu+coOk=;
        b=dVtl33CWWZyZn9JYz1uRdSZSHiMQzLcltFH4jMDsrB9nKmQ6Ap9CB5WUE2jdTeJFoI
         RNIRQkKz2GVz/IgieYF1l0Fmlv5YmMxsq7AdTZ5xGDN5GSTghMEtbxJ05tX2KQid/mqB
         KJQM6Biwkjc2/PoWxMm7F9zgvsCIeQpX6XEcNXMe44ENkY3kQV3S6So7H2SL2+ifLSh5
         a8PF2syU6ly260rc1LjRzTu3woA/Yf3lNYqT4S8YScsdl57E121XLJskZmBZJpgP/B5h
         UpHO860e1fAKaxBax28XJrzR0P6Km3HQ+gC2OPUiZi2HuMMVCucDmHlUNYwuI0HV1tjW
         pwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yAsZTSZ1a8xS9rErKf9SBVyjQcUkv6lfr/KFAu+coOk=;
        b=cEpshTFWvASZamlu2zlqe+qtD2oOCb6z9Uj2Q9CQvwo7AA3UghQFmRNjnOfz2U+a4F
         d0vb0rqJT+PVDLmaF9RdCiW2xG8NIzoQTvyX+kZ3V93iQdDecdyWFjRaqa4hoe9UFqmH
         QRY8yIPCa7MC5REO4aLSFVmWrCrk6lWNYWQnh6SqRtButnoapNgT09N/QyPeI8+AlNjN
         X8wVC5Y4YcSKiLDSy1z5qNQRCUiT8btT2f2nBraZv0iNeDdiTw9NqZREvVrKo7ttvNPh
         60ahv/emPmjnA9mk0bdCz7naI4FXD6deX9ThYw0rG8NAVOaYhta+yTutO9RDEFNPSmIV
         MzuQ==
X-Gm-Message-State: AOAM53376gfsGbouUbJknb7QNcYcaayEKb32mzSRXeOT8qGx5sUx1HXd
	N4vSgPQoGjgaWa3vuQISAVeyz1MVfl4veA==
X-Google-Smtp-Source: ABdhPJxUN5ZUhtOcz0d2q4ybSjuruzHPv1K4AehZHBwLykcSk+YIbNmkk8aYK2nzmqaUrcp9c8+rxw==
X-Received: by 2002:a17:907:8a18:b0:6fe:ccbc:afe5 with SMTP id sc24-20020a1709078a1800b006feccbcafe5mr22223241ejc.54.1653598185213;
        Thu, 26 May 2022 13:49:45 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id b3-20020a50e783000000b0042617ba637fsm1252502edn.9.2022.05.26.13.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:49:44 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <mripard@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] pinctrl: sunxi: a83t: Fix NAND function name for some pins
Date: Thu, 26 May 2022 22:49:43 +0200
Message-ID: <7383317.EvYhyI6sBW@kista>
In-Reply-To: <20220526024956.49500-1-samuel@sholland.org>
References: <20220526024956.49500-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 26. maj 2022 ob 04:49:56 CEST je Samuel Holland napisal(a=
):
> The other NAND pins on Port C use the "nand0" function name.
> "nand0" also matches all of the other Allwinner SoCs.
>=20
> Fixes: 4730f33f0d82 ("pinctrl: sunxi: add allwinner A83T PIO controller=20
support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>=20
>  drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c b/drivers/pinctrl/
sunxi/pinctrl-sun8i-a83t.c
> index 4ada80317a3b..b5c1a8f363f3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c
> @@ -158,26 +158,26 @@ static const struct sunxi_desc_pin sun8i_a83t_pins[=
] =3D=20
{
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> -		  SUNXI_FUNCTION(0x2, "nand"),		/* DQ6=20
*/
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ6=20
*/
>  		  SUNXI_FUNCTION(0x3, "mmc2")),		/* D6=20
*/
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> -		  SUNXI_FUNCTION(0x2, "nand"),		/* DQ7=20
*/
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ7=20
*/
>  		  SUNXI_FUNCTION(0x3, "mmc2")),		/* D7=20
*/
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 16),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> -		  SUNXI_FUNCTION(0x2, "nand"),		/* DQS=20
*/
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQS=20
*/
>  		  SUNXI_FUNCTION(0x3, "mmc2")),		/* RST=20
*/
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 17),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> -		  SUNXI_FUNCTION(0x2, "nand")),		/* CE2=20
*/
> +		  SUNXI_FUNCTION(0x2, "nand0")),	/* CE2 */
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 18),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> -		  SUNXI_FUNCTION(0x2, "nand")),		/* CE3=20
*/
> +		  SUNXI_FUNCTION(0x2, "nand0")),	/* CE3 */
>  	/* Hole */
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 2),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> --=20
> 2.35.1
>=20
>=20



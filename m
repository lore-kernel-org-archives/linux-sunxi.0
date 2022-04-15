Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3382D7B
	for <linux-sunxi@lists.linux.dev>; Fri, 15 Apr 2022 18:21:38 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id u15so16518492ejf.11
        for <linux-sunxi@lists.linux.dev>; Fri, 15 Apr 2022 11:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aY2i70GcxPM0t2j3zWxTuNc97f9BOBUas6jIJc8m0/0=;
        b=e2/JQZr5KfImS1MZLgF8x0G8Ugy+IalHb4/nfvLGJljKEkBueU3lYaCB6l++dVJ2T2
         ct7bfOhn4kEOMv+637QbdyhS9JUFuWIoT9foyYKwaGCbT9bFqZUYsTnaiKTD9uskqf1j
         Ek9/HZErQ7IiXqI6RvMJuUn9R8IxNG2NlBjMcwnlzzK17Ov3AF0ti/AzlowENM8JsNq4
         pXnobt4hQF+ymQv/PVIbX3kgj1HEiuqYxgu1jMqbL7gO0MGI0zbaxM2B3Q4eqEy79MlW
         VNgXQHbrgoHdPuzekv1iCnAbGCs3o6x/0wFq/NQm/cRzvlIeNqPwCPoNz/bAoJG8VhuK
         EsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aY2i70GcxPM0t2j3zWxTuNc97f9BOBUas6jIJc8m0/0=;
        b=1eIFuFeHupLMgQnsfkcYA5I0qHFEthOgPKiIWODxYMEzYFvGVg3aEgkUsRjmJnIysH
         zchBIW86MGELMAzrm6vMlsQqmUejk0o0Nhymp7j+8anin/FMane/s2WM+ObmKKra6X1N
         uvT5bCflMlMz36QcyVdfnZJR4F3U+ymUN/mDJhZiBI1CcLZ+I1qtPNfQkp39XXkvrcMX
         E+AZF4JG2yxQubjVtXZtweZRp3fkD48h0OT1ug/QS+jQqdEIaLbL+Hg2HgFktC1tHUm2
         qnnacsLeb8gINu+8KZKnnEff1uBKA1450BqehgM7qjkLGVBCqNs5DHBvrYa80rJC7Yga
         uVbQ==
X-Gm-Message-State: AOAM530EC32YZlJZjmEXyBmwxnsuE2cx6hqmZ/lFXjmczowWcrjL3FQG
	jAZNKwV4wbsQS+loD8IlMhY=
X-Google-Smtp-Source: ABdhPJzCq6JERosCiAk6D1rln8EykVMZGfAoAS2LM2VBpWXvpllvzlCPidoEpqmP3Q4iCLXYpm4R5w==
X-Received: by 2002:a17:907:168a:b0:6e8:d125:1d24 with SMTP id hc10-20020a170907168a00b006e8d1251d24mr273806ejc.508.1650046896395;
        Fri, 15 Apr 2022 11:21:36 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id lb4-20020a170907784400b006e0d13f65e5sm1910608ejc.167.2022.04.15.11.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 11:21:36 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/3] Input: sun4i-lradc-keys: Add support for R329 and D1
Date: Fri, 15 Apr 2022 20:21:34 +0200
Message-ID: <2097461.irdbgypaU6@jernej-laptop>
In-Reply-To: <20220414002349.24332-3-samuel@sholland.org>
References: <20220414002349.24332-1-samuel@sholland.org> <20220414002349.24332-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 14. april 2022 ob 02:23:48 CEST je Samuel Holland napisal=
(a):
> This LRADC variant uses the same 3/4*AVCC reference voltage as the A83T
> variant. The R329 and D1 LRADCs appear to be identical, so D1 support is
> accomplished through having the R329 LRADC as a fallback compatible.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>=20
> Changes in v2:
>  - Set the new flag for the R329 variant.
>=20
>  drivers/input/keyboard/sun4i-lradc-keys.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c
> b/drivers/input/keyboard/sun4i-lradc-keys.c index
> 5630334a6c09..8f9bfb05244d 100644
> --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> @@ -78,6 +78,12 @@ static const struct lradc_variant r_lradc_variant_a83t=
 =3D
> { .divisor_denominator =3D 4
>  };
>=20
> +static const struct lradc_variant lradc_variant_r329 =3D {
> +	.divisor_numerator =3D 3,
> +	.divisor_denominator =3D 4,
> +	.has_clock_reset =3D true,
> +};
> +
>  struct sun4i_lradc_keymap {
>  	u32 voltage;
>  	u32 keycode;
> @@ -323,6 +329,8 @@ static const struct of_device_id sun4i_lradc_of_match=
[]
> =3D { .data =3D &lradc_variant_a10 },
>  	{ .compatible =3D "allwinner,sun8i-a83t-r-lradc",
>  		.data =3D &r_lradc_variant_a83t },
> +	{ .compatible =3D "allwinner,sun50i-r329-lradc",
> +		.data =3D &lradc_variant_r329 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_lradc_of_match);





Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09313D72
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 20:18:14 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h5so25159949wru.7
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 13:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=5boySqx/QOquxLdl8JfduLgh/CCKYPrGmebEc48BqF0=;
        b=jLv3eDLvx9cgcOp5gVtcmROUr2uL6GYDlm8F4RBQWUGoBZn2VuJHqqH7BCvQLkCifO
         ljH9VuP0Da5A5DQjni+AeAf38v2ml/1zwzOjnYptmctUe7jiHMFLsHoVqZiICXOXNtrf
         UNp8UCcHyj3io+wolu6mPwkxm8ZqYX7u+sc1RY6WlPTQOd1y9aK3r6hwtRSthvXQhVc6
         xWW50IGEq7ybZp8R5H9EcpOq/NgBKaZyTmvtg5rXOIesPVsuuCD8rm6S1/Q+SidPCJM0
         gN0VgnX0bUdIA+RW6Uh+X9EwueDctoU1FcLqMAZCWTt7HVjh7W2mqBAFK1z4fwXj0fIl
         /Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=5boySqx/QOquxLdl8JfduLgh/CCKYPrGmebEc48BqF0=;
        b=dP5fNl86qC+ZvPwQvUjOijhUIDZIAffHGtf7zsPUOK7cUBrecO97JNVqUaQ7ss9tiU
         k6pbDH9UNBRPEf1WLvkaIf2wDg21hcHQp9QnFZdf9GUQMez5pmfUW1xlezi6y3Vs13ga
         gKSTr3d6CuqCNXGJQLR4km7X2g2zYNLTYqUNEdZ265qZtOew4nCg4xEkW2bZ/q4PWxpH
         gxjKQUbLiI1IostvtAO/kd4Ny/I9SLVJ9FyzpFTfet3uWadqBm+R1x6Q6Q36iG9ofaGn
         Q//wUcB9cEmcwrblwiRXgOCqLC7Ct7N/CLKLF2A76f+H8udN8XLSkjr8TZZqKOsox574
         OmLA==
X-Gm-Message-State: ACgBeo1VgQkLr4x7GQ85a0zan3cdiz8zH0Cemer4rh/nWf0EfMPei1Jo
	UHyFJLFFv1qymTjp5QVXWiQ=
X-Google-Smtp-Source: AA6agR7qqebJ62S4jnfJLHIVKwuKG1XL7+sEEI5x6RLTUccSKg0PKv9fP153dYaHKowzV88ZPlHI6w==
X-Received: by 2002:a05:6000:2a3:b0:225:7ce8:a318 with SMTP id l3-20020a05600002a300b002257ce8a318mr2611163wry.350.1661458692998;
        Thu, 25 Aug 2022 13:18:12 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id i186-20020a1c3bc3000000b003a601707174sm242129wma.33.2022.08.25.13.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:18:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, maijianzhang <maijianzhang@allwinnertech.com>
Subject: Re: [PATCH] iio: adc: sun4i-gpadc-iio: adaptation interrupt number
Date: Thu, 25 Aug 2022 22:18:11 +0200
Message-ID: <5595575.DvuYhMxLoT@kista>
In-Reply-To: <YwdhTlk+7h+FMrwm@scg>
References: <YwdhTlk+7h+FMrwm@scg>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 25. avgust 2022 ob 13:47:26 CEST je fuyao napisal(a):
> __platform_get_irq_byname determinies whether the interrupt
> number is 0 and returns EINVAL.
>=20
> Signed-off-by: fuyao <fuyao1697@cyg.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  include/linux/mfd/sun4i-gpadc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/linux/mfd/sun4i-gpadc.h
> b/include/linux/mfd/sun4i-gpadc.h index ea0ccf33a459..021f820f9d52 100644
> --- a/include/linux/mfd/sun4i-gpadc.h
> +++ b/include/linux/mfd/sun4i-gpadc.h
> @@ -81,8 +81,8 @@
>  #define SUN4I_GPADC_TEMP_DATA				0x20
>  #define SUN4I_GPADC_DATA				0x24
>=20
> -#define SUN4I_GPADC_IRQ_FIFO_DATA			0
> -#define SUN4I_GPADC_IRQ_TEMP_DATA			1
> +#define SUN4I_GPADC_IRQ_FIFO_DATA			1
> +#define SUN4I_GPADC_IRQ_TEMP_DATA			2
>=20
>  /* 10s delay before suspending the IP */
>  #define SUN4I_GPADC_AUTOSUSPEND_DELAY			10000
> --
> 2.32.0
>=20
>=20
> --
> Technology is exciting



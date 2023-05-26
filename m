Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAF8171BD
	for <linux-sunxi@lists.linux.dev>; Fri, 26 May 2023 12:24:53 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-43932736509so415530137.2
        for <linux-sunxi@lists.linux.dev>; Fri, 26 May 2023 05:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685103892; x=1687695892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kac9+1tgw97t/ZhT9HBMA1F6hwQ8HyeJeKG9Y95z0Z8=;
        b=Rj2m49t9Gu6u5Dvb9guyp/NpRtEiMTVCA2ZOzuAVxziARXF8Vw8Jr85chjYO45vZbN
         JHdF3s2zIHuAP3InBuqFoZqVXw3LfEYtLC6UfDhE6CM0SWJImVFE8PrWee5xZFpHoXXM
         lxMVnHCM9shP17BIMJP6vCbsdBzJ56r4p03YePD2GaMgpAAPFLuSvaEZXUsz4LIyn4OQ
         j2wTN4EtmoivZMurhUJQ6V5eshnwSkJ5xPCvX99Pjf5plfInPBDIQ4by/TPVSjTCk5Ui
         xGePMvjUiiWrShWgM+8Grb7OP9xCxWhMEOzxML4QOu/2IMpOabk32EYDv2MdLxIUiVwp
         K9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685103892; x=1687695892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kac9+1tgw97t/ZhT9HBMA1F6hwQ8HyeJeKG9Y95z0Z8=;
        b=ht4QHaEnwceHQ12Pun4b5VS8grhg8zGrVzqpamcRjAwtDP9MKFDwOVXCTgb8Kjx7Tc
         tKxSTQG7+jwJyH0ZF1rBFClRtKYxgh88xE1AgOUjzs8vOm3rsz/O/4I4DfdXEtrVZF71
         zQDCUcMuDwCUSKNtL3k2Cc+isXsduHgVYpuVSlCWPWCQpTk+k8IR2n+kIBRxJPSNGgQL
         zw8SWijdTC22qCJGKnt4xESccNX/eJ/IsF7Zz4c2iRk8h/J5m53B5+3iGml5FyniPNpH
         rWkDvZs4Mc/egxuSWjsS3C7wJ+wPMF7nRTp4StqRJvuOLLRuQ5YNFaiICedN158n+Wb4
         E7Ww==
X-Gm-Message-State: AC+VfDz6zVMEpSQa7025oi8YmlFlGVzV5r0BY+mSqb+1rLsXIHFYUWSh
	jBPFyaH+Mt3veuIeyWQYNijOMTvcmCZrGqkb+zr/6A==
X-Google-Smtp-Source: ACHHUZ4Vo4ypf1Yrzp9viUHOSDtXH4maYpbjQ0xLEQ39qLDEPhBaR9Ehjieq+52sv0yXRrHFogqdGN2e5yQGMg9FBKQ=
X-Received: by 2002:a67:ea84:0:b0:439:4c9c:1f00 with SMTP id
 f4-20020a67ea84000000b004394c9c1f00mr456422vso.30.1685103891955; Fri, 26 May
 2023 05:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1683719613.git.noodles@earth.li> <cover.1684258957.git.noodles@earth.li>
 <7691a35155cf644c2efb02c282c5ef007a6570fa.1684258957.git.noodles@earth.li>
In-Reply-To: <7691a35155cf644c2efb02c282c5ef007a6570fa.1684258957.git.noodles@earth.li>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 26 May 2023 14:24:41 +0200
Message-ID: <CAMRc=MeJHKRYStTSwTCirdQo=f2okN2ys5=V7-ppzCaGYwDkvg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: gpio: Add GPIO3 for AXP209 GPIO
 binding schema
To: Jonathan McDowell <noodles@earth.li>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	andy.shevchenko@gmail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 7:47=E2=80=AFPM Jonathan McDowell <noodles@earth.li=
> wrote:
>
> The AXP209 has a 4th GPIO, so add it in preparation for support in the
> driver.
>
> Signed-off-by: Jonathan McDowell <noodles@earth.li>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.=
yaml b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> index 31906c253940..1638cfe90f1c 100644
> --- a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> @@ -44,6 +44,7 @@ patternProperties:
>              - GPIO0
>              - GPIO1
>              - GPIO2
> +            - GPIO3
>
>        function:
>          enum:
> --
> 2.39.2
>

Applied, thanks!

Bart

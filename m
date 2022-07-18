Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C650EA6
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Jul 2022 09:40:18 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id n74so19820928yba.3
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Jul 2022 02:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iE4O9Cu378EJtqo0H2CKMhex7ENncDoyJzJfljjWc34=;
        b=atbdkpmn7BTglOlpaWDqAQ8u472jPWWGzY/LgcBZ2DEW1a+r4dKCNnj6/84iCmlk6A
         g6oUSSQx1+8PDI6C0zFmkDo37/Tq9z4kqSn8QYkU8rYuUxaUVFwzP+YlU6M74YjHPojt
         h0R8+K7mjpEvV1Kp8kIy29ViBrc/Uhsf3Z+F2cvkHoJSBREOvvDoEyKGEUV/EBhbXgJT
         3tYVQ+oP7jJC2JqLR9m8n1ObRvhNycmZjKk5iS6KMzqya5a60eALHnhHtaqbzBV0WcZF
         DEGMqTyoP5H5zWL8GYWE1dtJQVvyl9prp2L2rT4aAsLDdy7knFM8CTggbYMkX02mfb8S
         0UOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iE4O9Cu378EJtqo0H2CKMhex7ENncDoyJzJfljjWc34=;
        b=UY+DSRby+wO2e6+t/Nn2MsJH/5PYVdb1v4Bs2sm35EgdJmTVEo5PV8QQP52TyfWBWl
         I7kKQYFp9BwjsDowL77xdlgwdxJgIfJnW7ufc4ai8Ue0HJ55J0qOl9FUeqfij4JTR/ow
         6Tc8JBpZJY+5YqBQEUK8Y30u4ZsGKw6xG3XARqcmgoRsW+TS45BIUJZYTvWT3hZJygnP
         O6yBiS3MoLAS1cdpxaaGSlFTLhExirBEKa4J95r9NJpjqxSbaFci/2nHAjISDCqHmQXk
         yGB5k3bvXMSVv0giwgWhUm/yVJL9NqnyArZs8a1xdDzoJ0o/W0uR7aqffeAK2A/GF+Lt
         GZ5Q==
X-Gm-Message-State: AJIora8UEC6VQGOqFH4Isk2a0FEfp36OOkZnfrEpKpvOhfG6CvrcgvOI
	p0H7bE/gpSHGwJtPPmImiOy2XfFjJi/xtesAMPku7w==
X-Google-Smtp-Source: AGRyM1untAtN1WYQrJZsigBhKn2EAZObctQZWEj9UO7eADOFB1CYKYePpRc3z7bi0EcjTCtmqdei+tsdUnJrI6FmTOI=
X-Received: by 2002:a5b:9c5:0:b0:66e:cbbf:2904 with SMTP id
 y5-20020a5b09c5000000b0066ecbbf2904mr24704895ybq.220.1658137217225; Mon, 18
 Jul 2022 02:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220713025233.27248-1-samuel@sholland.org>
In-Reply-To: <20220713025233.27248-1-samuel@sholland.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Jul 2022 11:40:06 +0200
Message-ID: <CACRpkdb2ZGDTe6+X6fBZKRNs9GMt0ZT4D=hZJAc9L1d_W=W0OA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] pinctrl: sunxi: Allwinner D1 support
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 13, 2022 at 4:52 AM Samuel Holland <samuel@sholland.org> wrote:

> In the interest of keeping the series ready for v5.20, I decided to drop
> the D1s bits so we can decide how to handle the compatibles next cycle.
>
> This series adds pinctrl support for the Allwinner D1 SoC. First,
> it updates the I/O bias code to support the new mode found on the D1
> (as well as some existing SoCs). Then it refactors the driver to support
> the new register layout found on the D1. Finally, it adds the new
> driver.
>
> The code size impact of the dynamic register layout ends up being just
> over 100 bytes:
>
>    text    data     bss     dec     hex filename
>   11293     564       0   11857    2e51 pinctrl-sunxi.o (patch 3)
>   11405     564       0   11969    2ec1 pinctrl-sunxi.o (patch 6)
>
> This series was tested on A64, H6, and D1.
>
> Changes in v2:
>  - Drop D1s compatible for now, due to ongoing discussion
>  - Fix PE3 function "csi0" -> "ncsi0"
>  - Fix comments for JTAG DI/DO pins
>  - Include channel numbers in PWM functions
>  - Drop the separate D1s variant, since D1s is a non-conflicting subset
>  - Enable the driver for MACH_SUN8I to cover T113 (same die, but ARMv7)

Took out v1 and applied this v2 instead!

Thanks!
Linus Walleij

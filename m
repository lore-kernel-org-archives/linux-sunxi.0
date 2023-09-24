Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D8FDDC9
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:50:49 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9adca291f99so623499466b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695585048; x=1696189848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0ZBqIoDYKMVCzgLuvboaux6shOrM5HIrW6ijoQ1dls=;
        b=hwvNqAZ0ksmi4s9WzMV6Beixkjo7i0+Sgd0ughX0DvHl26xow16fXWc0/+FGGirJBY
         aBxR26pjeEMQEI71+z9WFGqFLIdHeUyGiFqi3NszCaopR1V8NhR2eX8Y2bgKYoFpB6Sd
         6bGer2+hrAXMyylzj3i3UcsRXKY7w+5ZFOum9SRVNJTkG5WhnFO1wZdnU09XWgFkisJ7
         6JaiuBazaSmHJgqHBTRrIGsrz9m+zPshQ8gfD7VnYmlozKTgzORxBHwsY1Ye/z1s8Lfb
         GL6Hd1TIGDJ1yIg+9w/itwOihqAj+bCzTOD5ZwVZ3CxbaEnlogpn0Z+DK9fnFwxN/Rpw
         f5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695585048; x=1696189848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0ZBqIoDYKMVCzgLuvboaux6shOrM5HIrW6ijoQ1dls=;
        b=BIEkS1I2xStvOijZ0zE+PBS8HxfpzM/9RzjXMNCOfkS1W0sEuP772Z+lquQcDv96MH
         Xj6gHN+LGMAL86uWJbOWp+r9EfQ2iwsXxfb7wz9LxHhbv7alIvj0oAWDyVh80A4758mo
         zJSrrglUO/9WvtLRm1q2gC3c29s02Vc5gVfn7lWhRU0xLZ/E8GgU2Es4Uq3e7hNS0Qqb
         l2jfJHGIUn5mKPn4MwnftC6pzdXlLCDOrjveC9dTLYff70hHPm8X7kyfJiNRB9ClfghM
         8R8yc7PBqnEXuiSCUsyxyNAv+kpwe2Hpx2kzrYn2GtBiSMKTBwzuyzYviUA9XklGEpp3
         RMEQ==
X-Gm-Message-State: AOJu0YyIQycuVhQVyLkLE4DwKIw8ivqjF8mWimwHXieJkeAWiH821E+w
	WIfmXuNHo8jzZ0fDFtTV/L8=
X-Google-Smtp-Source: AGHT+IHLYgqMybMHGPeaqhZNmoe5ADooSVrZz1GsWPUqF2lfGpcVEHt34hg0NCrjDiXTINlAK7E+8g==
X-Received: by 2002:a17:906:68c9:b0:9ae:7387:897b with SMTP id y9-20020a17090668c900b009ae7387897bmr3799726ejr.30.1695585048383;
        Sun, 24 Sep 2023 12:50:48 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id s2-20020a170906354200b0098ec690e6d7sm5338376eja.73.2023.09.24.12.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:50:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Mark Brown <broonie@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Shengyu Qu <wiagn233@outlook.com>,
 Martin Botka <martin.botka1@gmail.com>,
 Matthew Croughan <matthew.croughan@nix.how>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 1/2] dt-bindings: mfd: x-powers,axp152: make interrupt optional
 for more chips
Date: Sun, 24 Sep 2023 21:50:46 +0200
Message-ID: <2900712.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20230919103913.463156-2-andre.przywara@arm.com>
References:
 <20230919103913.463156-1-andre.przywara@arm.com>
 <20230919103913.463156-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 19. september 2023 ob 12:39:12 CEST je Andre Przywara napisal(a):
> All X-Powers PMICs described by this binding have an IRQ pin, and so
> far (almost) all boards connected this to some NMI pin or GPIO on the SoC
> they are connected to.
> However we start to see boards that omit this connection, and technically
> the IRQ pin is not essential to the basic PMIC operation.
> 
> The existing Linux driver allows skipping the IRQ pin setup for two chips
> already, so update the binding to also make the DT property optional for
> the missing chip. And while we are at it, add the AXP313a to that list,
> as they are actually boards out there not connecting the IRQ pin.
> 
> This allows to have DTs correctly describing those boards not wiring up
> the interrupt.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Should I pick this patch through sunxi tree?

Best regards,
Jernej

> ---
>  Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> index 9ad55746133b5..06f1779835a1e 100644
> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> @@ -67,7 +67,10 @@ allOf:
>          properties:
>            compatible:
>              contains:
> -              const: x-powers,axp305
> +              enum:
> +                - x-powers,axp15060
> +                - x-powers,axp305
> +                - x-powers,axp313a
>  
>      then:
>        required:
> 





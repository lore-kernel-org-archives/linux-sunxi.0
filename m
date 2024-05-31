Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C205B68F
	for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 17:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717178250; cv=none; b=LYjZZYyhfsXo6u26fKz3HYQVeLsIKOqlJIk+8MScUVvShc4Y8y3wivbIEQLUE6QtQLOT+yY+TumwOe1sH2tpOYwjaNM1QOu5mHQtHG5IHICwyQbvH7yMZ0mO2m0Lm8z0Ldni2PGoC7g+DT8KR/afEZ6yu9aGsXzFYSTFQH7pQtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717178250; c=relaxed/simple;
	bh=14nUOvlXzx9FwcFZnYhljHX2vE6nY1fLFbUL/vgkrwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcpyvsrtoVFwAXo8y0VC6/CkA/vrCZcSdmSx8GcAIRMl3JvkmY5t0qyH6HlBs+EvEE927ED3+pC0S8h1eTJAOhsFtGBdrIKmUxwK7nWopGnYnxnZh+w4wd1V/UlSN77cg1uvWih2dwlHR2bGakAXxrnRY8Xkj4EozReGckZ6LdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OO1XDKt/; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO1XDKt/"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfa7797e897so931106276.2
        for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 10:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717178247; x=1717783047; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iLsU9SrFk8jsYiYkwRmxAIdMWmUIfrvdUknMyWYRiWE=;
        b=OO1XDKt/BnQjus2EukVPSVT5KSxoZ2WJ6n0LZko8a53h0rlf927YBwkqY6AslmILrS
         NZs2h3XWPUo0bPWUg7DjdqZMrOzXL4W6LleTU/vS3a7LY6lj+I8DvtzuEi4B3pt/APQY
         8C/2sRI6ZhzzGiwlt/KjsToxofU+UsmoEICGnQgn2oCycUD3tKMJQI3nY9oTabyQKUDD
         91GHRe8TP5lGrKBywnXTuLoFPDh8zwEPbUjK/D8WWIZ4zJtdnrJZ1+nb3vJL/+ycoFB1
         6Rrfi2Fs8ru5y22+UbDDEPwxki8l1k8CcfmVR4/nEvd4Hbs+GWvJMKQmV7vaEz5Zta0L
         oeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717178247; x=1717783047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLsU9SrFk8jsYiYkwRmxAIdMWmUIfrvdUknMyWYRiWE=;
        b=Q9hyNfNxwAS8nQlJwPOj9VM0nEGk1pah7kNy9ZM3tDiVdwk9aZLWy7xJDXu+YEMiYl
         DjuYV1mCMz57336c9Aq51PJkQlx1dUV66Ftr4jV6Np65540jhlFg0XE47nUKfLJyaIYO
         pJC3LYlhDqHdsqjGU2YA/qs2MLxYTufePlfTImiQ0S6aMgnNNMC+71qFZ6F8jCNQHbAP
         9DcBx5n3P78XLoCIdyfK663ZV9yLVTMJl73usWblUTehtJV35llmbzwJSR9EjJFe2euE
         bhSw3+7auXArsmIacfadKiKJJm9OhLnF7MMnJossoZ9A2P2NHN7cycHemMSA37ZBnGJ+
         TpSg==
X-Forwarded-Encrypted: i=1; AJvYcCWH9VVkRA7zqptMeZPn67W0Bz59P5WFj/W1rMUBgSYuxf+jz64D9rAPDNBnWIOdsXYfLqOO1UuDrkKvmKxHnih2qkJy/1FGc40vxcc=
X-Gm-Message-State: AOJu0Yy990pTSUUlxoWv/IF8Q7xaCnrYvG5bMeqwZX8uzaZ89zKxHUVc
	no3+7Fj4GZXKY6GnC4TbdlkJPM6XFb16t4XkZcDYJRiL7PcuMOCHV578AUlVDY05Kukc4mQu+jp
	InQ0nyGadL15yoGuzihxflUxZBsE=
X-Google-Smtp-Source: AGHT+IGJfAakWRlaze69hr1itb5DcopAVyEyNrYk8qoHbmtcEU0nuInXs6ghX0YrxFqZ+c4wgNhMQt18gfTY2R95X1Y=
X-Received: by 2002:a5b:b86:0:b0:de5:4ab8:317f with SMTP id
 3f1490d57ef6-dfa73c087fcmr2687449276.20.1717178247282; Fri, 31 May 2024
 10:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240531141152.327592-1-kikuchan98@gmail.com> <20240531141152.327592-6-kikuchan98@gmail.com>
 <851280ad-ac0e-47d1-99e2-4f3b5ea29f2f@kernel.org>
In-Reply-To: <851280ad-ac0e-47d1-99e2-4f3b5ea29f2f@kernel.org>
From: Hironori KIKUCHI <kikuchan98@gmail.com>
Date: Sat, 1 Jun 2024 02:57:15 +0900
Message-ID: <CAG40kxEbMQc-ni0HDVR7rtj48aFu-jz8sYUAO+fdmZSmXWrizw@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: pwm: sun20i: Add options to select a
 clock source and DIV_M
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Aleksandr Shubin <privatesub2@gmail.com>, 
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

> > This patch adds new options to select a clock source and DIV_M register
> > value for each coupled PWM channels.
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
>
> Bindings are before their users. This should not be last patch, because
> this implies there is no user.

I'm sorry, I'll fix them.

> This applies to all variants? Or the one you add? Confused...

Apologies for confusing you. This applies to all variants.

>
> >
> > Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> > ---
> >  .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > index b9b6d7e7c87..436a1d344ab 100644
> > --- a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > @@ -45,6 +45,25 @@ properties:
> >      description: The number of PWM channels configured for this instance
> >      enum: [6, 9]
> >
> > +  allwinner,pwm-pair-clock-sources:
> > +    description: The clock source names for each PWM pair
> > +    items:
> > +      enum: [hosc, apb]
> > +    minItems: 1
> > +    maxItems: 8
>
> Missing type... and add 8 of such items to your example to make it complete.

Thank you. I'll fix it.

>
> > +
> > +  allwinner,pwm-pair-clock-prescales:
> > +    description: The prescale (DIV_M register) values for each PWM pair
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    items:
> > +      items:
> > +        minimum: 0
> > +        maximum: 8
> > +      minItems: 1
> > +      maxItems: 1
> > +    minItems: 1
> > +    maxItems: 8
>
> This does not look like matrix but array.

I wanted to specify values like this:

    allwinner,pwm-pair-clock-prescales = <0>, <1>, <3>;
    allwinner,pwm-pair-clock-sources = "hosc", "apb", "hosc":

These should correspond to each PWM pair.
This way, I thought we might be able to visually understand the relationship
between prescalers and sources, like clock-names and clocks.

Is this notation uncommon, perhaps?

>
> Why clock DIV cannot be deduced from typical PWM attributes + clock
> frequency?

This SoC's PWM system has one shared prescaler and clock source for each pair
of PWM channels. I should have noted this earlier, sorry.

Actually, the original v9 patch automatically deduced the DIV value
from the frequency.
However, because the two channels share a single prescaler, once one channel is
enabled, it affects and restricts the DIV value for the other channel
in the pair.
This introduces a problem of determining which channel should set the shared DIV
value. The original behavior was that the first channel enabled would win.

Instead, this patch try to resolve the issue by specifying these
values for each PWM
pairs deterministically.
That's why it requires the new options.

>
> Best regards,
> Krzysztof

Best regards,
kikuchan.

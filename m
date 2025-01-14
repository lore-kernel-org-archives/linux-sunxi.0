Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2300523D3E8
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Jan 2025 07:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736838112; cv=none; b=Q6qrI2ASOAUzmEhucwchOypIPicZAWaXxfkBwfmSRrEjFUcVDg4h5vJPaEZO/jkFkheMmOPJtk31R54ttKSKh6qSG4o0RoBe1UiNb0KReBW6Hr8r8vAB4UfbjFyYxC297iJJ6iiNUZ8yE7APB8Efx8umpvQSq1XNryb2M0GwLGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736838112; c=relaxed/simple;
	bh=WnVvCdAyY+XAqWXEr/1FXoer0pDasH5/wCqA5s1r6YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ijkf/lhLGMyv4pZ5gtsnVfeWk+djdFEIX/FoS79JCFgU6k80GKRwxUlqfRX3G9V8FTmklReoo7uGnfPmVmjoT+SXUL/jYC5Tr+CMcbLs5eHJwwogeyAMm8r7yC3OZLzG5jLjJWg0MnHkyao8gUMoH/+DrICZXwnu6iz+9jidwJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e384e3481so4709457e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Jan 2025 23:01:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736838106; x=1737442906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+UcOE3NbQ9slLhfP+gmnwjLdrB9FRRmf5lPYamPvI8=;
        b=Z6AlGX/9Y6A0V3GdAYQGWA31bvkit78NVq+gfiFyJaFlrx4vsrTiD2dtueVRTEZzbK
         6YjZx/2QfU20uLQqWTZOT4dMKY681cLVrPBsBBH/FJK88juIUFZpKtQX+Hs5uj4n0EWe
         oPOuTmu6hiCsdnJQnnh8YQbCqgqx2v8bIt1sgaNxIWfR//VaJNPE4SASubMi7URMLur+
         zsqZxTiPbb2ldRw2vlVFdRD5wJOvH43BK/gunoitz/0e+eFBAvK6/ZruyGGxvaoHYhbN
         yQb4eW/0M+rsISfs0hEMdXXwlhpgG7ko5AtOMZ2f1GKVa2VAYVWNo7cyTsU3C2FxyeSk
         +4ig==
X-Forwarded-Encrypted: i=1; AJvYcCX/8CGbim1dDEfFa0+xRxNK3oqVOYzes9yyEg7WNuUV9n8luADj0jfWUJ2M0cLV0PjlP7snHK2W81SeWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzX+AZSs3rqrlXo2T//gl1oUPHptuYAkdmY18XasMU34YHPxVd0
	m49JCkIjhE9UzFbaH27WV2Oz4nJPDo4Nu9veov0V9qd/+C1xp8j2eslFjVXBfKw=
X-Gm-Gg: ASbGncsUvRdQR0xxVszLr4EeVSdIlvKqcsBDWpBnVQow44zRbzP/3S5QJWFouyzAkmR
	JpPN3jJeGbeiLNkPBrvroHQQvfn9417EXj7zYlSxsxco5tTA1zm5qOcpbHokJ/GRrxC+wEriPb4
	RmjZQ8XaIRAcsff8EiQNKLztlGe7h7qXGr6XsyLkxvs6N84XkHgn54vBkY/D3YKhsd89aNHiZTh
	H4OciXljS3pi/EIzgMb4mwNkfnfoi0JXVi6hFbKzcPMrQJla7r7AjvjQP0oWD0Fx7mASIPfvepG
	Mr+2/KIDLJQiTw==
X-Google-Smtp-Source: AGHT+IEef36gAoPCShKAYrdjYsuzEI9nr5NkLdChcQnbnNYxH9fR900pTioySefyYJqCzHVL7yrctQ==
X-Received: by 2002:a05:6512:a8e:b0:542:2990:722e with SMTP id 2adb3069b0e04-542845ba7b6mr7706977e87.15.1736838105380;
        Mon, 13 Jan 2025 23:01:45 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be4a029sm1570978e87.54.2025.01.13.23.01.44
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 23:01:45 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-305d843d925so39820031fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Jan 2025 23:01:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtQt7wQTxwqIS7alpAPFqmrMJQCx0QWwStxPa6f47pLW29YshjvgCocTvSNU/3QaPHF5tSlrIMWM4c7A==@lists.linux.dev
X-Received: by 2002:a05:651c:501:b0:2ff:e6fb:b10 with SMTP id
 38308e7fff4ca-305f45db1a9mr82180361fa.26.1736838104539; Mon, 13 Jan 2025
 23:01:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241111005750.13071-1-andre.przywara@arm.com>
 <20241111005750.13071-6-andre.przywara@arm.com> <CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
 <20241120101228.26bbf100@donnerap.manchester.arm.com>
In-Reply-To: <20241120101228.26bbf100@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 14 Jan 2025 15:01:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v663LeDtk1ZGOAztQ+Sx5OtbSx+xkLgypZYRjXkAr6_GRA@mail.gmail.com>
X-Gm-Features: AbW1kvY5ioH0ofguoIZCmg867-6-rz1ALLpjN9guXZRF83auvJZgI7_L4pl8dSY
Message-ID: <CAGb2v663LeDtk1ZGOAztQ+Sx5OtbSx+xkLgypZYRjXkAr6_GRA@mail.gmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner A523/T527
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 6:12=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Wed, 13 Nov 2024 16:50:19 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi Chen-Yu,
>
> sorry for the late reply, I was away for a week.
>
> > On Mon, Nov 11, 2024 at 8:58=E2=80=AFAM Andre Przywara <andre.przywara@=
arm.com> wrote:
> > >
> > > The A523 contains a pin controller similar to previous SoCs, although
> > > using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> > > This introduces a new style of binding, where the pinmux values for e=
ach
> > > pin group is stored in the new "allwinner,pinmux" property in the DT
> > > node, instead of requiring every driver to store a mapping between th=
e
> > > function names and the required pinmux.
> > >
> > > Add the new name to the list of compatible strings, and required it t=
o
> > > have 10 interrupts described. Also add the new pinmux property.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++=
--
> > >  1 file changed, 21 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4=
i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,su=
n4i-a10-pinctrl.yaml
> > > index 4502405703145..6fc18e92e1e94 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-p=
inctrl.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-p=
inctrl.yaml
> > > @@ -56,6 +56,8 @@ properties:
> > >        - allwinner,sun50i-h6-r-pinctrl
> > >        - allwinner,sun50i-h616-pinctrl
> > >        - allwinner,sun50i-h616-r-pinctrl
> > > +      - allwinner,sun55i-a523-pinctrl
> > > +      - allwinner,sun55i-a523-r-pinctrl
> > >        - allwinner,suniv-f1c100s-pinctrl
> > >        - nextthing,gr8-pinctrl
> > >
> > > @@ -64,7 +66,7 @@ properties:
> > >
> > >    interrupts:
> > >      minItems: 1
> > > -    maxItems: 8
> > > +    maxItems: 10
> > >      description:
> > >        One interrupt per external interrupt bank supported on the
> > >        controller, sorted by bank number ascending order.
> > > @@ -119,13 +121,17 @@ patternProperties:
> > >          $ref: /schemas/types.yaml#/definitions/uint32
> > >          enum: [10, 20, 30, 40]
> > >
> > > +      allwinner,pinmux:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        description: pinmux selector for each pin
> > > +
> >
> > Why not just the standard "pinmux" property, as given in
> > Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
>
> I had it like this in my last post two years ago, but learned from
> LinusW [1] that the generic pinmux property has a slightly different
> meaning, and abusing it for just the pinmux index values would not match
> the generic definition.
> We *could* use the generic definition, but then this would include what's
> in the "pins" property, like I sketched out in the cover letter, as an
> alternative to this approach:
>         pinmux =3D <SUNXI_PIN(PB, 9, 2)>, <SUNXI_PIN(PB, 10, 2)>;
> Where the SUNXI_PIN macro would combine the pin number and the pinmux int=
o
> one 32-bit cell. See the Apple GPIO DT nodes for an example.
> This looks indeed nicer, but requires quite some rewrite of the existing
> pinctrl driver, AFAICS.

Sorry for taking so long to get back to this.

Could we maybe add a generic replacement of the existing "function"
property, which takes a string? Like "function-id" or "function-selector"
that takes u32 (or u8). Then it could be one or the other. Not sure
if the binding maintainers would accept this or not.

I understand that we probably don't want the mux value combined with
the pin number.

ChenYu

> [1] Previous reply from LinusW:
> https://lore.kernel.org/linux-sunxi/CACRpkdbMc-Q6wjgsiddu6-tWC1dt2uFk+4Ly=
erMdgFk2KRGK4w@mail.gmail.com/
>
> >
> > >      required:
> > >        - pins
> > >        - function
> >
> > This section should be made to apply only to the existing
> > compatibles? Maybe we could just split the files and have
> > a clean slate for sun55i?
>
> Yeah, I couldn't find a good example how to make it *required* for one
> compatible and *not allowed* for all the others. But creating a whole new
> file is actually a good idea, as this also avoids adding another case to
> the already quite indented if-else cascade.
>
> Cheers,
> Andre
>
> > ChenYu
> >
> > >      additionalProperties: false
> > >
> > > -  "^vcc-p[a-ilm]-supply$":
> > > +  "^vcc-p[a-klm]-supply$":
> > >      description:
> > >        Power supplies for pin banks.
> > >
> > > @@ -156,6 +162,17 @@ allOf:
> > >          - interrupts
> > >          - interrupt-controller
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          enum:
> > > +            - allwinner,sun55i-a523-pinctrl
> > > +
> > > +    then:
> > > +      properties:
> > > +        interrupts:
> > > +          minItems: 10
> > > +
> > >    - if:
> > >        properties:
> > >          compatible:
> > > @@ -166,6 +183,7 @@ allOf:
> > >        properties:
> > >          interrupts:
> > >            minItems: 8
> > > +          maxItems: 8
> > >
> > >    - if:
> > >        properties:
> > > @@ -244,6 +262,7 @@ allOf:
> > >              - allwinner,sun8i-v3s-pinctrl
> > >              - allwinner,sun9i-a80-r-pinctrl
> > >              - allwinner,sun50i-h6-r-pinctrl
> > > +            - allwinner,sun55i-a523-r-pinctrl
> > >
> > >      then:
> > >        properties:
> > > --
> > > 2.46.2
> > >
>

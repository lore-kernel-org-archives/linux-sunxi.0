Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D0126C0D
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Jan 2025 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864495; cv=none; b=e9njcRdHGQ0ftL+QVGB5cV0swgntAT5P51dZkyqZBZm+Kqnaqk9mClUIiusmta9xd1QC1yczL5ibDi2NmqAhXXlPr4DnS88P3ZEfviV/5QDhDAOF455OuwzZCbmYg1sZgm1oJhPx6i+HIP6yJrGMF280ESvmMEIIhfzygzy+qaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864495; c=relaxed/simple;
	bh=X4YFjJxoY0/tFZnk6gz+MxCSdJE4jpqj/CYBPrpBSdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FC7fLBDAFlTEtt3owmaNLX85K0vs4rWMp6Rv8A9LjVFyLYKzCXL39Q5LWrDmI83W5OE56o0Pln4ZxxtfoBPC4JlTvp+k6nmre6qjv6+vbad61RSdlJaxC314sFG5mtvqMlSxumkoc3NF+vgU5KRlOdQVbgU6PdxbSYL2DUlxcK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e3c47434eso5207524e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Jan 2025 06:21:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864489; x=1737469289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VF7CpgGuraPOcVgWtPEXcXDSHFkLVsj9pxOgmyyHmQg=;
        b=V9CoAoj1aZk0VI28UF3N2RC90LXMnkBVA+/FU3mvCneDj13FEwj1XaZKefDonbt+3Y
         jk0YVpesB4TxPVifSdQKXSacJ2Pm7ApRN8H7ZKZ3Ss1MBMtDhnXght4GMX96DQ0JH/Sx
         Gl2VZAejdTZW/KYKJsemmb1PTdywr4jvSKn5GEX93Sq5WIoEaoOQpH+Eh5QlOW3lk2x8
         mO5+dNNEMbVzSEMjfyOllOVzu3DLh8HsftoNVgu2ELr6LLc3XsIwHMBeziZ5hKd3pMeK
         A7agXEKFk7u/+OSjSCj1dwI6rom9A8JokOhz+++SZmtDMM9f/h3S3CmMyYRKvB19z6U2
         6jdw==
X-Forwarded-Encrypted: i=1; AJvYcCVy2e3L1dfPN982Em2XEWm09pQWj4AdhxU9OL9dB+hhLyiFtpV13U5u6nSeGGP+otV1VdgxWSAwFJccew==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyubsj7DcxtDqtSkOEcD+AeUchTBFuVs/3qGXUsYr6XFETE7Ykg
	jSiTxx/AvNkrlgEyAS7EkBHunS2ZBHCTplFfzgAcvVkZSrBBOFq7rsq9kiD8
X-Gm-Gg: ASbGncuKhdvImXiOvee1D2n1OtG+2O/jW3ZNoM1gEwkIpw9mFm31KZCNKPXnVzfaQb4
	YELinAMFaQLikqoxcu7QnotmsNjnlvProXXrKa2wSR/wApiYZyUEk0WLyn85XQ7yubkW5dQ1wuf
	4oddN6Lh/B96tc5e2eEUbmMtgoSQ4d3/ILf4NP6E2SFggidlai6ufzZKdnCaaxEWI0Eo3cHZBCf
	ZfY0TBeQQ+5sFhN9rmi3IeqpOQJczS8U3eb0k0mdwCAXZA1fiKeZ3vInzYbbsKeGdnAvpGyA518
	znt4XiXtL30iWw==
X-Google-Smtp-Source: AGHT+IET/+QqZukdAj9FPOtiuX9A1VgedjOo8mtZfScwGzeb92tgqZcJFngWe5Rqi9pHwSGyCK2Vmg==
X-Received: by 2002:a05:6512:3c83:b0:542:2929:63ea with SMTP id 2adb3069b0e04-542845c1e8amr9643440e87.24.1736864488481;
        Tue, 14 Jan 2025 06:21:28 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec064esm1734211e87.196.2025.01.14.06.21.26
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 06:21:28 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3043e84c687so42627201fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Jan 2025 06:21:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUK4vFd9xfM83VHwiZD7cyzw605EXys69ggkV6hN6Ioxv80BvgGJ0o1s2+BHOBKRe4yXS3c1whozop0cQ==@lists.linux.dev
X-Received: by 2002:a2e:a543:0:b0:302:4a4a:b6d1 with SMTP id
 38308e7fff4ca-305f45745c7mr78694601fa.14.1736864486493; Tue, 14 Jan 2025
 06:21:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241111005750.13071-1-andre.przywara@arm.com>
 <20241111005750.13071-6-andre.przywara@arm.com> <CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
 <20241120101228.26bbf100@donnerap.manchester.arm.com> <CAGb2v663LeDtk1ZGOAztQ+Sx5OtbSx+xkLgypZYRjXkAr6_GRA@mail.gmail.com>
 <20250114112149.5448baae@donnerap.manchester.arm.com>
In-Reply-To: <20250114112149.5448baae@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 14 Jan 2025 22:21:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v67b4q3T31vLc8Q56KADtRUAcyHk13KUJ_aO1LqTCYSsMA@mail.gmail.com>
X-Gm-Features: AbW1kvYOX-F14DRBUu8Ms1IljUt4d39ndzmhL2m2-zk0YvABvyR_SSL_OJ1rqh0
Message-ID: <CAGb2v67b4q3T31vLc8Q56KADtRUAcyHk13KUJ_aO1LqTCYSsMA@mail.gmail.com>
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

On Tue, Jan 14, 2025 at 7:21=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue, 14 Jan 2025 15:01:31 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi Chen-Yu,
>
> before I get to your specific question below: what do you think in
> general of the idea of getting rid of that table based approach we use so
> far? Is that something worthwhile? I definitely think yes, but wanted to
> hear the maintainers' opinion about this. Happy to present some arguments
> if need be.

Seems OK to me. The other platforms I've worked on don't have the tables.

OOTH, would we have headers alongside the dts files for macros that
give the function IDs a bit more meaning? I mean sure we can always
go back to the datasheets, it's just a bit of a hassle.

> ...
>
> > On Wed, Nov 20, 2024 at 6:12=E2=80=AFPM Andre Przywara <andre.przywara@=
arm.com> wrote:
> > >
> > > On Wed, 13 Nov 2024 16:50:19 +0800
> > > Chen-Yu Tsai <wens@csie.org> wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > sorry for the late reply, I was away for a week.
> > >
> > > > On Mon, Nov 11, 2024 at 8:58=E2=80=AFAM Andre Przywara <andre.przyw=
ara@arm.com> wrote:
> > > > >
> > > > > The A523 contains a pin controller similar to previous SoCs, alth=
ough
> > > > > using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> > > > > This introduces a new style of binding, where the pinmux values f=
or each
> > > > > pin group is stored in the new "allwinner,pinmux" property in the=
 DT
> > > > > node, instead of requiring every driver to store a mapping betwee=
n the
> > > > > function names and the required pinmux.
> > > > >
> > > > > Add the new name to the list of compatible strings, and required =
it to
> > > > > have 10 interrupts described. Also add the new pinmux property.
> > > > >
> > > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > > ---
> > > > >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++=
++++--
> > > > >  1 file changed, 21 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,=
sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinne=
r,sun4i-a10-pinctrl.yaml
> > > > > index 4502405703145..6fc18e92e1e94 100644
> > > > > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a=
10-pinctrl.yaml
> > > > > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a=
10-pinctrl.yaml
> > > > > @@ -56,6 +56,8 @@ properties:
> > > > >        - allwinner,sun50i-h6-r-pinctrl
> > > > >        - allwinner,sun50i-h616-pinctrl
> > > > >        - allwinner,sun50i-h616-r-pinctrl
> > > > > +      - allwinner,sun55i-a523-pinctrl
> > > > > +      - allwinner,sun55i-a523-r-pinctrl
> > > > >        - allwinner,suniv-f1c100s-pinctrl
> > > > >        - nextthing,gr8-pinctrl
> > > > >
> > > > > @@ -64,7 +66,7 @@ properties:
> > > > >
> > > > >    interrupts:
> > > > >      minItems: 1
> > > > > -    maxItems: 8
> > > > > +    maxItems: 10
> > > > >      description:
> > > > >        One interrupt per external interrupt bank supported on the
> > > > >        controller, sorted by bank number ascending order.
> > > > > @@ -119,13 +121,17 @@ patternProperties:
> > > > >          $ref: /schemas/types.yaml#/definitions/uint32
> > > > >          enum: [10, 20, 30, 40]
> > > > >
> > > > > +      allwinner,pinmux:
> > > > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > +        description: pinmux selector for each pin
> > > > > +
> > > >
> > > > Why not just the standard "pinmux" property, as given in
> > > > Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> > >
> > > I had it like this in my last post two years ago, but learned from
> > > LinusW [1] that the generic pinmux property has a slightly different
> > > meaning, and abusing it for just the pinmux index values would not ma=
tch
> > > the generic definition.
> > > We *could* use the generic definition, but then this would include wh=
at's
> > > in the "pins" property, like I sketched out in the cover letter, as a=
n
> > > alternative to this approach:
> > >         pinmux =3D <SUNXI_PIN(PB, 9, 2)>, <SUNXI_PIN(PB, 10, 2)>;
> > > Where the SUNXI_PIN macro would combine the pin number and the pinmux=
 into
> > > one 32-bit cell. See the Apple GPIO DT nodes for an example.
> > > This looks indeed nicer, but requires quite some rewrite of the exist=
ing
> > > pinctrl driver, AFAICS.
> >
> > Sorry for taking so long to get back to this.
> >
> > Could we maybe add a generic replacement of the existing "function"
> > property, which takes a string? Like "function-id" or "function-selecto=
r"
> > that takes u32 (or u8). Then it could be one or the other. Not sure
> > if the binding maintainers would accept this or not.
>
> Do you mean specifically a *generic* property, as opposed to something
> prefixed with a vendor string, and coded up in just the sunxi driver?
>
> Because otherwise "allwinner,pinmux" is that numeric equivalent to
> "function". I kept "function", as a string, because the GPIO framework
> still needs a string at places, for instance for sysfs. We could create
> those strings, based on the node name, by sprintf'ing something, but I
> figured we might as well keep "function".

That seems to be what other drivers are doing.

> In my U-Boot patches [1] I actually ignore the new pinmux property, and
> still use the function name, as it was easier to integrate into the
> existing code. U-Boot uses a very limited subset of our current table,
> so each new SoC doesn't add much to the code.
>
> [1] https://github.com/apritzel/u-boot/commit/ab4f7ed0879022357646
>
> Code-wise I think we would still need our own driver code, so whether we
> use "function-id" or "allwinner,pinmux" in there doesn't make much of a
> difference, I think.

I guess it simply affects whether the bindings and subsequent helper
code can be generalized or not.

> > I understand that we probably don't want the mux value combined with
> > the pin number.
>
> You mean like the Apple GPIO does? I wonder why not, actually? I find thi=
s
> actually quite clever and compact. Again the "pins" property atm is quite
> string-heavy, so the code has to translate this back into a bank and pin
> number, then lookup the function string in our table to get the pinmux
> value. We could fit all of this information easily into this new
> generic "pinmux" property, and the code just needs to mask and shift that
> number. Each pin occupies a cell, I don't think we can get much better
> than that?

Mostly because it prevents one from having pin config options without
muxing, for example set drive strength without setting the mux to GPIO,
the latter on sunxi is done exclusively using GPIO bindings.

I talked about this at my talk at ELCE last year, and afterwards was
talking to Heiko and Quentin, and it seems at least Rockchip can't
separate this. Rockchip goes even further with their "rockchip,pins"
property by also including a reference to the pin config node phandle.

I believe MediaTek, which uses "pinmux" as you described, can't either.

That's my main concern.

Also, the "pins" property can be integers. The question then becomes
how do you want to handle the numbering, i.e. what to do with the
holes in between the different banks.


ChenYu


> Cheers,
> Andre
>
> > ChenYu
> >
> > > [1] Previous reply from LinusW:
> > > https://lore.kernel.org/linux-sunxi/CACRpkdbMc-Q6wjgsiddu6-tWC1dt2uFk=
+4LyerMdgFk2KRGK4w@mail.gmail.com/
> > >
> > > >
> > > > >      required:
> > > > >        - pins
> > > > >        - function
> > > >
> > > > This section should be made to apply only to the existing
> > > > compatibles? Maybe we could just split the files and have
> > > > a clean slate for sun55i?
> > >
> > > Yeah, I couldn't find a good example how to make it *required* for on=
e
> > > compatible and *not allowed* for all the others. But creating a whole=
 new
> > > file is actually a good idea, as this also avoids adding another case=
 to
> > > the already quite indented if-else cascade.
> > >
> > > Cheers,
> > > Andre
> > >
> > > > ChenYu
> > > >
> > > > >      additionalProperties: false
> > > > >
> > > > > -  "^vcc-p[a-ilm]-supply$":
> > > > > +  "^vcc-p[a-klm]-supply$":
> > > > >      description:
> > > > >        Power supplies for pin banks.
> > > > >
> > > > > @@ -156,6 +162,17 @@ allOf:
> > > > >          - interrupts
> > > > >          - interrupt-controller
> > > > >
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          enum:
> > > > > +            - allwinner,sun55i-a523-pinctrl
> > > > > +
> > > > > +    then:
> > > > > +      properties:
> > > > > +        interrupts:
> > > > > +          minItems: 10
> > > > > +
> > > > >    - if:
> > > > >        properties:
> > > > >          compatible:
> > > > > @@ -166,6 +183,7 @@ allOf:
> > > > >        properties:
> > > > >          interrupts:
> > > > >            minItems: 8
> > > > > +          maxItems: 8
> > > > >
> > > > >    - if:
> > > > >        properties:
> > > > > @@ -244,6 +262,7 @@ allOf:
> > > > >              - allwinner,sun8i-v3s-pinctrl
> > > > >              - allwinner,sun9i-a80-r-pinctrl
> > > > >              - allwinner,sun50i-h6-r-pinctrl
> > > > > +            - allwinner,sun55i-a523-r-pinctrl
> > > > >
> > > > >      then:
> > > > >        properties:
> > > > > --
> > > > > 2.46.2
> > > > >
> > >
>
>

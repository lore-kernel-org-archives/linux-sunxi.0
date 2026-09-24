Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D243E6DFA
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281018; cv=pass; b=otYEjjAIL7OG2uZqf88my8ZR+Zi08vYzd0baoOkqEuMjJFIqVurOPW6KkakGjmEvuc7kUZnixfMyrCZmeLlJZGI264fv4pyhNjkX8ZNteNb+mu7A5lHCy4K6oKz1zXuG7LUhnugExW6g/D4m1VnDI9WoJTga/HBDf/fpQTsi+WU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281018; c=relaxed/simple;
	bh=WS/57KdXBBwGfRZNL7QHE0ldeTLI0dMl0tLbZXWOYHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQtEpNJFb0D1I9c8FSwYoSunDxHDJ/Ll8C/Wp9YDHI75bKH5K+rOZZgzujekeEgyAusot898LAr4CMa52MVk43laz0RPoAyCoH9c6AwjGkBb6pFzE1QZsr4i3kKKH4bxPbashAbqOubiSjR9gaQaYJZkacCHha+6lKHGSkYO6ZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okKatnrX; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okKatnrX"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d91ede8035so1249515ad.3
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 13:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790281012; cv=none;
        d=google.com; s=arc-20260327;
        b=C/I1AUggo0OEyBv0XxZVSxhvJUJTdY+hGGXzFouPyNpeftSNluRnJqlJ5PME85Vtbu
         +1HGrU7YIGnE25R80hlxdNVnzDGqhPfrtI0yJqQ2WgCETUOXziXj1S1ml6qOqPCwISsU
         sobsyX9pQPMOWkFbh6G0ad4hrcoupvaZ+VYur8EKlWhsO8hvL5IL12tlL4VPod1ZkINn
         +Y2jaONkU1jB1nNUWgrET+UIprvlIJ74SJDo5bwCWjno3zLutdcm9KgtzFoxmZEf+KYp
         A3wJbCB+/+cCtJfbSnV7v1q/HTWnMS6s9rmLkSPOiIwaSnAK08ectCgONAj6hynnJ6cE
         E5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        fh=gYwwLLLhvG0i+4mqQx8Awh4DyZdvzlW3QA/4y4L89L8=;
        b=TwAYs2ktxD12ntAg1P+ifz1jsbgiphq+ce75W53VKwmla4AaUkPZfeSguD6JqPvDiI
         eJ7bf80RZoTLVWjDlk40dYCb35KYuff3MknNu2LhHfbkBoiPcvdY9L7+GYSS2xSkOGSH
         tuSoMJfyIz/D8xeHCtCT3KKqPWD/ZVrhCXTZMEGpdn0O7N6XoXWJ8Mw9R7pMkR6jb5LN
         ylmBvuEkTJT96ahv9tlj9Qcj3RfVFkRpOTgo51phW4FUiX3eWr9Y6EiYIjYwKrHERAF0
         CI/SqNBeYoJHwyJBK+k54Dp5ckgVZ9Da8HAtWFDZWKcjbE5vcM9uuq/CWPNBPklgmVXZ
         TS9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281012; x=1790885812; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        b=okKatnrX7Ux8hoXr21T+pycA2hH0c1ZpqHe0R+Q5pEFOoMzur1wX0k01oH+h9Y4FTQ
         3d+v/cKT9ai4jQ3SVyQ+AzmHXTDeQCVyYSFMophgZG1TMPBEv2jJKHiF/znY2Y3dmnsj
         kKaoeWmPLilxuEAs1Q8inYG3Q4KGKpeqNUF5/cjDRm7B593ZsGzr2FdDAeRetHLGzN3C
         AM/aO1Qrj+sCmvl+nOmbGCtDRpVvknd05jCDtNymg4Qwr7XSijxSsnl+uC+HKK5TvD3U
         9mle+5RadqiVMwjFRcZ/MXx8ziDM7xN8uVNHUOAAQPpctRNtkypl5aPvQiLVAmKs4SDa
         BYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281012; x=1790885812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        b=TejKq4NrCE8gkMs4qlqxIA5JMrq0DpmY3m9EU5Mlk0nBLF6z9S6KV7d7jLHRZ4Dokj
         ju1oJtfh9ogfBZhrqKILrDdVzR09QjA3M+J9uFFlfO2cJ4BUn0/9uZ8NKG5dieUcNXUF
         qDGzhqC9PoQfbYzqOaIsGqnPhKTOceIWVteUIdiVbOoGcF1zl0WEF8JsSBH+1CpP3QnM
         1esbqgV6BZ2WTL8VFn47xwJsEGYwoUI+711VZgoFdZXWcp8c7Dw5M9Dg5T6b5ZpgASUv
         9yyLnMnZINgSQbc+BRDI+5eE8aMgUvadHsYejBiXMmeUjA2Of2hmZ3VIhbIYGHsK/HIM
         Tbaw==
X-Forwarded-Encrypted: i=1; AKwUvBxKoLV2LYe0zLotg0R0NK7BhQdmjwBVmgfxnUPEKdy/XTrTSbCLwNSd0pfB289+T9gKdxwvgLdvltXS9w==@lists.linux.dev
X-Gm-Message-State: AFuF++nMtk3ifkWeivWUx4aVZnGA/0NopnpW4e+uF7L4Vp6YwfHSahM8
	HfHKvwrdqjIaH+Dzduh8k+fTUkJxzzKJ8hK7p3wps9cf4CiaNBhkUPH6UJdTL3MUPsSU8Y+9DTx
	xuXfyO6tR4qedXfu3GFRHf7Qp9Ip51Hs=
X-Gm-Gg: AYBFou0m4pyPZqBGOjiRSY4vbdsy1E7o28nR7CAt9gpmU3eJ5ussTQb/URRMlAEA7Pr
	HKQg4zECWMrNTlHxhW8ssjNGvoUddylvJP5BKl3Q0fExyN0BVSMOyK/+aB7F+fgAyMCuC/oCU64
	l/5v5UTVfLWzWr8O+G5Qd0PjoPLxRCTpCqYQOITdNvg+BAOba4SnB9ZtUekGWvxxpr3qLDc1RkK
	dCXj5Khsq3ObGpbWeG+/zaL3kshVbrRx2h8fYvODll3QkOt7wREVRYQEQv1QZdquB+xIyplvnCA
	1k+GdjtWAnjVPu0eABB231VvytI49cbUkd6RGV162HuVtfNoEFaK4vcAvNNRyhEURLQZyp0=
X-Received: by 2002:a17:903:22cb:b0:2dd:c100:943d with SMTP id
 d9443c01a7336-2df7e6632cemr33132005ad.59.1790281012320; Thu, 24 Sep 2026
 13:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923201701.43391-1-pmazzini@gmail.com> <20260923201701.43391-3-pmazzini@gmail.com>
 <30c42b73-204d-4531-bd1a-1ee160a4b000@arm.com>
In-Reply-To: <30c42b73-204d-4531-bd1a-1ee160a4b000@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 24 Sep 2026 21:16:17 +0100
X-Gm-Features: AclHuK9Ix7omORkFeC8AEjcG9VWZQpvYqS7tGdczHTc-lHozfzxFcTWbaDF7Pzg
Message-ID: <CAAxh=ju7+vQ=_opueqK-3Fe-qj9_OJiVunBWDmdmxk86dRqWxw@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] dt-bindings: pinctrl: add Allwinner B288 pin controller
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

> Can't you just add the new compatible string to the existing
> allwinner,sun4i-a10-pinctrl.yaml binding?

Done for v2.

Thanks,
Pablo


On Thu, Sep 24, 2026 at 10:07=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi Pablo,
>
> On 9/23/26 22:16, Pablo Mazzini wrote:
> > One controller at 0x01c20800 with four external interrupt banks.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   .../pinctrl/allwinner,sun8i-b288-pinctrl.yaml | 108 +++++++++++++++++=
+
>
> Why is this a new file? Can't you just add the new compatible string to
> the existing allwinner,sun4i-a10-pinctrl.yaml binding?
>
> Cheers,
> Andre
>
> P.S. Since we have seen this a lot lately: please wait with a new
> version of your series for a few days, to allow other people to comment,
> and to allow discussions to settle down. Not everyone can respond quickly=
.
>
> >   1 file changed, 108 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinne=
r,sun8i-b288-pinctrl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-=
b288-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun=
8i-b288-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..806da97ab708
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pi=
nctrl.yaml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/allwinner,sun8i-b288-pinctr=
l.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner B288 Pin Controller
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: allwinner,sun8i-b288-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description:
> > +      One interrupt per bank of external interrupt capable pins.
> > +    maxItems: 4
> > +
> > +  clocks:
> > +    items:
> > +      - description: Bus Clock
> > +      - description: High Frequency Oscillator
> > +      - description: Low Frequency Oscillator
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +      - const: hosc
> > +      - const: losc
> > +
> > +  gpio-controller: true
> > +  interrupt-controller: true
> > +  gpio-line-names: true
> > +
> > +  "#gpio-cells":
> > +    const: 3
> > +
> > +  "#interrupt-cells":
> > +    const: 3
> > +
> > +patternProperties:
> > +  "-pins$":
> > +    type: object
> > +    $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      pins: true
> > +      function: true
> > +      bias-pull-up: true
> > +      bias-pull-down: true
> > +      bias-disable: true
> > +      drive-strength:
> > +        enum: [10, 20, 30, 40]
> > +
> > +    required:
> > +      - pins
> > +      - function
> > +
> > +  "^vcc-p[bcdfg]-supply$":
> > +    description:
> > +      Power supplies for pin banks.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - gpio-controller
> > +  - "#gpio-cells"
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/sun8i-b288-ccu.h>
> > +
> > +    pio: pinctrl@1c20800 {
> > +        compatible =3D "allwinner,sun8i-b288-pinctrl";
> > +        reg =3D <0x01c20800 0x400>;
> > +        interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
> > +        clock-names =3D "apb", "hosc", "losc";
> > +        gpio-controller;
> > +        #gpio-cells =3D <3>;
> > +        interrupt-controller;
> > +        #interrupt-cells =3D <3>;
> > +
> > +        mmc0_pins: mmc0-pins {
> > +            pins =3D "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> > +            function =3D "sdc0";
> > +            drive-strength =3D <30>;
> > +            bias-pull-up;
> > +        };
> > +    };
>

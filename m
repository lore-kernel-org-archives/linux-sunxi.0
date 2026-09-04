Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5503DB961
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541582; cv=pass; b=XpkmhXRNhUulg3X4U8uXuPj6ivTqONgXr5nRJh4kq/1D9RY8xJX5I/T+TyN+huJBvK0OEX4iOuz5D/HpXt0oiKA0g6qRhBWT44ncawMSWk4N36PqN+MXymGoNjY07JvJozJmTmtgeVcHTeXEclxt/scvUlFsTUAmyNyHk5IVDhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541582; c=relaxed/simple;
	bh=it7al99Mn0Hztn1jkp4WlVXb+TrDxTMcFjo8QDlqTgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cks1NQLvgpeBB4r8uH9d9uy3bt47tzwHbIG4r0CvRH4Xw2McbNYG5lUajEgTszxfV4Df1dpjHrE0QW2lCmReg2Vdw5gGAcV3SdePDl7Dfcj1asS1/7RERaqWNkvmnK9xQhAhkah3a4L1/cmlIXrQ/ioMx5Rs/BxwJPyFRDYsgMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7LfgvyT; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7LfgvyT"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c7bf03c4d0so1024353e0c.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 10:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788541579; cv=none;
        d=google.com; s=arc-20260327;
        b=mVoyFUGy4EMfq6RSIyuZ7JcVDfpHvVQij21clA6EyI6EA16gIpsNxEuklI0D5m0V9A
         JPClb1MSNACM8duWJLxyTw+rNG1hDaQe1TDsRaMf786BSOdlOSq2ARKbv7NEzNFZYNz6
         MaI6le7VLJvmV0ABumYnwNf62wSQxx0wXavUpY4iJz1GMlaqtS0oHWwt0xFMgAsmupf6
         XIzHv7qsncDPqYKPzUx7fkBlOMB91MDWcHrgyskDGjgg1Qhwh3oBjS37dFso9UtsbI3n
         JIl/TN/FMh1GlAaKziE7CxtbF/mRGfRf7wMNeZdsF+HltcCgygPHRsZNbmQz6vMem2UW
         fsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFC2guGLZc9ltzCdl0pnPxvf2FTE+4Td6tDRAjgS4Nw=;
        fh=BJoroJXCWGK5XiAPUYjp+czarIuSAo7V7Tnhc2Lxc0g=;
        b=XkZR7OegIjSix94v23ZW9IX4NDQSzG1COiHQbvLLrViUOXcr8SmL6gpCoNWzguocts
         XGBEJr1VGIivEmlwhiSV4yEHc8KvORmsLVL4ffM4qwnDjPkC0Bu70CM/T4w3sCc4TZZU
         F9XG9nhk5h7crYUK0hqKZP6nceZtc5WAwdeXKSW3oFKGCj4CX+AIXc44rqWSxXn87uTn
         Mh7wxcIMMb7Z7kWITLDjw4WKcoM+WxBhRJyvLcUD1+hxCCaDpPDArhmSgpS2jy5Aq+gL
         5/XjBB5aFs41ATVIfKVL7IaeTyKhwr0DQzUpZPo3pzCiJqsotWh/oO4vcda7gqdyCjpC
         e07Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788541579; x=1789146379; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFC2guGLZc9ltzCdl0pnPxvf2FTE+4Td6tDRAjgS4Nw=;
        b=G7LfgvyTfvy6rLuh47U8DJhio1OlsUA3gVt5T9sbxDKhH2JFVcDI7DgA4ddnzMbOry
         K9IlwSfb72F20Ft8hOO9GMv/+0xFtKMBv2+qTHRsUHgaI/2fqroEQQB4WaCP5Q13LPVr
         FDS/I+0u6fGc2wrhil133WZq2hLB+eXagTQ8XXd7EZuP9tHi7dSeaziDt6MhwkGFbgjX
         06od8dBeryzdVwosMlpprob6mXu7aFCrAkN4kND4Hh0hT/JLM3tfmc+a5ccFfFFQ9IH/
         ad9hNrlxA+ZQ2zllYl78jfhZndyFX4q3AnWi9/S1dd8BnDfYL7bdtciKkqe2GKboswUZ
         bhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788541579; x=1789146379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFC2guGLZc9ltzCdl0pnPxvf2FTE+4Td6tDRAjgS4Nw=;
        b=lGHCUv0U2SL7uhsJrX1SOwpurUhJI6oZ8gIM6W70TXKeZU/9LoFBo09DrD52NPTyHH
         25051JzLEpdb15CLx7bMIei2iKrW9E3wC/FumimXUtS7CAA8MB5dvltxmIKsIZ/68rlv
         HjWVfjigELKvRaVEDNKKlpAGMBgUleI7nSV21HuI9YKF+axFF/mhe/oUpBoA4mMiq/7V
         J3o2WagSbs9fUvccL0VYYJA4On2QK05aKj7NulsMNg1Y5DDXPKLDc5rfb3wK9zFeQpRy
         EoFPs82Gv66vjEDObpyRjG80dy0Ard7bbD5L5F10bD7D5nxlVn6lPNtNW8gbcXCw6Gbd
         7tEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzB6bneNaTkwrjKdYEZaS8rHoKISwH22zIM/lf6XYZaSuC3N/ITgEjV4FOG8Z5aIHezZLv34mfp3rIF2w==@lists.linux.dev
X-Gm-Message-State: AFuF++lTiVbeDBtPqPBPnn1+tzhwWoE1AmvNPfKPEFTPudESlfs+tNPP
	bDijB4eKqbzUe9oD03rQUUz7idzKV5SVkFqwP0jlrm0eqS8CoIjVJaHPlQkqTUl58rhkpxkKc94
	XJAldMG6NBOLE2Lx4Xd8ll0365ZJxwuA=
X-Gm-Gg: AYBFou3rW5VKtfbrDgWYZAsahDlLT7qFaXsUgPvHTgoP1JUtYf8J2fXUQ3BFmDbadBZ
	0h28cIX2cTjivtu5aOG4jNqCciXB0wJfotP53yG4d9Y/SOFjnBP7TIgC7uwGFIJspdvU+HAum0a
	+n3ZwQH9dhqL27G/L2JHN9KrLF1z5aEgCk5dwPKjnnw+GKBV2rbsHO4fAmT0hu0XOhONbdUtu1Y
	Qy3fFqQ4EBJbtbOnalv4kNd8Xqyp2h3GcugFWpgus06vvradjIr38NjZZQ8LoKis5NUZ0axVYlB
	ysn2ojrhB8l7i5/UPgK+qNhPXL2a6KFCDN1mRD6lO9hrh0cAss2zOHTRv94z8h/MtOwjPBhc0qF
	Q18vFTtDJ6vKyOxEjFJcr9YcjOz2Vw2Fzdt7+8kQl8qDiQrVZKQFTlU2gRx/mtvvUpTLXZe+SjB
	da9RZ+Z6HWX9OvCs9vkCqxEkmO4jj/0S0e5snP6Q==
X-Received: by 2002:a05:6102:8023:b0:789:5fc6:3693 with SMTP id
 ada2fe7eead31-78a4a6f8278mr2620716137.6.1788541579377; Fri, 04 Sep 2026
 10:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
 <20260903-submit-ac200-mfd-v9-3-6b7ed278989c@gmail.com> <20260904-overpass-clumsy-8ccdd5d4ca0e@spud>
In-Reply-To: <20260904-overpass-clumsy-8ccdd5d4ca0e@spud>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 13:06:08 -0400
X-Gm-Features: AcwNN1X6bl9ODedCCrg0dVF5P7jGVB6L6R8M2S6nkA_KWsBfrKX-Ph0fkWo7Kdk
Message-ID: <CADvTj4qKxyPZMLBZgpNMMxkFn09MUCNEc9nLva-j=24C_Zg-nw@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] dt-bindings: mfd: x-powers: Describe AC200 functions
To: Conor Dooley <conor@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 9:50=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Thu, Sep 03, 2026 at 02:09:42PM -0600, James Hilliard wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Describe the AC200 audio codec and TV encoder as child nodes of the
> > shared I2C register provider. Keep their analog supplies on the functio=
n
> > consumers and describe the TV encoder display graph and optional bandga=
p
> > calibration cell.
> >
> > Add the shared interrupt-controller properties and interrupt numbers ne=
eded
> > by the TV encoder. The Ethernet PHY remains represented on its primary =
MDIO
> > bus and is therefore not an MFD child.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 136 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   1 +
> >  include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
> >  3 files changed, 150 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml =
b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > index ca7a910b2c73..935dc07138cb 100644
> > --- a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > @@ -28,15 +28,114 @@ properties:
> >        be 24 or 27 MHz, matching the rates encoded by the documented EP=
HY clock
> >        selector.
> >
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      The shared open-drain INTB output for the TV encoder, Ethernet P=
HY and
> > +      RTC interrupts.
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 1
> > +    description:
> > +      The interrupt number, as defined in
> > +      include/dt-bindings/mfd/x-powers,ac200.h.
> > +
> > +  codec:
> > +    type: object
> > +    $ref: /schemas/sound/dai-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: x-powers,ac200-codec
> > +
> > +      '#sound-dai-cells':
> > +        const: 0
> > +
> > +      ac-ldoin-supply:
> > +        description: The 3.3 V supply for the audio codec LDO input.
> > +
> > +    required:
> > +      - compatible
> > +      - '#sound-dai-cells'
> > +      - ac-ldoin-supply
> > +
> > +  tv-encoder:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: x-powers,ac200-tve
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +        description: Cable detection interrupt.
>
> Given the example, this looks like a hack.
> Is this mfd actually an interrupt controller, or is that just part of
> this hack too?

The AC200 has separate TV encoder, Ethernet PHY and RTC status and
enable bits which are multiplexed onto its shared INTB output, so the
intent was to represent that demultiplexer as an interrupt controller.

I notice that the example's tv-encoder interrupts property inherits
interrupt-parent =3D <&pio> rather than explicitly referencing the AC200
interrupt domain. Is that incorrect interrupt relationship what looks
like a hack here, or do you also object to representing the AC200
interrupt demultiplexer as an interrupt controller?

> Quite frankly, I am not really sure why either the tv-encoder or codec
> have dedicated child nodes, they don't appear to have conflicting
> properties.

Do you mean that the DT properties for both functions should be folded
into the AC200 parent node, while the MFD driver still creates separate
codec and TV encoder platform devices?

Lee requested at least two MFD children in this series, so I want to
distinguish the Linux MFD cells from whether those cells need dedicated
firmware child nodes.

> Additionally, why is this not part of patch 1? Add the binding in a
> complete state from the get-go. On that basis, at least,
> pw-bot: changes-requested

Do you want patches 1 and 3 combined into one complete binding patch,
while retaining separate implementation commits for the base provider
and the MFD cells?

> Cheers,
> Conor.
>
> > +
> > +      tv-vcc-supply:
> > +        description: The 3.3 V supply for the composite-video DAC.
> > +
> > +      nvmem-cells:
> > +        maxItems: 1
> > +
> > +      nvmem-cell-names:
> > +        items:
> > +          - const: bandgap
> > +
> > +      ports:
> > +        $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +        properties:
> > +          port@0:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: Input from the display pipeline, carrying CCI=
R656.
> > +
> > +          port@1:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: Output to the composite-video connector.
> > +
> > +        required:
> > +          - port@0
> > +          - port@1
> > +
> > +    required:
> > +      - compatible
> > +      - interrupts
> > +      - tv-vcc-supply
> > +      - ports
> > +
> > +    dependencies:
> > +      nvmem-cells: [ nvmem-cell-names ]
> > +      nvmem-cell-names: [ nvmem-cells ]
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> >
> > +allOf:
> > +  - if:
> > +      required:
> > +        - tv-encoder
> > +    then:
> > +      required:
> > +        - interrupts
> > +        - interrupt-controller
> > +        - '#interrupt-cells'
> > +
> > +dependencies:
> > +  interrupt-controller: [ '#interrupt-cells', interrupts ]
> > +  '#interrupt-cells': [ interrupt-controller ]
> > +
> >  additionalProperties: false
> >
> >  examples:
> >    - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/mfd/x-powers,ac200.h>
> > +
> >      i2c {
> >          #address-cells =3D <1>;
> >          #size-cells =3D <0>;
> > @@ -45,6 +144,43 @@ examples:
> >              compatible =3D "x-powers,ac200";
> >              reg =3D <0x10>;
> >              clocks =3D <&pwm 5>;
> > +            interrupt-parent =3D <&pio>;
> > +            interrupts =3D <1 20 IRQ_TYPE_LEVEL_LOW>;
> > +            interrupt-controller;
> > +            #interrupt-cells =3D <1>;
> > +
> > +            codec {
> > +                compatible =3D "x-powers,ac200-codec";
> > +                #sound-dai-cells =3D <0>;
> > +                ac-ldoin-supply =3D <&reg_aldo2>;
> > +            };
> > +
> > +            tv-encoder {
> > +                compatible =3D "x-powers,ac200-tve";
> > +                interrupts =3D <AC200_IRQ_TVE>;
> > +                tv-vcc-supply =3D <&reg_aldo2>;
> > +
> > +                ports {
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    port@0 {
> > +                        reg =3D <0>;
> > +
> > +                        tve_in: endpoint {
> > +                            remote-endpoint =3D <&tcon_out_tve>;
> > +                        };
> > +                    };
> > +
> > +                    port@1 {
> > +                        reg =3D <1>;
> > +
> > +                        tve_out: endpoint {
> > +                            remote-endpoint =3D <&composite_in>;
> > +                        };
> > +                    };
> > +                };
> > +            };
> >          };
> >      };
> >  ...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1d03b0060bda..8a48f6a1e593 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -29511,6 +29511,7 @@ L:    linux-sunxi@lists.linux.dev
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> >  F:   drivers/mfd/ac200.c
> > +F:   include/dt-bindings/mfd/x-powers,ac200.h
> >
> >  X-POWERS AXP288 PMIC DRIVERS
> >  M:   Hans de Goede <hansg@kernel.org>
> > diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bind=
ings/mfd/x-powers,ac200.h
> > new file mode 100644
> > index 000000000000..cc59e2ab4912
> > --- /dev/null
> > +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > +
> > +#define AC200_IRQ_TVE                        0
> > +#define AC200_IRQ_EPHY                       1
> > +#define AC200_IRQ_RTC                        2
> > +
> > +#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */
> >
> > --
> > 2.53.0
> >

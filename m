Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB82173
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Jun 2021 10:56:37 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso1529294pjp.2
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Jun 2021 03:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HuLGw9v7JLauPhtnxWS8KYadx9N1A/H3l9fDM2qNdFs=;
        b=Zhj8UEuYrb4byhhy4fvAXLyIcmOOFNXknm7PP8rsag6hkDRyQUHz2glSE9P47Ax/o8
         2x6T4LwzcY9FMCJt9+/ZIMwszYNdgg53J30WeeWvWMf3yA7rrzPaoSXcZ0pEDUNMPQIH
         uPYFMbPHjYNjzKlHTDGbC6HGv96cokWjzplROekLytbWjppWC9KJnRFEZI8Y2a49AQoX
         vJWVAQj9bplLUyd8X1E9rAzy9zil8Ke0Lb7Y5Y8UtCkQ1uJD0VvN6hlbWroddcoM3PVn
         UBYR1nXZQAagH8XFLPrxMHoctTJ8Y76+0UIT68BeR0Nk36MVaOzawLd+4yL73vyIez4Q
         1rKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HuLGw9v7JLauPhtnxWS8KYadx9N1A/H3l9fDM2qNdFs=;
        b=h4BzHH/sQRv+iBWDVXezBa6+DrQaofBsIKj2oMXdedVTlyVFUpEMXNfDIDhawa5KuO
         ZU299bXR9ycbjjSenl9oYP4nEqusdWH78CZYOOsuGbFBCMzb9ajlCDoomTg76koX2eqk
         fw1IOiPsGSkC/kfKX7wAgAHS8nz5tQF0diPNoUDDUB3LG32wtlrYQX4uv5y7a30ZkFff
         xhjIs73yJu/8yaY6rVBIluOkuFjEBedSz8mMu+wlKB8JUtWjEQ8jmMw7HseeyeiY2Xt5
         U/C5Cn9imRrWqFIsYNEWYnRpQh+Bpk04/C2ufiCTNYK4hqS31q8xpGfLhw8HfBsYciL1
         BK/Q==
X-Gm-Message-State: AOAM533PDdp8/x4cRa8qZUIlDE0EAu6GVvLK7f0tUwNGjwF5iKhdH91Z
	oSue8NzOhUA8CapG/rZz1gwJ47YvCIx6m6PoNA==
X-Google-Smtp-Source: ABdhPJxTheKUcJqyRfJvtawPTMCjeDGxyzMx7Xo/qrwPj+nkXyk+JqpYYCZmLzAA+Kf7pa2yv3lgVepdJoP3repgnkw=
X-Received: by 2002:a17:90a:aa98:: with SMTP id l24mr4447446pjq.156.1623840996957;
 Wed, 16 Jun 2021 03:56:36 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210615130737.2098-1-fengzheng923@gmail.com> <20210616084920.y6yjic4sau6ungv5@gilmour>
In-Reply-To: <20210616084920.y6yjic4sau6ungv5@gilmour>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Wed, 16 Jun 2021 18:56:25 +0800
Message-ID: <CAE=m619_52DDC_up=QqRXkF88uJR6CcAJqentnBzb=pxL7LhxA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for
 DMIC controller
To: Maxime Ripard <maxime@cerno.tech>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, wens@csie.org, 
	jernej.skrabec@gmail.com, alsa-devel@alsa-project.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B46=E6=9C=8816=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=884:49=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Tue, Jun 15, 2021 at 09:07:37PM +0800, Ban Tao wrote:
> > The Allwinner SoCs feature an I2S controller across multiple SoC
> > generations.
>
> Which SoC generations?
>
> > Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> > ---
> >  .../sound/allwinner,sun50i-h6-dmic.yaml       | 66 +++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,s=
un50i-h6-dmic.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h=
6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-d=
mic.yaml
> > new file mode 100644
> > index 000000000000..81d40c374e44
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.=
yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner H6 DMIC Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Ban Tao <fengzheng923@gmail.com>
> > +
> > +properties:
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> > +  compatible:
> > +    const: allwinner,sun50i-h6-dmic
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Bus Clock
> > +      - description: Module Clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +      - const: dmic
>
> The convention we use is bus and mod
>
> > +
> > +  dmas:
> > +    maxItems: 1
> > +
> > +  dma-names:
> > +    const: rx
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +required:
> > +  - "#sound-dai-cells"
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - dmas
> > +  - dma-names
> > +  - resets
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    spdif: spdif@5095000 {
>
> The label and node name seems wrong?
>
Yes, in fact, I don=E2=80=99t know much about yaml format files.
The allwinner,sun50i-h6-dmic.yaml file is based on
allwinner,sun4i-a10-spdif.yaml.
So, How do i convert txt file to yaml file, for example:
---------------------------------------------
Required properties:

  - compatible         : should be one of the following:
    - "allwinner,sun50i-h6-dmic": for the Allwinner H6 SoC

  - reg                        : physical base address of the
controller and length of memory mapped region.

  - dmas               : Generic dma devicetree binding as described in
                         Documentation/devicetree/bindings/dma/dma.txt.

  - dma-names          : DMA have to be defined, "rx".

  - clocks             : Contains an entry for each entry in clock-names.

  - clock-names                : Includes the following entries:
       "apb"             clock for the dmic bus.
       "dmic"           clock for dmic controller.

  - resets             : reset specifier for the ahb reset

Example:

dmic: dmic@5095000 {
        #sound-dai-cells =3D <0>;
        compatible =3D "allwinner,sun50i-h6-dmic";
        reg =3D <0x05095000 0x400>;
        clocks =3D <&ccu CLK_BUS_DMIC>, <&ccu CLK_DMIC>;
        clock-names =3D "apb", "dmic";
        dmas =3D <&dma 7>;
        dma-names =3D "rx";
        resets =3D <&ccu RST_BUS_DMIC>;
};
---------------------------------------------

Thanks.


> > +        #sound-dai-cells =3D <0>;
> > +        compatible =3D "allwinner,sun50i-h6-dmic";
> > +        reg =3D <0x05095000 0x400>;
> > +        clocks =3D <&ccu CLK_BUS_DMIC>, <&ccu CLK_DMIC>;
>
> You'll need includes for it to compile
>
> Maxime

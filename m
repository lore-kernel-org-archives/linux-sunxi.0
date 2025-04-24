Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B17E288C90
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 17:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745516279; cv=none; b=lh1zRL/fNkEKToFcNyX4FaibnAMhkduY2x5HKZtT1Y1dbi54CjayAPFQPPo9Rj5J9i1nveidpOKIByUqfN/9L+FWGv3cPICY7Utgj1B9KDRyiri5UNVFJvRTH9APt9pcxrPyEgmyi46oBo02zGoAV/gjdJfNs8lSjWB32NL2cvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745516279; c=relaxed/simple;
	bh=l9GwqA6moC5o44LoO/P/z4Eal0AfURGG0Z3kI4uyrIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS1YbHwNFgaMzqhYumhTW7d7glHZctlsUoeSBcWsPiJRBcDxOwpiW0NS3hK1e94nE7j/Ne/I0PWppJxM6QImbkXNU1csQ6w9PgdcEIIk7dCVjHtXe9C0quWGRKRZ5CYJ8A2gQ8t5wbAhIyGl4qB03Mg+U8jY+mynXemfCPpv2Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1545125e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 10:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516275; x=1746121075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CiowPURGN4de6Iry0e1Jc5BJ/71dYd20vAslI7Guwu8=;
        b=kNcPnZWPhWuHDn4G824AxoFg7/MaCP3NLNKWKZytqPxS+wm6o6CAdnrblUxN6ZEJDs
         LJyy1qz5nMWhC2moQYZ2o6cfl6W/TdYluV75O6nA8rIgRk6+goq2NIfkkxBx5QHCIqra
         uKZOZH+8UzTdmBX9b0AGIoy+pvtrCo5LPQ1/etmYOGVEzg/06Fe7Dyda7rj5zAoXkONP
         mGV1JS3slYO8kgb6Ra2XUDfR/X528n7fmhBt6fuD4DFI8l0WD9DX0pikmCh8KEyQRD8V
         xbW9tQvZLz9RGMBiYH+8f0E5WS8B2s9cPWwhurdLWXeWmMFAs4lQXOoeg3VuMQS07YPw
         OicQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmHDThwmkW9lp2foExPkwnRaDfz/kYQJILWN6lSfl+L6GDH/c/1Pgm+3e9UQNOKkvIq5YtST74mpq7vw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx13M4Y/b444TJjwMLvKmHCLAwI9fi6IE6VmOBBXY6c9XvLTq5n
	n50NZoaDtMqu9utq1CbWlz4Q6cc0ejdafSQ0Sv7woSIRgTol8+YgzDJd0iJ7
X-Gm-Gg: ASbGncuM6PbgAFdqkBzVmh34m3rK4qqXxeQ8bWYqfPT/kpE414CB5URcGHPgrbYT0yB
	f1HsDOz2uBkn8RkT259EmUvFW9zlVXvXlNY3fIyJpqZ80zgfYSGBfME/uz7delf+a0cr1YZxmkC
	YcUJhWQ2u9LUkG/Bcpeg4ArQJCagjJ+bqp0sS5M8EVQVzTl5N9naoDgz+V7EBRJ6//bCxRMXjJ0
	joagCXvDZAJD02yOdV6NqzcOsvUfnGvgau5wNVCGfS6sIj9XyEJkEQJJcz7pydpJqDn8nevAKKZ
	aq/aDFh/SmCELmiKqImcdT4ikLfuMxt8fKJuJFEXpVcYShMz7sInOoDixrYJak5/yOzifi31dg=
	=
X-Google-Smtp-Source: AGHT+IE4x7hfmC99KmLT0+1CIZH3tMQCU6Qd3N3FQ7UV301DX2BYi8CpJFB/qETm6roYoHkfrqKe8g==
X-Received: by 2002:a05:6512:3da2:b0:54a:cc09:eacc with SMTP id 2adb3069b0e04-54e7c4210c2mr1147539e87.39.1745516274316;
        Thu, 24 Apr 2025 10:37:54 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7f1asm303059e87.237.2025.04.24.10.37.54
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 10:37:54 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bef9b04adso14147081fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 10:37:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvIYq52nIzGZNrra7TebMytBzFoKKLbA1O2kqunCF9Z9brPDq2FQugIJD6PFDqmu6yCwiCxMyri8rjEA==@lists.linux.dev
X-Received: by 2002:a2e:a9a0:0:b0:30d:b49d:7fb7 with SMTP id
 38308e7fff4ca-3179e5e518fmr13777371fa.16.1745516274006; Thu, 24 Apr 2025
 10:37:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416224839.9840-1-andre.przywara@arm.com> <20250416224839.9840-2-andre.przywara@arm.com>
 <CAPDyKFop9gAUq3kG4-hs358y=N48rLQSvJaRveXo_ebVTf8gEg@mail.gmail.com>
In-Reply-To: <CAPDyKFop9gAUq3kG4-hs358y=N48rLQSvJaRveXo_ebVTf8gEg@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 01:37:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v66w-tD=--zwDBOG8qJbwBR=s9mJ32c65W88P1eazDKLhQ@mail.gmail.com>
X-Gm-Features: ATxdqUHvL4W44GNl5WKefwtfRdBLLoloQmPwAjVhg3bD1KPveNWGmCRztikltk4
Message-ID: <CAGb2v66w-tD=--zwDBOG8qJbwBR=s9mJ32c65W88P1eazDKLhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 12:58=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
>
> On Thu, 17 Apr 2025 at 00:49, Andre Przywara <andre.przywara@arm.com> wro=
te:
> >
> > The Allwinner H6 and some later SoCs contain some bits in the PRCM (Pow=
er
> > Reset Clock Management) block that control some power domains.
> > Those power domains include the one for the GPU, the PLLs and some
> > analogue circuits.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> Applied for next by amending the example according to ChenYu's comment, t=
hanks!
>
> Note this patch is also available on the immutable dt branch, for SoC
> maintainers to pull.

Thanks! I don't think there's a need if it's just the YAML files though.
As long as everything comes together in linux-next, folks are happy.


ChenYu

> Kind regards
> Uffe
>
>
>
> > ---
> >  .../power/allwinner,sun50i-h6-prcm-ppu.yaml   | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/power/allwinner,s=
un50i-h6-prcm-ppu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/power/allwinner,sun50i-h=
6-prcm-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun50i-=
h6-prcm-ppu.yaml
> > new file mode 100644
> > index 0000000000000..7eaff9baf7268
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-=
ppu.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/power/allwinner,sun50i-h6-prcm-ppu.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner SoCs PRCM power domain controller
> > +
> > +maintainers:
> > +  - Andre Przywara <andre.przywara@arm.com>
> > +
> > +description:
> > +  The Allwinner Power Reset Clock Management (PRCM) unit contains bits=
 to
> > +  control a few power domains.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - allwinner,sun50i-h6-prcm-ppu
> > +      - allwinner,sun50i-h616-prcm-ppu
> > +      - allwinner,sun55i-a523-prcm-ppu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#power-domain-cells':
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#power-domain-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    prcm_ppu: power-controller@7010210 {
> > +        compatible =3D "allwinner,sun50i-h616-prcm-ppu";
> > +        reg =3D <0x07010250 0x10>;
> > +        #power-domain-cells =3D <1>;
> > +    };
> > --
> > 2.46.3
> >
>

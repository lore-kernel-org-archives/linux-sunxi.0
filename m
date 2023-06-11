Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81641FC5
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 07:54:11 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-97458c97333so548259966b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686470050; x=1689062050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2bYmU9gOFw7prawoSArqsjj7q30vNelMkCTOp3DUZA=;
        b=ZIEOX3tJHJOzGLZrKAdQ+Em+CgSdACZ6I8FnuJaC4jYMStxwz09k1IUU5ZVNT1dW2v
         ogPNUK7ZS+3BABiwD25+IzvvjnBLi493MzDiM/IR6p3MMAwZt7gXj55mTTsPuV1GhUnB
         iq6nxosD3itFoqyejgow+y2d+JcxEim7S9fh42peyFKgPu1KbhgXG/+edgWI+9mRGdCA
         yCU+aQjqgUZYEEPCg7Xt6cnvbidmIInJNEc58JumOG7Xe0aO208JhTCnXrR+QlWi1wMM
         tRieArJ9twGrAHIA7Zobx4X3k4JDjR7avO4YwD1ezT3hNQ7OM9N1Ahi5W08doshMsRBk
         2skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686470050; x=1689062050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2bYmU9gOFw7prawoSArqsjj7q30vNelMkCTOp3DUZA=;
        b=aVtKE1QEX6TaHb00A+NtjK1jKZmHPPx2qVqOvQs6/NbE6M0nYWL7Df7rDSjWh92Aq0
         kdz/PJzYTMcayal2Y0coXcqAs2xZQxvlZKjYblgweZg8d2HI+WQ6X95Zdub+bcybWYae
         rjXNO17399K76A7h3Olj4yygUlJIVC2LSRigt5sQbvkNB6fCuJDK3OpA5FxyNLT0N0JK
         Vwj79qi8sX/S60oxbNtMJ1yhuRZSuz/HNn9BF2fKvsYz7KtnMpK/Rwp2F/Utdck46DdS
         lK/8HsMgeKMWntRU+9Ep4JL645ahAJRz5f17/0XM+A0l9T97zhWqOMwhzqs1WMCmomN9
         T0Fg==
X-Gm-Message-State: AC+VfDw5pQVT5rqC2NfpwJs7EeJfHfDH6cfz4yGnHcAAS4qyrUGdOnDM
	5DqJLBNx5JYKhYT0qxiL5McgJwKSxo+JtD7kYGw=
X-Google-Smtp-Source: ACHHUZ5ja8bZ3Ma/lzFyJGdan7jkXrsKOmmJXjhxvrXILS4V+ZNLzwM/6ID9I2oXbI3TE6BVuXmHvV/daKEMgKQnrEw=
X-Received: by 2002:a17:907:7f09:b0:973:a30d:b264 with SMTP id
 qf9-20020a1709077f0900b00973a30db264mr6940129ejc.46.1686470049410; Sun, 11
 Jun 2023 00:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230610141739.999268-1-bigunclemax@gmail.com>
 <20230610141739.999268-4-bigunclemax@gmail.com> <20230610-rehire-amid-2517f43504c0@spud>
 <CALHCpMiEmc8L=O86_x7-KkBHFwf2QpuP0M7ugz7dNPr71cpJmQ@mail.gmail.com>
 <20230610-enlarged-agonize-0e9219f9921d@spud> <20230610-crumpet-spender-4133090a4728@spud>
 <CALHCpMjFNvJAnd2_3-1n_L3QRz4eNc-Egm-BD6jcS6H694dSyg@mail.gmail.com> <20230610-whimsical-unrushed-2f5b30349588@spud>
In-Reply-To: <20230610-whimsical-unrushed-2f5b30349588@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 11 Jun 2023 10:53:56 +0300
Message-ID: <CALHCpMhQ8XxffHr_f=AtO-HoWadBQb1mSvojELctdwMKnF1tbw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: thermal: sun8i: Add binding for
 D1/T113s THS controller
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=81, 11 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 01:14, Con=
or Dooley <conor@kernel.org>:
>
> On Sat, Jun 10, 2023 at 11:31:03PM +0300, Maxim Kiselev wrote:
> > =D1=81=D0=B1, 10 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 21:01,=
 Conor Dooley <conor@kernel.org>:
> >
> > ...
> >
> > > > > > +  - |
> > > > > > +    thermal-sensor@2009400 {
> > > > > > +          compatible =3D "allwinner,sun20i-d1-ths";
> > > > > > +          reg =3D <0x02009400 0x400>;
> > > > > > +          interrupts =3D <0 90 0>;
> > > > > > +          clocks =3D <&ccu 0>;
> > > > > > +          clock-names =3D "bus";
> > > > > > +          resets =3D <&ccu 2>;
> > > > > > +          nvmem-cells =3D <&ths_calibration>;
> > > > > > +          nvmem-cell-names =3D "calibration";
> > > > > > +          #thermal-sensor-cells =3D <0>;
> > > > > >
> > > > > >> Is this calibration required, or optional, for the d1?
> > > > >
> > > > > Calibration data for the D1 is optional as for the H6.
> > > > > (But without it, the sensor data will be inaccurate).
> > > >
> > > > Okay. Modulo the signoff:
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Wait, that's not what I meant to say... Clearly turned my brain off f=
or
> > > a moment. If it is not going to function correctly without the
> > > calibration data, why not make the calibration data required for the
> > > d1's ths?
> >
> > I don't really know why, but the calibration data is optional for
> > other controllers.
> > So I just did it the same way.
> > Here is explanation comment about it from the driver:
> >         /*
> >          * Even if the external calibration data stored in sid is
> >          * not accessible, the THS hardware can still work, although
> >          * the data won't be so accurate.
> >          *
> >          * The default value of calibration register is 0x800 for
> >          * every sensor, and the calibration value is usually 0x7xx
> >          * or 0x8xx, so they won't be away from the default value
> >          * for a lot.
> >          *
> >          * So here we do not return error if the calibration data is
> >          * not available, except the probe needs deferring.
> >          */
>
> Wait, so if there is no calibration data then this thing will just defer
> probing, ad infinitum? Looks like everything other than the a33 has the
> cells in the dts, and the software seems to expect the cells.
> What am I missing?

Not quite. If we don't have a calibration cell in the dts, then we
just skip the calibration.
We will only get EPROBE_DEFER if we have calibration in the dts.
Here is the whole function code:

static int sun8i_ths_calibrate(struct ths_device *tmdev)
{
    struct nvmem_cell *calcell;
    struct device *dev =3D tmdev->dev;
    u16 *caldata;
    size_t callen;
    int ret =3D 0;

    calcell =3D devm_nvmem_cell_get(dev, "calibration");
    if (IS_ERR(calcell)) {
        if (PTR_ERR(calcell) =3D=3D -EPROBE_DEFER)
            return -EPROBE_DEFER;
        /*
         * Even if the external calibration data stored in sid is
         * not accessible, the THS hardware can still work, although
         * the data won't be so accurate.
         *
         * The default value of calibration register is 0x800 for
         * every sensor, and the calibration value is usually 0x7xx
         * or 0x8xx, so they won't be away from the default value
         * for a lot.
         *
         * So here we do not return error if the calibration data is
         * not available, except the probe needs deferring.
         */
        goto out;
    }

    caldata =3D nvmem_cell_read(calcell, &callen);
    if (IS_ERR(caldata)) {
        ret =3D PTR_ERR(caldata);
        goto out;
    }

    tmdev->chip->calibrate(tmdev, caldata, callen);

    kfree(caldata);
out:
    return ret;
}

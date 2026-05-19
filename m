Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2B026C385
	for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 03:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779161641; cv=none; b=jRwcyQzfCBmaJ7okQK+tqpIXW8N+3lywXUWjmomYo8n5NwruczT4qlGLHiDGtknZE/AETj9E1VOboXfpFc7LbLwN338CsyMvYzcioMRkxTJcsDvbIKbLQTaAu9HlpnXHwoQIO3L1yXh0AeCjDGPjPZiqYaphPH1ACL2sgZQwhmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779161641; c=relaxed/simple;
	bh=nqKg2vNqhpGy8mWBUrH5n648k2I71k6MfxdNSF69OdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSc7uEbrAg/Fd+R0QOOXlqCZrJf0lo1bOKcxnWTZi+vgTH5ibdsGRR+BNV+Uj5QI8LQPeNIWFW1T/6iTG1jup9XSix9bXWNpd4VAhd9gnnyOcqCVUXORpu3T4O9Jy/Y5LPBlrOsPJbPJcjSb0+kGovNpld/XsqTi85x8OOYxapE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjonHy3/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjonHy3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE31C4AF09
	for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 03:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779161641;
	bh=nqKg2vNqhpGy8mWBUrH5n648k2I71k6MfxdNSF69OdA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=SjonHy3/Bl4JhFw48DynnSqz6PqlQC615bV+ELzdICsUebCLPeMjylDSbyEjSd+2R
	 svvVgacwmgrWRH67NtJwCJPm7HhU+JSPuJ5jh+reA0mqhD+AhrD9IQJpZc6ZOBNKPz
	 5XB9ShRumxfrAmHbhrBsE0mtlyzMx/tL9NO+4FMz0xs93WEFI5UqQyUdh36wZyV/jy
	 yrTUSD/u6ZFvY320Dss8T4ynJOCUYfVGvLZkV5hub5MPZCSlMrwT15CErgx/ANGRyo
	 Byghh8prXWAvBT9JO5JZ54QgKxm+u5tWxEdBdAPuhWKjfnENxRVIAD3PerwK4pAlTb
	 ikyOEMBDaaqNw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38e97e73234so28044991fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 20:34:01 -0700 (PDT)
X-Gm-Message-State: AOJu0YwtYSbF7Xt3t2AZvLNyMlwpuh8KuF8kJPGnDMT2eUz5VIurAE38
	ihLW2vkA+zQQpfqRlq7oc0dW6YlbFpZ2MOHtiCk/dxdiYjs1uixywU6Orh+SZQL1L7oV98p/9gY
	HdW2t6HiaByAnuZo406MC0EYJIUZjC3E=
X-Received: by 2002:a2e:9854:0:b0:394:472e:e430 with SMTP id
 38308e7fff4ca-39561c124d8mr40219351fa.18.1779161639815; Mon, 18 May 2026
 20:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com> <agr9m_tidBr6Cu2h@collins>
 <04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com> <aguIvpKQM18kX97T@shepard>
In-Reply-To: <aguIvpKQM18kX97T@shepard>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 19 May 2026 11:33:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v66C4o020Wj979O9Ms1yGrQ9mxTppex7L+i8F2=HobktCA@mail.gmail.com>
X-Gm-Features: AVHnY4LLydhSeTMxsbAa_7rikkTlCp_XrE-66uJsZgTVHv70SiGFx9AM4k7da9Q
Message-ID: <CAGb2v66C4o020Wj979O9Ms1yGrQ9mxTppex7L+i8F2=HobktCA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
To: Paul Kocialkowski <paulk@sys-base.io>, Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 5:46=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Alexander,
>
> On Mon 18 May 26, 22:05, Alexander Sverdlin wrote:
> > Hi Paul,
> >
> > thanks for the review!
> >
> > On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
> > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.d=
tsi b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > > > new file mode 100644
> > > > index 000000000000..65b094f30bf5
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> >
> > []
> >
> > > You should add:
> > >
> > >     chosen {
> > >             stdout-path =3D "serial0:115200n8";
> > >     };
> >
> > I actually have it in .dts, but it's theoretically possible to deploy
> > the core board in a way that serial0 is *not* a console, so the above
> > probably will not be valid in all cases in .dtsi.
>
> Yes I figured out later that it was in the board dts file and I initially
> assumed it was missing entirely.
>
> In practice both options are fine, although the reference software does
> hardcode UART0 as debug serial.
>
> > > > +&reg_dcdc2 {
> > > > + regulator-always-on;
> > > > + regulator-min-microvolt =3D <500000>;
> > > > + regulator-max-microvolt =3D <1300000>;
> > >
> > > Should be:
> > >     regulator-min-microvolt =3D <900000>;
> > >     regulator-max-microvolt =3D <1300000>;
> >
> > 0.81..1.2v according to A133 Datasheet Revision 1.1 Jul.14, 2020?
>
> I guess the initial values are taken from the allwinner-perf1 board dts.
>
> The 900 mV-1.3 V range matches the CPU OPPs (although it really only goes=
 up
> to 1.13 V). Maybe down to 810 mV does work, but we don't have an OPP for =
it.
> I think I took these values from the reference BSP for the board.
>
> Also it would be good to add:
>
>         regulator-name =3D "vdd-cpux";
>
> > >
> > > > +&reg_dcdc4 {
> > > > + regulator-always-on;
> > > > + regulator-min-microvolt =3D <500000>;
> > > > + regulator-max-microvolt =3D <1300000>;
> > > > + regulator-name =3D "vdd-sys";
> > >
> > > Should be:
> > >     regulator-min-microvolt =3D <810000>;
> > >     regulator-max-microvolt =3D <990000>;
> > >     regulator-name =3D "vcc-usb-sys";
> >
> > I'm a bit puzzled here: datasheet says 0.9..1.0v
> > and it has no "Typ" value, similar to VDD_CPU, but
> > VDD_SYS is not part of OPP tables, so who is going
> > to adjust this? Or shall it be just

No one really. As long as the current voltage is within the range,
the kernel will be happy. But ideally the DT just describes the
acceptable range, and the bootloader programs the correct recommended
voltage.

> > regulator-min-microvolt =3D <950000>;
> > regulator-max-microvolt =3D <950000>;
> >
> > ?
>
> Yes the reference BSP runs it at 950 mV, LGTM.
>
> >
> > >
> > > > +};
> > > > +
> > > > +&reg_dcdc5 {
> > > > + regulator-always-on;
> > > > + regulator-min-microvolt =3D <800000>;
> > > > + regulator-max-microvolt =3D <1840000>;
> > > > + regulator-name =3D "vcc-dram";
> > >
> > > Should be:
> > >     regulator-min-microvolt =3D <1100000>;
> > >     regulator-max-microvolt =3D <1100000>;
> > >     regulator-name =3D "vcc-dram-2";
> > >
> > > ALDO2 is the main DRAM supply, this is the second one.
> >
> > Core schematics mentions 1.1V/1.2/1.35/1.5 on this rail...
> > Currently U-Boot has CONFIG_AXP_DCDC5_VOLT=3D1100, but potentially
> > this is adjustable, right? At some point LPDDR4 chips they
> > are soldering today will be unavailable. And in the current
> > market it will happen rather sooner than later...
>
> It is part of the LPDDR4 spec that the main voltage should be 1.8 V and
> the second and I/O buffer ones should be 1.1 V. See JESD209-4D Table 180 =
=E2=80=94
> Recommended DC Operating Conditions.
>
> Maybe they jsut copied this comment from a reference design that allows f=
or
> other types of DRAM too. In any case their BSP hardcodes 1.1 V anyway.
>
> > >
> > > > +};
> > > > +
> > > > +/* DCDC6 unused */
> > > > +
> > > > +&reg_dldo1 {
> > > > + regulator-min-microvolt =3D <700000>;
> > > > + regulator-max-microvolt =3D <3300000>;
> > > > + regulator-enable-ramp-delay =3D <1000>;
> > >
> > > Should be:
> > >     regulator-min-microvolt =3D <1800000>;
> > >     regulator-max-microvolt =3D <1800000>;
> > >     regulator-name =3D "vcc-pg";
> >
> > Do suggest to drop vendor's
> >
> > regulator-enable-ramp-delay =3D <1000>;
> >
> > in all cases?
>
> Well we generally don't have the delays in the axp regulator definitions =
and
> it works well without them, but I guess they don't hurt either.

We should probably keep them if we know that they are properly measured
values, and not just cargo-culted.

> In practice many drivers will have a delay after a regulator power on any=
way
> because we generally expect that hardware needs some time to power up,
> in addition to the regulator. So all in all it's rarely critical.

Those are two different things. Devices generally say "wait x ms" after
power rail is at full voltage. The enable ramp delay is the time it
takes the rail to get to full voltage. The latter depends on board
design (capacitor rating) and PMIC settings.


ChenYu

> >
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helpe=
r.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> > > > new file mode 100644
> > > > index 000000000000..ccbca5d0a40c
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> >
> > []
> >
> > > > + aliases {
> > > > +         serial0 =3D &uart0;
> > >
> > > The is best added to the core dtsi.
> > >
> > > > + };
> > > > +
> > > > + chosen {
> > > > +         stdout-path =3D "serial0:115200n8";
> > >
> > > Ditto.
> >
> > But it only physically materializes in Helperboard, the carrier.
> > Potentially this one can be left floating or used for something else.
>
> Yes fair enough, I'm happy with having it on the helperboard dts file.
>
> All the best,
>
> Paul
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

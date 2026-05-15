Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D50A30F95C
	for <linux-sunxi@lists.linux.dev>; Fri, 15 May 2026 21:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881923; cv=none; b=j4XygbLVFLFrHlccVi5PUofj5n09KJvtt5wCKcGcyCpggyx5L2ioFsbh2mL0fxevgMjHOTU0oasVZyna3e7Eoe08/mRSiwqygQTPnODTqxbCov/LAuQBkEoOONJUwU5eCWnVtFN1ObCsqqiMKrtQjNGOHmEfKBd0G0mTo6ukJuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881923; c=relaxed/simple;
	bh=w/NSnWPxO2pPbEQZolqzwkIT6PojPrmpavCWj0wqYGU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q5xKBcnHKVsF0/AjK3pu5TCNFGlgObq+9yEgPzO5/F9RXisWGwFu4SCsH4ez7C2UvoRtZpRANpuuBvd3tNd4RB363KG4zbW6r70vV8BmjjFfseAVD3297sUKqpY27R/htOcxT3INYzSBKC9FYZ/1KuHVACMze7YhVHK+jRi9j2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nCPJZG/y; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nCPJZG/y"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D48101BCB;
	Fri, 15 May 2026 14:51:54 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 371183F85F;
	Fri, 15 May 2026 14:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778881920; bh=w/NSnWPxO2pPbEQZolqzwkIT6PojPrmpavCWj0wqYGU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nCPJZG/ymBaYmcyERMbxLdIsHQoNGJJEJxaWy2/8f+2GnZIHlMZ+4GS5187VVvwoY
	 IH2pP9VPYV9gZM+MXD1JIlOMUxGgO/ZclmXl4a955uYPg0wdQKJNQFcQLflkdYlRLM
	 krq3CmKprRwSY7QjrDU8svR6X78wpShjn/zYDMXo=
Date: Fri, 15 May 2026 23:51:12 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
Message-ID: <20260515235112.3d2a0c5e@ryzen.lan>
In-Reply-To: <CAGb2v66drOyBgNU0hFo356MKTFnggNmyzrANok+-U31NzZCUEw@mail.gmail.com>
References: <20260511221741.25888-1-andre.przywara@arm.com>
	<CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com>
	<ee9fca66-d079-4ad7-9cb3-5077e8a4f6d6@arm.com>
	<CAGb2v66drOyBgNU0hFo356MKTFnggNmyzrANok+-U31NzZCUEw@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 16 May 2026 00:12:17 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> On Wed, May 13, 2026 at 5:19=E2=80=AFPM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > Hi Chen-Yu,
> >
> > thanks for chipping in!
> >
> > On 5/13/26 07:21, Chen-Yu Tsai wrote: =20
> > > Hi,
> > >
> > > On Tue, May 12, 2026 at 6:18=E2=80=AFAM Andre Przywara <andre.przywar=
a@arm.com> wrote: =20
> > >>
> > >> The Cubie A5E board comes with 16MiB of SPI NOR flash.
> > >>
> > >> Enable the SPI0 DT node and describe the configuration.
> > >>
> > >> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > >> ---
> > >>   .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  | 15 +++++++++++=
++++
> > >>   1 file changed, 15 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts=
 b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > >> index bfdf1728cd14b..7ad22fc85d1fd 100644
> > >> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > >> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > >> @@ -344,6 +344,21 @@ &r_pio {
> > >>          vcc-pm-supply =3D <&reg_aldo3>;
> > >>   };
> > >>
> > >> +&spi0  {
> > >> +       pinctrl-names =3D "default";
> > >> +       pinctrl-0 =3D <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
> > >> +                   <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>; =20
> > >
> > > This whole thing needs to be an overlay. The HOLD and WP pins
> > > conflict with eMMC usage, so it seems that Radxa only populates
> > > one or the other.
> > >
> > > If you look at the pictures on their official website, you'll see the
> > > SPI NOR chip populated, but not the eMMC chip. On the linux-sunxi wiki
> > > page, you'll see the opposite. =20
> >
> > Well, I have a hard time spotting any actual eMMC SKUs in the shops any=
way.
> > But you are right, the hold and WP pins conflict with eMMC, whereas the
> > other pins are not.
> > =20
> > > And you probably want to enable QSPI, like Sashiko mentioned. =20
> >
> > Well, in the interest of keeping this simple and enabling the usage of
> > SPI flash for all the users out there, I'd rather drop the extra pins.
> > This is mostly really useful for booting the firmware, maybe loading a
> > tiny kernel or other data once, so performance is not a big concern in
> > this use case. The BootROM surely does not use QSPI. =20
>=20
> Given that the pins are tied on physically, if someone then enables mmc2
> for a potentially present eMMC, the two pins could be toggled by the
> MMC controller, causing the flash to misbehave. I'm slightly concerned
> about this possibility.

That's a good point, but that means it's really a hardware design
issue: you cannot have SPI together with eMMC on this board.

I don't know if Radxa ships the eMMC SKUs without SPI flash, I
will try to query Tom Cubie about this.

I would prefer to go with SPI flash, at least for now: I think that's
what most users have, and the eMMC versions are rare so far? Since we
don't have an eMMC node in the DT anyway, that should be fine for now.
If someone adds eMMC support later, we would need to figure this out.
We could mark one as disabled, and leave it up to users (or U-Boot)
to decide which to enable.
On the H6 there is a similar problem: PC5 is both SPI0_CS and MMC2_CMD,
so on the PineH64 we disable the SPI flash, in favour of eMMC, which is
more useful for users (but sunxi-fel SPI access and U-Boot SPI loading
work nevertheless). But given the apparent prevalence of SPI boards vs.
those with eMMC for the Cubie A5E, I would go with SPI on this one.

Does that make sense? Any thoughts?

Cheers,
Andre

> > And as you say, if people are really interested in the last bit of
> > performance, they can use an overlay.
> >
> > Cheers,
> > Andre
> > =20
> > >
> > >
> > > ChenYu
> > >
> > > =20
> > >> +       status =3D "okay";
> > >> +
> > >> +       flash@0 {
> > >> +               compatible =3D "winbond,w25q128", "jedec,spi-nor";
> > >> +               reg =3D <0>;
> > >> +               spi-max-frequency =3D <40000000>;
> > >> +               #address-cells =3D <1>;
> > >> +               #size-cells =3D <1>;
> > >> +       };
> > >> +};
> > >> +
> > >>   &uart0 {
> > >>          pinctrl-names =3D "default";
> > >>          pinctrl-0 =3D <&uart0_pb_pins>;
> > >> --
> > >> 2.46.4
> > >> =20
> > > =20
> > =20
>=20


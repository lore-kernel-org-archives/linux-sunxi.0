Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFF717F
	for <linux-sunxi@lists.linux.dev>; Sun, 23 May 2021 00:06:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59FD81042;
	Sat, 22 May 2021 17:06:58 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78D1A3F73B;
	Sat, 22 May 2021 17:06:56 -0700 (PDT)
Date: Sun, 23 May 2021 01:06:43 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob
 Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Samuel Holland
 <samuel@sholland.org>, Ondrej Jirman <megous@megous.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org
Subject: Re: [PATCH v6 05/17] rtc: sun6i: Add Allwinner H616 support
Message-ID: <20210523010643.7fdfd419@slackpad.fritz.box>
In-Reply-To: <10265315.EKgO2cQaHd@kista>
References: <20210519104152.21119-1-andre.przywara@arm.com>
	<20210519104152.21119-6-andre.przywara@arm.com>
	<10265315.EKgO2cQaHd@kista>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 22 May 2021 09:29:26 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne sreda, 19. maj 2021 ob 12:41:40 CEST je Andre Przywara napisal(a):
> > The H616 RTC changes its day storage to the newly introduced linear day
> > scheme, so pair the new compatible string with this feature flag.
> > So far the clock parts seem to be the same as the H6, so combine the
> > compatible string with the existing H6 support bits. =20
>=20
> There is one more difference - H616 alarm value is now broken down to day=
s,=20
> hours, minutes and seconds.

That's a good point, that actually requires adjusting the driver in
this respect as well. And contrary to what the manual says ("Counter
Register will down count to zero"), and the previous RTCs do, those alarm
registers now need to be set to the actual wakeup time, not the time
left before wakeup.
Will fix the driver accordingly.

Thanks for the heads up!

Cheers,
Andre

>=20
> Best regards,
> Jernej
>=20
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/rtc/rtc-sun6i.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > index 0228e9dfd969..ec0cd0ee539a 100644
> > --- a/drivers/rtc/rtc-sun6i.c
> > +++ b/drivers/rtc/rtc-sun6i.c
> > @@ -382,6 +382,8 @@ static void __init sun50i_h6_rtc_clk_init(struct  =
=20
> device_node *node)
> >  }
> >  CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
> >  		      sun50i_h6_rtc_clk_init);
> > +CLK_OF_DECLARE_DRIVER(sun50i_h616_rtc_clk, "allwinner,sun50i-h616-rtc",
> > +		      sun50i_h6_rtc_clk_init);
> > =20
> >  /*
> >   * The R40 user manual is self-conflicting on whether the prescaler is
> > @@ -773,6 +775,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[]=
 =3D {
> >  	{ .compatible =3D "allwinner,sun8i-v3-rtc" },
> >  	{ .compatible =3D "allwinner,sun50i-h5-rtc" },
> >  	{ .compatible =3D "allwinner,sun50i-h6-rtc" },
> > +	{ .compatible =3D "allwinner,sun50i-h616-rtc",
> > +		.data =3D (void *)RTC_LINEAR_DAY },
> >  	{ /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
> > --=20
> > 2.17.5
> >=20
> >  =20
>=20
>=20


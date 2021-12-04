Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEB168
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Dec 2021 15:21:18 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPSA id 7E2BDC341C2;
	Sat,  4 Dec 2021 15:21:13 +0000 (UTC)
Date: Sat, 4 Dec 2021 15:26:21 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Evgeny Boger <boger@wirenboard.com>, Quentin Schulz
 <foss+kernel@0leil.net>, Samuel Holland <samuel@sholland.org>, Maxime
 Ripard <maxime@cerno.tech>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org, Linus Walleij
 <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: adc: document TS voltage in AXP
 PMICs
Message-ID: <20211204152621.4f15b3d0@jic23-huawei>
In-Reply-To: <20211203204754.2ucaiiwyrvbtwgbz@earth.universe>
References: <20211118141233.247907-1-boger@wirenboard.com>
	<20211118141233.247907-3-boger@wirenboard.com>
	<20211122104915.zism6uadgwxjz5d2@gilmour>
	<d1a18116-e198-1b26-d73a-36fbf31aaa81@wirenboard.com>
	<35630e89-4988-a6a9-b801-0e9e44419684@sholland.org>
	<206c2a66-42b9-7e07-66c3-6007b010c996@wirenboard.com>
	<20211201110241.kts5caycdmzqtp3i@fiqs>
	<4fd167ed-d5dc-358a-00f5-6590f4c20a68@wirenboard.com>
	<20211203204754.2ucaiiwyrvbtwgbz@earth.universe>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Dec 2021 21:47:54 +0100
Sebastian Reichel <sebastian.reichel@collabora.com> wrote:

> Hi,
>=20
> On Wed, Dec 01, 2021 at 06:45:44PM +0300, Evgeny Boger wrote:
> > Hi Quentin,
> >=20
> > thank you for the feedback!
> >=20
> > 01.12.2021 14:02, Quentin Schulz =D0=BF=D0=B8=D1=88=D0=B5=D1=82: =20
> > > Hi all,
> > >=20
> > > On Tue, Nov 30, 2021 at 02:58:23AM +0300, Evgeny Boger wrote: =20
> > > > (added linux-pm@ list and maintainers)
> > > >=20
> > > >=20
> > > > Actually, on second though, I think it might be doable to add volta=
ge to
> > > > temperature conversion to this driver.
> > > >=20
> > > > I think since the NTC thermistor belongs to the battery, not charge=
r, the
> > > > thermistor should be described in monitored battery node.
> > > > So I propose to extend battery node (power/supply/battery.yaml) by =
adding
> > > > something like:
> > > >=20
> > > > thermistor-resistance-temp-table =3D <25 10000>, <35 6530>, ...;
> > > >=20
> > > > This driver will then interpolate between points to report temperat=
ure.
> > > >  =20
> > > I disagree, I think it does not make much sense. This is already done=
 by
> > > the NTC thermistor driver.
> > > The battery "subsystem" already provides operating-range-celsius and
> > > alert-celsius properties for that.
> > > Since the battery is linked to the AXP, all we need is to be able to =
ask
> > > the NTC thermistor driver to do the conversion from temperature to
> > > voltage of the two voltage values we get from the battery and use the
> > > result as threshold in the AXP registers.
> > > I wouldn't want to have the extrapolation done in two different place=
s.
> > >=20
> > > I can see two ways of specifying that interation:
> > >=20
> > > battery -------------------> axp --------------------> ntc
> > > 	min/max =C2=B0C			request =C2=B0C to V
> > > 				 <--------------------
> > > 					response V
> > >=20
> > > This however would require a phandle in the AXP to the NTC thermistor
> > > driver and I don't feel like it's that good of an idea?
> > >=20
> > > Another way would be to use the battery as a proxy for the voltage
> > > request to ntc.
> > >=20
> > > 		     battery --------------------> axp
> > > 				min/max =C2=B0C
> > > ntc <--------------- 	     <--------------------
> > > 	request =C2=B0C to V		request =C2=B0C to V =20
> > >      --------------->	     ---------------------> =20
> > > 	response V		response V
> > >=20
> > > This would require a phandle to the ntc thermistor in the battery nod=
e,
> > > which kind of makes sense to me. And since the AXP already has knowle=
dge
> > > of the battery, it can request the appropriate value to the battery
> > > which then proxies it to and back from the ntc.
> > >=20
> > > Forgive me for my poor ASCII drawing skills :) hopefully it's good
> > > enough to convey my thoughts. =20

If we were going to do something like this, I'd see the battery as a
consumer of the the temperature measurement from the NTC (might also consum=
e other
things from axp directly).  So it should be

Temperature / events flow.

battery <---temperature----- NTC driver <--Voltage----   axp

Threshold configuration flow

battery --temp thresh-----> NTC driver ---volt thres--> axp

What's missing infrastructure wise is that we don't have an in kernel
interface for IIO events (i.e. the thresholds). It's been discussed
quite a few times in the past, but there has never been a strong enough
reason for anyone to have bothered implementing it.  It wouldn't be
very hard to do if we do need it.  Previous discussions concluded it is
fine to leave demux of events to the consumer unlike the main data flow.
We might refine that in future but for initial usecases that would greatly
simplify the code whilst still allowing multiple consumers from a single
device (which you would need here for example).

These flows are the same we do for data etc for things like
analog accelerometers. That accel driver is a consumer of the ADC
channels as it is using them to convert the voltages to accelerations
that it wants to then present to it's own consumers (typically userspace).


> > I see quite a few problems with NTC driver approach.
> >=20
> > The problem is, I don't know any suitable subsystem for that. NTC
> > is not a subsystem, NTC in kernel is a mere hwmon driver, and also
> > is quite an old one.
> >=20
> > Also, we already have iio-afe, which, in a sense, already does pretty m=
uch
> > the same as NTC
> > hwmon driver. Maybe using iio-afe is the better idea?
> > But then, I think that's a very complicated interaction for a simple
> > interpolation between points.
> >=20
> > Another thing is, in our design we ended up using not a simple 10k NTC
> > thermistor, but a 10k NTC is series with fixed 2.2k.
> > The reason why it's needed is that AXP NTC voltage thresholds are fixed=
 at
> > startup time, and if we somehow have to deal
> > with default thresholds to get different behaviour.=C2=A0 So the
> > resistance-temperature curve in our case is different from any standard
> > NTC. Speaking of "standard" NTC, our supplier has like 15 different mod=
els
> > for *each* resistance, which slightly differ in
> > resistance-temperature curve. Adding them all into a driver would be
> > strange.
> >=20
> > Personally, I think better approach with NTCs is to place the
> > resistance-temperature tables for bunch of models to .dtsi
> > files, describe the thermistor node in DT and then make all drivers (hw=
mon
> > NTC, iio-afe, this one) to use this data in the same way
> > it's done with monitored-battery node.

Agreed those tables would be needed whatever the solution.  We might
stick to 'standard' tables for simple cases but someone will always wire
a circuit up that does something we haven't thought of.

> >  =20
> > > > We can also adjust PMIC voltage thresholds based on this table and
> > > > "alert-celsius" property already described in battery.yaml.
> > > >=20
> > > > I think the driver should report raw TS voltage as well, because th=
e TS pin
> > > > can also be used as general-purpose ADC pin.
> > > >  =20
> > > Since the ntc anyway needs this raw TS voltage and that patch does th=
at,
> > > I think it's fine. Specifically, re-using this pin as a general-purpo=
se
> > > ADC won't impact the current patchset.
> > >=20
> > > What we'll need is to have a pinctrl driver for the few pins in the A=
XP
> > > which have multiple functions. But that's outside of the scope of this
> > > patchset. =20
> > Should it really be pinctrl, though? Unfortunately the choice will alter
> > other
> > functions as well. Say, if we use TS pin in GPADC mode, we'll have to
> > disable
> > temperature thresholds and current injection. =20
> > >=20
> > > Regarding the injected current, I don't have enough knowledge in
> > > electronics to understand how this will change things in the thermist=
or
> > > since in the NTC thermistor driver there's no logic related to the
> > > actual current being injected. Maybe it is related to some operating
> > > value required by the NTC? I can't say unfortunately. =20
> > It's basically Ohm's law, so it's not related to the NTC thermistor its=
elf,
> > but more to the voltage across NTC that the AXP can measure.
> > Say, if maximum measurable voltage is 3.3V, than the maximum measurable
> > resistance
> > at the given current would be 3.3V/80uA =3D 41 kOhm. In case of 10k NTC=
 it's
> > about -5C or so.
> >=20
> > But again, one can't really alter startup voltage thresholds of the AXP=
. And
> > also, regardless of
> > settings, at least AXP221s will completely disable TS-based protection =
if
> > voltage on TS pin is below 0.2V.
> > So at the end, unfortunately, there are not so many options when it com=
es to
> > the thermistor and the injection current. =20
>=20
> Linus W. recently sent a series for NTC support in power-supply
> core, please synchronize with him (added to Cc):
>=20
> https://lore.kernel.org/linux-pm/20211122234141.3356340-1-linus.walleij@l=
inaro.org/
>=20
> (FWIW I don't have any strong opinion about any solution)
>=20
> -- Sebastian


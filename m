Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141D570
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Aug 2021 00:39:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B99E1D6E;
	Sun,  1 Aug 2021 17:39:46 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE9D03F66F;
	Sun,  1 Aug 2021 17:39:44 -0700 (PDT)
Date: Mon, 2 Aug 2021 01:39:02 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob
 Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Samuel Holland
 <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>, Alessandro
 Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v8 05/11] rtc: sun6i: Add support for broken-down alarm
 registers
Message-ID: <20210802013902.7164876f@slackpad.fritz.box>
In-Reply-To: <35374855.gLGPhMbAMS@kista>
References: <20210723153838.6785-1-andre.przywara@arm.com>
	<20210723153838.6785-6-andre.przywara@arm.com>
	<35374855.gLGPhMbAMS@kista>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 25 Jul 2021 08:11:49 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> Dne petek, 23. julij 2021 ob 17:38:32 CEST je Andre Przywara napisal(a):
> > Newer versions of the Allwinner RTC, for instance as found in the H616
> > SoC, not only store the current day as a linear number, but also change
> > the way the alarm is handled: There are now two registers, that
> > explicitly store the wakeup time, in the same format as the current
> > time.
> >=20
> > Add support for that variant by writing the requested wakeup time
> > directly into the registers, instead of programming the seconds left, as
> > the old SoCs required.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/rtc/rtc-sun6i.c | 60 +++++++++++++++++++++++++++++------------
> >  1 file changed, 43 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > index a02be8bca6f3..f0ee20bfdccb 100644
> > --- a/drivers/rtc/rtc-sun6i.c
> > +++ b/drivers/rtc/rtc-sun6i.c
> > @@ -48,7 +48,8 @@
> > =20
> >  /* Alarm 0 (counter) */
> >  #define SUN6I_ALRM_COUNTER			0x0020
> > -#define SUN6I_ALRM_CUR_VAL			0x0024
> > +/* This holds the remaining alarm seconds on older SoCs (current value=
) */
> > +#define SUN6I_ALRM_COUNTER_HMS			0x0024
> >  #define SUN6I_ALRM_EN				0x0028
> >  #define SUN6I_ALRM_EN_CNT_EN			BIT(0)
> >  #define SUN6I_ALRM_IRQ_EN			0x002c
> > @@ -523,32 +524,57 @@ static int sun6i_rtc_setalarm(struct device *dev,=
  =20
> struct rtc_wkalrm *wkalrm)
> >  	struct sun6i_rtc_dev *chip =3D dev_get_drvdata(dev);
> >  	struct rtc_time *alrm_tm =3D &wkalrm->time;
> >  	struct rtc_time tm_now;
> > -	time64_t time_now, time_set;
> > +	time64_t time_set;
> > +	u32 counter_val, counter_val_hms;
> >  	int ret;
> > =20
> > -	ret =3D sun6i_rtc_gettime(dev, &tm_now);
> > -	if (ret < 0) {
> > -		dev_err(dev, "Error in getting time\n");
> > -		return -EINVAL;
> > -	}
> > -
> >  	time_set =3D rtc_tm_to_time64(alrm_tm);
> > -	time_now =3D rtc_tm_to_time64(&tm_now);
> > -	if (time_set <=3D time_now) {
> > -		dev_err(dev, "Date to set in the past\n");
> > -		return -EINVAL;
> > -	}
> > =20
> > -	if ((time_set - time_now) > U32_MAX) {
> > -		dev_err(dev, "Date too far in the future\n");
> > -		return -EINVAL;
> > +	if (chip->flags & RTC_LINEAR_DAY) {
> > +		time64_t seconds;
> > +
> > +		/*
> > +		 * The alarm registers hold the actual alarm time,  =20
> encoded
> > +		 * in the same way (linear day + HMS) as the current  =20
> time.
> > +		 */
> > +		counter_val_hms =3D SUN6I_TIME_SET_SEC_VALUE(alrm_tm-
> >tm_sec)  |
> > +				   =20
> SUN6I_TIME_SET_MIN_VALUE(alrm_tm->tm_min)  |
> > +				   =20
> SUN6I_TIME_SET_HOUR_VALUE(alrm_tm->tm_hour);
> > +		seconds =3D mktime64(alrm_tm->tm_year + 1900, alrm_tm-
> >tm_mon,
> > +				   alrm_tm->tm_mday, 0, 0, 0); =20
>=20
> While above line should work, it's confusing why you're adding 1900 to ye=
ars.=20
> In my opinion it would be better to use same trick you used in patch 4 -=
=20
> rtc_tm_to_time64() with hours, minutes and seconds set to 0.

IIRC setalarm does not want the time struct to be changed, but this is
OK in settime. But anyway ...

> Or maybe you=20
> don't even need to do that, since division by SECS_PER_DAY will round dow=
n=20
> anyway. In such way you hide RTC internal representation detail which doe=
sn't=20
> need to be exposed here.

That is indeed a very clever idea! I changed both settime and setalarm
accordingly now, adding a comment about this.

>=20
> Once fixed:
> Reviewed by: Jernej Skrabec <jernej.skrabec@gmail.com>

Many thanks for the reviews!

Cheers,
Andre

> > +		counter_val =3D div_u64(seconds, SECS_PER_DAY);
> > +	} else {
> > +		/* The alarm register holds the number of seconds left.  =20
> */
> > +		time64_t time_now;
> > +
> > +		ret =3D sun6i_rtc_gettime(dev, &tm_now);
> > +		if (ret < 0) {
> > +			dev_err(dev, "Error in getting time\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		time_now =3D rtc_tm_to_time64(&tm_now);
> > +		if (time_set <=3D time_now) {
> > +			dev_err(dev, "Date to set in the past\n");
> > +			return -EINVAL;
> > +		}
> > +		if ((time_set - time_now) > U32_MAX) {
> > +			dev_err(dev, "Date too far in the future\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		counter_val =3D time_set - time_now;
> >  	}
> > =20
> >  	sun6i_rtc_setaie(0, chip);
> >  	writel(0, chip->base + SUN6I_ALRM_COUNTER);
> > +	if (chip->flags & RTC_LINEAR_DAY)
> > +		writel(0, chip->base + SUN6I_ALRM_COUNTER_HMS);
> >  	usleep_range(100, 300);
> > =20
> > -	writel(time_set - time_now, chip->base + SUN6I_ALRM_COUNTER);
> > +	writel(counter_val, chip->base + SUN6I_ALRM_COUNTER);
> > +	if (chip->flags & RTC_LINEAR_DAY)
> > +		writel(counter_val_hms, chip->base +  =20
> SUN6I_ALRM_COUNTER_HMS);
> >  	chip->alarm =3D time_set;
> > =20
> >  	sun6i_rtc_setaie(wkalrm->enabled, chip);
> > --=20
> > 2.17.6
> >=20
> >  =20
>=20
>=20
>=20


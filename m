Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DF94AF9F4
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 19:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377789; cv=pass; b=j5sZHvfnGfWosPztHl+ORKCgiNlrkmdqjk0yl6PicfoTlUbxm8YV/jGMNK1Y15tJTHvGM1Uyi1wAhos6l8nJ0VYhFM703HefE66SzqRBNsjxO3Z7kihQ7mHStw8vxsFnvz5CitW3R8sfY6Z2Xw9a2p6rjU9RjB6mGszhpdCbS8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377789; c=relaxed/simple;
	bh=+EtTP6H/FtO/OTJEnIc0R8Df83ApwUFjyl553EFOAtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bk/uKeDW5vDyVcJo+yEcmhYKOt7v9CTL2dKzKA1BOTmU9UdFPWvqW040z3g/m3img8UmH7H/Wpu0Nt7Bru5jXHXSxTllJalWyn14JNCeC+pJjH4qst1rFQ5ikEyF4pneSqkqHW+BdDVT+Fkq1ckcZl5XwaHYAYgPnjI09QrUc0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRbH4VNb; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRbH4VNb"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7466771f1caso544855137.0
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 12:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788377780; cv=none;
        d=google.com; s=arc-20260327;
        b=lSJs7nD/okf6VWNgGYohxTWsPKj1XZAO1gEPGkU2qkLKG6VPwZjfmq031koR0rzVnd
         PsSXGp/AkpNEBjGs8mvOKCJC5SBeT3ZgURgSWBqHMXaqdFCxeLtragUwzlNgxmm+4oHF
         r0K+wIKDv2Xk9Exw5r0t/GuWsgLzroMzodmK2SmEy3LoVhG3UNQpgMQs3PrGHGEV2thi
         ToLmIVQTsLC4U4C0vv5fw6wj0qhGOXNqOWdTp9I9G+R3u8OGnM7qoZNrwyy2K/XSnPSl
         a+yCJXSMJqQRRChc1+JdnmD6RV25unBoB/6noXVTatnRgfBzG/q+EZu06pqNym8tiLMh
         HHQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nUeJONOZOXQw27AH5OAmCGkZrUTbVh90RMUP44aKmJ4=;
        fh=rLUvm1VEyE7yOhdzewpg/umnt+ZVhY/hYT30emD/3Ek=;
        b=XOZK7yAGmxvhy9wZjmdWq2QK52er/ksMwVGAGc7pruJkzKXBkM/qYQFpw+D80SjNFX
         lGnUU6ZFtK+s0rVWhqKi9ebzuKvUpO6qRKp/3HK2v8rI5PjKaihFDvWC6r5b1/v8ZIBE
         S1Fgj9IBOuDb2o3WP0kVlyEu7vZ/ptQhlDPSS5E+QSlXRmh9Y0K/zTa82PAqzTVo4ftl
         Vr69LCAzgIaIxxW1TdAmTmzAVSe1PGPoU8GMkjqMmTyoyMdeqo60YF3r0p235hCXs9qI
         BoI6AqCJhMAmTz4ZM0mig72oSlP9z8FijyGI/g8W/5ppxdE+Ek+pruUzjk9EIvFkfsEb
         HgqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377780; x=1788982580; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUeJONOZOXQw27AH5OAmCGkZrUTbVh90RMUP44aKmJ4=;
        b=gRbH4VNbwu2z43h3JBtlis+MVzN6txiir1rvQDRN6iST3M4lQXd+CUzgcRhLpw/v3g
         xVWxboeSZ9HUAQkkeI39f3zq+e7RUlrexeqO5SU/yQS8K1BinxKUdtvuqBTnpvC0xJBP
         NESywpkdta9zb71644zXdcqgIRR/ed2qON+0nAIxM8q+BFoLxRK9LUhuckGFTJJ/trMf
         hv/k8ZHGKueEFvGWLCZNznzaTOxdVDMn+v38jiNfISONcITj+o65Rlvig18SoYyIBT0P
         MM7+/R2qNNfRUzW6UlykfJBx8YjjojDmqIeZShRNH//pJ5C6y37lZfcNJS4dQgC+tRUG
         nQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377780; x=1788982580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUeJONOZOXQw27AH5OAmCGkZrUTbVh90RMUP44aKmJ4=;
        b=pq8x2OsvPyWT8Ldsn2q9MRRsXutvIch97kaoibNQyX1MDJDLtWkOSgLCBtRCzcLBtf
         fj+Jws5pNBjnUgZQ/SvIoL+PVFtZQsNgaPPDLhj76rWu3lQAnl9KqXLesGAbLJsSRsvZ
         1iPxfwBXugnK1+IsegLOC7EfCTPcXz4IIhnHX+zaMgdwWjjkuE75TZKJl8NqYBT++qLp
         TzgK3OYZKv86OzV+4GJznxNHVsHaB4Q/KqL9I94M0/UC+owacD2DzKGKxSiv/te2ayAA
         dHdjf/Cf9d5uHLMAq0oPLv1xrFjBqZhLrY5HiZOavhRi+r9z0pqN0kpjjvyGPfwc2Rge
         lpJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmwXOHq9Sz2tIZvnP+fsUr+RbaUIpsixKsAFiyZvqFIPISMfZioVYMXZP939XU29mwPwYj+TSCZfAW6g==@lists.linux.dev
X-Gm-Message-State: AFuF++nkwtyTzBYNk55wqhMYUsS+/BgTsacjmK7C2frNNHg9o93UjQw8
	Jh/Wh0gtkSqnsAoGR99sJokmcAjRLtDJaqeGpg6o7Y6ZOpOK7ZPfFm0ve68cSo7P52hFuYghogs
	bw2ZaqqeKpAUxjqd0vCxX1pBjpgbGjmQ=
X-Gm-Gg: AYBFou3WZb2HCfGkNoKfMP5HlmheDHyMnGzJQtHjKbYNVm+h0vBr5UZRTdSZJy+GlzA
	sA/is/6SqKkWouLdxNr+apBPTMdawj3v0douYK+OQSqX8IvHMwfWjPik6IR/z09WzVpkP7R//xx
	BwO1lgthxSR0z9BZAiHwwCCGUFuWciXjz2M4GyMSG7Cdb/TxGBkK27scd8dQqYIPY8D+sgUJj35
	kMMTQwVx5Yx9RNRpp0XNfobVyvFXSExAemoiIGmToEQuR3D+K7xTYSI4N38MUK+57u2jRS4X6Mt
	WtRyxLVrrm+5ohcgqSCqOSrV7w8HFmSoBvagzPVJBEPjvmrYBfd+/wkiHPIABFb5Z5F5zOCkZEo
	MkHOpOa6GVfkAs6hx7eIm78/2prMFhVAAknRM5rWFnj0kw8Bzl0ZFRuJog7XA8fbUj6j+YvzDgm
	zwgjMZKqM2jSUti6kV/qDv2xAzooetXaTjPsemTA==
X-Received: by 2002:a67:e704:0:b0:778:5e58:ec46 with SMTP id
 ada2fe7eead31-78a1f1f0bb4mr2338551137.2.1788377779561; Wed, 02 Sep 2026
 12:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
 <20260811-submit-ac200-mfd-v7-2-8b06f552a4d7@gmail.com> <20260902143122.GA2082450@google.com>
In-Reply-To: <20260902143122.GA2082450@google.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 2 Sep 2026 15:36:07 -0400
X-Gm-Features: AcwNN1Xwt_WeKE5EYA94nRgCZXJ8kS7opgPLjZCch4rn9cxdGbvWKIuGY6VRBjY
Message-ID: <CADvTj4oytrbZw9oKzRu=+tL1WZMyscfDvBMm2uK5hhNv8ZxTBw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] mfd: ac200: Add X-Powers AC200 support
To: Lee Jones <lee@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:31=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 11 Aug 2026, James Hilliard wrote:
>
> > The X-Powers AC200 is a mixed-signal companion IC with a paged register
> > map accessed over I2C.
> >
> > Enable the shared input clock and prevent its rate from changing. Match
> > the vendor driver's 40 ms wait before the first register access,
> > initialize the paged regmap, report the chip and package revision, and
> > apply common reset.
> >
> > The Ethernet PHY link endpoint is independently enumerated on its MDIO
> > bus rather than created as an MFD platform child. Keep the regmap attac=
hed
> > to the AC200 I2C device so a separately enumerated function can resolve
> > that device, establish its required lifetime relationship and retrieve
> > the regmap from the provider.
> >
> > Cache only the common page selector. Individual functions can reset
> > independently and invalidate their other registers without regmap's
> > knowledge, so leave all functional registers volatile.
> >
> > Reset the chip during managed teardown and system shutdown.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/mfd/Kconfig  |  11 ++++
> >  drivers/mfd/Makefile |   1 +
> >  drivers/mfd/ac200.c  | 163 +++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 175 insertions(+)
> >
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index e4fd4572472f..cac3fff5aee9 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -205,6 +205,17 @@ config MFD_AC100
> >         This driver include only the core APIs. You have to select indi=
vidual
> >         components like codecs or RTC under the corresponding menus.
> >
> > +config MFD_AC200
> > +     tristate "X-Powers AC200"
> > +     depends on I2C
> > +     depends on OF
> > +     select REGMAP_I2C
> > +     help
> > +       Support for the X-Powers AC200 mixed-signal companion IC. The A=
C200
> > +       contains audio, video, RTC and Fast Ethernet PHY functions and =
is
> > +       co-packaged with some Allwinner H6 and H616 SoCs. This driver p=
rovides
> > +       the shared register access used by the individual function driv=
ers.
> > +
> >  config MFD_AXP20X
> >       tristate
> >       select MFD_CORE
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 72d3944b0ad8..f8101d2a9ce9 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -150,6 +150,7 @@ obj-$(CONFIG_MFD_DA9052_SPI)      +=3D da9052-spi.o
> >  obj-$(CONFIG_MFD_DA9052_I2C) +=3D da9052-i2c.o
> >
> >  obj-$(CONFIG_MFD_AC100)              +=3D ac100.o
> > +obj-$(CONFIG_MFD_AC200)              +=3D ac200.o
> >  obj-$(CONFIG_MFD_AXP20X)     +=3D axp20x.o
> >  obj-$(CONFIG_MFD_AXP20X_I2C) +=3D axp20x-i2c.o
> >  obj-$(CONFIG_MFD_AXP20X_RSB) +=3D axp20x-rsb.o
> > diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
> > new file mode 100644
> > index 000000000000..0964e637afef
> > --- /dev/null
> > +++ b/drivers/mfd/ac200.c
> > @@ -0,0 +1,163 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * MFD core driver for the X-Powers AC200
> > + *
> > + * Copyright (C) 2019 Jernej Skrabec <jernej.skrabec@gmail.com>
> > + * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
> > + *
> > + * Based on the AC100 driver:
> > + * Copyright (C) 2016 Chen-Yu Tsai
>
> Drop this.  Every driver tends to be based on something else.

Dropped in v8.

>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
>
> Why aren't you using the MFD API?
>
> If you don't need it, then why is this in drivers/mfd?

The EPHY remains enumerated on its primary MDIO bus, so it is not an MFD
child. For non-EPHY use cases, the AC200 audio, video and RTC functions
are intended to be added as MFD children.

There are no such child drivers in this series, so I have not added
unused MFD cells. Those can be introduced with their corresponding
bindings and drivers.

>
> > +#define AC200_SYS_VERSION_REG                        0x0000
> > +#define AC200_SYS_VERSION_PACKAGE_MASK               GENMASK(15, 14)
> > +#define AC200_SYS_VERSION_CHIP_MASK          GENMASK(11, 0)
> > +
> > +#define AC200_SYS_CONTROL_REG                        0x0002
> > +#define AC200_SYS_CONTROL_CHIP_RESET_DEASSERT        BIT(0)
> > +
> > +/* Interface register accessible from every register page. */
> > +#define AC200_TWI_REG_ADDR_H 0x00fe
> > +#define AC200_MAX_REG                0xa1f2
> > +
> > +struct ac200 {
> > +     struct regmap *regmap;
> > +};
>
> Why not just pass 'regmap' directly?

Changed to store the regmap directly as the I2C driver data.

>
> > +static const struct regmap_range_cfg ac200_range_cfg[] =3D {
> > +     {
> > +             .range_max =3D AC200_MAX_REG,
> > +             .selector_reg =3D AC200_TWI_REG_ADDR_H,
> > +             .selector_mask =3D 0xff,
> > +             .window_len =3D 256,
> > +     },
> > +};
> > +
> > +/*
> > + * Each AC200 sub-block can reset independently, invalidating its regi=
ster
> > + * contents without regmap's knowledge. Cache only the common page sel=
ector;
> > + * this avoids a selector read-modify-write for every access on the sa=
me page
> > + * without ever returning stale functional-register values.
> > + */
> > +static bool ac200_volatile_reg(struct device *dev, unsigned int reg)
> > +{
> > +     return reg !=3D AC200_TWI_REG_ADDR_H;
> > +}
> > +
> > +static const struct regmap_config ac200_regmap_config =3D {
> > +     .name =3D "ac200",
> > +     .reg_bits =3D 8,
> > +     .reg_stride =3D 2,
> > +     .val_bits =3D 16,
> > +     .ranges =3D ac200_range_cfg,
> > +     .num_ranges =3D ARRAY_SIZE(ac200_range_cfg),
> > +     .max_register =3D AC200_MAX_REG,
> > +     .volatile_reg =3D ac200_volatile_reg,
> > +     .cache_type =3D REGCACHE_MAPLE,
> > +};
> > +
> > +static void ac200_disable(void *data)
> > +{
> > +     struct ac200 *ddata =3D data;
> > +
> > +     regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG, 0);
> > +}
>
> You can't do this in .remove()?

Changed to reset the chip from the I2C remove callback.

>
> > +static int ac200_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     unsigned int version;
> > +     struct ac200 *ddata;
> > +     struct clk *clk;
> > +     int ret;
> > +
> > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     clk =3D devm_clk_get_enabled(dev, NULL);
> > +     if (IS_ERR(clk))
> > +             return dev_err_probe(dev, PTR_ERR(clk),
> > +                                  "failed to enable input clock\n");
> > +
> > +     ret =3D devm_clk_rate_exclusive_get(dev, clk);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to lock clock rate=
\n");
> > +
> > +     ddata->regmap =3D devm_regmap_init_i2c(client, &ac200_regmap_conf=
ig);
> > +     if (IS_ERR(ddata->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(ddata->regmap),
> > +                                  "failed to initialize regmap\n");
> > +
> > +     i2c_set_clientdata(client, ddata);
> > +
> > +     /*
> > +      * No minimum delay is documented. Match the vendor driver's 40 m=
s delay
> > +      * before its first AC200 register access after enabling the inpu=
t clock.
> > +      */
> > +     msleep(40);
> > +
> > +     ret =3D regmap_read(ddata->regmap, AC200_SYS_VERSION_REG, &versio=
n);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret,
> > +                                  "failed to read chip version\n");
> > +
> > +     dev_info(dev, "AC200 revision %#lx in package %lu\n",
> > +              FIELD_GET(AC200_SYS_VERSION_CHIP_MASK, version),
> > +              FIELD_GET(AC200_SYS_VERSION_PACKAGE_MASK, version));
>
> We support all versions, so why print it out at all?

Removed the revision read and log message.

> > +     /* Reset the chip after dependent function drivers have unbound. =
*/
> > +     ret =3D devm_add_action_or_reset(dev, ac200_disable, ddata);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG, 0);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG,
> > +                        AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
> > +     if (ret)
> > +             return ret;
>
> Okay, now what?  What uses this regmap?

The current consumer is the separately submitted AC200/AC300 PHY driver.
It creates a managed device link to the AC200 I2C device and obtains the
regmap with dev_get_regmap() for ancillary package-control access.

v8:
https://patch.msgid.link/20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.=
com

>
> > +     return 0;
> > +}
> > +
> > +static void ac200_shutdown(struct i2c_client *client)
> > +{
> > +     ac200_disable(i2c_get_clientdata(client));
> > +}
> > +
> > +static const struct of_device_id ac200_of_match[] =3D {
> > +     { .compatible =3D "x-powers,ac200" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, ac200_of_match);
> > +
> > +static const struct i2c_device_id ac200_i2c_ids[] =3D {
> > +     { .name =3D "ac200" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ac200_i2c_ids);
> > +
> > +static struct i2c_driver ac200_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "ac200",
> > +             .of_match_table =3D ac200_of_match,
> > +     },
> > +     .probe =3D ac200_probe,
> > +     .shutdown =3D ac200_shutdown,
> > +     .id_table =3D ac200_i2c_ids,
> > +};
> > +module_i2c_driver(ac200_driver);
> > +
> > +MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
> > +MODULE_DESCRIPTION("X-Powers AC200 MFD core driver");
> > +MODULE_LICENSE("GPL");
> >
> > --
> > 2.53.0
> >
>
> --
> Lee Jones

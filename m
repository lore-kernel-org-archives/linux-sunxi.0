Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743257;
	b=vSEYVtcdjCmYGMFpUrdnXxGAcC+R5d1ZXfo7nE+6bxLBCgrWtfnEPtdw3Fzd492MDGUl
	 3bGDvep+95TEUlQ2oYb2EP4uK8T/WlqAZQXR0SvtYZjWQkAymuonK7wlTOG09N62IkpP0
	 Ie6JxcjtgzNx+QtHq0qlte95R/e+gS914fdUWUy3reKj0ovbcwKQHRqhhkEk2TiC1lAcK
	 2R+dvmzrBUkugh4E4IgXydQqjXk/o2p52Y5y0dNtXDjRjgOXDg9s4+Haa905/ad4IrtPr
	 W5E7Wij1nXW9qb+vPre75O3ZyLcLJvfumbF1G+8lQHWUcJAlXBt+zsBgRd8fOAN/5KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743257;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HZ+jIX5P6rv8gqxiLdTITz+Ew8AKgWb8WBEuqi4TMqQ=;
	b=He9ks3FIKwPp69s+kUzIpyzcGeVqoVV1QKtWh7mCABjjp8gXYhUK614whD3zasDaIBBg
	 5kYIwa2kzoZ5L0Ru6jXpyHHijirMy9y0TXrq+JXs8zGBrb/VSVGAKUXan4RX1OROOBU0A
	 r4s661PSEKPoEld5HxeBvD4GgIjRLQzE4/friV4vFVSTew4NPYw7WaAjjTopwrT06LWXi
	 rqWu42sEVKQmPixjPMyWyCV001PEtKiOCUTJseZ0A05o6xIo1g1SlMHP7W/YtMu2jm2Rq
	 kqt60B34ETwRLl1A0HBNuaDfkQdWIZ6+LpQ4Bu4ul5m5iqNQnMS3aMnCZ5KFF1LF/fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bzS6D7vC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C7F606A31C;
	Fri, 27 Nov 2026 01:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bzS6D7vC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973F71F000C1;
	Fri, 27 Nov 2026 01:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795743256;
	bh=HZ+jIX5P6rv8gqxiLdTITz+Ew8AKgWb8WBEuqi4TMqQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bzS6D7vCqRBVh+DFfkxJ/pEqit3az7hXp/do8oPkenlZv2QgaM0AL/3g4R7cEhIuX
	 DDH2psWjK6hOUz+mpJim87yNq3BBTB+nIHJEvK844A5F017hRAOrtIIglsah50mqG3
	 WYvgpWp87PG/deglMvZX2S1PEuG2FgB5bVxDJ6Z86ObxHMD/SlrPXjTC9F6Pw5MvH6
	 Cqp2n4Cwyo3JTLImwKWYK9LhpmMAib7XblJiQotxydD2PAnUCyR8aAchr+ytvnS0Cg
	 fgu61Q8rwQ44+HLcHtDGOlmzPhrtv7XGmSsLUpq+7A+pSh2bZuKA70MToJEydF7MTs
	 d+Q6x5HRtsqtQ==
Message-ID: <sashiko-outbox-236397@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] iio: adc: Add the PocketGo S30 analog stick MCU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Romain TISSERAND" <romain.tisserand@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127012612.1589039-5-romain.tisserand@gmail.com>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
 <20261127012612.1589039-5-romain.tisserand@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 01:34:16 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] iio: adc: missing vdd-supply regulator enable in
  s30_stick_probe()
- [Low] iio: adc: positional initializer in struct i2c_device_id table
  s30_stick_id
--

commit c592863ae00c89b0a1034f60c564180d8b5bb825
Author: Romain TISSERAND <romain.tisserand@gmail.com>

iio: adc: Add the PocketGo S30 analog stick MCU

This commit adds an I2C driver for the PocketGo S30 analog stick
microcontroller, exposing the two potentiometer readings as raw IIO
voltage channels.

> diff --git a/drivers/iio/adc/pocketgo-s30-stick.c b/drivers/iio/adc/pocke=
tgo-s30-stick.c
> new file mode 100644
> index 0000000000000..09a60cb307d97
> --- /dev/null
> +++ b/drivers/iio/adc/pocketgo-s30-stick.c

[ ... ]

> +static int s30_stick_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct iio_dev *indio_dev;
> +	u8 v[2];
> +	int ret;
> +
> +	indio_dev =3D devm_iio_device_alloc(dev, 0);
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	ret =3D s30_stick_read(client, v);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "no answer from the stick MCU\n");

[Severity: Medium]
Should s30_stick_probe() enable the vdd regulator via
devm_regulator_get_enable(dev, "vdd") before communicating with the MCU?

The miyoo,pocketgo-s30-stick device tree binding declares vdd-supply.  If
a board wires vdd-supply to a switchable regulator, the MCU can be
unpowered during probe or powered off at late_initcall when the regulator
core disables unused supplies.

[ ... ]

> +static const struct i2c_device_id s30_stick_id[] =3D {
> +	{ "pocketgo-s30-stick" },
> +	{ }
> +};

[Severity: Low]
This isn't a bug, but I2C subsystem convention prefers named initializers
({ .name =3D "pocketgo-s30-stick" }) for struct i2c_device_id entries.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127012612.1589=
039-1-romain.tisserand@gmail.com?part=3D4

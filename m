Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A813413EFF3
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jun 2024 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717665869; cv=none; b=OymDU4AhJ0P0vZzgbU5AP0a0TMFcxk/Vqe7usqQFrZndv8ihUyg4GVu+SJSwW3nX1Nt1EzvEimWY3G3PBez08nqtSjlEsZKVkTQNkW8jt+VxGUa+FGyII2+z0ZjqMx73SQ9xokUChQmqEFDRzJq6uzLbTDiFZcVvTcsRM31SC7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717665869; c=relaxed/simple;
	bh=udXsNUhcnZ8ynFTNJ+VRVp6bj42T4g0XRqCcuRb5JXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2XRT2PfoO8KJsh2VWVzPQIjtUTxynFwtkA0cJ0OcpyKitP0xz4hHwZ/o4lOiM/unCOKof+girYoqdgHmztkCHQDRoB0EFMKQ8douGJF0JGzsA5WaJWowSRWMIv+kr7fB0N4vyErv55LX3LS7pEVRQ21VjSiT0xFYCjHat9sYp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zGCZkyxo; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zGCZkyxo"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c29c487a94so397251a91.1
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Jun 2024 02:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717665866; x=1718270666; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCgaL8o9gTqW3R6MkCs66+V6tGdqOhyMZityYxhrOKQ=;
        b=zGCZkyxoVSmXr7VCixce3emZzjiPTlVcIgja7vqRTLwE2KyMNCLmvI1UX+TFZFN/61
         upT50DRPltTJrv8vr++lLDYOkEHTPs2EqBbdsRFosn3qTphkuLmB5HeRMPyltE2osHs4
         gjFwTOXhPYsflTOn5sNaykCCCOQoOx2dxePg3moZbjcE1PzRWEZHutTQ3JxMfJU7nTil
         bRKa25xM0pxT+VDYQPeNItguSleKjsDpkp1X4EGS2rNavRyPSIkKK8YDoEC9zA1yMRGo
         Ys58ymIrnUWur/cLiT8QroEp1UCNh3zGoC790Km2smDf1XS1bq2zqt33KXf1JUUXqOxP
         gFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665866; x=1718270666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCgaL8o9gTqW3R6MkCs66+V6tGdqOhyMZityYxhrOKQ=;
        b=q23k0pmgLirVUE4Nn5W17+7r3AYRckwyFzWDCiMP8EyNlPbGvRchd4RoiLWHCX4QRk
         IBW6UvGvr2N+cK2yJXOjz7BJgSYAnmoVtw/FmPT31EkJO+ZxWXQfb5dk/aCltc5Ql7h6
         dSXEFfTxnh+OyUfC3ae6BhM80XJYSuntmawV6LcCykZMvCHBqTTcQs1Q+pHLI2Yz3e+G
         8RJVxf2F++8pUvCAW5dbCPUa6klEx1f/UlbdtC4uq9/CDmM909TA7nzywKiShVIb/w/k
         sE1Zwhm5o0DaebxEjtrPOgUyYCtluk4dzNw6EDOEsrvOdnKqIm6Z0J0VRlRDD2feMpWM
         MQVA==
X-Forwarded-Encrypted: i=1; AJvYcCV0eQAeJNcppkGXXwv2t4sNn4kyhxCWe+iMx7+sWDhHr0e5nR5it5bnBKllcz84b1usDAbcfV6UAyIv8sncMf/G2kTKXYipMROQeZk=
X-Gm-Message-State: AOJu0YxSudRi1MmY5c5n7Cq4e8tNZkHfh1rPQV7cNeTo6l5NcS98jcZr
	vN5Iidsal7bpds/atmZWXbGVfbk8G7jkc+Tn7NFmsz+byt1pF4Zt1gw7TmuZE4hM5pTjIDuZ6T5
	ubq7dwZ32pU8rEJXbqRtkEqn/bCtt/t6+MRdC
X-Google-Smtp-Source: AGHT+IFO27fLQ60otnz+VPqegLb1l+ah/BSl+EBtF4Q1892OcY0hAdcmXoAoiATlOwzJL3jUrPraipj4bPnP8gdWMEU=
X-Received: by 2002:a17:90b:4ad0:b0:2c1:ad46:7133 with SMTP id
 98e67ed59e1d1-2c27dafd1d8mr5026032a91.8.1717665865426; Thu, 06 Jun 2024
 02:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com> <20240605175953.2613260-6-joychakr@google.com>
 <20a9ea0b-74d0-47b2-8dc0-2b5e7d070d38@roeck-us.net>
In-Reply-To: <20a9ea0b-74d0-47b2-8dc0-2b5e7d070d38@roeck-us.net>
From: Joy Chakraborty <joychakr@google.com>
Date: Thu, 6 Jun 2024 14:54:09 +0530
Message-ID: <CAOSNQF3Kes3MHWf3FMCCfNOCvymSZV8RS+UMM_oKjhBQzQz8Bg@mail.gmail.com>
Subject: Re: [PATCH v1 05/17] misc: ds1682: Change nvmem reg_read/write return type
To: Guenter Roeck <linux@roeck-us.net>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, manugautam@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 2:48=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 6/5/24 10:59, Joy Chakraborty wrote:
> > Change nvmem read/write function definition return type to ssize_t.
> >
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > ---
> >   drivers/misc/ds1682.c | 16 ++++++----------
> >   1 file changed, 6 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
> > index 5f8dcd0e3848..953341666ddb 100644
> > --- a/drivers/misc/ds1682.c
> > +++ b/drivers/misc/ds1682.c
> > @@ -198,26 +198,22 @@ static const struct bin_attribute ds1682_eeprom_a=
ttr =3D {
> >       .write =3D ds1682_eeprom_write,
> >   };
> >
> > -static int ds1682_nvmem_read(void *priv, unsigned int offset, void *va=
l,
> > -                          size_t bytes)
> > +static ssize_t ds1682_nvmem_read(void *priv, unsigned int offset, void=
 *val,
> > +                              size_t bytes)
> >   {
> >       struct i2c_client *client =3D priv;
> > -     int ret;
> >
> > -     ret =3D i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM +=
 offset,
> > +     return i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + =
offset,
> >                                           bytes, val);
> > -     return ret < 0 ? ret : 0;
> >   }
> >
> > -static int ds1682_nvmem_write(void *priv, unsigned int offset, void *v=
al,
> > -                           size_t bytes)
> > +static ssize_t ds1682_nvmem_write(void *priv, unsigned int offset, voi=
d *val,
> > +                               size_t bytes)
> >   {
> >       struct i2c_client *client =3D priv;
> > -     int ret;
> >
> > -     ret =3D i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM =
+ offset,
> > +     return i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM +=
 offset,
> >                                            bytes, val);
>
> i2c_smbus_write_i2c_block_data() does not return the number of bytes writ=
ten.
> It returns either 0 or an error code.
>
Ack, I see only i2c_smbus_read_i2c_block_data()  returns the number of
bytes read . Will fix it next revision.

> Guenter
>

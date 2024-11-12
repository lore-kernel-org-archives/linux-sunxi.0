Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC21442F3
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Nov 2024 13:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731418090; cv=none; b=pTknG3MRdLGbiusGHiPeOOktGH8TqrwOLLyRskSbDa/Hi8p/rop8RqTHSfLWlVN/fNpGEB1nItp3s5lJzRaopWMBytB2YlG/AUkn+AW3E4lRNnjsYc4i+nre1k1rWQezFzcWObrRonKwZGkQghKBC2sUKz8ia5wSvyBH0eo5z2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731418090; c=relaxed/simple;
	bh=uuSadX5PVKOtC5uNK1nDK5MZ8cysr353hCL7P5ooP00=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XuQoRTDqyIsJ7E47Tnvz7tLZtowdeuIsgJLbzd4C+pxGXYYWo8COtcKA8pb73G2d1rPBMWzAOS+ghIa1HDQe0AQ4cmpHALFkqhsb8avWI2/tRDnrtRa2HafsPxxeztYxSGC/Zi5vxugHA1N1ycPnyhLS8KYGVaxjeH9VO/oxA5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXGOfy0O; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXGOfy0O"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43158625112so50006445e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Nov 2024 05:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731418087; x=1732022887; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6Mdlml7mvRhIQJi3P6mBQ2xYrATvlG8Nv7RbYSprPig=;
        b=NXGOfy0ORdbslTwzYfFMFuTmdU1gB4uH4pk0LHe/YFwmc9KVSA5bqIu+VNoKylQTEF
         p4H5M9o6qBneWwhLb6tGp9d7/+aNiSUd9BDAYj8Xo2GJuYcUiiY/L/v5prq5zFD5eIdE
         JNXkojN0RWE9AF7BJbMWjZEFTXkXY8nRJV0d626L4lKgD6PmuIDz1AZBulIHuCVWg3py
         plUOHX358nek8iXXyCHVGA8QE+PHagwSHybnj535xGJNhgozECxXDUczWFrC+Ya2eprP
         2/YYwZXNCpuiiwnAxLG4PPc9qHak1OWjM2ISkMqTaHOVSJ07lwKpNplvUYOj/2pkkKiD
         BiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418087; x=1732022887;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Mdlml7mvRhIQJi3P6mBQ2xYrATvlG8Nv7RbYSprPig=;
        b=NhmY8L1EdRUW4bIeDVEFDAnWhC3KZaz85OlLAkgcE1NVmqoHlGtJsNDdQBYAB5jGJd
         rCTZj7abhfWIN/24B99Jct5ILsAc9p8jicyfTLqmt8F19+MuRSyMwk/QIPp/4Oci2SeV
         iFhBxsNGvDILYUn12rxaakM3DAisOp38LVAvDx30n+vA0vPhV5hYkR9JqAgM/2MGv4wv
         d/VdJhbx0PgHo/e5JGPLQqwHAAjVCZ19+Ot+TzMpWgDGguNrQjUrKxUF540AaVibdJWJ
         yoD1ef0akG9f4YXjmyZNvbK1TBdTMMYwl4PkUB90KQBO5wXP+NxLPM/LCqeNfUv3uJ1P
         HDZw==
X-Forwarded-Encrypted: i=1; AJvYcCUMk+CnMJUXkssMShIChp/sRMGduVo9PJdkLeyTzaLKOwSwzx9LNoD9JD/okwGTZb/OvtfK+lxZv2Wh+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6OAiG9m7l7QnCQ5dsP8GrCzoIOKYPNAbnqI3WuVMAC8d9QXyJ
	7gwchG117YHL/OVipgoyBYi+dh6gBCDjU9MQPtojphWkYlcldycU
X-Google-Smtp-Source: AGHT+IHuvmoh+csNe9X8YH1ZqOMhN/s/he+IW0zhFR4Gzg9kg6wzwqnVueAlLrzOkJEZhu46mUzUQA==
X-Received: by 2002:a05:600c:4141:b0:42b:af5a:109 with SMTP id 5b1f17b1804b1-432cc533103mr25180105e9.24.1731418087081;
        Tue, 12 Nov 2024 05:28:07 -0800 (PST)
Received: from ?IPv6:2001:a61:34c9:ea01:14b4:7ed9:5135:9381? ([2001:a61:34c9:ea01:14b4:7ed9:5135:9381])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed987d95sm15591027f8f.44.2024.11.12.05.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 05:28:06 -0800 (PST)
Message-ID: <2a4e69f3ac4fb6cb131735d3cb598223b71bc90b.camel@gmail.com>
Subject: Re: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where
 possible
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, Aren <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 =?ISO-8859-1?Q?Barnab=E1s_Cz=E9m=E1n?= <trabarni@gmail.com>, Ondrej Jirman
 <megi@xff.cz>, linux-iio@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
 phone-devel@vger.kernel.org
Date: Tue, 12 Nov 2024 14:28:05 +0100
In-Reply-To: <4ibd5tgpt3uzbmouqdiiv5pvfxebo5qsmgn3xh6rlb73qevatv@cajznxqnlca3>
References: <20241102195037.3013934-3-aren@peacevolution.org>
	 <20241102195037.3013934-11-aren@peacevolution.org>
	 <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
	 <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
	 <ZzEPACoblmcQD9yu@surfacebook.localdomain>
	 <xubjmxig4luag27ifnmqmv3x3bvzhwczwvw34kw6tssaa2d24t@ysnqh5e3g7sz>
	 <ZzHSE9Nrf4YySJrq@smile.fi.intel.com>
	 <4ibd5tgpt3uzbmouqdiiv5pvfxebo5qsmgn3xh6rlb73qevatv@cajznxqnlca3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-11-12 at 11:15 +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Andy, hello Aren,
>=20
> On Mon, Nov 11, 2024 at 11:44:51AM +0200, Andy Shevchenko wrote:
> > On Sun, Nov 10, 2024 at 04:34:30PM -0500, Aren wrote:
> > > On Sun, Nov 10, 2024 at 09:52:32PM +0200, Andy Shevchenko wrote:
> > > > Sun, Nov 10, 2024 at 02:14:24PM -0500, Aren kirjoitti:
> >=20
> > You can do it differently
> >=20
> > #define
> > STK3310_REGFIELD(name)							\
> > do
> > {										\
> > 	data->reg_##name
> > =3D							\
> > 		devm_regmap_field_alloc(dev, regmap,
> > stk3310_reg_field_##name);	\
> > 	if (IS_ERR(data-
> > >reg_##name))						\
> > 		return dev_err_probe(dev, PTR_ERR(data-
> > >reg_##name),		\
> > 				=C2=A0=C2=A0=C2=A0=C2=A0 "reg field alloc
> > failed.\n");		\
> > } while (0)
> >=20
> > > #define STK3310_REGFIELD(name)
> > > ({						\
> > > 	data->reg_##name =3D devm_regmap_field_alloc(dev,
> > > regmap,			\
> > > 						=C2=A0=C2=A0
> > > stk3310_reg_field_##name);=C2=A0=C2=A0 \
> > > 	if (IS_ERR(data-
> > > >reg_##name))						\
> > > 		return dev_err_probe(dev, PTR_ERR(data-
> > > >reg_##name),		\
> > > 				=C2=A0=C2=A0=C2=A0=C2=A0 "reg field alloc
> > > failed\n");		\
> > > })
> >=20
> > I am against unneeded use of GNU extensions.
> >=20
> > > > > replacing "do { } while (0)" with "({ })" and deindenting could m=
ake
> > > > > enough room to clean this up the formatting of this macro though.
> > > >=20
> > > > do {} while (0) is C standard, ({}) is not.
> > >=20
> > > ({ }) is used throughout the kernel, and is documented as such[1]. I
> > > don't see a reason to avoid it, if it helps readability.
> >=20
> > I don't see how it makes things better here, and not everybody is famil=
iar with
> > the concept even if it's used in the kernel here and there. Also if a t=
ool is
> > being used in one case it doesn't mean it's suitable for another.
>=20
> Just to throw in my subjective view here: I don't expect anyone with
> some base level knowledge of C will have doubts about the semantics of
> ({ ... }) and compared to that I find do { ... } while (0) less optimal,
> because it's more verbose and when spotting the "do {" part, the
> semantic only gets clear when you also see the "while (0)". Having said
> that I also dislike the "do" starting on column 0, IMHO the RHS of the
> #define should be intended.
>=20
> So if you ask me, this is not an unneeded use of an extension. The
> extension is used to improve readabilty and I blame the C standard to
> not support this syntax.
>=20
> While I'm in critics mode: I consider hiding a return in a macro bad
> style.
>=20

Not commenting on the debate between using the extension or not but I total=
ly agree
with Uwe about hiding the return in the macro.

- Nuno S=C3=A1
>=20


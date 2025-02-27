Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CD718C932
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Feb 2025 02:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740623018; cv=none; b=kYK+GfbxT5ku8m/V52gnf94jY+wpwUsQFrSCrZAHbEAr+B1js4YqM+XNW9ZqXqK03+OUvY2lYNvmIH9gvyRQ02JOdTlTZAgwHAfTBu9oz7foIxb41vThBSPvfvUgrm0JqhPNMhvXaeUivFlpgXJySdcf9/KN0q4JFk5Mja7ngqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740623018; c=relaxed/simple;
	bh=ywG/0U98+aIC5AKqx0d1encQ4xe3IFr65PFFIsf8Ku0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTkIaFVGC3krLIA35Y+tDIlwv3BRCDkdZ0K7QZ7RK0F+BuU53Uo+nhFeQowANzOmDVqzRyN+5egdVffJC/+6ZC3E19fB0T7lgniyXGh9PCIgfvtSg5BgJ+yl5/Wn88kvng3VGuk9m9KvdBxWkYo1dwMoYBItQWlMYODpt7tZ7IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=isn9ki8H; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="isn9ki8H"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c2303a56d6so47823385a.3
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 18:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1740623015; x=1741227815; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h4hxIMMVyH7njqW67UfhDeh0ELQ4qvr/ENt+j/m9+QA=;
        b=isn9ki8HhfPh41vKeXYY61Z/TxGqhIP8avVEIRVJ1DVwWekDRLy0qSmz7gWuSVpJsf
         YAlpl1iaAj5B88n8Ih8FfcgjJuyxzaPymhu9kCTqCQ9WngoyP48ONXz1cOI0a4ObSoL3
         F7ZF/iXmdjyrsuUZYtYUfGbjJRXhyMm2MMuJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740623015; x=1741227815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4hxIMMVyH7njqW67UfhDeh0ELQ4qvr/ENt+j/m9+QA=;
        b=p8Kk0fIFyBiWN47QV5KAFM7E9V2aYnspwdKV8nNzHU0DKF88CWvE53OkvtD8slLM7p
         24LiooBFLkGQ3T/qxHHXDxPuJNZyMOJU2oAe4Ofzsz7+DlnRzlJPC6lEGsz8va1T1IuA
         ggdei6HJluF66yeti7gpIX0ql8WbvzKShvRabj2aIQ2A+C34B3ru2iWKWKqf4csgg8KS
         gD90nx2wG94MTangpnkYLkJ+JsNmRkHVG3bkbMWLoE7hbnXEO/k7+55bFU/FNGmgHIXx
         Keiysunn54fAGDCDbaIKvVUPFka2JSW3jokJFGgnuvwxmsAyuYX28Mi4O8Oo4qL55bgs
         qHlA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ2gtlQBtifx7f9EAlYRhd+q2qfZxMlZaHcH3nEmNFZW2ylCGbzY4MKQeMd5SO4t6SvEgKV2x6S3fLJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRlFQLsgd7Pr/eB157ccouzQ+C5CXV6L7x84OsLP7dEmBBA9np
	0DYcI5kU3qskstUL43g/p3/64j/iy7qYuNRAT+iHDcNJ5pmu1k3Hn7BbETy/0GI=
X-Gm-Gg: ASbGncvQ/JdoX2lRLSFUxE46FfUW2GIO3exGzoyWUOy/3nFXEuD/KVvoIC2ZXxxtFhA
	8MYHe/8bLv6WeROSisyc4f4ScEM2YW5C6VWDflkqSNxf2An8VRpBitR4C1y9cVtS1Jrck7x8Sjx
	yyxcDts3vEjxluLguvKYjd7rjOQ5pim1+bNQ4RvoyBD1XkimOPtX50p1b/9BR0HLExPcyR/6h0W
	8uGSj5j7jSwFUfv7NWCEm4NMKZPQAuJmgNEQphuawXqhE5mfOHHNYNJhE9JLtOQVtfQt/VBV8BP
	uP1ZugkZQnaTHjBfG8ksxrk7
X-Google-Smtp-Source: AGHT+IFYTDlnWfvgkPEqt0V5pXELaBFCzehucmg/qPcrcsg5EQhDodP0d92KxbcdyzK5Tx7mC3qgiA==
X-Received: by 2002:a05:622a:1387:b0:472:ebe:a77b with SMTP id d75a77b69052e-4722491ec9dmr379964451cf.44.1740623015242;
        Wed, 26 Feb 2025 18:23:35 -0800 (PST)
Received: from bill-the-cat ([189.177.125.6])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474617b452asm5023441cf.0.2025.02.26.18.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 18:23:33 -0800 (PST)
Date: Wed, 26 Feb 2025 20:23:30 -0600
From: Tom Rini <trini@konsulko.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Simon Glass <sjg@chromium.org>,
	Kuba =?utf-8?Q?Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	"u-boot@lists.denx.de" <u-boot@lists.denx.de>,
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 1/2] sunxi: mmc: Fix T113-s3 MMC clock divider
Message-ID: <20250227022330.GR2640854@bill-the-cat>
References: <20250226113712.1257061-1-andre.przywara@arm.com>
 <20250226113712.1257061-2-andre.przywara@arm.com>
 <PAXPR04MB8459D3EB1E61A160A2C2D78188CD2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oh20ZoUFyzEQFChj"
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459D3EB1E61A160A2C2D78188CD2@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-Clacks-Overhead: GNU Terry Pratchett


--Oh20ZoUFyzEQFChj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 12:31:59AM +0000, Peng Fan wrote:
> Hi Andre,
>=20
> > Subject: [PATCH 1/2] sunxi: mmc: Fix T113-s3 MMC clock divider
> >=20
> > On the Allwinner D1/R528/T113-s3 SoCs the MMC clock source
> > selected by mux value 1 is PLL_PERIPH0(1x), not (2x), as in the other
> > SoCs.
> > But we have still the hidden divisor of 2 in the MMC mod clock, so
> > need to explicitly compensate for that on those SoCs.
> >=20
> > This leads to the actually programmed clock rate to be double
> > compared to before, which increases the MMC performance on those
> > SoCs.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Reported-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> > ---
> >  drivers/mmc/sunxi_mmc.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> > index 0b56d1405be..8f72d758e46 100644
> > --- a/drivers/mmc/sunxi_mmc.c
> > +++ b/drivers/mmc/sunxi_mmc.c
> > @@ -92,6 +92,13 @@ static int mmc_set_mod_clk(struct
> > sunxi_mmc_priv *priv, unsigned int hz)
> >  		pll =3D CCM_MMC_CTRL_PLL6;
> >  		pll_hz =3D clock_get_pll6();
> >  #endif
> > +		/*
> > +		 * On the D1/R528/T113 mux source 1 refers to
> > PLL_PERIPH0(1x),
> > +		 * like for the older SoCs. However we still have the
> > hidden
> > +		 * divider of 2x, so compensate for that here.
> > +		 */
> > +		if (IS_ENABLED(CONFIG_MACH_SUN8I_R528))
>=20
> Use CONFIG_IS_ENABLED(MACH_SUN8I_R528)?

No, either is fine, IS_ENABLED(CONFIG_FOO) is less confusing for the
case where there's never a CONFIG_xPL_FOO.

--=20
Tom

--Oh20ZoUFyzEQFChj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAme/zJ4ACgkQFHw5/5Y0
tywKQgv9ElW6dk+H6FdAVcjJyrirV6NHkiIV84sGm+IFlhB+DF1ff0Jw4T9aFNNP
ZkpS8NyZeKmE96c4i+i4301DW58+IOAXqrr3zgt5rh8+2HoVJQdsM1axa/3QkqDV
+bEqTignm+YKnEWXn+BExlEQLM/DJzAh6NYz9jgpCTwFjEyz1umosUsKLWXJBVVS
iLtRWqkcX7U1D4wfYBDLRHZiC9P6gl2dXpNwyGgjQKFLjSNFyzETGKQ83NkB+E4V
6oZzXcpSRTqT0vmOj8JGE3LDr8IEk9CxF6b0/859ebtQJngaRg+0u01y6vOXL5Ac
jpgY3ngpyym6gQ7YBWE/u3QklrsCvuD0dNJDbsYFgAf1rdXBfnl+pXFE9lRsgpHp
+NdqAMficv9kv0kdMaJe90TJZelCS+cRA9rZLciNm14aXESY4g83qdsqIw+qv9HC
wVHcIgWwIP8Zlq9Q+M35YbHi0vgcLqN1NhtmO/9iNGSP75cWlqjbY4nbOsBnyI5n
uucIbKfS
=UTtW
-----END PGP SIGNATURE-----

--Oh20ZoUFyzEQFChj--

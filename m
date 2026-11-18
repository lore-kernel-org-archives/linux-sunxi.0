Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010806;
	b=sOUiWycbwAIF5Fk7/JgKLu6wSAthYpRQS0CDPq8fuxN8P3/YVW2TMiRkOsYQY9AVKE9y
	 Bb0EXVpopsJxxw/FEg12MeS3WiRnREhI4r70eiowheWYVTBp351+4fXYiLkdVrEiHYZZS
	 FDT13b+xdVDAhDFcS15d44L3Bu3xeV5BGoCn1+ZrALvJguOmRU16YnK4eQ1p04TQz+DPo
	 gvx2GV4MVMUpjmxBhV9gACpwqqRxVwhmiKONyx3aN6bQJlPImG/1k2WL2Jb7CDv88Wbpo
	 lpt/4WvV36txaWcwDXJ51AqAEp5sQujv+P28yYHQg5KfeCaSIOsJmklURx560+2sGhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
	b=g8M+OEVzg8YkmDITFMpYy1lRD56WqOxUedEXv7gcQovhio5GGYVOQ2CrDdqGQ0FNxsQX
	 t7ZFxOd0j4HHiYbRoxypZUBDhulQwo554d96422Qy5NHxGFn3l7n+XQd9MKxqBa1LFa5z
	 oo8ILZP2rRs91HHjg9S3aAEpg1Ojm7xl/2UtuKQaHl6/WjVxRty1+kTjdnkec8u60Wxfg
	 0cQRXvrQMe1jONttc5zHkbtLuO3qxEf4bn+LoCHsB7bdWedXHOe99jouNN2qgjwbxOuA0
	 AGNCBeGLzrk+7VZJ/fXGnpNsnMvRy06PHfEYHPAZJvHTwYvGPWPaIQPprHtCZCqaS1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m+xbdE2k;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946CE606A332
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 14:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 946CE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m+xbdE2k
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so6631595e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795010804; x=1795615604; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
        b=m+xbdE2k5CCVtpBP577o2tkxcRdCBv8X0ubrc4Nn7qvC4s7OT1ONYtLDkxTy81wS5s
         XLRxhavPkNIyPjaAfZ6kanIOp/tyFL/uG4Faezv5bA6NYiFOnyy1oPi3XQBSvAMea7aK
         ltrHwWADMWOV1HqENeFcmmHZOUlHBXT0MtECSc41tppkRmtQbVOd1Iw+W/9bRFPg0xwZ
         AfOa6Xj4i9j5ebEXys5PkCUIFA6nAUcOmu3Sxzy3pFSURiCUsqKkBSDMD0t53bG7ur2+
         ydjYlSXuGjuc7BAbkG3yeDi9kwk4d92sCO9wZLm1CgzZa+DWoaEd/Oy3RS6bWfeG8hdq
         GTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010804; x=1795615604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
        b=Rg9/5UOIamNr4gfuUPNp1THhUcVrF1TVrWPpsjkDMVchIDLwmwbGX8XkzIXGjXreVu
         qkwMS8iNtzPx5gGvI4I4BAIN62+5dbQAx1QpvwpFGAw+HUbuZDn/cmYt56W9EbJZITml
         CdueoEFjD9TaN3feDNz3Lj/e0ihV/GAiM7EbYfdtMF+XJSl11Q4w/vVq9NcPUUn/96il
         /KaiHCBqfy+M7yOEICZNOIHjWTu9tGGMbiHxRVkoApBfzIqPDKBjUGdGMMqfz6Gs3xHD
         J9OOuv93oi3vj8u/FPy9BJy3I3/A3p6oHveJLxvTXwJr1M9n+Bc9CuGeKnbE7PM5k7MM
         Salw==
X-Forwarded-Encrypted: i=1; AL+hErGW7eO6FIZC/6Ty7OLGx5SJtj867S8IKvJze4o5N/fi/XtfJrWo9KjbIVKjBRSX9SKDGKrsjuUuH5Qagw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8lFP0HnfY/8+M9l4uYEsG+i78Y9nhXE1c92KC01PjFqyrv/pF3
	evyLTGaN8dEzwPDbHwOQNDJSoCcxrdcSI1y5zo/TrO6i9jJl2HOSMO7Tm3BGM+hqiHI=
X-Gm-Gg: AYBFou0XUHerMVr0xjQBdvtEMaKzLr7TLA+G7QAQtYGerkrpymT/3JYsjQycuEoH8sE
	JTR9jgo1RlvAzHJSi2hkgzmcd7CqQh04f9tzjrHtv9ogCpUNFUtEG+5adV2J268cLI9PnuVc43l
	sHHn0xf0OSuQRzeBEvYrRtZXdN5sVlTGIr3IeBAhtlc88OQ7WJw44sdWYAlWZ2neZzoftD7rI24
	KCWU1WieAJwlmgsbSg3gQ7CK98UGW0nUqMOAoDg2PACzCQiztASDOzEnUQR4W+2MZq2vRsZoVWy
	hlXFTiJf4MgxNCgiUfFZY31mfxyEysavcJAV2ZDWHtTymneLOnfKTf84xhqaXcGM+wy4z+sMHnA
	aF0Nd7eCzGZwBsqcnRDFlcD0fcX7C7DLiBCmxmgIy5zkQXxs5ORJ+EBnjLbZNsT3+mq3hQtoVeO
	lK9/UsorKPWXDWZSZWL4ynZhdWhfKK78rBpqfXKNDP38fvEaE6yHPndAiTygt1zvYDsrnvW41Rp
	RAQFu2GoukTyZVAwMDdFpEAq5Z0/jCKWy6T9/QgGDF+LYxjtsJVcxuoGH7vQ69jZF48maL5u0Xy
	RQ6NUVofeiBm4Wj8JvtR/y8hxbA5smYG0tE=
X-Received: by 2002:a05:600c:3509:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb7da03954mr52120315e9.9.1795010803953;
        Wed, 18 Nov 2026 06:06:43 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb7d256f64sm61534715e9.1.2026.11.18.06.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:06:43 -0800 (PST)
Date: Wed, 18 Nov 2026 15:06:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <k@chaosmail.tech>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	imagination@lists.freedesktop.org, linux-mips@vger.kernel.org, lima@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
Message-ID: <av2rKJQ0AKU9CFZI@monoceros>
References: <cover.1795002467.git.ukleinek@kernel.org>
 <a2d5ce256b8ec150de4a6494c177b19693a33222.1795002467.git.ukleinek@kernel.org>
 <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5c6ped4sw6nigwko"
Content-Disposition: inline
In-Reply-To: <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>


--5c6ped4sw6nigwko
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
MIME-Version: 1.0

Hello Jani,

On Wed, Nov 18, 2026 at 03:27:40PM +0200, Jani Nikula wrote:
> > [...]
> >  drivers/gpu/ipu-v3/ipu-common.c               |   8 +-
> >  drivers/gpu/ipu-v3/ipu-pre.c                  |   4 +-
> >  drivers/gpu/ipu-v3/ipu-prg.c                  |   4 +-
> >  254 files changed, 1155 insertions(+), 940 deletions(-)
>=20
> How do you expect a patch of this size be merged?

Using b4 am :-) Honestly, in the cover letter I wrote about an immutable
branch and offered to rebase to 7.4-rc1. When trying to apply this
series on top ov 7.4-rc1 there are only 6 conflicts (1x modify/delete
and 5x content); these are all not so hard to resolve (and even dropping
the respective hunks (i.e. resolving using `git checkout HEAD`) is fine
for me.)

> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i91=
5_pci.c
> > index 84a7dc6ab5db..faceb3de4fa3 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -870,7 +870,7 @@ static const struct pci_device_id pciidlist[] =3D {
> >  	INTEL_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_info),
> >  	INTEL_ARL_IDS(INTEL_VGA_DEVICE, &mtl_info),
> >  	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &mtl_info),
> > -	{}
> > +	{ }
>=20
> Personally, I would *always* use {} instead of { }, and would rather not
> change.
>=20
> Across the tree, {} is slightly more common than { }. IMO changing them
> is pointless churn.

It depends on how you count. My statistic looks as follows (on top of
next-20261117):

	$ git grep -l device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/devi=
ce_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | sort | uni=
q -c
	      2 	}
	      2 {
	      6 {  }
	   2598 { }
	   1262 {}

So over all *_device_id { } is more common by a factor of > 2. This
series fixes one {  } and reduces the number of {} by 37. For only
pci_device_id it's:

	$ git grep -l pci_device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/=
pci_device_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | so=
rt | uniq -c
	    159 { }
	     32 {}

Without the context of an array initializer there are many empty
code blocks (function bodys or `do {} while (0)`), empty dt nodes, and
{} in Rust code, which IMHO have to be considered off-topic for this
statistic.

Best regards
Uwe

--5c6ped4sw6nigwko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr9sOcACgkQj4D7WH0S
/k4vggf+PQfM4MkbLgaQRCdXRWWsc4/Fa0tTMBQAl4gjx2p5NE/N7TDUO571o3+N
oWcelzY5O1uRcc2qHZVnu3vAxFqzk4YHfGjsbGHsxQAibxnIFW7ttYTzt0w5a9NH
v65V6+sebCdwLrPVE5ilcqzFFSgmnv1wTNm2vCEUxdKGacifySaGRmg4+ax+fLb1
CL+RS7fM2EkQxG1k4iDEPv1Onrm9S4DtwTts0wxkK780rWYD9FoSLjHyX/x21Y8x
SZKaXeNZlxtHJpQLq8ub8AL/t6k82nC020wYZOUbUmvPyqxhNoUuuS0/RVlz9xT6
kXiliIwWzcMtAKt4ik8nbTRO5JERhQ==
=0alU
-----END PGP SIGNATURE-----

--5c6ped4sw6nigwko--

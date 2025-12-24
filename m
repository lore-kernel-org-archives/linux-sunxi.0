Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205422749DF
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570325; cv=none; b=MFyaPkU7LFQwpesnx0wUAEQplwlVNA6A33pS+3Zhx2xMK5qr00nohGKD8JTKJXd0/iloNI1pSy6AXTeZLr5Dw0XKu3HDmuauPG2qDi74+0281PrHpECXCTvJyR14bxqAesirVvoBUEGCwlJ7PHDsYVlWu72Nw45ouaP4Dmm8ljw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570325; c=relaxed/simple;
	bh=3W9jCb+QmhgFO07BnEKeRfiQa/LuwbGaIH7AYV4ri+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAj9PWz3FcktdYBo1yfevE7FKCMYIQKIZ/tGVs6aNBYWSCsFKGlNmU1akVX1XbUd4Mj02PumE6VZB7uOoC9riOufElc7kOycqUg4X7WP45oQrZCrXQgWm725soHt6g79+USJhwP6VNAAPXrYGFqSbxmL90O8cgbG+LqO3421l9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tFXwO2Lf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tFXwO2Lf"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so896495e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766570322; x=1767175122; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3W9jCb+QmhgFO07BnEKeRfiQa/LuwbGaIH7AYV4ri+U=;
        b=tFXwO2LfApTuT9qE2DX+gHbR31Mp9U+SfB4UAlxMgkaCjK+L48uehqCIKPwy8AWGFS
         WmcP3OzDtjl7f1ra4jA1jFKLQ6RFA9UQcbd6BGsWeoola3ZihOk0YwKuB682g7EKSDv6
         IxnxflFUqQQ4fror1Pz6k67ezWQvGgoAtphG6/S6Lr8ckKq362Gzu2IjS0hRLJv0DW6i
         2jDO14kHeHnHrnQ2EkfWiLetxMpa3BvoRDjUfb5VfZiSBP4Zzwd9RmVfn9qFFr3bvc3y
         iGAl8ULuRGooXLsiSTvQlWFb9Q2k1nT3Rfres1m28hBzZtvCk7mvkAbSnAhbAMLCn6c2
         ih0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766570322; x=1767175122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W9jCb+QmhgFO07BnEKeRfiQa/LuwbGaIH7AYV4ri+U=;
        b=uk5/V36ztaBrvztVb++mIRTS+emiNFpedeR+snATGy81/tAkuCp/BPuW2tcBwD4KnV
         kHAVpOGy5DfLJWGjuqRbFfTlKmdA/TkGZIPU885511hd0fP0ee5fHuhDD472dxFtcqCO
         S1Og1NGAKJ9tVuw8IBz2ox52GY6IsqZzkCO24B+SxRX6G00/zbl5muRMJo0iRJNLUA+p
         1KzvgejzSwd63JEIU3dAj+mWQ7NPEGOMLdwfba20C73437qAKQxV8fjJHEblNUf7ouFK
         n4v1yotHRV1CvckZwgYvNHkroBFYbmH3v1oY112Kdto7z/yMNVpiUev3xogZzxJsSdU0
         Q5yg==
X-Forwarded-Encrypted: i=1; AJvYcCXeN+nFihZb5gaS49MTzTum1iUNggSM1eN/XoMtMAWrfgT021W96gn7U8NfTE5y9tz7ueXI84pGyYoFsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaFMrAaQuDl7p2C6/hF8pd1RjEq8Z8LR/SN7vnQrTrdFEkPg92
	NmNIM0AuTzeXLsVU/CSX1mlSTCMM0PdMuTma5OsSxQ8aokQHoM6MSKXVZ9PyH2J1Zxw=
X-Gm-Gg: AY/fxX7T1WTgatBBAVZ96fp3aANKsD6CIEKfYhEpPKzwvQIYKTvvf1AfomqlIgOFO00
	Qy33paiLMTe4biUeEdoyC+wFs30X0DNhhI/hVInLFa7HaaQXw0cukh4PPXRklzPHhSLMjTiMFvw
	zI+Zl23k9ZPWw65eU+OjsED3tp6iIVr1F8FM4c6lrxr51yFcueKZsnBoj0D4pxnsrdyIlcDZ7+2
	/VA2TmnyPZCafBZ627as1fXFYyuwwHzO2GdwKdzZTfVpxQ/aM7BW94BzY1okqNv9Wi5Octt7UJj
	UFaJz7rXPyZjq7NRpuyDPXCgxM9Mgms2WtnU9TcfwNEpgVoGr+0qp36TGNXu7roL0A2rZOEaX2e
	iuYKOkxPkJGEohekgoeoYQKnVFNXZ0xXx7jEj37e6cVGENg+Rdt5u/ybIyxRV/PgvmAjYZeuwqK
	YqoUWRl9n49b7sot4RHI3gVJxgkGEi5Hry0Q/pxwX/Z/G42HeD
X-Google-Smtp-Source: AGHT+IFfcuTV7Ug+hHX5tZTCG4tq3O4PaTRJvfFv6G9+yLiBklGAMOZE/zio57FP/aM+ckx9YK7JaQ==
X-Received: by 2002:a05:600c:1988:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-47d216f9b5cmr104213055e9.2.1766570322064;
        Wed, 24 Dec 2025 01:58:42 -0800 (PST)
Received: from localhost (ip-185-104-138-126.ptr.icomera.net. [185.104.138.126])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47be395d9cfsm138801615e9.0.2025.12.24.01.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:58:41 -0800 (PST)
Date: Wed, 24 Dec 2025 10:58:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Richard GENOUD <richard.genoud@bootlin.com>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Introduce Allwinner H616 PWM controller
Message-ID: <5ih4qxr7572x6fakxjsx2vrxnt3yey2dtvdyaiwyuvulivh3ef@hebpjfdginev>
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
 <6113404.MhkbZ0Pkbq@jernej-laptop>
 <160e221e-98a8-4097-8340-94ac7d208136@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="isiyzcztmhye4ftq"
Content-Disposition: inline
In-Reply-To: <160e221e-98a8-4097-8340-94ac7d208136@bootlin.com>


--isiyzcztmhye4ftq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/4] Introduce Allwinner H616 PWM controller
MIME-Version: 1.0

Hello Richard,

On Mon, Dec 22, 2025 at 10:17:07AM +0100, Richard GENOUD wrote:
> Le 21/12/2025 =C3=A0 20:12, Jernej =C5=A0krabec a =C3=A9crit=C2=A0:
> [...]
>=20
> That's why I put aside the pwm-clock and I went for this instead.

I havn't tried to understand the issue in detail, but would it help to
use assigned-clocks to make pwm-clk suitable? Assuming this allows to
drop all the clk stuff from the driver that would we very appreciated.

Best regards
Uwe

--isiyzcztmhye4ftq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlLuU0ACgkQj4D7WH0S
/k5ZeggAmSXzq+7SM5fhXqm2YGPnsK8wxgPcAF1ZdU4MGph24TU4R91q/56X2Ayd
OUxDHsO4bEZXGwd0taoVdkCJf3WcDipjGJ+lfKgRCT5569BE5seDZDASgIlnPu6O
ZRog3BGrI85GM5Gq/sG8zpiqdbeK2/49huTSo2VRN28+elurTzP7MXMEVdJ4ZLPR
fmvo/ERCkz4giB8YgjM75WsImYiEehzraLTJ1EXhBq5WxbqMMwEKy6s7NT6t5H1+
U+/8buxQllY52OKOyqLBBWbQpaAqSc28evvjUOikxuLAMk/I2FbPHnDoJRUz7GRO
Ufu2ihMbS+cRebq2spwZSq1RoiCx/g==
=uvSc
-----END PGP SIGNATURE-----

--isiyzcztmhye4ftq--

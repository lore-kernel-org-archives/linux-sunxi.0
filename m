Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769256;
	b=JuD9IRYmqgKnEXv/9VH/9BIBtCLz+gar59MFgD/z3bzxysIQWdxkRm9nZHh9k3J99Upy
	 KWlZWfE1OlGGz8dQApR5ZhRIKwhMoUF9N7b20adTpongeG5mqGQnwm0YCHg1CKmePbKC7
	 ufIgqfhUUs7yqL2TAwjwZ/eB0f+Cu//bNs1l0VaShDj/yzgD6z8oQFF9BOEB3pc6sBIWP
	 OAreyXMHCSvsnt8FKNGb4oWt9T+RkkgD/Q1DS3tprknuA3k80Km2y+ULLNmThNbj2OyMS
	 zu1wvX6DGyqOK3g6O8Qjid6baLi014f/r8Rk/3tNavtmJkGKtmtFTVLV4bZDVIVwlrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hFWAeWghUobS1SNh2HR/z8yfcl8Q4/5YjOR9+nLiaM8=;
	b=kTsjd1ppoI4Q+i9EAEKoGhJBIHn78Xky/xuApTpWiIIqYokg57uDwFinhoyTZhU2ADUu
	 wBU7ULhgC9tp8MecSHa3YNJssXamTY+hzDaihQ6nT3qzRgIDHDsRRrRPL/4TvGVH03uaS
	 DYj90V5YaQaMLccm0rndzklwMrAJYoc0jm9m6Vl9BIjRc34wbm2np7i7h/0hYoc3Zw+de
	 kTrN0Lu6286mEpZZeeIFkyV1zQAlko0tGfe3RIXPTDHlqcQK4UU/iuPa7kpLM9pvkhq+k
	 5ptlVHEC+zl0PSxtdRt/Fj9Yy2dGOlNNcN3qUTiNyfrnjq6fsYcA0qR0hJlnm7Kgdaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=icK5eoNv;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E71606A324
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 08:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E71606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=icK5eoNv
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so82956425e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 00:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769255; x=1796374055; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFWAeWghUobS1SNh2HR/z8yfcl8Q4/5YjOR9+nLiaM8=;
        b=icK5eoNvIW93ZiAYSC/tfRamK+jw1gY0h6s5zno1ZC7ds3M8reGOZ3uozN5/r8y4l9
         Sht6o7Erah1vzmcVHfe/QjGS4r+k14pIQo0LQ0y2lq5y4dDzHif9qq+fwxOENNBv/IYG
         pVtVzvSZAjU5Ri7Tn2hVE3zDtdZGynqgPIZEJ4UtgnLEHCJPBhc2D5AMPxPINVpBKJJk
         hcY0fnBOxJMWO9FLuX62fVsXlmR7k55iF99e/jvMdYRlHeg9lU1STXaJKElCqtTW2sp2
         4OgOb9LRu7QZwzALmby9ZUOZSYysSgEBwcOI4/GYpCZXS+TEH9WFMGzgSD/aL+dN5TWf
         zVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769255; x=1796374055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFWAeWghUobS1SNh2HR/z8yfcl8Q4/5YjOR9+nLiaM8=;
        b=k3noF1xgYpi4eKWO66w/of/zww48bS3AIePA6lU74yunLjIpdBQs1SjFBjh58kTGcD
         e2asRbX0Yc5ZFbt8SURXjvzJezrSZVHjNpNLTVBT/f90433jleuGecuj0iidR3C16Enn
         Q7nHue9rF9KJ5KKmQj9u92/i6jximKlVUEwjsXZWxCzKH5GW2hMKfnGq+5AWSLZ5qEFS
         TIw2bGdQVvKbx3R1/Ok4R7u5EYRLywdeO84LFaGp9nMJwfGC1gdqokKx+Uq09IVhcSbl
         81FiRePfHKsFAWV9ga4Os6mX9y58wBMEFJrFoy57EbFFc8nja8lxdPrEOg/tErxdlof3
         Km8A==
X-Forwarded-Encrypted: i=1; AL+hErGhz6YqMH05Jrg4aHO6zrVRw2+aOn3O4VbmJkUm+K4nFo3WxNnw5/3Cs5RnbWL6DFAYLZ4658y2oOm7PQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/l/5lknmmOT7qVmsJH+qLp2l4ALFur8qBBGEpeDjcVEkmujl8B
	qdzk3Xn1sPk+EfBKRInv36wpgjpDDznBHGlsjM3sl3Az5QUs0Ha3DbQnHc9ZI1+14zo=
X-Gm-Gg: AZFdTZfBA0N1Vkyfm3GxXDsdnGXYDyqU9gbBCtu2XbG4zj4Qn7f2uEurMZspjlqLYHp
	u+8vLp/WQqBeJbIcYIYskNyUl7dLU2iXzmudUq5texLhpQRIDOy7SLoda0vzWjhG1xxjVk5rs36
	zA6e8yjpI6085Iv/svl1pCGcyo+Jd7u15CsM+huEDDJq9W7Y42boJizG9wo//1JDcEuy5EicAjs
	DSbgACRr/d/56TYESCy5bF1IQ/kDB1qASf/7/9U/PBd+xOVcZSJfUv7J81x19BdwaKHAIrcBWa9
	8Rs2TUaDxo4l1jmFvR86F93sFbam52CRODWJeIwcG3WO/xsV2WcOnELGaRAZAd9Kxk+29fMf/7N
	XZfmroJTtTLzo7gxLihcHsb4Lg94FqDv/XBInlao2c7U6bt4h+gY2uAbbCsORYjEm6KZec4Endl
	o8W6our2CS7MhWna0ACcFOaMI1lj7QYcug3xcaD5j4GGinWq+pP3mYNquUzAU5BpgKiV+qq+GeH
	jhHY+LZ6Lq+q2/ryl5zXD1Sf/H8UC/qQ6qo2vj+Hxwu8KcCx5k7N/20+NeXfXCFIyiaLZVBlafY
	WZu50g1vBoLywDuvgYHK1muVqwiq/YmkNC18Mn3uJ97Sk2ozlg0CVb+t34shFcGsQigpSEcJZzV
	QSDGQkOng2ancgbnb
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr460696165e9.31.1795769254732;
        Fri, 27 Nov 2026 00:47:34 -0800 (PST)
Received: from localhost (p200300f65f19a90496f529fbcf0b312d.dip0.t-ipconnect.de. [2003:f6:5f19:a904:96f5:29fb:cf0b:312d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884a3a3dsm662489995e9.10.2026.11.27.00.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:47:33 -0800 (PST)
Date: Fri, 27 Nov 2026 09:47:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 2/4] iio: adc: Add the Miyoo A30 analog stick MCU
Message-ID: <awlCneo6rrSJPgky@monoceros>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
 <20261127012612.1589039-3-romain.tisserand@gmail.com>
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
	protocol="application/pgp-signature"; boundary="kmxikfi6vr3vqamf"
Content-Disposition: inline
In-Reply-To: <20261127012612.1589039-3-romain.tisserand@gmail.com>


--kmxikfi6vr3vqamf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/4] iio: adc: Add the Miyoo A30 analog stick MCU
MIME-Version: 1.0

Hello Romain,

On Fri, Nov 27, 2026 at 02:26:10AM +0100, Romain TISSERAND wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/serdev.h>

Please rely on <linux/serdev.h> to provide struct of_device_id and drop
the include for <linux/mod_devicetable.h>. The latter pulls in several
more header files that are not needed and that introduce build
dependencies that are not needed.

Same for patch #4 with <linux/i2c.h> providing i2c_device_id and
of_device_id.

There is no need to Cc: me for new revisions of this patch set.

Best regards
Uwe

--kmxikfi6vr3vqamf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsJQ6EACgkQj4D7WH0S
/k7MsQgAmXkeM4wMAFcot67XUVVbBIBHe14nNZchUfh2WmvpAi0XpKPNzsTIHhjj
/GUImj+kXS7eSvVQxGljXF5pczIDQsuen39afEPHvvhSyg6oxGFTEXp7SfEeuHAD
vg+2SwwGvurRKj5+owpBWNRDeCDTZnwZratfLSZdfT9kL4xjk49xBptg1K/Ev1GK
oz7iX7B2LJSQr71EV4/vWigA10VXxR6nsgBwhKbQmBLv3jBGoiU6UQdZ/O/BewLM
kvwT7M6MH34lt3X1gC97PXjO4XwqYOdg4tQG9eDWqJ4kh4TUCIKB03AzOEGJ8n82
VMq7sXMm64yM6YZAUq6tCbzxKjFNag==
=yo0y
-----END PGP SIGNATURE-----

--kmxikfi6vr3vqamf--

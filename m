Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC641F4634
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Jul 2025 07:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751356683; cv=none; b=ooAQVJ/n/Gvqyd4XSMWO5BPSp0yrRMRidI5qvwDZXrttUMyPoz/p7SdbG725tCgHYuuEMkii6ulasEI0lunfSi6i8HR5BkbF0mGWv3s3KVo8aoCXv5xZpCqeAf0n3gHti7tj0vFWs9keIeyWozbMUDIe9WJ3vG6EN21rwCik1hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751356683; c=relaxed/simple;
	bh=0fGtepblwK+PwnUbRqr8IJdvtvAvDr3iEbtu2aVkHEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NO2pAMAYxXoasM2oBoqfDgISN+bH+LYZOzLOrj/ArPVo0vDk3KVaD9FgSzBj1CtFYVm/3uOT3KkWh9GX3N85IaNg5w7jOG0A/i/RjbUhQtPEdSfdnPkIqZiYCAugnj7f/hxC5N4RWezcfrnE4pih4JwEWxXL7RXuNHHsD0W0+LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dds31DMP; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dds31DMP"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0b6532345so1232965566b.1
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Jul 2025 00:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751356679; x=1751961479; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0fGtepblwK+PwnUbRqr8IJdvtvAvDr3iEbtu2aVkHEg=;
        b=dds31DMP4vdg8BTmCJ3SvF/363k+XEi7fa7eQEcM43MBnoInnkfQyAnoruwODGJg34
         T/vZY+Rb46BPRL63zXG3bxPgXAFp8pprKK84VxLlUkkCPhldcVJ2TyInPmb+DsCHAYqn
         CZDyBXzM3vo1/mL0MGqU/g/N1HdZBKNXCAN+9yXPsZoPybNeRPbEaNHZ9q2NJyhGGaAA
         GecI/S6baM0l53VTO0y4tJq9v9PhxS+h9pKaFHQ8RzSaC3SE08pAvCp0VK/J0k6aF8M8
         s3GByQAHojex8ujWC3QSLN7LISiXDAEipI9iIr2I4HE2WYAmHF1dcBQXf6hZ3uI9tq6u
         FvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356679; x=1751961479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fGtepblwK+PwnUbRqr8IJdvtvAvDr3iEbtu2aVkHEg=;
        b=ak46fzF+j6lo9Zh5Ci48eZTgUKGexHsDZiuyMtzNvZY2SacuxK6Y/lL/mqOwfZmKtV
         KL8g9/E9kELWT+XaBKGoZVdG6B7xu9tPdl/SmVZrtpb+6MwSuHKCMW67/nmLrNK3pB3a
         uoKiVPpfI9PnF3hpp+a5eVq5zhYNd8mJQJnEhKrjHApbK/mt7ntntUSuXvN8HKS75tTi
         cvo6LftEt0VLk/Ws5YCcSUF9Y2Zq/oqgp+inBee7NqcG6npjqXhacKJgfenUV0eygmtZ
         GFUh3HSzjqqQgbZ0YY5YW39dDmjkQhBNJK8vh0285nA4bHpRAmYrevdqvsmqckQ+FC3r
         JjCA==
X-Forwarded-Encrypted: i=1; AJvYcCXkKZFqMb+WfHsGNgMijiGCOdilf2SFYi2nifCkPWU9MU8G1SbHnNYdqGkMbCufQzAJ3KH98sZpNnsLgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxS6Cr+NKDwh1JREbxPGyHF0Er8KVXyVhVC+uapMgZrjxMNqQNr
	P75KiS7ALM1wHOl5E+rlcKZITkcDjO00x6Vrp5dl5b8ZS59LR7gDdlcmkTPHI+y9djw=
X-Gm-Gg: ASbGncv61UK53F9s+7FhuwjGhoDZALriJtDN2SozPcSsHED3MEsrdp4Uy89hWUuAism
	aL0RjUXrGP10FW+tVjAELSNCvaqzhyahVbKbatuHteOVfMRrptSruTFX9L/IkfUYbqto9GdS/O6
	9eFrJPBuU5Q6DbsLtbBRCo6Q3McE75uEHMKufHzhY6zxjcmHOHJVplmtQQASMePIRAU8VlqA0ba
	Ki/v5LNGd0jEkk163Fs83E2Jh4kHibC/Ddq1vtJU8QEblt66C5nCMYkb+nAJakTx+RuExEY9JJa
	dITXRKXDQoWKI3lYPIyGWeoYZ/Uj1R+4PosS2ry5LUxZ1b5wP3WhfSA1/Jdnj4niYoRezKOtkTZ
	+Y7mEODNdwJAwCExMrOIhb42Z4WYS
X-Google-Smtp-Source: AGHT+IGGrCAc15VHtma/sGYQ2QD6trb1EHpP/JN8l1psGDWhOW7Eth1ZId1p8Z9JxXzDyNqdoc0dkQ==
X-Received: by 2002:a17:907:3d8f:b0:ae0:c4e3:e2e8 with SMTP id a640c23a62f3a-ae3b0b8fa19mr136200866b.28.1751356679310;
        Tue, 01 Jul 2025 00:57:59 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae35363a172sm808993166b.8.2025.07.01.00.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:57:58 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:57:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	linux-riscv@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/8] pwm: Drop local locking in several drivers
Message-ID: <wzadx2ut3wjm24bw7ol4qjjeku6f74sp3tovtexs5w62ljesid@n7d2f4uzga6b>
References: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dvqu3sv3rcoezsre"
Content-Disposition: inline
In-Reply-To: <cover.1750788649.git.u.kleine-koenig@baylibre.com>


--dvqu3sv3rcoezsre
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/8] pwm: Drop local locking in several drivers
MIME-Version: 1.0

Hello,

On Tue, Jun 24, 2025 at 08:15:36PM +0200, Uwe Kleine-K=F6nig wrote:
> some time ago the pwm core implemented additional locking to protect
> lowlevel driver callbacks against driver removal. A side effect is that
> .apply() and .get_state() are serialized. This allows to drop some
> locking that is now superfluous due to the core's locking.
>=20
> I identified a few drivers that are affected; these are cleaned up
> accordingly here.

I applied these patches to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
now.

Best regards
Uwe

--dvqu3sv3rcoezsre
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhjlQEACgkQj4D7WH0S
/k4vegf8DgkQ0a9kQ5LjlzCtQA04Tm1xfeP7UVjfQXVsJkkBcOU4mfdoSrU9tfno
BfO6tWeFYcUdJbCAPLDW0rtt/PLGq00m1Ti+DotG0ys5XYfE4C/L2gEcEJXEWdh5
teuOCdBWo55vAOj0OT+fFWSagAH5t1UJvOiX/XHUqS4do4wNVCUDo3oCG94zvqRo
t+cSZpO8iWlY+qK/wJu7rClU87CHx+WgtSs+TKH44z6SV8chWe2sh2a8bJzEYjLf
oCP3jZ6htcXuYiqQEyxRtyzYPvV7Uhy3tnshs2tS54Pyvgs6hYa13ZkPU9uSa154
6kyYGeshrOV0IJSJUvGmR+mfNO9lcQ==
=GkCe
-----END PGP SIGNATURE-----

--dvqu3sv3rcoezsre--

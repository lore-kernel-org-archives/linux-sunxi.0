Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4F91FC7C2
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Mar 2025 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741850367; cv=none; b=bPXJHZHpfGajt0wVFJoW6Ot+5UXfP8dfEZtBNQ+DBKbmAanz8DSXbrWHVcYc5tYbW15OTtLk1BNIE3H7q5iYYda0kDIp+6HFzwvV8UtEdEiwwphxey8cv6jucRU89RlzbPuP3wW35jLn7hAi+6TjGRxkE4WeoZDiad1RRPEo/yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741850367; c=relaxed/simple;
	bh=Ybr4ppd4ggfhezGrA8SGEZN+uoR4U/7erGa8s7nsu5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlL3Ymr0ELMFVStbpsC3jxD75CqroRkHqKaZNSbk5X0RrEKxXbBm3HIUOFfhxzDHKsvCGU7M9qZZqPVfteegCoQH3AaDaaVMZ7DN118RXV4uc/sVf/DMBLDnQQZ8RdzVTahq1aEIMwKgeVQIA+vDcLUXYjRrDzDAaVebS0vy3eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxIRCOPa; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxIRCOPa"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549b12ad16eso694750e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Mar 2025 00:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741850364; x=1742455164; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xFwqzBXDybwuD2vjc1RKwbgfdx/o0MRc2L5yNvshUHo=;
        b=lxIRCOPavkhEMs9oA1yd8/zRhFLVz2zwHJ6O/p4tUNNwlnfs1OSSOu/bDc6qPUJhgI
         +c0S5OOAkci4FcoV8QTPvpv5cke+S0vWAU9bAHPmAtAmRRNHrIVNJy3NDw/Xsj4lHA/P
         EysIRNIorJjTNncMVJjvswT1Wg2IEjvJs3+v9xWM06+ZZkpO2Me6OVlG12z+aaDrHiNa
         Kbw8LPEtF232wvUFb30oHG8r+mB+92gmC0YXhGL4hqK1B5SpddlftnWm0Sr+JzK10Nlr
         MamOerhbQaiG+nIapVPFiKoCgYwx9Y3CWiHNC+ym14PIhhaGFzHUQT5+V3KhG5vNyAal
         qCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741850364; x=1742455164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFwqzBXDybwuD2vjc1RKwbgfdx/o0MRc2L5yNvshUHo=;
        b=gRoWmKffy4wt5i0uIMxhII0/6Iora/Pf2PriWpRVmhhds02WLih5PaDUTkg9ICXeky
         Z5kfiTkY8+5ddeGu4PFQTl9Hd6pQiA3sYHaTwCm9rVg1UhPrbFH2Kz8/tvqsVN5PpcqO
         AExRGuBd4rPZVrUrPjuRQIeGU5dDYiihKcSdf04j3Mlk/+jZpCf33+q/29++Mvljz0ck
         u69E1TtxFpTw0USDhZfAtcd33vXYwGktYpEykgOKaJb4r0Qaq4GmKd88bqil9wluTtjX
         +ZtqGnz0nvGxykJCTBXduDZVnUUiHjYbCAJMvZX745LJJpUefNcvBRIfWyk+Srhjee5s
         PtHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz4VAxQyCts+MPsNkIARlYHRwwX18q3q7BPgECQ/pJf7NjNVTgxnJ50ztecVfo+iq/93/KjvegJatoCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3P2qwd3mZA0rHTvN3bGIHioXjBTFdMFXyLK5psMAr2kZLPoIp
	y/i0uJKZMm6u6Qf9bhamWaA1DcuAgxA2HxHAO6sxaYc+vNR/oaQw
X-Gm-Gg: ASbGncvEYvBV6xMPPNyStrnppHx8up/Db8cFUc1s0gKj4m5jy9V5PAdWuR8CaU7r6i7
	YGWIEGWdDCeassIqH/AGoIbS5UZo+qFrCIdzB81wrcL0iRn4mn3wE9e8cUkITz6MD5BEZbzUgV9
	1ISlu+yojTwmNv4qPCgrApl/IFcqCHhRLIRqG2KZo3FeXUsQ6U4pvmjkKJR8FdhVOYNc7Wo6+k2
	FtZ9L2oLAAkUd2GPyYxQbqLbES7mH4dCXzqvn875ddewXIQ3qnIFDS01r5+a0e34xiIzP1xdH/c
	C4pbb3n5lRh5z/RHu49k9dATTJPXkwt9RpgTQ9A4bMfCQqyEovc=
X-Google-Smtp-Source: AGHT+IEjv3VEotqH5VFMYNkLSITb7yxLQ+/ZPsDGqrkSfM+X1MuBHj1FF3/q86MbLY14fdbT78uThw==
X-Received: by 2002:a05:6512:3da3:b0:545:1082:91a1 with SMTP id 2adb3069b0e04-54990e2bd29mr8607537e87.7.1741850363715;
        Thu, 13 Mar 2025 00:19:23 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8851c4sm117554e87.199.2025.03.13.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 00:19:21 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:19:17 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v7 07/10] MAINTAINERS: Add IIO ADC helpers
Message-ID: <b1d1358a6e8f436fe6a6d5704e63abab660950c8.1741849323.git.mazziesaccount@gmail.com>
References: <cover.1741849323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H8QAWWuku4uOTwSt"
Content-Disposition: inline
In-Reply-To: <cover.1741849323.git.mazziesaccount@gmail.com>


--H8QAWWuku4uOTwSt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add undersigned as a maintainer for the IIO ADC helpers.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
v2 =3D>
 - No changes
RFC v1 =3D> v2:
 - New patch
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0..5b96fb864227 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11208,6 +11208,13 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/rc/iguanair.c
=20
+IIO ADC HELPERS
+M:	Matti Vaittinen <mazziesaccount@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	drivers/iio/adc/industrialio-adc.c
+F:	include/linux/iio/adc-helpers.h
+
 IIO BACKEND FRAMEWORK
 M:	Nuno Sa <nuno.sa@analog.com>
 R:	Olivier Moysan <olivier.moysan@foss.st.com>
--=20
2.48.1


--H8QAWWuku4uOTwSt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfShvUACgkQeFA3/03a
ocXgIAf/SYEOEjN0fysrCaCgrEuPeg5uKTPDg9mCm7K35bm36KYpZkrUX4WcZFsG
HxF+grWO98il0+w8YpYtNFVU0ureaf+sM0frxSTd5Iv2BfQMa2flmcnrEqXPgPtP
FZ/hZA6gUAgExUU+fs+nQbSqLkYxuYp8z0NxwnipVYJz6JupSNgI3jevCBY/mXXp
Deb88x3LzC9x2iwaGd1yaMhs2JeSbkeZWSz0fmvinB0881zxkId2EvLR3eJ5NBuZ
pOJXGC/SACubM7oIo4BTJ3UQhODieMHUZEhaMgbxzwuuvpDWhCqwz90UvNj5ZSGy
jv61+IuPJ3I14vufpID4JxSi7Xe2ig==
=01Pj
-----END PGP SIGNATURE-----

--H8QAWWuku4uOTwSt--

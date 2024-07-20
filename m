Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C9212EBE1
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Jul 2024 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721495662; cv=none; b=dsELI1P0+a0WzcdtV5JN5WwaVdR99oZ0nyco4yMl3LnXt56OLZGdy3AOz9Qw1Ar79t9tHFUpNZ85YcTyw1cFRjgzvFg1SxwUO8TftegPgQbIZejVnEe/TiXJNI0EtklnZTmiK4ZEzgJUvLFGxI3ezVnVfjlXF+851D5lXv8CloM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721495662; c=relaxed/simple;
	bh=OyN3ZWdPIPj2MOFpYW4ki2sZjTT2bQzpVNtgtoKSR/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=he6eISVj29nto2pChd63FwYldkgseArW9dns9I3Q7K+33HwFpcJC0WxvChbdDvC1LHOoKyqixBrQVRBQhO5oEMqkHRh89Z/oqxlCem/Il9jJoYOAADnZ7tl31RCaDWT3GYvN0oxEhmT8IXEiGHEYjHCKvXk9fvOnILP4wK2DUiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=qZKbFnZ4; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="qZKbFnZ4"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7035b717880so1762566a34.1
        for <linux-sunxi@lists.linux.dev>; Sat, 20 Jul 2024 10:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1721495659; x=1722100459; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8loVbkb8m8vGN6/0kVpkglgJYN9ScAPRJ8PdoeWP720=;
        b=qZKbFnZ4xVLcCNmIFFrpULC9su/I+l+8MEHQR5y6sNxAwQ+uIyc1jafCRB/EJ9SbGF
         8klYjMKu1QGn2K6NfJwjWPu0B85pBDORE3KLm3vwXpQjqQvdsCu9ricoYzRAU/GvYcm/
         XjZ/+k74fR+aaFCH0r7k3S+B4NurwXQ+8RFLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721495659; x=1722100459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8loVbkb8m8vGN6/0kVpkglgJYN9ScAPRJ8PdoeWP720=;
        b=PZ0uX3YETM5LeJwrNkLwFoAM8/SwD5kV/51bdCL22t0+DGtSqArFwWYFt4tbbn8wpU
         YruWirV7wuTMNNU2OCugbE2kkNn/14z/JZwke+B2PJIhrfJRgQs+oQyDeyiT6RsVuZXl
         kzuNBR8xStfbH6okIgoGf7n0kU06oK2NSZ3lrAlHtCUZrMiQtIBqEiy6DoiJzRkpfm+S
         ZLUmPvqdzQUEWLmlMq8SqT0YHN35Wfa2qljzZcTb+AS5W1IqxUi+kGRbU9ZC6us0qi4t
         EhFHvCQ3mHSA2RZ/yUqGBgwKMVBJkBVYnHHoJIM/X7dOqNMb8GFq7nX7WEIP6CDJiuT+
         FzcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUTkVh9EOvFLCgA1qTYo3yq/WJQf2hvR8afiOpV9q6YIArBcCmbIqI4l3aGFdAVmwoij1uo6fd114+L7uNlY5z0JiCPhDRZujw+pI=
X-Gm-Message-State: AOJu0YyV0CcCyRWNJKIR6yk/7GibyVOKrS//A/KiI+g7Mzw53E9m9dZA
	e4VO3LcnV0dM+ZIw84SnIMQBtJOzchQ7sTS89BGZmJpxVWr4cfaFGzHFc5JvAxo=
X-Google-Smtp-Source: AGHT+IGfUJ1Wonm6IyIgH0EF61tRcgqSPgMxUJUAlzn4LYw3brdx7sYrSussEET44zyo1B9f84HQXw==
X-Received: by 2002:a05:6830:378d:b0:704:49d1:6c93 with SMTP id 46e09a7af769-708fdb3b456mr1457847a34.5.1721495659173;
        Sat, 20 Jul 2024 10:14:19 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-103-45.totalplay.net. [189.203.103.45])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708f6195e28sm773993a34.75.2024.07.20.10.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 10:14:18 -0700 (PDT)
Date: Sat, 20 Jul 2024 11:14:15 -0600
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Jagan Teki <jagan@amarulasolutions.com>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: dts: arm/arm64: update devicetree files from
 Linux-v6.10
Message-ID: <20240720171415.GG561963@bill-the-cat>
References: <20240717143415.343827-1-andre.przywara@arm.com>
 <20240717175153.GR561963@bill-the-cat>
 <191A0F66-E2AE-4D1B-ACBE-E411E135BB61@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xTSkFB0xJ5Uan9zl"
Content-Disposition: inline
In-Reply-To: <191A0F66-E2AE-4D1B-ACBE-E411E135BB61@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--xTSkFB0xJ5Uan9zl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 11:21:54PM +0100, Andre Przywara wrote:
> Hi Tom,
> Sorry for top posting, am on the road.
>=20
> First: The Allwinner drivers in U-Boot work with mainline kernel DTs for =
ages, so there are no code changes required.
> We manually sync the DTs from the kernel for years, but I always do one c=
hange:
>=20
> In kernel v5.13 the Allwinner IRQ controller (not the GIC) DT binding and=
 DTs changed in an incompatible way, and some critical devices now route th=
eir IRQ through that controller instead of to the GIC. If an older kernel s=
ees such a new DT, some critical devices fail to probe due to that, and the=
 kernel does not boot. Using the old DT routing fixes that, at the expense =
of losing some advanced power saving features.
> So in the interest of  better compatibility with older kernels and $fdtco=
ntroladdr (default for UEFI boot), I always kept the old way during the U-B=
oot sync. This affects all devices with the popular H3, A64 and H6 SoCs, am=
ong others. A20 and older or H616s are not affected.
>=20
> So my plan was to migrate the latter group ASAP (after the v6.10 sync), a=
nd then maybe the others in the next cycle, which means pulling the plug on=
 original Debian Buster kernels, for instance. 5.13 is three years old by n=
ow, so I guess this might be fine now.
>=20
> Does that make sense?

Yes, that sounds reasonable, thanks for explaining.

--=20
Tom

--xTSkFB0xJ5Uan9zl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGyBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmab8GcACgkQFHw5/5Y0
tywviwv3eqNqWeeffp2JhUfw4aW60YZQZ4PtvZ7oaqtrzqVzwj82AOfY3T5ihh3F
6nw3l15O4qDDXeUY++MCMHxQ+w6Gm0sKmpk9p7B0mV7xTKsq2lp7YghVzG1Y/vzg
ATYmfaw6Nw0pHXOljIrO0Fg05bUUV6OUwhqlx9/5Teahpqh4i+3FuAieZqafWITK
DBBCcTsBS0S7ZDBNVEsaYwQtQqalE5HskUCktTnTU6A2CJvUWHIQ9O9IzbSsOEjg
wtIuNQWbbSAvbCU3kG8BsuUKbYK8mUbLYWDx1nPHUsgrz3xMl5rRyTy2NmIiF11N
9kHz7Vsc1T+3sK4mx0B4gUBzL9zFGv8cUHfl6KrUrPNEybGKDpRynyIea327U45G
QpwTeKsoB/OtpE1FUEgpFZ6M449n7iQEpcZ0hFHPf8oYUwBNOvRGbuMUltnrfRZ/
0rNWZWEfdHQN5Pqc+cfT/GMnJHnBbEJgp3R72V5QSW0Yar0fG9eXiB3/9GTuFwhD
X6pKsO4=
=HQMt
-----END PGP SIGNATURE-----

--xTSkFB0xJ5Uan9zl--

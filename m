Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40C2285CB6
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Mar 2026 17:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853617; cv=none; b=BC0MdQE56jGYFavuosHq9lvwYCFyT3Ib2ciNZpDXUYdyYKaG2tU+kK3jH7oHTFy6iMSpqHDEDJu26kg+F1veXG0ap2cS+eDJngoIKTAdes6RavYGTh9ec6U9SzB4LVBzJdrdP6Y+JjG/CtfrS33GjUrsd893yjBinrO4l968A10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853617; c=relaxed/simple;
	bh=TVcfOfnkyMICzWDSsQhB/17jTkWZfzh7jOQLCrH60f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1VTyR4L2ltpEX/hIIbcX7havYok78/LsEg7Xur7OVNFi1hje58u1SbLvV+Wy9nSXi48FySNWfYMhp9kXTwMRCeFYFM/MlLU9mAFlQn2+dG2qbS9RDXIWzQUxHxcvepqD0YJxg6mUa44Uto42MOAKyHJoJWFkJ+zAuSfln9V3/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=VkGAit94; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="VkGAit94"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4138136f02eso115300fac.2
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Mar 2026 10:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1773853614; x=1774458414; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ0dwZTWCLUjeTGLQnNUrpEZyPgab8wV8W+8/XubfJw=;
        b=VkGAit94ke3OkuzEazING5AY7eXYnMQNUnGeHixN49DjDtJsoEE9zvwpfIXERoqRnw
         SuIkhuK46fW5uvRi9aDcxOAl/PhosM4samqQhw8pfZoqhEXorN9dnIc/BCj1eQCcDocp
         XpPaCwArmK9t4k5FqPhd8cXpSDVoJEwoKca7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773853614; x=1774458414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZ0dwZTWCLUjeTGLQnNUrpEZyPgab8wV8W+8/XubfJw=;
        b=kW1WCNjKbB6C07enQj/4SXdx1HLaIx5zG2jJ5ZE5ZShRxXZPqUrEePJWbF0+2QzxdN
         j6cfrfFes3kVUhWUKxSCCx88fxcQDxLKn4NVTYqIQt+jvGlPfYgQymfOuAQkfCxijN0g
         lEfurZrti3faJAesp7EJQoNwRr/WJc8PONbKXSzfFQXAaBhyjGT15zp9ksIspxJAmTkR
         SwnwPMumpkAX8S7kmkC8YKnNdHJ7JDcDc4PTDIdMH3WxCkp7YncCDz6KDLU7H3hS1Mhb
         cXNTEaPBKCvbzs015yJVUWL66x7/ZB9oz3ZCHZLEC7Z7aHpjBAVn+8YOGuXoFQkRF5/t
         djrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXab9BukRhpJIcYLpo7oV3k4eI/6B574qDpmkNNwz1qvGmw1xNqBlDj1hBWjuLC5eE96XPBNrOUsCR7lQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUwjNpRoocUtRrrQNjEZHfQHiv62VB/gWA/oeu/mjLX5GPNf+k
	kbPIHzvbwZC+nOngDiVXdY/7oq1OvxQbFpoSwx3jLKrARUd8V8YdoQtm4Pefx39PWP4=
X-Gm-Gg: ATEYQzwUYmNE/Z0b8PjP8CVlTcNY9RBFKorL9Y4gtAVRF7BgM+FaOCmyCilRqsPeqpH
	TIrc9UOTNHGHSYSi7kjgj6KxF8d+Yg7QeTbN6P+9vzaWaRuUo0lQ05lbuA/yrFWTKe58RTtsbCD
	9Uq9sh/3EJ3o8SX18NfqpYfHhiyp85MFF7/0gaKlmX5L9Czm+k+XNmWY3PfK3WOb4nQ5N6GlbRa
	EFq2C8rqQMhMETALJ9QJWuZaVrLyp3avVDyRVk7kbRsMpRtf+zq+P24HysD1EQkgOBrp2jFq8nR
	+HecTfdGzRq8Rjl1FfytGUfrx8V9bT/IIQzB61ngrSCtzCMUWNCgHbEg5do5LrEJVngpEVh7NBw
	uRLp8EfYfWdX53SK7fCVD0S1ya9ShyywBDc56SQIbMxSKPyD2Pxutet/VDd9teRvoMzrRZlF4hM
	ieS3tioci3UEnQjGS6v8Ss29kPQiZqZ12HuKSRmr9or7Q6w1uhWqUeNWdM4IKOsRPi8/NG1bmna
	fig3NNLbpT2sPqi05mS8iGK0EjiqtbN0n+q8kn1eS3U08ie/GAXJxKcxXs=
X-Received: by 2002:a05:6871:340b:b0:3e8:970e:d4f7 with SMTP id 586e51a60fabf-41bd3c95403mr2701704fac.11.1773853614342;
        Wed, 18 Mar 2026 10:06:54 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-235.totalplay.net. [189.203.97.235])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd288d791sm3401617fac.7.2026.03.18.10.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:06:53 -0700 (PDT)
Date: Wed, 18 Mar 2026 11:06:51 -0600
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <contact@paulk.fr>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: Pull request: u-boot-sunxi/master for next
Message-ID: <20260318170651.GM502704@bill-the-cat>
References: <20260318115702.1637000-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uA9gXr/A5JhsEIB0"
Content-Disposition: inline
In-Reply-To: <20260318115702.1637000-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--uA9gXr/A5JhsEIB0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 12:57:02PM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull these sunxi changes into next:
> For once, replacing the legacy LED API with a more lean alternative,
> just for sunxi's SPL. IIUC, this would be one step closer to dropping
> this deprecated subsystem altogether.
> Also adding two DRAM cleanups for the A133 SoC. There is a third patch
> which requires some changes, will care about that later.
>=20
> Gitlab CI passed, and I booted that briefly on an A133 board and some
> board with a GPIO controlled power LED.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit a27980786cfb3c430aa1c05da8e79180c584d2=
21:
>=20
>   kbuild: strip sub_make_done from test-script environment (2026-03-16 10=
:41:40 -0600)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git sunxi/master
>=20
> for you to fetch changes up to 98429b7be6f45d393cc905b2cf9844eed7b09b8a:
>=20
>   sunxi: a133: dram: Align parameters terminology with Allwinner (2026-03=
-17 23:27:24 +0100)
>=20

Applied to u-boot/next, thanks!

--=20
Tom

--uA9gXr/A5JhsEIB0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCabrbqAAKCRAr4qD1Cr/k
CttlAQDRuDpdiDTIdYHt9pI0rHwU6k9GHOFAn92VpkoJEjYs4gEA7GQvdvKRK4cv
1wpoqvaWiolUrixhiV4tasAi0J6WjgE=
=igfv
-----END PGP SIGNATURE-----

--uA9gXr/A5JhsEIB0--

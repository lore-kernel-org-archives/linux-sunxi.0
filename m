Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB71303C9F
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 17:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755105182; cv=none; b=LI6I6IX4Dn0k2pl4A1HikIxyt0bPyt0ej2vSRdIZJrT0sNkVbgVoaekvLb5wm+dxg1Fa0DO2PBtTokafXt/sGIeSK+m2VjKZ08mUve4cSkgKgs2i7YJUkPilLVQIaWUVyV2qnDcj/nwYekPmAwvnfrx5nTYylys2SkOIujrqaHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755105182; c=relaxed/simple;
	bh=SrhFvYfRVgda/o+WVC3TSnvf/hceWD4db3Td7qglA5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvbWfr3ljjfBFSZg2OLvTlUj+kgbVNvNU5DhoxT27tUNa9+3w6caJU5V0SOcQ7ntZ2QjwfVkDxHzBk7I/CV56MQXS0lwr7ReRiQGaZeU3XQyKy872p5w/yIYYw9u4BsDoUgV7XBImWag9pH6HZVKs8FQlQp/7Aw8OG2Sy2iuuso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=C2ipNyPP; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="C2ipNyPP"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-74381dddc44so24188a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1755105179; x=1755709979; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QyNiT04c61MTjtkUTO2O1Sku7SQOwbkGz1jBF7IUFKw=;
        b=C2ipNyPPYxrSB6uAV23xuxSMo8Yj3/ivXFRFJoZnY1pKT/ZDvt7wbzNpAuTgXRUT00
         wFJJP+Pa7BtUMl0HvEWF3hlHyBAivH40YeBsvs1V9D4uqECn7UmMMbgj60EnHCw0z/RQ
         dlWRMYw0I8ubNT1FLiaW7ibmRljYDPTvagTos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755105179; x=1755709979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyNiT04c61MTjtkUTO2O1Sku7SQOwbkGz1jBF7IUFKw=;
        b=buffn1+zJnzj3UolcPwLijXkbD5ejme7KQNoodXjTt0Soj3xKeEl34nEgzyFFoFvtW
         NP0GJpZj7Al8T8qLmFTNIWtjN9EoFYLf68OHkF3VSJ/kaBpByyXddDGwpzV7A2ve36RX
         XwgzrvH6FSkutlSEfFCi4C3lMTDtWLGYLHDPgOMTSmXeYvQwfEYgPoLWgteNo98nr0rB
         UPpwrNRjRblKTqQLzeQj99LCeqWspX4MJzHppBjUCjPBoBCAtLJDRVRkC94mjcK3vEsM
         Uu081IVahnFNr2PKDPJlbSVGNxrl6uw7P2TcrXbJ7mF/75z0DUeED40aTp/qJ6HNagop
         JO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSvKb2UZf1MN7xhIRI3Re4kaQ6RTPfQIq13DFi3pX5yFQBXj89EA5tqo2HEcvJzK5oH7lJd+PaJ8SCBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YziXO2F8EoWh9TYy9sVNLMkyWMxO39/1giluyc0qSvXvgLBC346
	kcDaieSKd6Xye1iwcphOwhIWsXYhq9iy7ySmYzaPXTabkPUAmDNy74frHqb+pEedJ6s=
X-Gm-Gg: ASbGnct+GzCwMJKvNOYicdeiUiW2NtPGID4Kton6fCLljFPT5Jg+iQdmuHZTCnV03KS
	a7ZP1wnTraiE9srWkhJ/IwoljIKYzhx/ivHax8TZyxsZaflM/CTomZZKjSOUcW2eVZz5KLAVYDg
	7rzrzfo7EUcSmZ7prHStztqoi0ZCYNJ7SWXOmVan91PzWY1o10/bzF8oqu6n/DJpec/XvhrDIEN
	5puSj1+7eoiOfiC/fCDnOqqv2xHgCnHCf8nVKwTC/ceYlgPLT8ckMDjf0ShDWeQTT2tdQCZSzBJ
	6LxxgbXsGQ7HXw4h1gXlgEHzMaIgRhfDwqTx6xwu+g8ouqdfmkcPRDJ2ooZUXUMspeeJ4zDFXtO
	9rjSkANC9TS3mRSBcVQ55OjE6vtovIRY0HkYPt66ca8od5Md5f8VCoFKz
X-Google-Smtp-Source: AGHT+IHzEufQI+kuIGAbLBkL9Mu8Ee+y5dk/yyY03/CrHhLWXuKCQGq8v5AmZgTRTN8wabwgyYY2Ng==
X-Received: by 2002:a05:6830:719c:b0:741:213e:2212 with SMTP id 46e09a7af769-7437546e9b8mr2297145a34.17.1755105178883;
        Wed, 13 Aug 2025 10:12:58 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-42.totalplay.net. [189.203.97.42])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61b7cac2c52sm1711818eaf.26.2025.08.13.10.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:12:57 -0700 (PDT)
Date: Wed, 13 Aug 2025 11:12:55 -0600
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	Eric Anderson <ejona86@gmail.com>, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] u-boot-sunxi/master for v2025.10
Message-ID: <20250813171255.GC124814@bill-the-cat>
References: <20250812105605.1344927-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NUjOA6iejJWKj6lI"
Content-Disposition: inline
In-Reply-To: <20250812105605.1344927-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--NUjOA6iejJWKj6lI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 11:56:05AM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull these sunxi changes into v2025.10. It's mostly smaller fixes,
> and some additions that were dependent on recent DT updates:
> We switch the S3/V3/V3s over to OF_UPSTREAM, the DTs were already
> identical anyway. While at it, Paul sent more fixes for this SoC, I am
> pulling in two easy fixes that were ready and low risk. Apart from other
> assorted fixes, this PR also enables Ethernet on the new A527/T527 boards,
> made possible by the DT update from the DT rebasing repository.
>=20
> This passed the CI, and was boot tested on boards with Allwinner A10, A20,
> A33, V40, A80, A83T, T113s3, F1C100s, H3, A64, H6, H616, A133 and T527 So=
Cs.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit acfacf452441d0a659e3afbd55fd6061aa17e6=
47:
>=20
>   Prepare v2025.10-rc2 (2025-08-11 13:47:46 -0600)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 553c5a69a5f1e36c8c6cd654e48601322979b8fb:
>=20
>   sunxi: H616: dram: fix LPDDR3 mode register settings (2025-08-12 00:50:=
57 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--NUjOA6iejJWKj6lI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaJzHlAAKCRAr4qD1Cr/k
CjujAQCmln0aOco+YcLgqrg5R23zQuxq2lfYgtPBqU/JEo41vQD+NT4t8y46gwpw
LOlFM6bcMwfDtA0MaiupVMNjAjOuEw8=
=6emM
-----END PGP SIGNATURE-----

--NUjOA6iejJWKj6lI--

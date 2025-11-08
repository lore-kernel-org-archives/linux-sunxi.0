Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133DC1FF5F9
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Nov 2025 17:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762624656; cv=none; b=kfGg8+dima/f385ycywaTonhzWweXjRPF1MqIsxHIWGH4rpe2iRfRPtZM6v8dR4aWZqHNetoEvGIe7efcOi43ADLselzZCmep1Xt4JcffLVr8Uu2TchF7ozHP/ve0B1Hijsp+3u4xnd3Dt3vq8+fO93oQ15/i9vKz2apZZjzcTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762624656; c=relaxed/simple;
	bh=gYqU8JgtG9Nq3bBOTHXf7LJVe9kcCt9mk9/IAbc8jxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=txOOASKJhuNnJxvq+JsdpzJqCFldbtbTAzV1j/edGtYHF4/9slgFxyStKRMCljmfzzVmimx+awasq6NLO2xBut4Om0Z1c5r7NH+oCFcoSeRwvntEtIbe/ikkbblKiZ+t69WsWaekr9bcWtNl3xfK4ALLtQrjSPPPNGRipT8Z+Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=d5LKp7G+; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="d5LKp7G+"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=gYqU8JgtG9Nq3bBOTHXf7LJVe9kcCt9mk9/IAbc8jxA=;
	b=d5LKp7G+L20SJt/AcES/pk4z7v3M9WnYU3AMPEaTEzDknj47umZ1TbPTbI5Vbbkqpk3BmmJqjxnByRkZ5pcOVcRNKYdCSoPDuFFGXFlcFzDxCVotp8B29NtVNZiaB9xsPSfJwnSOF1ZzHbMf0trRj7XC8JPww7weTA91hoXwicE=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sat, 8 Nov 2025 17:56:41 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Parthiban <parthiban@linumiz.com>
Cc: parthiban@linumiz.com, linux-sunxi@lists.linux.dev
Subject: Re: T113-S3: Secure Boot
Date: Sat, 08 Nov 2025 17:56:40 +0100
Message-ID: <2286928.tdWV9SEqCh@lukas-hpz440workstation>
In-Reply-To: <5290a949-1eed-47e9-a258-024447009c7b@linumiz.com>
References:
 <4693897.cEBGB3zze1@lukas-hpz440workstation>
 <5290a949-1eed-47e9-a258-024447009c7b@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2591779.irdbgypaU6";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2591779.irdbgypaU6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Parthiban <parthiban@linumiz.com>
Cc: parthiban@linumiz.com, linux-sunxi@lists.linux.dev
Subject: Re: T113-S3: Secure Boot
Date: Sat, 08 Nov 2025 17:56:40 +0100
Message-ID: <2286928.tdWV9SEqCh@lukas-hpz440workstation>
In-Reply-To: <5290a949-1eed-47e9-a258-024447009c7b@linumiz.com>
MIME-Version: 1.0

On Freitag, 7. November 2025 18:13:13 Mitteleurop=C3=A4ische Normalzeit Par=
thiban=20
wrote:
> Hi Lukas,
Hi Parthiban
>=20
> On 8/1/25 10:33 PM, Lukas Schmid wrote:
> > I=E2=80=99m working on enabling secure boot on the Allwinner T113-S3 (a=
s part of
> > preparing my SoM design for EU CRA compliance).
> >=20
> > I=E2=80=99ve successfully fused the SoC with secure boot enabled and bu=
rned the
> > ROTPK_HASH. The SoC correctly boots a TOC0-signed image from SD card, a=
nd
> > U- Boot starts up and behaves as expected.
>=20
> Could you please share how this is done or may be with a document patch to
> u-boot? To add, am also in the initial analysis of adding secure boot for
> A133.
I actually do have a document on how I fused and flashed my prototype board=
=20
here: https://nagami.readthedocs.io/en/latest/software/enable-secureboot-on=
=2Dsoc/

The required changes to U-Boot are already in a Patch, but I haven't heard=
=20
anything back yet.
>=20
> Thanks,
> Parthiban
Best regards,
Lukas


--nextPart2591779.irdbgypaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmkPdkgACgkQJnN+drMV
Rtg5eAf9HD2O74B/ycSsKkJSihW5ZZWeP7yFdtzRSIzRUgJZ1BXEq1qInhpBb7l9
EEDr/9nVz0S/CBAggrKOJE6L4/CSvtW+0txgUgZZAmZA5/jPT4wdmxvIRjoUYHkT
kiyI8olIghzZa4ZZ8jXsi4JMcWTh1PuiDAFVB2WBZSVWFbglEsOcnHLUgXJV0EVh
QHsL0vb93IcrGUvtFSDrfbBfOiMaEH2r/46+RYq/Q75BypSrsKkpTq7yBqL6Ypw4
Mz2tFuCaMTI2Ply55bTqj9RKXWvM45VxwxjcW3Sn+IdS7OXbcr9RjZgX1ejkVKXX
7gtqP/zmKHeyHvS/H7RHcOZlxroG/A==
=Pf3Q
-----END PGP SIGNATURE-----

--nextPart2591779.irdbgypaU6--





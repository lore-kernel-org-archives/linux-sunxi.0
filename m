Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B0C1EA65
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Aug 2025 20:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754081294; cv=none; b=IKlw2v5pnFV8puYRvB6CG15cvQMgn6QOGMbNwaFLQcid1ZPZE8VVq3Byu2rshL9kh+ICv69Icmk8yC0iqqaSYePSMvReW7ELa2BbxJT0HPcK3+XCzKrtkdKe+kkCsxDleQ678gQKSObexhVG9GSMprcJGRq3FVt0UHPjAg2UAQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754081294; c=relaxed/simple;
	bh=+CEjMxEd48FPH4oziDqPTJv4As3eOOd4id3bwTdmC+k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZQ9BiqspJAjP18sfAallNAfYfObpQL+GnX+hMYahwWQZc5vICQHkvA0x3bKlRn9KooU2vy4Xx7mY1XyTvNIDM2MOg5e4XdFPSzeEnSgikkWGQkRO2VqmKxrvYPZBmBnyWhR/Qp/8Pu2zp7T4IXGSwbF29PUGLu5m1fXTYg3yI7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=LU6a4jtr; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="LU6a4jtr"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:MIME-Version:Content-Type;
	bh=+CEjMxEd48FPH4oziDqPTJv4As3eOOd4id3bwTdmC+k=;
	b=LU6a4jtrT+q+dFQIQFSGv4oHLOxOcISmLWYj5NuuKfxu+7UXFd2QPzOR62fjOc2nU8Ir3/iuleTD66XEnPyNeIGfd1DEUBdW18QHmjoHeg7KF9lkIgeNxHqcUVKzSWU4LQzn8yCwEcAiUOH8gpOzBh73qC/vFJKkSSmCXrsDspQ=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Fri, 1 Aug 2025 22:33:19 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: linux-sunxi@lists.linux.dev
Subject: T113-S3: Secure Boot
Date: Fri, 01 Aug 2025 22:33:19 +0200
Message-ID: <4693897.cEBGB3zze1@lukas-hpz440workstation>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5102913.0VBMTVartN";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5102913.0VBMTVartN
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: linux-sunxi@lists.linux.dev
Subject: T113-S3: Secure Boot
Date: Fri, 01 Aug 2025 22:33:19 +0200
Message-ID: <4693897.cEBGB3zze1@lukas-hpz440workstation>
MIME-Version: 1.0

Hi all,

I=E2=80=99m working on enabling secure boot on the Allwinner T113-S3 (as pa=
rt of=20
preparing my SoM design for EU CRA compliance).

I=E2=80=99ve successfully fused the SoC with secure boot enabled and burned=
 the=20
ROTPK_HASH. The SoC correctly boots a TOC0-signed image from SD card, and U-
Boot starts up and behaves as expected.

However, when I try to load and boot the kernel from U-Boot, the board hang=
s=20
right after U-Boot hands over control, no further progress. The same kernel=
=20
image worked fine before enabling secure boot, so I suspect it might be rel=
ated=20
to the secure boot configuration or runtime expectations.

I=E2=80=99ve already tried debugging U-Boot and confirmed that the kernel i=
s loaded and=20
`bootm` is called; the system hangs at that point.

Here are the versions I=E2=80=99m using:
=2D **Kernel:** Linux 6.15.4 (mainline)
=2D **U-Boot:** 2025.07-rc5 (with custom devicetree and I2C3 modifications)

Is there anything specific I might be missing when running the kernel under=
=20
secure boot on the T113-S3? Any guidance, common pitfalls, or pointers woul=
d=20
be appreciated.

Best regards, =20
Lukas
--nextPart5102913.0VBMTVartN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmiNJI8ACgkQJnN+drMV
Rti/3AgAnCmVSZD0xH+Esz+7FtT4r6w3oJT4qXgVqQkggEoLt5TqvRLq5QImIynO
DXLak3hn5uDK31xYk8Ks1Z88oDz4nCHjfnHcdikqlKgpeUJcJ9Lt8260j9LPw7Ks
AX/osXneXWMUjv31jmFrJhcYhPOHK70itDwJmvW0lOYR/vdZVPGvZ95Bpx1Cuf0I
dSweRQBqrp8VnU5lJK+/CzxIAEnxF6AFqvO7U1lel1IusEFA92YtuhFzNXpWeCvK
Mqs/GMqynT/aE35O4NhJjJBukTmMQcZRNhEVdIQ9Wh32pLCgXwrbxZsaivHM40Mt
a130rPZLW3cSQICEVvTCpwMzwwe6rw==
=fDLF
-----END PGP SIGNATURE-----

--nextPart5102913.0VBMTVartN--





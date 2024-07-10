Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BCE195B14
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 18:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720635122; cv=none; b=s5fsS1gp7z4se4KSQCN8neiJGBJas/YrpGP1MLMbOZlmm6kilKUNQsAEY5GirFH04ilfs3wZtkTlTq6p5V/H+mPd7IIMO+Skf8x0J++JSYnYJyhdw62xRGafS5XvojKRSLbtDW273o740Jlft5eY8AReHFAcEvAVugSa6G33qgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720635122; c=relaxed/simple;
	bh=JBuQ1VPXGZZENZRSB9356SdJRQn/hLnlVz/uEX6AbCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hoijQLIlLHhufBBLgsvR1+8ZwQhARTgIHE5GdaPnI1vUOW4niINVf3eI2wap7BZVK4+Gnz8iiwZW8qh0iN82qiIl2i+EQP3wqIwnTJ3Co7xoQ/Nnb6uBQxMUGTTN5cEu/MbHSX59Aho/o6DmGuizIVss49FiSUsuRWyhahkxFyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SErqavPn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SErqavPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6914C32781;
	Wed, 10 Jul 2024 18:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720635122;
	bh=JBuQ1VPXGZZENZRSB9356SdJRQn/hLnlVz/uEX6AbCs=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=SErqavPnPXDemBHwnvxs08tZ9G3Ra9qkHrD/yAJB657Y2+ieiRpH08PSKzAdPgiLD
	 3SDumKwn/S7cZUlDxdqSmteufHt1VOMcdHydhHtbpLQOECGxdxqHZzC55OpWt/By2K
	 ZjQWzxOkYFFlOHcUDFRUFV5BEmPPoWFQ0SIzl4xqa4YPYgSvAJ1uoxhq2o5AZXoq2y
	 WN3sKPaWkHT2MAXRUv8JFc2Cp9nLNJAlOBw0+gRqeAGuNp8G8ID1nomXaosrDjI5xq
	 zCu5phb0TCumbl34cWJ5YZfU+X2r6IIaR+s0y9ip6XD7Ay1aw6mVB7iQxL/elVykxi
	 r3lrizxrthuXA==
Received: by wens.tw (Postfix, from userid 1000)
	id 626245F7C0; Thu, 11 Jul 2024 02:11:59 +0800 (CST)
Date: Thu, 11 Jul 2024 02:11:59 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner SoC device tree changes for 6.11 part 2
Message-ID: <Zo7O73Afx7lZcBRi@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wQyIwK0W5D+2KsxB"
Content-Disposition: inline


--wQyIwK0W5D+2KsxB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

Here's a late DT commit for 6.11. The driver parts of the H616 crypto
engine series was only merged last week, so I only got to it today.

The whole series has been tested by multiple people including me, so
I don't expect any issues. And it's just enabling a new IP block.

Please pull.


Thanks
ChenYu


The following changes since commit 0ce1d34678e5d214746ee4887f9f7714c39e331f:

  riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees (2024-06-30 23:06:52 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.11-2

for you to fetch changes up to 6ed9a85f1c44d7049cf2d488bfe71252ce467dc2:

  arm64: dts: allwinner: h616: add crypto engine node (2024-07-11 00:43:10 +0800)

----------------------------------------------------------------
Allwinner SoC device tree changes for 6.11 part 2

One additional peripheral enabled for the H616.

- H616 crypto engine added

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: h616: add crypto engine node

 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

--wQyIwK0W5D+2KsxB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmaOzu0ACgkQOJpUIZwP
JDB1VhAA2yGX5i/k7c8ILEK4kC8iBX90FCsa57tzVA95myZ82Lef1rMMdlKJ2Z4k
EFXHJ2U6AQAs4owxdofqccARLUSXKzl00ezz8p0ZkHf/CVU3qh5GMdu/dN4mLfEJ
oq/4sJ5U9sjf+BwwkGdxs8EvpCV4He8aomO8HkoL95i1sqt48R9goNPBxBirB3Vb
IKaR4LNLZ3D2RM8bVdoBynM3ICsH8oWwJcZ1x0WWrUom3KONndcr/qV0Zgmlxj38
guAgztzliyjAiENx0x0kB9RD3eLi8uT3HFrqbXpuipFCGWYS+Rr9X2xZ4Nhpn3X+
mMupSmTLI2sfSG51Gzlm87aZDFQlQ2QHQmXu4KdLqGqlRUau4otyrf242OswXDP2
KlkgPkhNvRjBGxnLWgKc3LG02TVNp6NryUIWXWvE4UnAxyu1y04zheZ3n6d27+8B
FuNBi//vfz7gDbruVu/czqrnd5qaRA+DsXmpHniskcuW8k2dH194rzf/x5VwQJmm
KSOwaSsWtLxfG+0Etk756WsVDSLEU34IZmjWtSsrDsOXHFYw+YbJ6a1aNWOUCqoQ
oOa89k3aZp1GwCPMMNUIf9r3OT/oCuEnScNd+gvZvBi1D018dvaY4xI5E+0II1XU
IyJtmuN3W771VM2fyj41AhSaGGIC+BEyLu/eYDiqAfdoype1/mY=
=XYbq
-----END PGP SIGNATURE-----

--wQyIwK0W5D+2KsxB--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD62D17C69
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725552970; cv=none; b=sNLk0eRBET0EHUHNDuoIjd9tgHRbVkG3uLq+TQdJ+sUlLj2Xevt+gicqLx4qF3Z6XfvIMSnWDHPgZHEStiTy4brxsQvqv12POADO58CnM1QAQwleK5GHE9t2+dmFsBvqnRT8xFsbb6nC4hwbc7kLia0PZNLGgQggE4wsQIsGMwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725552970; c=relaxed/simple;
	bh=K6MydERYdIY0Z+ZpKp75OHZXyI16kJo0Xh/WOFWcOGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIsslTtFlIRQXdvyKUv+m2QCY1WXfSckouyB3CEMeitDEshElNVZPRgHUDIZ0if3n7dO0hzbzYBok3xh+g/YHEpyDECf4J1UV9nW+dWm2kub9mbhKOSSA5smz9+QigBFDrtT+v70q1Fe2WAjL51btPw4Yp7UzanxpSKxqop12nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXcMh+m/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXcMh+m/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A86C4CEC7;
	Thu,  5 Sep 2024 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725552970;
	bh=K6MydERYdIY0Z+ZpKp75OHZXyI16kJo0Xh/WOFWcOGM=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=MXcMh+m/7PBt7JdXIct10BfgDpoQf4GTSYKpC4Lsur52oi8B2yVXVpKKvBm6WAz1J
	 YRB616jrmdCl+OhUDjNdA3is8kCpCCZKtd1bXLilZ2yF5P2g0fxwUQjKnpHWnOXRo0
	 fzlOlaRHrLMSwLD1x5huz/0CCzJz50uyQxEl58eRNqyYHgowZ9xmSNIlVQgQm7VuJL
	 hOpl8B0brCo9NCEsKLQfODPiMTeqbteQe+3GXZK+nDDdQJNsPauK5PzDs2eCNzWcxR
	 pW/dKCsM6X7WakFsmE8MRa1Og0TlS9/pjMPE+wgDeuF8Q0J/kR1rHGiwL8MvyY2Caf
	 eRbvOrwHv1zvg==
Received: by wens.tw (Postfix, from userid 1000)
	id 08C205F882; Fri,  6 Sep 2024 00:16:07 +0800 (CST)
Date: Fri, 6 Sep 2024 00:16:06 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner SoC device tree changes for 6.12
Message-ID: <ZtnZRhTwsBeO7Qtb@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bj71I9tp/XVtj0o/"
Content-Disposition: inline


--bj71I9tp/XVtj0o/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's the Allwinner device tree changes for 6.12. Not a lot of stuff
for this cycle. How the PMIC is talked to was reworked to make it work
better with U-boot. And there's one new board, and the charger for that
series of boards was enabled. Last, thermal trip points for the GPU
were added for the A64.

Please pull.


Thanks
ChenYu


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.12

for you to fetch changes up to 89f1a037e97cb2ec0948eb92bca17e7d8c4fc824:

  arm64: dts: allwinner: a64: Add GPU thermal trips to the SoC dtsi (2024-09-04 22:43:49 +0800)

----------------------------------------------------------------
Allwinner SoC device tree changes for 6.12

ARM64 device tree and binding-only changes
- Move PMIC on RG35XX boards from RSB (Allwinner proprietary bus) to I2C
- Introduce Anbernic RG35XX-SP board
- Enable charger on RG35XX boards
- Add thermal trip points for Allwinner A64 GPU

----------------------------------------------------------------
Chris Morgan (5):
      dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
      arm64: dts: allwinner: h616: Add r_i2c pinctrl nodes
      arm64: dts: allwinner: h616: Change RG35XX Series from r_rsb to r_i2c
      arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
      arm64: dts: allwinner: h700: Add charger for Anbernic RG35XX

Dragan Simic (1):
      arm64: dts: allwinner: a64: Add GPU thermal trips to the SoC dtsi

 Documentation/devicetree/bindings/arm/sunxi.yaml   |  9 ++++--
 arch/arm64/boot/dts/allwinner/Makefile             |  3 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 16 ++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  2 ++
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 27 +++++++++++++++--
 .../allwinner/sun50i-h700-anbernic-rg35xx-sp.dts   | 34 ++++++++++++++++++++++
 6 files changed, 85 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts

--bj71I9tp/XVtj0o/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmbZ2UYACgkQOJpUIZwP
JDCWZRAAyBoANbGZGTYGIrQbHHF/vksDhE7CTxMq+HD0Vjqnf8KshyvKUHqQ0vtf
//rFjGpYx7jveFsR7apGnm13L0Y6Ju9NvYQ2BBfDzSrWbo8qaxB8zhlNl8YpuC9n
4q4J5PVMTDKJP0m48trGp9iumakkTUh/TxKHwH7wtmvEpTqvoFDtAV9qb+aj9GWp
I7oKEzYT4x3ofp+ya7mdZyaivj1yP1fPL4qsBos+KgsREm63cFczjK2NSDuyQRqO
kJrJG3TqU/uKLjQhMxEhsG7LYYtgiX++FVsE+IUrM2/y5DLW+o6oZfQfeZChqcKl
RV2UMJ20733nB66Y6tQ5OJRFZ9hhK2NaW0kVKMiKDD3EcPIAMQuNhoyb30/61sSb
sv/ki4gE0/3+Pu3u1xtXb7oXWeEebL9CXM68z8HAdyY5+xMbew5t5ED65IRUEbdP
vPwdALZn1L7D2SswiBWHFgbqWTS8JSJkgGALpYUrotY7ovNcF7V12OQ99ZR7DVpE
Xs53efo8/tSWoPgJ1O/Qm5lgw4PDB6tY48RJ025zNWQ00SKgsm+6tIvbh9GqxyUN
Kl01AMykabNHFxSAlTFdbuFomQoc3HQJBeiFKU8U9UAopkhlxO9xdTisqiJhjJVy
2RIoVowPebPcSVS81lGjIjhv5PEAUmhYxGDK4LB2udVr+EQjmLQ=
=An6s
-----END PGP SIGNATURE-----

--bj71I9tp/XVtj0o/--

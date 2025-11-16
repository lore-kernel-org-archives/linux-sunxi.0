Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3A228F5
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 08:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763280065; cv=none; b=USaCQObQjMU7rfNlAh1ZEYGaSTwp/UK0xH40m5Qar1qYhD3ojlrUNn2vyVAZ32vwMbcEGoCX6zAH2XRTLdrGP7Cj5ADgZFb+eZTtPEgSNa6vc1A2JCV22MVAZr7DIUnC4UKq/JnuR7DD8U0xAGSGKSmBCnFTRMgDRAitSER0tu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763280065; c=relaxed/simple;
	bh=n1m3+OEF7ZWWfJVdAJR+SCkIJOuK7J/zBc3Whpeg4zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dwbnm20q5rsBD+dPq5aUVCIHIcTszhHoiOq+I2dFqPZzLH+n0HqqhS9WBAXVnPQlH0rGTalHdUI7umHOBMo7hn+RgdqpI4xh/eKUbjDTt5mdia9880fDVgOXDsdzGnFQ7b9PNUizDwOsH3AmSfT++8R0YUNMA/UzvzfPQe6u73s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oi1oh0Ly; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oi1oh0Ly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E42C116B1;
	Sun, 16 Nov 2025 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763280065;
	bh=n1m3+OEF7ZWWfJVdAJR+SCkIJOuK7J/zBc3Whpeg4zs=;
	h=Date:From:To:Cc:Subject:From;
	b=Oi1oh0LyKUfgqA/oXZ/90yJqnLB6jw6RKLgVckWAt9cZjKStxigZ8w93oQ+Fcyjke
	 UumwTgYTdUWAQDvpwWZ4qjcmNh0uYvU8PZ7jVciWVR+z5ZIQbJAX2e9Nf/1HVOHu4I
	 yLj88Vzaj9x+Zp1qyHziFFLaBJH6wQxQEddxJz8L2cyUB35hdOixFGq33coGTGttnm
	 4ikCysxrqYivY09LkWscVt8bWB3BN80/1IJEmmYQ2vzLHssqLPdeHL8u7ytK0CxFmC
	 d4RcGjlwWS/RwX5JDEaC1TvsdvkaiDbnsBiBwuZ8fN2wthXFKtmfv1mbcAiZJBCiQc
	 HGcQe+a9hb6fQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 69C2E5FF44; Sun, 16 Nov 2025 16:01:03 +0800 (CST)
Date: Sun, 16 Nov 2025 16:01:03 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner DT changes for 6.19
Message-ID: <aRmEvz0F1yVCgE-B@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g5tY81ESRNcZFmD0"
Content-Disposition: inline


--g5tY81ESRNcZFmD0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.19

for you to fetch changes up to ae0d3f1e6dd2c6404db2fbd7556b93eddd6c87b8:

  arm64: dts: allwinner: a523: Add SPDIF TX pin on PB and PI pins (2025-10-29 01:07:33 +0800)

----------------------------------------------------------------
Allwinner device tree changes for 6.19

The A523 family gains support for I2S and SPDIF audio interfaces, as
well as the GMAC200 Ethernet controller.

The H616 gains support for the NAND controller.

----------------------------------------------------------------
Chen-Yu Tsai (10):
      arm64: dts: allwinner: a523: Add GMAC200 ethernet controller
      arm64: dts: allwinner: a527: cubie-a5e: Enable second Ethernet port
      arm64: dts: allwinner: t527: avaota-a1: enable second Ethernet port
      arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port
      dt-bindings: dma: allwinner,sun50i-a64-dma: Add compatibles for A523
      arm64: dts: allwinner: a523: Add DMA controller device nodes
      arm64: dts: allwinner: a523: Add device node for SPDIF block
      arm64: dts: allwinner: a523: Add device nodes for I2S controllers
      arm64: dts: allwinner: a523: Add I2S2 pins on PI pin group
      arm64: dts: allwinner: a523: Add SPDIF TX pin on PB and PI pins

Richard Genoud (1):
      arm64: dts: allwinner: h616: add NAND controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   5 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  52 ++++++
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 204 +++++++++++++++++++++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   |  28 ++-
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   |  26 ++-
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts |  23 +++
 6 files changed, 333 insertions(+), 5 deletions(-)

--g5tY81ESRNcZFmD0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmkZhL8ACgkQOJpUIZwP
JDD33g/+MTCGbBbfJdpgGLE7z/F24tbTFDk2KVV+dAfCW+CZ08p+MVSVlhrzAk5h
CbRAVxqYLO7sgGQhF0Jd7ge1HuE+zcZYqOym/SyfNJmYqVq7UnBTD7CIA2fYoy6Z
UoKpRfSwqzX/yEkvIPwPNJKwiL3hdJLqe2rBl7EVB4NrZpbmdOXEbyTydoy9fq5o
VDTArUSsxen53dqhjoXMNj7LF9h7Dftvb3Tp1G5vhRJtP6ozMBoauG7YI8anh3I9
jLj43YXxAYwhvYKpYYjB0eTgGiXZoB1v10kvCI4KEm5FAffhbCQgGR8R9deWHEkq
SzAn/luocI+dd9O0FYqfMBi2ngAanSM4c/PQ7nHB7lpZXblQ+nsz48BiNC32F27G
itFecCqDJS8VkxmTuqkKbCT5mjZvahlHn+7Mr8OjHdS/aIqnVoCQNxPk+VxdB5cV
UcxqNMJ3Nb2+n2GEvDm8BPWJ8tqPKiEvOBE5c5GEVkHmAMvFp7BhMM5NgEyxNcDQ
guXJa/eTNynwdonSfh2J0I1oL6rbhx6vLPz4dgnBZei0w9rliO1RusPbvEDSrv5F
WCrIaiLQfthgh810ieDrFw1PCqhDtdhBmqb4tifNkm9LAifkhNnmVJsr/GaKjL0g
N6RcXcUHkOqbu4C4vzXC1BXLU6Z6BJgXjtuF4w9pK5sj/pjwXU8=
=cVPx
-----END PGP SIGNATURE-----

--g5tY81ESRNcZFmD0--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1039849AA29
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Oct 2026 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383863; cv=none; b=dRuz0/Q/93eP05tuW48emdtd8ae/AgNCrTjVXIDkxn7VKlY6mtaUygXQiCmHl6umJXTrlAAS64+G6exbSzSzIkhz3myhYzsSEGNiqOfQAXDzYv/u76AJTkA++U/j7IGc/BdS8hv0JFX893NZDhiMVrkwl9R+MKE07NSUU2nMXOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383863; c=relaxed/simple;
	bh=fRyNkI3fn8Au5OASxWCAyrnTfbevmHFPaBcPO1EffQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XqF9gBnlS5/etX8E2a84yK0Icidi+KCfadzaBhlYsSZ29SCRwfbLgNt9I/dkFGk1bomPKHgSbwtIMv8f19cvtpTZVRi4uE+Yg1BKCcmC+/fjSp5jJB3YYbqw30IMOaxYJK+y8cYfi//DZ9C62tWE8x7wtSU12RMSTSqV8etRKwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jee8JM5I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jee8JM5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C13C1F0089C;
	Wed,  7 Oct 2026 14:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791383857;
	bh=sIcv331wntNvMfBhP0jH3BFhPY14ilEwGB4AgDf0gDw=;
	h=Date:From:To:Cc:Subject;
	b=jee8JM5Is6ioiatnT8WCeH8cVVygoBaSeClOvKBrFIG4byCR3bo+bY8KlfXjAutcG
	 JtaVGigOhRpRkVVg+w+yRjMPOh7VAdxx4wjltjIru+enJC+4AgYn8NxtxcLAvL9xuU
	 sUzWaVLstyfsR7q0VV1hsFeJwCAe86XIsNPBtgj18Yk2GXtlYQB0SdGfg5BwIkYRey
	 g0Zu2wHg/UKFEINFHXFiIc+d20sjFKxcW9eJsnNp54AB1SvooEh7+dOkzIBfv62PsT
	 3hCqMtbLp2mE6V253nKxsd8AfBRPp9lrX9nbboF1m/mNtI+L2RMF/6WY2qXCyFFL9V
	 3AR5veNkagYWg==
Date: Wed, 7 Oct 2026 22:37:33 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner DT Changes for 7.4
Message-ID: <asZZLRnqygKV8hMl@home.wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BDuy6gkAhz2wqgtr"
Content-Disposition: inline


--BDuy6gkAhz2wqgtr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.4

for you to fetch changes up to eabc3c090e81ea329b2c7530ca655a70228dfaa4:

  arm64: dts: allwinner: sun50i-h616: Add video engine (2026-10-06 05:27:57 +0800)

----------------------------------------------------------------
Allwinner Device Tree Changes for 7.4

Main changes: H616 gained its video codec engine, while H6's video codec
engine device node was corrected. OrangePi PC2 got Ethernet LEDs added.

In addition, A20 .dtsi got a whitespace cleanup.

New boards:
- Teclast P80 tablet based on A133 SoC

----------------------------------------------------------------
Aleksander Jan Bajkowski (1):
      arm64: dts: allwinner: h5: OrangePi PC2: add ethernet LEDs

Andre Przywara (3):
      dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
      dt-bindings: arm: sunxi: Add two Teclast tablets
      arm64: dts: allwinner: A133: add basic support for Teclast P80 tablet

Chen-Yu Tsai (2):
      arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for video engine
      arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine

Jernej Skrabec (1):
      arm64: dts: allwinner: sun50i-h616: Add video engine

Krzysztof Kozlowski (1):
      ARM: dts: allwinner: sun7i-a20: Replace spaces indentation with tabs

 Documentation/devicetree/bindings/arm/sunxi.yaml   |  10 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/allwinner/sun7i-a20.dtsi         |   2 +-
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-a133-teclast-p80.dts | 205 +++++++++++++++++++++
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |  22 +++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  12 ++
 8 files changed, 255 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts

--BDuy6gkAhz2wqgtr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmrGWS0ACgkQOJpUIZwP
JDB7thAAzfuPpQJgPM5QtwD7lAPzkFkl2siC+HZymBCvAjn43et7WNCVhOts+qtf
/l1eZGn9BDDM8rlgbqNTuTfrq6T7nxZLt2jxRfhKx1bXyZOqb4IwnzrV6PmDXEFg
xIJoSze93VCErjCbhkH6hMbbHM4oxQo/KLUwK8MJjTHdjZZ8UfPerbX6hgYZ9q3p
AcKC1jM3gvdBI886mx853wNlLGFq68kycX7hItpX3R6cO0Ql54jIP5Wc2WWoj+A4
F8oSVI295y4sfvfzIK8erNW6OBQ+7vFR8lymUwOp4DqhIXdwBu0uQD4OxrUCbTka
Y5BJ25gXS+fVE8fmtFdEGZHSu3oLL2/ZXUOycVEeO49ZaTrnl2xSxBmmMU2BFO3w
kv15oh2qRNy1XOZsxRthsa4+BxhJ9iwZX3vQV6ArSFxs86uaLoCNt5R8SShDqU6z
vwAQk0I1DbT2QWz0Z3rqH1zXWOoqR4T+0FK6vm1ISkmTdsW5onuj+ztQikthPcQK
nJrRoy58zN2N/n0un99JKPqEpclCW/1j4aqxi94JnxEGVUVtCBvqfDczQxnbBotI
gFcwMtoYAfXzDApfme7ZCE7IMTYiR+uAjpeZI5ZfPPn1exD2ZBnjZYPKBhM1a/gu
n5Baa2QN5Gr2jWHzcWd154wOZkBs7uhhUh81SGjS0n5RekpycHQ=
=bJ0u
-----END PGP SIGNATURE-----

--BDuy6gkAhz2wqgtr--

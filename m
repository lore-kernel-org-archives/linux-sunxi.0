Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7387A363C6A
	for <linux-sunxi@lists.linux.dev>; Thu, 11 Jun 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186597; cv=none; b=QwmrdLNB6El5GcVDSqXVXsPsPNvgR37uSOsxfJh1LeqsYwxZh3QPutsXYkyWBGgqSJothm2fU9Ed3uyHoXT0v7NGrCyy1uTVP1vcQ14FlsgGL6DO7f0/wOlCqc7VRxJMVW6pfhxhOVQKurt60WV18UpTdFlg1Wg3aakg6iogUnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186597; c=relaxed/simple;
	bh=KM4LL8Gh8xGad4QI9XcVPIlus9WKFwleUkdRr5fjPXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cyK+qaArX+TSVmUw/yBu32zaKLqBKB/dFbf+hQvvMIOcZwIGasuba6vj6bl+ckzaVEAa3HMulCEVTfyLEcnL1uBXd4aOF8st3wTIOEJzz7yDxXMXe9xM7FyTXJwgFGf6h4fxsKxvmAMIp/QygCuUCE/4uF6TJYY9u+eBiLMZlWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXe9Ur/g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXe9Ur/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E2C1F00893;
	Thu, 11 Jun 2026 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781186596;
	bh=5DHHyzLEfw3GTU4oBkJkB3iK+XV3OFBbTGTbLxfr4IM=;
	h=Date:From:To:Cc:Subject;
	b=dXe9Ur/gCDsCGP9BHXfYJ4cZ5PQRdbtr/IcXQWn1RrkY66fLe5sWl9AlrF0vmaX5O
	 Ju65FBO7/IXscgKD3270ZN/Kbs9XyfoFdTMjo+Ck6OcZS1l1+ZNRqB5f+y7tLwGbKn
	 /4n4miM7gjBeiKNcOX7AVYNFYCMsxwlfq0hpzozAuH6O57YDENSKH2nDGyHbf5o8sR
	 mbVqMI+/QPV5CQbGXpS+kztKG5m7exMbMr8wvEm8Rr9MztsOJbBlPeo+g3XnHBq48r
	 A5SMZda86jWkUKAolKWCrC9o741RC7THdZ8McHw1uc08Pxnwmf80Q+FXMvC/wifklF
	 Ylj8bCDeyRdkQ==
Date: Thu, 11 Jun 2026 22:03:11 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner DT Changes for 7.2 - take 2
Message-ID: <airAH8n0YEtB3i2a@home.wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dusNKKIGbS/LLl67"
Content-Disposition: inline


--dusNKKIGbS/LLl67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.2-2

for you to fetch changes up to 6b81aa0c8a4f038712fa549e4d44d8279eeb0440:

  arm64: dts: allwinner: a523: Add missing GPIO interrupt (2026-06-11 21:46:33 +0800)

This is a respin of the previous pull request, minus the V3s clk
bindings change and MBUS node addition.

Another patch, a fix for the A523 pinctrl interrupts, is included. This
patch was just merged, but is long overdue from pre-7.0, the binding and
driver changes were just picked up for v7.2, and we are confident this
will not cause more issues.

----------------------------------------------------------------
Allwinner device tree changes for 7.2 - Take 2

Some changes for old chips and some for recent ones.

- A83T gained the MIPI CSI-2 receiver
- overlays enabled for Pine64 boards
- D1s / T113 and H616 gained the high speed timer
- T113s watchdog enabled (for reboot)
- H616 gained proper SRAM regions
- A523 family gained EL2 virtual timer interrupt and GPADC
- A523 pinctrl IRQ fix

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: a523: Add missing GPIO interrupt

Jernej Skrabec (1):
      arm64: dts: allwinner: sun50i-h616: Add SRAM nodes

Marc Zyngier (1):
      arm64: dts: allwinner: Add EL2 virtual timer interrupt

Michal Piekos (4):
      riscv: dts: allwinner: d1s-t113: add hstimer node
      arm64: dts: allwinner: h616: add hstimer node
      arm: dts: allwinner: t113s: enable watchdog for reboot
      arm64: dts: allwinner: a523: add gpadc node

Paul Kocialkowski (3):
      dt-bindings: media: sun6i-a31-csi: Add optional interconnect properties
      dt-bindings: media: sun6i-a31-isp: Add optional interconnect properties
      ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node

Peter Robinson (1):
      arm64: dts: allwinner: sun50i-a64: Enable DT overlays

 .../bindings/media/allwinner,sun6i-a31-csi.yaml    |  6 +++
 .../bindings/media/allwinner,sun6i-a31-isp.yaml    |  6 +++
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi        | 43 ++++++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       |  4 ++
 arch/arm64/boot/dts/allwinner/Makefile             |  6 +++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 38 ++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 19 +++++++++-
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |  9 +++++
 8 files changed, 128 insertions(+), 3 deletions(-)

--dusNKKIGbS/LLl67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmoqwB8ACgkQOJpUIZwP
JDAD5A//djDPJ8AgAYJEx/+UhvSbVJaDgrM+3z6ZNKoTblwS052gP0PR5n65Rdv8
wAqc63YXeDX2a/19UJPYP5K4DyRPWR8qxl32AEEprSFikiy2lB0DztklCKxHodYE
HmeBsaXEioccXGUAN0p/9CH9DnBBw5LNMKNgmGPJ/ComopfC6U6ITgAP3gB9+0VY
AtkrCoaV+f7iWROLQMTHdV3lFBO8195TyC6abrww+eLgc2+3nwSRYhcMTMis7+/N
x6vr5JpdoaUCpdQEnCHinP7+DGlzMdSgYFo++akkgArfRopJSH7fdD+k/V0DSCz0
le07XIVEzg/4o9x+9P0oy0KTwcxWebEcf2SP5ylVOJ3bu6zkVCXcvCeKubm0/QDZ
+m6ktbPK86ubMXYzb6FYJw28lUndEShEOWfW4OQ3bsnBl2gZvmrgErUybYrQV8ob
nrEcUllBOTE46bfI42wiPrFo91oH8YybTe7uFC7jzOZ4GI4NGOgBaDVp+w7er0Sg
DBMUti5R0oWtaf2mTnQZbB6C4xM/6boVlijnizEUBttjMVcXjC2EKIXqyX+/VXaR
47sThcuJTPSTtZtdxP3ar48z7NWNowFx092Jn0suSd3EU8HVDf6Am/TmIsONwrom
mqI0E3H7aI+xRnkQStqIQ1YPUN4VBn6ubis4oLByQlLFLgAES3g=
=6DUJ
-----END PGP SIGNATURE-----

--dusNKKIGbS/LLl67--

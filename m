Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2304367B96
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Jun 2026 19:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340889; cv=none; b=DG5bf+5ir1sJW4EKYRDDTfMW+a72GxfFVxrjKV1qtgaRiJ4Abx6GR65/gqQlhR+pnoI8iXMTfFziFvPM5tQB/qw4bpLTuVJnv3UWRGY0eYDzivFDcOW0SJUUstV6UExlIttQWWOHCslmT7eOGLd6mWYgOkxBuCdeEEFXRrnkLDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340889; c=relaxed/simple;
	bh=Gic55DZm7vnn+2LPNNiwlR1R7141b2vZIM9Xan8vBsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAjsuP8+urPuePuORWCJslglLbskrjdVXf7kr2Ly3kxXBb5VeW1Bcg1kaIlOQfa55BMawwP2tJly01Bi1+03cUArY2Uj2HSF+6mKCXWGGVGWi70pErK1OH2ntjtLu/fyRyoQv1T/OGxqaLX+DNw33J03auElj35pKyYFZk4eZ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBM3ebbe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBM3ebbe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4AF1F00893;
	Mon,  1 Jun 2026 19:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780340886;
	bh=5BBooQ+POiDj884MIiobYfemB6cKypHIDePShLGDwAA=;
	h=Date:From:To:Cc:Subject;
	b=lBM3ebbe9lmiNelN1SZsZyIQSG0p8EK04o1Wgb6+YGsr5Wg6fEIGbsm4MTlvyTPDy
	 Byr9a2TILbEzLQkx0p+KszgyZJLPSWQ0bCrhFZVeWJcseFsK17n9PN6ykzRNLYUbUA
	 Ga2vhcJ1jQ3rq/KtN9m1C6iEo+nCrTrPKDzSziboMtAhCoHpSVB6iiqbmVWnvm7Gt/
	 d+Re7CsZjqrxvgkxYeyLPeFuLe2mRQyrU7lwpezY+i/YKmGlSZ38tezYXgrdvPtLC1
	 iRb3ACgZerQ0B0QK9gVwEbKL6QicBj7FOltQmbEchNTsh4wsSCX53E2F9DkYxdT4nb
	 4MJkIULoRcV6A==
Date: Tue, 2 Jun 2026 03:08:01 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Driver Changes for 7.2
Message-ID: <ah3YkTZAR2GXlC3x@home.wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VfsGAi0BIhPgGehB"
Content-Disposition: inline


--VfsGAi0BIhPgGehB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-7.2

for you to fetch changes up to 61192938a5870ac36edae81e4775b680dcf02c61:

  bus: sunxi-rsb: Always check register address validity (2026-05-25 06:37:11 +0800)

----------------------------------------------------------------
Allwinner driver changes for 7.2

Mostly changes to the SRAM driver to allow for one SRAM region to be
"claimed" by multiple changes. When a region is "claimed" it is removed
or disconnected from the CPU's view. This is needed on the H6 and H616,
which have one alias region seemingly shared between the video codec
engine and the display engine.

One minor fix for the RSB driver is also included.

----------------------------------------------------------------
Chen-Yu Tsai (6):
      dt-bindings: sram: Document Allwinner H616 VE SRAM
      dt-bindings: sram: sunxi-sram: Add H616 SRAM regions
      soc: sunxi: sram: Const-ify sunxi_sram_func data and references
      soc: sunxi: sram: Allow SRAM to be claimed multiple times
      soc: sunxi: sram: Support claiming multiple regions per device
      soc: sunxi: sram: Add H616 SRAM regions

Samuel Holland (1):
      bus: sunxi-rsb: Always check register address validity

 .../sram/allwinner,sun4i-a10-system-control.yaml   |   5 +-
 Documentation/devicetree/bindings/sram/sram.yaml   |   1 +
 drivers/bus/sunxi-rsb.c                            |   3 +
 drivers/soc/sunxi/sunxi_sram.c                     | 196 +++++++++++++--------
 4 files changed, 127 insertions(+), 78 deletions(-)

--VfsGAi0BIhPgGehB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmod2JEACgkQOJpUIZwP
JDAwzg/9FDd9z1H9vB3wTj2ptls9aWIdVQ1kIinzaIl3/AzoSdJXNevbei+l0njd
plqY6KeJIT8DDIR9d548fEFsQt5E7LIrDXxSx+lk+VfynjFlORlCwTNM8DbqtRMB
hw5iAZAm8krS/QP3CRMgZ/wKzwwNLabjdLDB+7lDGVBxAIQOoOuSqU/CSpWrro8u
mCY1M2xYN4yf1Hn8+dwAgKBEp+DbmlZCuD2SFWM4JeII2jNKTaq1P88pVGHpZsTe
Kf07EppN4gllUIrHoPchRzoumuUG2ix5/CtseEm2D8MUDLwPqDPt0U0uwERhvJ5W
U3QGN24gtcX7CyMhfoA8Gowbn0+0j/1EnlNBS4UY8frdHItbXMDcwgrTvA0M1eEe
FbyNKqD2/a8kwEn2avghaWu/qL7+CPoU3YB0A3aJyfRZbXPL6lL1BHZ1GcEWPa8y
WqmS3GwbeJ5Za2dI9BG7f45rpF2cfntUbVclMO28LsI9uDTaFCO7WcLxeMrY7Ipy
jwd4bQhynnM3d8qS2f/628+jGQ9qmjmaGAfyOrusrkYLqHpRI9wiq7kMSzCcy/5t
n58YlYxoNNeivq4ZOZPvL+/jVDOFGE/aNfoJT6xjA/WYjtdZ4hBZT7/+GRWHOckN
VBmYdIkScoL/FPdLyx1mUcUGT8NhfPpbH6kGWCyWm69k0nLqKro=
=Bcm6
-----END PGP SIGNATURE-----

--VfsGAi0BIhPgGehB--

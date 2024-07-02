Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BEE15B0F0
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jul 2024 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719933317; cv=none; b=szKvY4mNvz+uyYWJqbBRW64ysau/U9vUdEoLweBf1iaGVrK6DLfEn4ZRaiEef3JFAbtzVFOIr0uLOp2DXtF7/3AKX1uWZ0ep5ZJ74VvyoqX1r7/hOYR3IA9X7hFBURapC0HF4ROs8uwuWzFZuZQykHU9xFDvPqQ8Q08mgNvSNQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719933317; c=relaxed/simple;
	bh=DaZDSPKv0/JYgC5HIzXmptUVG/3T/DsPn7yQ8KqnQwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nuFRriV43lymKpS8Yk1yrODpMb+/YQmRUYgYRpAKBbrCVsI8VXfGIU5Wa4NfJyi1BNv4H/rxN6mtT3fcJ/Dx05IGn/y9xx5r7M/X+xNtvkW3hXgQTt4WFrNXOyWT4FwuU7Zctc5paz5TQm9BkVmkPBx8o05G4MJPWA3AaPkNbXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTsCW2xE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTsCW2xE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E19C116B1;
	Tue,  2 Jul 2024 15:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719933316;
	bh=DaZDSPKv0/JYgC5HIzXmptUVG/3T/DsPn7yQ8KqnQwU=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=MTsCW2xEeIUX9y0q4uLZNFKjRYNg9LxTkO93FvAU37Yg2frtWHuOGU/QDi2QzxdLm
	 iwTSbppvBIfsiTplPYnKWn/Qmc6zS+M+bztLvSFpBEGYuti9vvDETpT/rq7oYBBkz+
	 aiHOELBPZXFOXUMfMmXdyLYIXPjPe/GWQs0cqUlf2CJoMmRD0eyZ/+lnAe0e/A98v0
	 4nhUQgYihjfvmPqj+wR2Ufea2mZzxJmlPQ1Xz3EA+q1sE+Ku+vccU73m7KQKhaE47S
	 zf2xL+B0dMHNsVMBmicJGNhICaWj43/IbWQGnCPBxQeWuRhZFoWZ8lETXm5RKYr/dX
	 SusFZ0M0uk96Q==
Received: by wens.tw (Postfix, from userid 1000)
	id 151B45F852; Tue,  2 Jul 2024 23:15:14 +0800 (CST)
Date: Tue, 2 Jul 2024 23:15:14 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] Allwinner SoC driver changes for 6.11
Message-ID: <ZoQZguQ6taJziJ11@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u/pROoVQ4UI9smts"
Content-Disposition: inline


--u/pROoVQ4UI9smts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi SoC maintainers,

Here's the second pull request for this cycle. We have a couple driver
changes for Allwinner SoCs.

Please pull.


Thanks
ChenYu


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.11

for you to fetch changes up to 3a6fb9025cdf975146b2f2e3771b67f03c4ca3dc:

  dt-bindings: sram: sunxi-sram: Add regulators child (2024-06-30 23:00:49 +0800)

----------------------------------------------------------------
Allwinner SoC driver changes for 6.11

- DT binding addition of regulator node under SRAM node
- Cleanup of unused list in SRAM driver

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      soc: sunxi: sram: Remove unused list 'claimed_sram'

Samuel Holland (1):
      dt-bindings: sram: sunxi-sram: Add regulators child

 .../sram/allwinner,sun4i-a10-system-control.yaml   | 28 ++++++++++++++++++++++
 drivers/soc/sunxi/sunxi_sram.c                     |  2 --
 2 files changed, 28 insertions(+), 2 deletions(-)

--u/pROoVQ4UI9smts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmaEGYEACgkQOJpUIZwP
JDDOnw/7B/RuxhhrPZhJytnpt4+P8X/pSCqrW4UW2ljnCWnWX2+mFw+5cUxYK5LE
f3YZAUOtIOVJyAFlnXJTOpwM6Cgf+qYer1bXt2T1PO5/F6O7ryI7woVWdQuTLP7O
Y1r9xsXE8D2O15Fval3GbAIjuKjyZyCTEEGJe//UCj62Cbf/VnugccS9I60BI+g8
c5j7rD4FOiZNeKk7DDJx1gHWQRBHGccRpX1hUx+ib8S9OWjOeIdch6WvOlBkTmBh
j2VZ3hwuOxzisemrigKAElOfs7Rs+zL5y2VPckq4jWvFOb4ZCSHsLTxiL33GguA6
pd6Ui6288Rxovo2FmpnGhgYArGuGcnqovnGd77g4AJ4XpCMG3DQJYy4NlHKBg2eP
Y+4FlSI5irKPt15LOhc7k7igQ0qNHG/KxszCCJnacJJx58bjTAy+hd6YQETtoueW
O7ldKj/wxArOfAQlVpYQUh3/DouD8qJAFKW/iKhbhdFOc5ZXO1BXsyxnW6SYSjuW
0lAG2euXIE+2PyavRxRlV0PMB7uVqCO7+yngJFxd8vGWji1+z96loDSTvK8u9pJK
Oz6a8Okvavxt4ldPvBd6+eBXxhvuMdd0qqyWZ2gUdERW7+rhwYaTiGRfkj+WGPry
HOOnU1nxXluZVRAPETq8fFsXsXbpllW3fEZEg5yqmLCvwzaoSKM=
=guj2
-----END PGP SIGNATURE-----

--u/pROoVQ4UI9smts--

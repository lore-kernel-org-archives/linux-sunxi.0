Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1A323AD
	for <linux-sunxi@lists.linux.dev>; Fri, 16 May 2025 02:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747361328; cv=none; b=iCE4+4Wua7PJRUWIHOozCr3WRERpeAAN1nCJLRgY5GctK+sQLF/uE4VYTH0m6BreZgun3ro/1TBSjs7LCIUpCunUPH+0wVvuD1jXsLUSPgY0yyhcga/Z7REnl/Q/8TfSkHqfeVgx1j0g+lu8hjhiM6Db9NGl4HlHyUnhvlMTAHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747361328; c=relaxed/simple;
	bh=X7Y2TUm5WKa8IQzCF3jrHIgaYTlWsW3VGzqSmV/UGCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pYWrqtOnOJn2bWsrEbhNiHrMfGktjtziRhjeNYstgmlpjCuY1fa+PAIRM3biIf5VmPX3Dx5CUAFPFaK6UIirzHkhU7BX9+464rWfkTzEfFR/91cC/hfRbJS4IX/AekkkTixGPTl8IP35Nmav9G0W/eFhZTSML3wJpTIc0U/trsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkM8a4n2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkM8a4n2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D43C4CEE7;
	Fri, 16 May 2025 02:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747361328;
	bh=X7Y2TUm5WKa8IQzCF3jrHIgaYTlWsW3VGzqSmV/UGCA=;
	h=Date:From:To:Cc:Subject:From;
	b=DkM8a4n2bIGr9l3gEO/gp1anlCqJgF5ipiLdRHQ2X9owzQBkT8g4iYuYRP114qaKB
	 40T9tyMr25gcSfk85u8Or70jh1uBsvoxHJ7lHJzkaVJjYOtyhnSaDJSfVbs+WCPVRF
	 6Qnaqxav9zBf/qyy1FfGdiNGfFm78ZtHrHSHq1u20jCFVUg1fj9+Iul3e6Hj+BjFx9
	 w1i/WsiUsHMMV4XPIjbwyZuhmHx3s3A0oLJXMOCvW7CvGRuvSBaMRFRsKP3Go30X2a
	 RcxBNd3NIXegsAbM57tFE+8KOWw2l/zt3sZdxouTaN6HTny+doNHaWFbD2qgFhhwOO
	 3Re5MDhmhByGA==
Received: by wens.tw (Postfix, from userid 1000)
	id 0FEFC5F74F; Fri, 16 May 2025 10:08:46 +0800 (CST)
Date: Fri, 16 May 2025 10:08:46 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner fixes for 6.15
Message-ID: <aCaeLgjZllV7bauX@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OtkIcRTRYefZpLF2"
Content-Disposition: inline


--OtkIcRTRYefZpLF2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.15

for you to fetch changes up to 573f99c7585f597630f14596550c79e73ffaeef4:

  Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection" (2025-04-27 13:38:14 +0800)

----------------------------------------------------------------
Allwinner fixes for 6.15

Only one fix:

Switch back to I2C for PMICs on Allwinner H6 devices. Apparently using
Allwinner's proprietary bus ended up causing issues when the PMIC was
sharing the bus with other devices.

----------------------------------------------------------------
Jernej Skrabec (1):
      Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection"

 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts   | 38 +++++++++++-----------
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts    | 14 ++++----
 .../boot/dts/allwinner/sun50i-h6-orangepi.dtsi     | 22 ++++++-------
 3 files changed, 37 insertions(+), 37 deletions(-)

--OtkIcRTRYefZpLF2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmgmni0ACgkQOJpUIZwP
JDBP6w//dfQ8y3BaDDpECuxk4MTFho8BrEKAUOVNTStsS9UgkdAk+Z2IGRJFSEfY
vh0Dbr7/MB5Zna60cDgmlF2bIjeE09yDRU+l1MUSMVemKwZBV3TIQriuPNO1susH
0vfAo/MbvHaC6bta39VCg7dwCMFYKiBHjr83CJnPkUjCMJtUaZeeJOv0kMv5w3cw
TEdBx0sPp0DXAwnWD1f5Jn65KBR8SJKYIW4zMIGxmHyYKkoKLTgQ5OGyhHb2QfLG
rZjR3nvB4V67tLlse89BPi42hxeZLNTJ1X8ryt3HHH0mDZZfA70h2vpcQSco1gF+
78L7TWzR7KdspPj62XcD8WQjYTcmOZRZ7Q1+IDrfgS3VUuqpnpW21d42qTmScvqz
GJmA9YEQ4NdUtSiDC4mzjKrMzLrTj5T7eL5HgHiyJw1PehZNoJYdJGqDGcHVXsu2
yllTynJLJxB5XYRYf1sOJwBTAxl33m2n08BFO0zDL6HSZYkxw3yoCQ+OmHPNFDBq
B+Rdscpnv6s7Tl8P69wq2HNYXCK+W/4S5+T/3IiDktVMwdfJEXCM7Ivid+R+fQ0U
ceKYO9La8wiKwPGkgJoZML79RnDQ9AcIav8DwQWZAicVnROCIXRz4XpBjfqP++GE
tOSFoq5oRYi5ytmiTbKK35Yy8heERk6osS2UvNc16eVjRLhNSpc=
=7c46
-----END PGP SIGNATURE-----

--OtkIcRTRYefZpLF2--

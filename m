Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E237C37F303
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773871; cv=none; b=gWaOsw6xcNBlJ8W7cSVI8mMSpPfBdjCnslF+pSOedqjaJgrhCkIO01GSXN4vEItAE7IkTwFsIOYmzIXIZEDmoWeVUhkVJbpwUlsfa/bS/TeH64qWW9wuPNoaifumXbq1DiK37Sh2Ss3GJjNVJkhl0S4ieBa/Tk/ypbrEnbt0Zvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773871; c=relaxed/simple;
	bh=BmWWOCdnDaLmpE539bT1u+ipnSHVCbX3QF4I1GcCi/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lch+tvZdh13UHkd+dAEl21fHOlIq9v3QvSxt8gn7n1DnT+2HmPsjCmBZXYZCLFnUt3j7BBAvL7p7yVCkYDf6lWJGsA9OFaAqBVzomOpxwVb0YlO2l58t8Tg6zq6N9iLTlZLZZzKgth62MAx/RhnxGz8d9agLcrcR+r8lX+i8388=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOyKTfG4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOyKTfG4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE081F00A3A;
	Mon,  3 Aug 2026 16:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785773860;
	bh=A+cBZhhBZSCKE4IdtwhAxDZSjkPHDuynJdWQOz9V520=;
	h=Date:From:To:Cc:Subject;
	b=UOyKTfG45IPjNnMKWv7vUMmDrJgsSLTrKCOAKvNBZ/KTPg4iqP3acA4sjyy7Q8984
	 uWIEQq/WxVMq999fB3M+Ps4JyMgddDPIgBwWBxUhkbRCsGFlPEF9fDez7ofD2USmYt
	 +lH5k4ReJhNQTNaYhNc1hS4wJni5SoLM2couTke2CTJLwZad4ZjEVXO1TLwW4lUP65
	 tWqZY4dEwQy5VMm7YTyzlv/PYMbRr8AV4cmTzehTsHxoowaAK92oE/b9wH7C1f9uXI
	 4fHHVzs0TgBRqoRpDC+mwP9q89o0kJi71wTLf9H6I/2YMT38Qx2pIRez9Oriskyl66
	 Mgs8+MTBRx/kA==
Date: Tue, 4 Aug 2026 00:17:36 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Defconfig Changes for 7.3
Message-ID: <anC_IPRrMwKHzc0e@home.wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N6IGr/i5M61X8Dyu"
Content-Disposition: inline


--N6IGr/i5M61X8Dyu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-config-for-7.3

for you to fetch changes up to b4158103c45386ab30ba7624bee17ebf33940baa:

  arm64: defconfig: Enable Allwinner LRADC input driver (2026-06-29 23:45:57 +0800)

----------------------------------------------------------------
Allwinner defconfig changes for 7.3

Enable the LRADC for arm64_defconfig.

----------------------------------------------------------------
Alexander Sverdlin (1):
      arm64: defconfig: Enable Allwinner LRADC input driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

--N6IGr/i5M61X8Dyu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmpwvyAACgkQOJpUIZwP
JDDWfg/+O6qUdq8k2l9tLd/v48ARXPwuUAiWsOYAAHyjp5dkPycUHAJJu24BCISB
hmJCm4BKCcuh8oc3qwzXcMACY4gLRSXwNOdyX9eiCVNbPbwZ9GTyt4fMc3Tn4FTY
5iAxxTKd72/9g0Q0cfjUffzBR2Ldk3SrLdu+UXQ/LnnCd9ihwbax9oerSvcapnuv
ixv8PW4QXXODUV4M4dfkgNLlCSL5d0USPI8eZdeyUoWzH5w2C/JiEA8UzGSLQfw+
pEZO0GHSYPq6X24spMcK1XjOf7hwxcPTh8LewV57cRm93Wl8NUMiTKMi/C3npkqm
l9GVRoCLn9WNad1DQ7OhssBpWf8shpV4cHyH4bBq23Gw06xaMrx1d2LmuqJYcxa3
NYj3TCrl0Uqxl3zRCVj3VRNZOlc3a9DE6cw2Y1vpzBGamLWfeQ+zrzhWK4bCUufO
J5LUwbpqv02xccbKkltyTQYrwmgeF0KfSPieSBugct1NVXzXGYcotsXJ3+BXiFUw
6YkPrWiaFyl7AxR3oT/sDsGgPLJzDdXskvKepSB07DOjIOZGX2HW8kL2jh4j1ryP
HJStaiEBUPB+Ztx14hvlHdSAVDkyGE1VWu+deuDcGD2oBtEECrRO8B4YyG/CP63g
w/N5izI4vmdMAp9EWHkmtC5BWO0Q40mN5DVtIM8W8cMteuyF9y8=
=b3X3
-----END PGP SIGNATURE-----

--N6IGr/i5M61X8Dyu--

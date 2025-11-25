Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAEA32549A
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Nov 2025 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764080198; cv=none; b=OfLkAsyUI/QsPD7zcr9ZPaU1cPjGUvWq7cpMUWps+GklQ9mUmRdBy7548qZ4P4U+2gg5NCzGho8QJ/TZh2xfaAojZJ/nAqQf/XDM3gprsalDbj99rTGuyhUNFFBbJU6CgfGAjGENokuw8Fzk9Bq1xqgiLy8KM2hMqLtaw0nn5JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764080198; c=relaxed/simple;
	bh=j3nfGadwUDjMgTdXCatHDQbxvZr231jjSff4Bmlfkh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QQG/X/PA5kKNDePoKYGA0h3Ix75zUkEYuWdX3dKzfdCGT5Z6ULGZeGubSGBhuQSvTUfy/es5+YNjRmCEkrB4cDx9cMQS/8sqDt0m/TMJmZuHZH174XRXw8VJeMRsmSzdxGckOkMZhU8SE56ZmPwANh1Hajb8KaJIT+tCfPKCHuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBP4fdOM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBP4fdOM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AF2C4CEF1;
	Tue, 25 Nov 2025 14:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764080198;
	bh=j3nfGadwUDjMgTdXCatHDQbxvZr231jjSff4Bmlfkh0=;
	h=Date:From:To:Cc:Subject:From;
	b=sBP4fdOMkH7WwZqDbZ8ETIqRyvSpTJjZ5lZSp8MYTiLhb+JOmGfklgIkOBNHZ+b9s
	 /oe57QWnlcgRj36YKsBvcL6/LPA4DlELXQSHetbOPCZgU6EB4izdADkguiDl/dS72a
	 7kI78H+hP+Pvt8YDg1lMFJCuqbrr8MMLkLC1Q8ZHQwxXUUrBVVf3sf8i5Efc8t8NYJ
	 WX0OGputg0ScCLnDUOic3UvE20x5BFbPToHCXQFxQSj4eQsrgg8lbQ8HcIVYX5LpB6
	 f2di8AyLRGhJMEhfQ9Gv05qb1/g0EM81VYwBUZQvhlOCP7WnS604r5oX9FLyveljGo
	 yO3m5SyX1dMRQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 99C835FD53; Tue, 25 Nov 2025 22:16:35 +0800 (CST)
Date: Tue, 25 Nov 2025 22:16:35 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner fixes for 6.18
Message-ID: <aSW6QyCvqM_DChbG@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DJKq9zpsa0m/tR0v"
Content-Disposition: inline


--DJKq9zpsa0m/tR0v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-fixes-for-6.18

for you to fetch changes up to 9f393d8e757f79060baf4b2e703bd6b2d0d8d323:

  riscv: dts: allwinner: d1: fix vlenb property (2025-11-22 09:19:42 +0800)

----------------------------------------------------------------
Allwinner fixes for 6.18

Just one fix to correct the "thead,vlenb" property for the RISC-V based
D1 SoC family.

----------------------------------------------------------------
Sergey Matyukevich (1):
      riscv: dts: allwinner: d1: fix vlenb property

 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--DJKq9zpsa0m/tR0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmklukMACgkQOJpUIZwP
JDCkOA//TvgyXYI40m3/T4+wHSjBhxtFFCnQ9h+dF4bcE64TvWSwcOyCHO1k8zaM
KJOYYXm3wXaNDvWN1H8/tY7hJHAPpsfTRzgEFX88rlr6/9c2AtGZnm37rtnGQ3NU
Z9fziFumZrzUWLvOKD55I+rZKS9N1xA4Qq4seilfkuuiwY4xivgiDEA4HeimK5MC
mdwICWEDgxWBNW8Xcw2kbuHW8ScpDhVkahreqkhGArYJHOavqGQtUbV1pvN/uYlo
89/lVKX7KPv6a8y335R0He6KqcPY+oPSRW+0nABT9NEot6Q++tUSc4aUBV1tErej
na/AF9DDP/UtZZBIxOVnwD2pYBqfvsOhPbG0dyt0r0c5sYjsZN+9D5iuWa5GKovC
+jh9lx+5xDaPrqc4v0jXWY97wKHAvU3Sxd5J7zoYcAcQTuxMUZFyDGovtSdUqfQC
96M3lFGx/ue7Ky4VOqELLsF+NNyBbDzSc7XITXmq6rXh8c0Sh/C1vgTozjCsNQfb
9ayXF84Xax1a8Fml5lyEYIXeHTu26CzlmbE/0vL2FuQXb8T31hsp6v0SRQmNj4XT
OW1h1tJ5tN98ASGJ8GOwPcef8vsJr4AHGCYa5qbb7xlaHwsDHhNCKVRepOn6a2+f
FKjQgdy8zWKny4DewnGGTQJ3mOLmnYWjWNpWB1RxEgoK9xLK/+g=
=jqdm
-----END PGP SIGNATURE-----

--DJKq9zpsa0m/tR0v--

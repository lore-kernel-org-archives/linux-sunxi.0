Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FB425487A
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Jul 2025 17:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752598953; cv=none; b=qnW7rM98ib4gd+WJodWIEc4+zLb6pEqZwoOhnd17A4QqUlZZDlNRDkSXolwsaa5IfCm2Bc4NS4B26H6YDMGBgpagHvvwaqUqpY7GUBt2X+X/d9XYqc3+Saal9IqTdrCV6MX6sH/4kNuE8lWrS085KmHQ+x3Rv/rv3Si51PyChyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752598953; c=relaxed/simple;
	bh=aUCJyXQ5/raMpoER4Fy00O2WoEBZyeIcEdSA9QVD9g8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bFpWiGIbbIKK9ZZHBzq8qxJ/8hpgZmvNwmtGT8ypAN53m67LdN66zjcUe2xHT4ILVC4W5goboKU2ckKTjmTtN+Wj4mUsSH47dap0UudwO6MPaIhd//PNo5E3QWK5WS9vl0LZtspnviqE5noRVdOHrKHti4yLiRkSNLQx1aOYb/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIryMHG7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIryMHG7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E73C4CEE3;
	Tue, 15 Jul 2025 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752598953;
	bh=aUCJyXQ5/raMpoER4Fy00O2WoEBZyeIcEdSA9QVD9g8=;
	h=Date:From:To:Cc:Subject:From;
	b=BIryMHG7k90MxQfXIHYMyS/lpgobYPy5dq1BV1SZYWXDJYLKmPQXV2CDjvJGHBcK2
	 8GtLcL6m3C1lBd8K5lq+mwygA9wYoMBgF9rAaVMeZCV6XAHj+xk5if3X6p8Yt++pWI
	 frzxamAnIkBOgTaYO+XP1KQ9PltVIfpIYHgs+9ecXB2Q8nKh4Ljaxf2+d8gAKN5Rna
	 FGKwfgB1F8vMG8az2IQf00lu7TSh21C0RsbxYXerX4j9m0PmDSGw5hAKwdzP3g1iA4
	 yi/8yb1q7JoOC13cFhcPCoBhEm+/KbjZS9oQJOCTNuUbrfSHJWYqWE+N0W87hRCFHM
	 aLtxluZYYUKuQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 07AEC5FB53; Wed, 16 Jul 2025 01:02:31 +0800 (CST)
Date: Wed, 16 Jul 2025 01:02:31 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner fixes for 6.16
Message-ID: <aHaJp8ut6z9Ds_qn@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RLQuYqrQwKO1rDBZ"
Content-Disposition: inline


--RLQuYqrQwKO1rDBZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.16

for you to fetch changes up to a46b4822bed08d15a856966357a4b12273751cd3:

  arm64: dts: allwinner: a523: Rename emac0 to gmac0 (2025-07-09 00:19:44 +0800)

----------------------------------------------------------------
Allwinner fixes for 6.16

Only one fix:

Correct the name of the A523's EMAC0 to GMAC0, as seen in the SoC's
datasheets. The matching DT binding change is in the net tree.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      arm64: dts: allwinner: a523: Rename emac0 to gmac0

 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 6 +++---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 4 ++--
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

--RLQuYqrQwKO1rDBZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmh2iaYACgkQOJpUIZwP
JDC0cxAApv7b6yHKWL+NGNQHegSmBgNQuVo/m8wRxS0pOAh3aiwgf7tZmdZRUHVq
OhD3DzU7NOUBhr5A4t+ZLwASp6doe49D3jhqQdlJw3c0w6R5rVb+1rix9ulQg6sA
wXu7wCyt9soLWPohQ9m7TVWP4xi/WZDB9i6tTInNNXDBHafp7yf2uyB4YnlU/kzS
6oz1QcM11XDx3N/ULGMqrGdYYf+lvHlAsZyqQRE9QYnnDgqJH+x9cAhM+brGKNSA
UEl6/yNBSc5GqTmk3SA5t/ISYNuVWS3kc7wvY5Jdbn1YRf+Gr/Dg8ODG0iRR+hr2
QI11WN9e9/CxcQ/X3zonC2hqsrlSTEjs9Hzu0yspGCSaYpIJ/L3zrwcDT4cRvUzp
tTvmUQu/CPH0IjTqddvzl4J5genhagj9htBvnxcMtNkXve6CnHFl/+GckZZQZwTC
t+iBuqqb3393hkErefqDbqrwbKS+iMJSENYjPLnKIK4nLy4VpAY168A2TzCbPTkK
20HH87TTy13LnFG9Pd56LKbys7rSCGYBYtk8p61rqjR67GaQdC4F9Jt5a76IcRlo
XlS226w8sz79CQ98axn8uTIbx+HJnvdS3zV219cwtOAEQUNKp0koxdSYGmYWMkyk
9JpgiYkt8/KHwVDqF9UrRJaLmBjmHcL7xkqP+0Zpel6VTsD2SiM=
=8no+
-----END PGP SIGNATURE-----

--RLQuYqrQwKO1rDBZ--

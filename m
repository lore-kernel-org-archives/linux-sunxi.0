Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E03B20B22
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731247675; cv=none; b=cNXAfTo4/+1ndaTIw6LpaNjd49z2P4ZmlRK11+NTTyKTtUxBp3a99XlTd/AKACjlJhB5I1x0fBe4AS2JA1NY7gUQo4CO+nDwSWxfWIS5rHZ9/gdmr1qCSyLYBUit+irZDirZ6MBvEpkeYRJ7gy/HXCmD4svSAGblyU+Os5HIUso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731247675; c=relaxed/simple;
	bh=gdPhLJ8j4Uzlo5GhXPaBgpdIH/HGDs5q15PpmoTKRSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NwX2hMev0xW0uUiNRoWDbmM+ChcHrvGBJKFz/GVwzDRzVrg9yqNeYYvtmpuxaSLBcxdAvfjikRCwiZnJ13OxoFg0KKlGBSVsuqJWQOdIpEUzDZVWU4KK+ps9d/7+rivsT6sMBx8Ct0iV8JbXolJDjAmIWHMCA7hrwtBIno0WTPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdKhFAdZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdKhFAdZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE957C4CECD;
	Sun, 10 Nov 2024 14:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731247674;
	bh=gdPhLJ8j4Uzlo5GhXPaBgpdIH/HGDs5q15PpmoTKRSk=;
	h=Date:From:To:Cc:Subject:From;
	b=XdKhFAdZUT2Z8hgcW0iCDppxHfGuv/N92KWc991rgLnxUk2dqHrJOJG7WMhzmWDc9
	 gN8seHc4lUQWxP6Zq+HTmuL4hEvPW0gpJoW2ytb4ru5mdQezZLfGwD0y+pmDY29Nc3
	 90XD4E0LJ2Cx5948xELOMEl3Qmlxfsf/NIbdbYD+Mebm+1ZCMYUyeoHRiMqIV8niiy
	 jg9App8qbpyOgFo9E+FGCYQqejA6Nt8YOHl2mArDFrXUpP4iIS7RBH5BA7taT/tXTb
	 i4sodyMMw8IHxfpRtzgwPiz2jUFhSkYRcyLLFpDMM6CSsP9tyd90TjdpfziPlSaU1I
	 rVz9eMMe+CKfA==
Received: by wens.tw (Postfix, from userid 1000)
	id 6C8AB5FC00; Sun, 10 Nov 2024 22:07:52 +0800 (CST)
Date: Sun, 10 Nov 2024 22:07:52 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner device tree changes for 6.13 part 2
Message-ID: <ZzC-OF57MT_yCeWH@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nGAeohEqVKDFKVoE"
Content-Disposition: inline


--nGAeohEqVKDFKVoE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit fcfbb8d9ec584c256c0a6e1ae3174a21b007f399:

  arm64: allwinner: a100: Add MMC related nodes (2024-11-02 19:32:40 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-dt-for-6.13-2

for you to fetch changes up to af1ad5675a2b5feebb49df0e0ac7dab1aeabfaa8:

  arm64: dts: allwinner: a100: perf1: Add eMMC and MMC node (2024-11-10 17:=
23:57 +0800)

----------------------------------------------------------------
Allwinner Device Tree changes for 6.13 part 2

- Remove accidental suniv duplicates in Makefile
- Add second source magnetometer for Pine Phone
- Add orientation (mount matrix) for Pine Phone's accelerometer and
  magnetometer
- Enable eMMC and MMC on A100 Perf1

----------------------------------------------------------------
Cs=F3k=E1s, Bence (1):
      ARM: dts: allwinner: Remove accidental suniv duplicates

Dragan Simic (1):
      arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer

Icenowy Zheng (1):
      arm64: dts: sun50i-a64-pinephone: Add AF8133J to PinePhone

Shoji Keita (1):
      arm64: dts: sun50i-a64-pinephone: Add mount-matrix for PinePhone magn=
etometers

Yangtao Li (1):
      arm64: dts: allwinner: a100: perf1: Add eMMC and MMC node

 arch/arm/boot/dts/allwinner/Makefile                |  4 ----
 .../dts/allwinner/sun50i-a100-allwinner-perf1.dts   | 18 ++++++++++++++++++
 .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi    | 21 +++++++++++++++++=
++++
 3 files changed, 39 insertions(+), 4 deletions(-)

--nGAeohEqVKDFKVoE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmcwvjYACgkQOJpUIZwP
JDDi1BAAvWCPCPCoOiaXBftkYbmH1m42odG48rUHxVc0lhXnMaWgDfHhCgc0dQ9m
slfAIQV4iQu94dQDr71X1qMCrFh0uJX71frCPB4fqZs0LpxhrYJqkaYJ1IKbx5Td
OX3UHDL8TzKjF3SfARorgPShvyVr4JoE3UgykiQBE63mMzJZO/ZpGQGJuy4/ns7o
GIw5xn2k1QeLy7sjfFF5Vvj1WnQp8erCAm2SiDQWelQ7n0ZNcbQArHQO+NkFoeYz
KCFiiXi9nNTd4bel9yenYAOz9m6jfQbfLQFrA5NP1gJWgS9zeBX3a6nPf6hcA7fp
Cli1IH7HC7foTA4Jn1Gn578ZEMtRSC+5N6uG5jf6SAUNMdQSRhLRrQ4yuHVFEnBG
R3U42jFY9uvGjJfgGzZ+YZKN0inHovXc9uj0lrvcI6Nh8keD1iYl7dWzkA8Bceq7
U+K6tkYim3DWIuN+7xwbGsL2c6dVWM1Sx7phtybjrbzVqwYROtyp+7e4NqbyZxjm
5fo72/oXAaX8afAPaYxzl0jsnZH1Kc2/cpS9fpY4EljsSM4OS73CTS1Pm2GH9l+s
J6jO306jx0r4IM2TspC91dCeIv6WU/wJjvcMPr5NSmeB5xt2sVeLs5J0s663z/Cb
ooXcAh7RJ9pJC7ktmYj/O1BvTKWdxzMBVJv9H0jxMAPVUzejvnI=
=zFs5
-----END PGP SIGNATURE-----

--nGAeohEqVKDFKVoE--

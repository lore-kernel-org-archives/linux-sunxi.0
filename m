Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4BE3A8E4
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Sep 2024 08:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726129861; cv=none; b=PMll9vxDHBbT8B4Y16medeFPupEDRAJeJPHcCf0HIi7sDfwpcqLEG9Y2QdR0Luxh4tAdAfvnAH/NGJX6Hb3Fi61cGrs8fNNBj43B9bqVSW3H1blL8REzsml5g8IQ+3CQaYZd/1QJO+25viQdNw928s2jJElXsSCescv1qEVo8z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726129861; c=relaxed/simple;
	bh=BnoeUpGqWxHWbBjwHyTUp1LxWEYQAvgqgD4Qow0g4hA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=onl9OCvbD7ol50/dx/OSyjc4L5s6ngKfY0mPCvw9m/UX3NtEf8VI7U9i3BFmy2SA4I5ZcXJX+xYih376pR0IMI/tAnT8caKMsZS9KsjP1QXYH/EcFsF8WmVgLi7X5hk1Rzcgs6nP64nbt7ICWDh5BaycAOjt2GND+uyuFiopeak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYXe7yf1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYXe7yf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D14C4CEC3;
	Thu, 12 Sep 2024 08:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726129861;
	bh=BnoeUpGqWxHWbBjwHyTUp1LxWEYQAvgqgD4Qow0g4hA=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=YYXe7yf1S2wKkmyjtB60HDUrLUBgYvCaB4KDq3YHHRZONjhFWFHxlDQnq1owxoSJc
	 +zwoM4PYcIOXrpZ+cCzSKJYSSnUnMdTcudpQx5FRqm1oBLNBjQBiioL/4Z2tHuTX1P
	 0UKCiEDD4RjaivZ4jI0fB9kraFNNUEurkCaJP0ISdL0HHlDbcjCGtONodSnigHds3e
	 UoBhlHzu/MitM9ysEWRyd2nNcixoxcYyuPcP1UcDrF45hKuhp8/8d4vv5xQYJbKh0C
	 +I1XNBzR+OUGL/VYzldHwcHcIT9UNNR9UrJlVxzLYal/EtT698exwG00UClxWUaSGb
	 dzycGIULqq9gw==
Received: by wens.tw (Postfix, from userid 1000)
	id CCD025F9F2; Thu, 12 Sep 2024 16:30:56 +0800 (CST)
Date: Thu, 12 Sep 2024 16:30:56 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner SoC device tree changes for 6.12 part 2
Message-ID: <ZuKmwD8VQrvNx8ir@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="suWzmaiDCCl7fJWq"
Content-Disposition: inline


--suWzmaiDCCl7fJWq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here are a couple more Allwinner device tree changes for 6.12.
Please consider pulling them.


Thanks
ChenYu


The following changes since commit 89f1a037e97cb2ec0948eb92bca17e7d8c4fc824:

  arm64: dts: allwinner: a64: Add GPU thermal trips to the SoC dtsi (2024-0=
9-04 22:43:49 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-dt-for-6.12-2

for you to fetch changes up to 605f56405a6719dfdc9f91464c082856cd929d6c:

  arm64: dts: allwinner: h5: NanoPi NEO Plus2: Use regulators for pio (2024=
-09-11 16:54:32 +0800)

----------------------------------------------------------------
Allwinner SoC device tree changes for 6.12 part 2

ARM64 device tree and binding-only changes
- Add system and pin voltage regulator supplies for NanoPi NEO Plus2

----------------------------------------------------------------
Kry=C5=A1tof =C4=8Cern=C3=BD (2):
      arm64: dts: allwinner: h5: NanoPi Neo Plus2: Fix regulators
      arm64: dts: allwinner: h5: NanoPi NEO Plus2: Use regulators for pio

 .../dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts   | 37 ++++++++++++++++++=
++++
 1 file changed, 37 insertions(+)

--suWzmaiDCCl7fJWq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmbipsAACgkQOJpUIZwP
JDCueg//QN0lPcrwhM6PhSAr0gHmWL0r/Vg46hwME7sKnyIqvRJWUCqENTJ1WSg6
at1tcuxp2kaS059vWB3T6kqgwboFZ3Ydf3iLVct2jKKM/AvLB4Wm37lk41tmWYEw
IVAT7Vym1L6wz25mKp0d+jWbXO6bDPaKXsCEVraEa034c1DXMddlFCc1gSMYofhY
Bx/hTAu51BHfT9kA0kDKwTl2ua6lLnhZld4+fTsMNFgDtTDMTJPJa4DqPi5Z5INP
PJt28aILbbGbiCDhWzX3RIYYQa8g2vqcHtmtoiUG6aSL5/jjxG0ts1LMpShMSpJd
u3rpD/ziQPn3j3lz9BWPi1OmqIvaax01hWAJ0LJ1IV4ZoPEljDozhNw6ZK+dDoes
apVu3fE43HlOq8tyI4gkWu/lzLuY3nXtIgCL1raeAK1u42LAQ5EbdY4OcrhE/yOh
k3JkoOOk+N/So8c8tWW0uTQ+pzt09uJ+ktPkLhV4YHAYTjtFCQmKbw7T3JmlP8FZ
3S6nAKLwenakdWzxGjj7lep7L8QCYf73sA/GnEX4m7woQfiMZbS1hPiNN/FjnKjf
EY8TlayAvbSSMO9SKffGpqc/9e/RllcYcoavUNFKmoVjE+9OWuG0u42zDZl83BZt
5oPu2qsYMZ5cdvHuAQmtZofFSoSrB4arohM77hu22+0fNhWZpUo=
=TB6J
-----END PGP SIGNATURE-----

--suWzmaiDCCl7fJWq--

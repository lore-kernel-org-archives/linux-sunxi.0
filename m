Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7426F288D6
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763280037; cv=none; b=LZBL7GslCzQjjZ5P+ia5dMzVg7tsOweFi63G80wKjpP+278vw2lyozj1o9S6d+ESHr8tRlXnsrIzz5PuORgW1x51yZKecFsuacTv4/jkkk8vtgZxyNUYY4refKJUrO+k29dDdaj/wzqwXnaqhMUTtqKCGRigUbQ/gXvolOAnk1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763280037; c=relaxed/simple;
	bh=oiCSedSb+vz06dq7HUd9ifzEUNgIQopka2q0mEATYDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3fimtO3FLE6Vf35init38oU/s1Oa2nzESwSTRq9A8vbLsaoOwC1Z4v+KN4mJ/AdLCkj4dod0uPhwNVPgtv4aySAAgssnIir45X5Ga7u8YdB0M7eKYyAv3TBvDnmmidM82tv8mk1QQq/2LnhsXDZg5UwVV/iLUcTQIToTGk91mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVWeVeAq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVWeVeAq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D969AC113D0;
	Sun, 16 Nov 2025 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763280037;
	bh=oiCSedSb+vz06dq7HUd9ifzEUNgIQopka2q0mEATYDQ=;
	h=Date:From:To:Cc:Subject:From;
	b=WVWeVeAqJ2AoBJ77gYb0DoTnPiVddFkdyH1ySh+LRFNsrTcJ//zXzSTNy1FSQYzBb
	 GLaU1liEfmVRc9EVc9aoLyHKaJrEQzyBh0fnHj8xErQDQKuYd0s74aZL+cqyux02Gj
	 stLqJRiV56Ahmk/nqez6G/sB7rOO7fttXNZWurlf2dBQ52HyxAjC6gppjsSAw4GWIg
	 lzSirpLIlHzBQdYAkDLu0kjEdQtV3nLZNJoERF744EsggrshICcPm8xQjANGajbmaf
	 81thRYIDjkrqw6aM5aMvUUzq5bFkZ1r7e8AGBiezkV2QNlIG++0FWlPoeDxUiykmy8
	 sgD0AlUpM7DOA==
Received: by wens.tw (Postfix, from userid 1000)
	id 74AEB5FBF7; Sun, 16 Nov 2025 16:00:34 +0800 (CST)
Date: Sun, 16 Nov 2025 16:00:34 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Driver changes for 6.19
Message-ID: <aRmEosrxfxFVY9zH@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zd2+LAuceIjyYVRj"
Content-Disposition: inline


--Zd2+LAuceIjyYVRj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.19

for you to fetch changes up to 122df8416e7f4c68fb3248377a2b34cdd31a85b0:

  bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy() calls (2025-10-29 01:10:10 +0800)

----------------------------------------------------------------
Allwinner driver changes for 6.19

Just one cleanup change that is part of tree wide cleanup of redundant
pm_runtime_mark_last_busy() calls.

----------------------------------------------------------------
Sakari Ailus (1):
      bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy() calls

 drivers/bus/sunxi-rsb.c | 2 --
 1 file changed, 2 deletions(-)

--Zd2+LAuceIjyYVRj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmkZhKAACgkQOJpUIZwP
JDBLQA/8CLsp/zXl4or1re162VX0AlYeyUxwY2CKYbK/fk7eqy2RQnTHA712saoQ
4sSCBRvSj+E/NhX93+Q0ZSxzqlt0MfaB0fYfbEYHQbYroMMU/lXi6Or3XWBrQ1n6
LxV8tzM1ZtKXxRDxyhzR1wsN2VR2dR2VtZRpWAc2lntVzamyKJ1toxLihLwivMjI
NOsZSkHYfpaNs54Dv0lAPoSPhIecR/R8dYfQ8lG0sPfOs2CS0iNEXpiyfNzloIkT
QhCQEyviQWu8DeyyxGvN6hx7OBLxTD8xZYFVvnUpwGe4hnGPKnWonJ2lCJL+ya5D
cdqjeOF26K9LOvtZv+amwSc7Fjm9MeHD+VWXiNIxYa+S+S7FmJoCRhu+bHaHVxtw
PQ+PcVR8idhltFqd+G97OGGjN+VOkDUJKRLLgS3IvSABWDL2I/ljbgI0wCA2hPom
37O1/8rZ8U7+PFQ/JwTs1eomy6+FZWQUMCMwyW4XNPocjGErL+WrTc898LLruv+3
dqKVm9/9p0VKwLq5CVPULWbN9rtoCMu5fC6ET0zU4DDnIoY2KS6+6LGvLI5kt135
4gGBdkmp/HBfbCsOa9BgeQWBoyT3skUlglLRmsbyWLkh5c96pFMxMRa7tsTH6PQ7
FWkq+xBYjiiCh9K7o7iaJDBbGP7w7ncwDTB2qXk/lem3bezWNQs=
=jocf
-----END PGP SIGNATURE-----

--Zd2+LAuceIjyYVRj--

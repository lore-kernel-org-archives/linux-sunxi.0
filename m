Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA5419D897
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 16:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725552727; cv=none; b=cCgX1Xpt+Hd9XlXc2xVvaZPLFuKrOpMASUeQw8fpeJ76PR4htVS8Yr9WZ5+UeH3zLWCXU+HHtVaBJS+E0RJvrQvsQ8pGSJH6hv+RbH5Jj9HyHtnqtSSB/IHxVheBS0rE27SKrHwlcy7HtWCd8r2dcw02zg17WCWvaW4X7DWNgWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725552727; c=relaxed/simple;
	bh=IFF9ZfIb8PFwjfqH8bgDXiv+AA5USyRSh780LD7aKtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rBaXsWxbd/HURb+tf+Zdu69cEDHkCItKBMJws1QFL/827MPg93CPn1O5gKbjcC5cCwu+6+WoF8SLT52JkrPU2AzAE6v1H18aqbaKLOEShj0VGkNgv4mtkHUN9s6fUNa+8qoORMXCydju05GuTFDcoR8rLKa5eTopM7+Q/MXKzWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQGZ/VKY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQGZ/VKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293E2C4CEC3;
	Thu,  5 Sep 2024 16:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725552727;
	bh=IFF9ZfIb8PFwjfqH8bgDXiv+AA5USyRSh780LD7aKtk=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=IQGZ/VKYZF/4gFzIy8uoecAjZgBGyXtruGp1LEZCHk7nZtVurf4d9Yhk3SHwNNQ6j
	 gud29gIVD5TOcXLlIYRAHMbhFdR/xLFe3+Te66Vo8s6dEvnwmup9iwWcNv/Gnj+Dfr
	 D7ddvLxHFvmUWekwmizyFcxf07MIRw6zqfqyjSYLZrJUjvZgjrbtd7T/nY3njTYt2P
	 cBQp5KR7tqWi33X4P4cfskNJoyHLBhBcZa0Xq954V5lXkh381sQaso2B227ypNCcsr
	 UvOPCUEf4YBMWhqsstbSgfYhEwZ4sc6oYdU8gf4TL4PcE4ZI+9EMdLmU5xKMdTuvLP
	 EE87ygPDrf2vg==
Received: by wens.tw (Postfix, from userid 1000)
	id 4F3C05F882; Fri,  6 Sep 2024 00:12:02 +0800 (CST)
Date: Fri, 6 Sep 2024 00:12:02 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner SoC driver changes for 6.12
Message-ID: <ZtnYUswjHdLRYq8Y@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1M46xnqRrRrzkmfl"
Content-Disposition: inline


--1M46xnqRrRrzkmfl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Not a lot of stuff for this cycle. Just one commit for drivers.

Please pull.


Thanks
ChenYu


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.12

for you to fetch changes up to 7ad250e13ff8a275ba846fd223288f01f5d3857c:

  bus: sunxi-rsb: Simplify code with dev_err_probe() (2024-09-05 23:20:47 +0800)

----------------------------------------------------------------
Allwinner SoC driver changes for 6.12

- Simplify sunxi-rsb driver probe function using dev_err_probe()

----------------------------------------------------------------
Zhang Zekun (1):
      bus: sunxi-rsb: Simplify code with dev_err_probe()

 drivers/bus/sunxi-rsb.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

--1M46xnqRrRrzkmfl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmbZ2FEACgkQOJpUIZwP
JDAINhAAq2LPi0AGk9E5+wL1K2jOUWwd4o0JS0ofmRoKbXFpYA8o+b5RgjLYjqu9
vsOHL8alT81eazFWPugI7i4AV9qo9x8InKU3QjYiEkCaeXsP931YDSTJ/Oz9nmsT
EYGou1GQ/inMPQ/cgkGCTXahcUMUZ7o6iOvCDmcQGA73G/oSLzx2WKnpRxedETvL
1VCCp2cuQ6x/S2zgAXqK8mwmVzweFCZSEvJ8fMD0AFutcHRWbXKKBijEbXOhPgPs
qLzSoD1NQjKOmiOrTTLogZEl7vSjujJ2dGW/sL6/m28S/dq2RyXh59AO0MqNSzBC
7ABpLiTOiDIlF4ZzYsIBpm932X5Aexhfm9BC2h7f4jnxr1zhFTU4pgLro0CF7XTI
u60HZHx/KQtCyVyi4GMe9947AZPqzj9PL/0jkA296KYJBiL7eQmtwZze14FmbxiA
ORpMGdiTAuoBmnjW0tymlb2JAon8VwcRb7uTdFtS4/vLFqzH7Yh26gZdRVKpU07r
zKn0Fz6aTZBCdzc+Rw/nhDGhBS5SrLskbYTfcKCOwMp8215OzT0J/7sfI0zDEClh
SU0TtFzDCLvG8x7W/UTk4R/qfGpk9f4kbzIFed/N7G+n8Yxc3dUIql6ENIWKoH3x
Mf1D/daCfja64q8DD8QOwPCb+QWWStScUgbmy+lVrNK7u6e2qXg=
=CaBt
-----END PGP SIGNATURE-----

--1M46xnqRrRrzkmfl--

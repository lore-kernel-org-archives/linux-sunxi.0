Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3BF1DFFC
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jul 2024 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719933161; cv=none; b=LlOFkX7sZ6AEwK2116/ShUOhKPnsP6fP0aAa0NHFbaV0Ei2zp9uEVC0BQvUZu2qhHDqCQz30Ber6Nn8oJ8r+MkkiT0Oy6BCy5gP0N0XRJdPkiF1Iq41q2tjrBq8fgqbtxCrDrQDz2qBmCvVcRSMzyDbbBXF/zHKRdxDn9WFcE2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719933161; c=relaxed/simple;
	bh=k33hXVwdB7QXNGJCLyWJnvbK+AxHsjUjmrFo9r3aq78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aVii3ppDy+NkfTr+FbZCRMVQchMnqoIlnNGy76N5NHIBKwFMPOUtLyxVw4d5ziMIj1U97P7OkeFuMqkuws64CAvrnFrIifqRZuWuhIl/WEzYARFRAhPHhctT+sfckh6aU5inhRSAJuHfeQCaLQ83HsQlSu91+qAxg5voOf5sjuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbhH1w4z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbhH1w4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD83BC116B1;
	Tue,  2 Jul 2024 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719933161;
	bh=k33hXVwdB7QXNGJCLyWJnvbK+AxHsjUjmrFo9r3aq78=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=PbhH1w4zL/WVKpjh2bFC6P0+BOnwpzuD15yFmyp2T8rpfbKcl79yAfMpJnZ2V/ATv
	 zZFXlNjmVADOzuTG7Vr7cZDRTbd5JZfuwntvIddt8L/3ujSeqa0z4/hU9Eot4rJd3K
	 /vzy5FbRW+TbQ55WkIPV2fcAD8lzXyof0bpPf7x263wFUnxCOwgbKw+m0G1GYB3B3B
	 TD0wKoy2tDz/phCg3dlLc+NdJt+mwm1/k2YnIInubaeLc0Wi1X910+nFxXgFObprik
	 L65CIA2wZCur18+8vq/1bvoNHz8zfwDT27v8vsqyRvFN2/QvFKh+s5KeWtAa06AltT
	 PpTk/vVOEaInA==
Received: by wens.tw (Postfix, from userid 1000)
	id 4CBE95F852; Tue,  2 Jul 2024 23:12:38 +0800 (CST)
Date: Tue, 2 Jul 2024 23:12:38 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] Allwinner SoC fixes for 6.10
Message-ID: <ZoQY5k21RQLOrBQ3@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uUc39WAOFAsMCQ3s"
Content-Disposition: inline


--uUc39WAOFAsMCQ3s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi SoC maintainers,

We have one fix for 6.10. Please pull.


Thanks
ChenYu


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.10

for you to fetch changes up to 5b36166e599b5c1332a1147271d2130cece4bb24:

  arm64: dts: allwinner: Fix PMIC interrupt number (2024-05-28 22:31:31 +0800)

----------------------------------------------------------------
Allwinner fixes for 6.10

- Fix PMIC interrupt number for Remix Mini PC

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: Fix PMIC interrupt number

 arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--uUc39WAOFAsMCQ3s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmaEGOQACgkQOJpUIZwP
JDDqQA/8DVRj9WjoienDaTA90zQKfI2jSGfKvbh608Q0KJgbLPaLUf/7+S8wGcfU
hmbiDaVPxiah4CXDfn7xxzfeyc4KgRXSo81pPQdul8sT6ngAMEDtMgEau/nN0T9w
WrLpohRuhFc1E1MbDXoIJN/v3A0YLDobUWXjRla9JFzNql/g7Z+uK+cO127JjQkd
9/75CN85Yv5a2u2UsIbc88cRrNAn5yS0MgPOgSUJpJH9jOS5bFtpxSbaj1Prs5nV
eRXTDQOuX6yda9Xv0Fd8FOt7gJTItVONr5tvjPJOlgeN2IJGuAJ9AtMH+JGWqJUN
yvUyvlgilqgmrnyGyZ2Vu5czuMQ9gNXVNGA7nO0sDRi/xapl6OLshAawrGknQxCp
kZDGoPIkz96yUAdzFte5j0z8J6MJmyxJvIsDsiSl8qdAXZfMqbraKY5jnkp3B3cK
pzn6QNRTUZMtu6G8lVoW+H77XvWM72YChNJqIDRdC8dTx6KYtEPNs9fotKH2pQNN
mvMABat4/j11e3LcuhsWkw3yNBdLqS8oaSUhOrf4Ct//VYHOGzm7zDnjE0caJbGY
/Kcq2MVF7prl8ec7+vEiBXPXaCDRyCaZQG3jS93t0o5hscw3jnMQ8D6mN1xlusZi
kI/5xcuLBEfnpkwgB0q/9uoeqwmraYvhUJXrEFye1/S0GK6naOk=
=EgnH
-----END PGP SIGNATURE-----

--uUc39WAOFAsMCQ3s--

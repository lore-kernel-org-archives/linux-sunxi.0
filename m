Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8C37F
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jun 2022 08:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92A3C3411B;
	Fri, 17 Jun 2022 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655455077;
	bh=aZdXfV3YsE3/duOhmXNh09snbeYamRpRDBjBWuFHJcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K5lAJUFTu1GJ9+qn9HAyb7uZVMZPB8z1Zb89jccW8b9Aqsi7S0Za/6hB9Xq++TKnq
	 eEr+cun1c5dnVqb9U87sTNsBNSIF3B/sJ+iLuldUe5oIbktYvelPBrdcMUIBkI7Cmb
	 2b1Nn38Xrh3qfAal3QhywKbdUjjWt29AjqHCyCxXhg1pgK5j6/a2FcxFLqM23bsphl
	 fuAV5vf2iyQfEuHs6Vkl4YHJgswlNrqGgHt+CqQyWtSMlcxBbYeB0juDm6wyS+UGnH
	 m55r6DtulfIOssI8VVJQ42U43O8+OTHsjRaXhflNgpiUSQh/brVFdQw0OZ7BhGMRAo
	 N2Z1iqQPXJnMw==
Date: Fri, 17 Jun 2022 09:37:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, jernej.skrabec@gmail.com,
	wens@csie.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: defconfig: Enable Allwinner built in CODECs
Message-ID: <Yqw9YJkCPBabzldx@sirena.org.uk>
References: <20220614100343.3135227-1-broonie@kernel.org>
 <052b1bc3-f110-fcdd-e88c-a3df77c921c5@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="veM+iypaJNPUbyZ2"
Content-Disposition: inline
In-Reply-To: <052b1bc3-f110-fcdd-e88c-a3df77c921c5@sholland.org>
X-Cookie: 98% lean.


--veM+iypaJNPUbyZ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 16, 2022 at 10:56:41PM -0500, Samuel Holland wrote:
> +sunxi maintainers

Note BTW that MAINTAINERS lists "sunXi" which doesn't turn up for
searches on SUNXI or sunxi.

--veM+iypaJNPUbyZ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKsPV8ACgkQJNaLcl1U
h9AUHgf8D2giroR/063+gU3iwoP3iEVY2ptBJn0TMQEFvqnxo7MNWvJs6qeAKGFj
pEI1zMDeLPhPD+e6hH0l8fpa46kG10h77cSr7ighjMmQuRfpmrdAvB4bKrk0uHRO
qSr6Vvy8Mwrbb/bFwNrHpet2ozCqLXEoiAPP4eHVbtOSkMAzdcCN3ax0183o3I9R
nETG8l/yKecU8R0UCGAVrf4/3YRm2MboSl6VHCLDFKFpRcxp2n3HuKNdwlbtnq0E
nrHA17/IqHxkeeNA9NzHeABvdjn8yrvXL6TM87HcceGoz7PWgb71U3vIkda2BqzQ
8o6aPG0jbioUCPCVHwzokEBAepvbGA==
=Ks1Q
-----END PGP SIGNATURE-----

--veM+iypaJNPUbyZ2--

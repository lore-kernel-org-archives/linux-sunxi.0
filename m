Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9CD28ED
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 10:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8C1C433B5;
	Tue, 15 Nov 2022 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668506597;
	bh=WyPRetAl/Vae/HPH9Ll9K6wRyR4YuEk9GYqHudIFD7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZSH5w6UHCZJqfjXX1TAxdENWVSC0VrMs5cyNszWmX0cyKpH128gdzkuzDnuP0jyLt
	 f46acOtrQR1hrU4556xcm4l0/fyCgveXlXkmQKNY/KfZcBOpyssgoRdPMeVF9W3Yaj
	 xtziwgM7NoZRsGD3aWwB97+KKD3G5bQyhMpyRQly6hFgvvkHoGC5R9Y80/GHbUKwYr
	 g9kpkt8c4dKx7Ro2C94QqUIkpaB7TFzKM9HKsI412ie5tQDf9gzpqHNouCPye9W6F0
	 iFg/oLOVRxJfn3W9PwbMdw3p/ilaS/K6AuFQNILMCGXsLovc7xYZqBhW2n9Ei6MX8Q
	 ATwVH06dv1iOg==
Date: Tue, 15 Nov 2022 10:03:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: andrew@lunn.ch, calvin.johnson@oss.nxp.com, davem@davemloft.net,
	edumazet@google.com, hkallweit1@gmail.com, jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
	lgirdwood@gmail.com, linux@armlinux.org.uk, pabeni@redhat.com,
	robh+dt@kernel.org, samuel@sholland.org, wens@csie.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 1/3] regulator: Add of_regulator_bulk_get_all
Message-ID: <Y3Nj4pA2+WRFvSNd@sirena.org.uk>
References: <20221115073603.3425396-1-clabbe@baylibre.com>
 <20221115073603.3425396-2-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E5+2TnzAyurkPAg9"
Content-Disposition: inline
In-Reply-To: <20221115073603.3425396-2-clabbe@baylibre.com>
X-Cookie: Ego sum ens omnipotens.


--E5+2TnzAyurkPAg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 15, 2022 at 07:36:01AM +0000, Corentin Labbe wrote:

> It work exactly like regulator_bulk_get() but instead of working on a
> provided list of names, it seek all consumers properties matching
> xxx-supply.

What's the use case - why would a device not know which supplies
it requires?  This just looks like an invitation to badly written
consumers TBH.

--E5+2TnzAyurkPAg9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNzY+EACgkQJNaLcl1U
h9DJ5wf/YCSejgcjszC0Ec4QlSsXfOv1ET9BGiUz8TuNUGAQThsYlKX5Bbk5nfki
PP3uLpGppXYtVoAprGXivsFMtoMGjaC124+Ixo2dxAQNsvx0w6EeFcIVQByrADs6
tE3s1jKNq4UPco+DzYAEbQEvIv00aabm1PdbOp3RrrlDwSWgD5Sb8TllN3ulJ2+s
R9//sUxhyaFM894wpnU2zyUL05Dp+maPYrdt81nz0l5+vAORk8P3L2X69wWlvkrB
5moncC/AwzJ0mmIIvY5E78cv2vK40BbBJyv61OllcNjErCpxFKO2V64n2Ij5H4Ov
oCL2X1HnI7kLEXeOWxJ95Wo2gGPGtg==
=Ax15
-----END PGP SIGNATURE-----

--E5+2TnzAyurkPAg9--

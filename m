Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422447C
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Sep 2022 09:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752F5C433D6;
	Wed, 21 Sep 2022 09:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663752510;
	bh=WDxuopYgb69Vunh7mtLHaLmL+ZS2lN6XufwXUZ+0EdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQS4Y46aVDSYt251ORFT3NfRYbbyD56HAS5w7pTjG/XLEflGVaujAE5gyT0ZSbZOl
	 F/uAprNsX6ec7il612pHJieVjhd3N57sxPIo+9jKky6PYcCwUzRaaht3UrSUrBqPBL
	 uqDuGZQ4RDjYoaL1hEzIeKIu0Bg2Kn8zkptnVVuB7ttjDDE4+TVde0G2v+I8OlWpPD
	 9Vlfj+JzAVfGS98q275cX6eSEnHGjl2jHEY8fMdfqdzhSKtLoT3TYM03FbxTpqmL3L
	 HGeez7Gsr4WXkiHZPVX2ZFtpmhYFLhAIANPtPYE5Nk4Ggmsby7f/0EaBZkf77oWM7g
	 dMd5OfyuKwBFg==
Date: Wed, 21 Sep 2022 10:28:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Zeng Heng <zengheng4@huawei.com>
Cc: fengzheng923@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	liwei391@huawei.com
Subject: Re: [PATCH -next] sound: sunxi: fix declaration compile error
Message-ID: <YyrZIEH+n5UfbFGZ@sirena.org.uk>
References: <20220921033819.2188233-1-zengheng4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ME3YOqXesqoqS5wH"
Content-Disposition: inline
In-Reply-To: <20220921033819.2188233-1-zengheng4@huawei.com>
X-Cookie: One FISHWICH coming up!!


--ME3YOqXesqoqS5wH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 21, 2022 at 11:38:19AM +0800, Zeng Heng wrote:
> Just fix compile error without any logic changes.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--ME3YOqXesqoqS5wH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMq2SAACgkQJNaLcl1U
h9Cvxgf+JwuwCJ3WVh4QQFfxsXemu9L+90kzz98/qFyGvhJAZhpNYajQ49zBNl31
jPkks0Gc2KxpnKmTip+skGzfl+mUYh+KWnZMDnLtRnaXEvxV1Lall1YVFcY+8KI1
vGYktnyhFH44wj03BJ2j0idUJFVb6U7W19jkMUG7PhgT/lHrOVbhe2RnbmINOkco
VRxGq50lphPtVsdZgkF4dX7VsFWoY6JYVlIVHBlR3K536EGAw2XmwxqZCJTzt9zT
Iu7XO9v6uFjTYgLGXzvfu3YmQaQivK/rTyZxTWO2AwiVzSdhVG1dL54KX66C6zXp
tFsU/enYJXkL2ou81XTRyeKXg5LhYw==
=MVeU
-----END PGP SIGNATURE-----

--ME3YOqXesqoqS5wH--

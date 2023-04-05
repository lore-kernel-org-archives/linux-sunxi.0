Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AD163AE
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Apr 2023 15:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A877C433EF;
	Wed,  5 Apr 2023 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680707229;
	bh=5x6+lM5qQE/TjNOsAuBROgc7xHXIj/4JzKzX7mcvMLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKKCKsYirNS1p1VFRS1pzV+w2fep0cG0tdbIY0XGequJSBBQUrVpbUXrdHCCPaK08
	 JRZjWHJznWFbmGrb0HkbSf+bgwFdlVeUgfxYi7WO7vXIRm5hJE59y469xVUM4KBk+9
	 0APrM7EBEgbgdW61IAwE3KeZJl5ZqYr04O6Q71Zh4yPhy/GedB8pzQVV2tXkaeYsUf
	 4sp1lsdmTnUpOBdP4ws9rXfTudwyX1WsSLx1ikNDyHUG7S/SPHXz30lohFUvUuVSUf
	 ebqoVTH7sDxiD3I0j/DjMACPjyfs9b+gqT4EZquverW2xw77SalaCstR8ngZ0lPqXi
	 27Nt7kFVVxJqQ==
Date: Wed, 5 Apr 2023 16:07:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com,
	Shengyu Qu <wiagn233@outlook.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/3] regulator: axp20x: Add support for AXP313a
 variant
Message-ID: <f1d7526b-7f51-462d-8192-0a05828bfc4f@sirena.org.uk>
References: <20230401001850.4988-1-andre.przywara@arm.com>
 <20230401001850.4988-4-andre.przywara@arm.com>
 <20230405142103.GL8371@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s00eJ8nyCZjf3ylO"
Content-Disposition: inline
In-Reply-To: <20230405142103.GL8371@google.com>
X-Cookie: 1 bulls, 3 cows.


--s00eJ8nyCZjf3ylO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 03:21:03PM +0100, Lee Jones wrote:

> Is this on your radar?

> Can I take the other two patches without causing issues?

I'm waiting for the MFD.

--s00eJ8nyCZjf3ylO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQtjpYACgkQJNaLcl1U
h9By4wf/dkxm0infGdmrULyFieQUeY2O4E8pBU3yywl1lq0PCFHXe6UwTz50KfvX
4GReUFZmaySaZ3SljDCKwpAAVwxTDN16Ao5iXw56dS3ZE8nySMUp0OBGRyzf+A/6
aj6Dfv/1b4t6OCa6nJ++nsalKN39XFk9bCiH9eA5R3gZkP1Gce3kPnmbClqHIe0k
+lT9g9+Oi+XJDqdeA56dYS1KFK7DBU/I3+IWjRmq6cZ2J5XftJTL35+zQN1PEOui
QzhktPbkuD8KU3nsksdrC46PO+3n/Twoe7dQGaP9eCY7AOf4O+OTvN74GEdG/Tco
yteeKi7WQwEMgMYF46+hJPFBH3beAQ==
=N3h1
-----END PGP SIGNATURE-----

--s00eJ8nyCZjf3ylO--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EA611CAF
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Jul 2023 18:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBDAC433C7;
	Wed, 26 Jul 2023 18:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690397264;
	bh=inWMbHQzWvxiDJ0CGStx9C8OQo3bCAYsE5PA+XZ4IG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oS7oQlP+L9Yof7jmcPyN2YuqfNI6hJZehf+6nNrgdcORCUcKRHR7oAUjsL0kPaO7D
	 +dby9Kt3uQjlfjBnoa4Yplx3K6d/WIkqG5s5bQF4r36XNKNtY25KKBQa253Twc0kKL
	 9o3u2jF5dwZfAwNZU/pdf+7rbC2svHmUlFCUl9fSVZnlQ/GBdij/RppbP5VyVF1+cB
	 GsJmPvwyzKXmJQt21oilS6Y0QwooTAyPkBl42cjRweWZ7V4XbRNFMOmGGzM2pf8RRD
	 rRVYfzzfq7V4N5cHmOCMPVF6vUFvM7388/UDuerhHbs019LUJuwQWC9sPQibPlgsfV
	 dXxlR+RBbbe/w==
Date: Wed, 26 Jul 2023 19:47:38 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] thermal/of: Fix double free of params during
 unregistration
Message-ID: <a72ca5e0-556a-4d16-9c5e-2b342bb074c1@sirena.org.uk>
References: <20230723-thermal-fix-of-memory-corruption-v1-1-ed4fa16d199d@kernel.org>
 <f559a614-93d5-121a-8ff3-0da77bc85f44@linaro.org>
 <ZL054LHAZv8VmIk3@finisterre.sirena.org.uk>
 <CAJZ5v0jJ+YM=7LUEKB_b5GUsGopLTT0eyPmomYV0OcGQp2gvig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ldfM+o0rph9VUc9l"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jJ+YM=7LUEKB_b5GUsGopLTT0eyPmomYV0OcGQp2gvig@mail.gmail.com>
X-Cookie: Life is the urge to ecstasy.


--ldfM+o0rph9VUc9l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 08:42:39PM +0200, Rafael J. Wysocki wrote:
> On Sun, Jul 23, 2023 at 4:32=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > There was a message on the thread saying the patches have been applied
> > for v6.5 but I can't see them in either mainline or -next.

> They should be there in linux-next (as of today).

Yes, they're there now.  They weren't at time of writing the above (on
Sunday).

> Surely, they are present in my linux-next branch.

Are they queued as fixes?  It'd be really good to get these into v6.5,
they're rendering the Allwinner platforms I have unusable.

--ldfM+o0rph9VUc9l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTBakkACgkQJNaLcl1U
h9DThgf/UWuCjWQj8NV+YlBo8o3bd6oPIaqs892ZUtsKAxVagl90Q7/+trEyJiHF
6KH1f3S9D7+8LnQFNL0kOaTdDj6JGETjjUKynkACEfyWm+59iHT/+dege32sIFv6
pV/d4RxifIfp0o2r9jIYTaojaxFRiLZW9nHhRfHaEpx51W25B5xA5XIvXyL7iEvU
hOhw+UI6vtJTQ5GVIRceX2iKjZnBBn225KinUek60omr+6ac3+r9nLLaPSlomTLb
Rx9cQ4D2ZiQSnHMip5HQ/0TsFeie1yJnJrSwU7p0aoDms8mpg7R5OskgyLu2ng3k
xOiWkFDGgZ4drBIhCMDLboe6s+0I/w==
=RKtC
-----END PGP SIGNATURE-----

--ldfM+o0rph9VUc9l--

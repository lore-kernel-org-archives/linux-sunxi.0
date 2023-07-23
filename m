Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4041850
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Jul 2023 14:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBB7C433CA;
	Sun, 23 Jul 2023 14:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690122724;
	bh=ABCsOm9JvWZ+f5nM61rJ7xZNzE0gx8IHdAjQzRG359c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXr/2FXi7zvvZxq8YappjJNcYGpYEdL+LSGDcNEg2Xu6OKq1mz+qrmtaXlwb/xIet
	 WwQqHTqliVs9MEuQCzDTyhJWf8dZGzTdWx9z2uhQIpb4hoLiqnu8pkQlDoTKErNtm+
	 P0Onv9DjGXNIKCrAhv173l5BMqpuMKfiqgRbj4cuafYxqAmTqxZYI2LOibS9Ru+jCg
	 l+t45Ul4EBQMLA7MrGlc1n+SC10mKbqBNS4KaooOr4yalsCxX/BCHj5dy4yXMT8AvK
	 ivDdZKn3EBZcqw8mw6G1Y5+QGabUUDPLMePohq/D/Nx5dWjE5V++lCsCnd4mudQVJJ
	 n780NLykLrEqw==
Date: Sun, 23 Jul 2023 15:32:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] thermal/of: Fix double free of params during
 unregistration
Message-ID: <ZL054LHAZv8VmIk3@finisterre.sirena.org.uk>
References: <20230723-thermal-fix-of-memory-corruption-v1-1-ed4fa16d199d@kernel.org>
 <f559a614-93d5-121a-8ff3-0da77bc85f44@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VCVa1Mdcy0K7qUUI"
Content-Disposition: inline
In-Reply-To: <f559a614-93d5-121a-8ff3-0da77bc85f44@linaro.org>
X-Cookie: Give him an evasive answer.


--VCVa1Mdcy0K7qUUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 23, 2023 at 11:57:52AM +0200, Daniel Lezcano wrote:
> On 23/07/2023 01:26, Mark Brown wrote:

> I think this issue has been fixed by:

> https://lore.kernel.org/all/20230708112720.2897484-2-a.fatoum@pengutronix.de/

Yes, that should fix the same issue.

> Rafael ? Did you pick it up ?

There was a message on the thread saying the patches have been applied
for v6.5 but I can't see them in either mainline or -next.

--VCVa1Mdcy0K7qUUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS9Od8ACgkQJNaLcl1U
h9C4+ggAgyC6LyMmC5zuLuGmpsEUMdCUr58Pk1Fkdi9gM5H24Q82x2RSh9U91FY3
zAm7b4GvLAjY7a+VQ0kFpLvfO5/eZaxvEKt0obAJQOFbPa/w6g4JpF3CkN8yX/ad
GYPMBi6Aeo5RzL1VcFRkzcJajKq1EBGXra8YaKWcRsEiEc5OYfXHI+jdk864ZWMe
FdhA0ciburHOzbrkT4KulZV6Onm+5m3KoQQmMzePJnQgCzYAXZdX7SO5Ftnpb8T5
DyTXYivBI57Y9tPEgUwftPHtZEG0XOw2MBeIp8zAGJCTykJ9MI8OW2D0zCeOYWaL
W7Yy19cTg4LDmXRhJfm42x3Ew6bf5g==
=iPai
-----END PGP SIGNATURE-----

--VCVa1Mdcy0K7qUUI--

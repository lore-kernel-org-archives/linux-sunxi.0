Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14E0371
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Jul 2023 14:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4838C433C7;
	Sun, 23 Jul 2023 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690123271;
	bh=rza00MXYuJ9oUniwfSVXu3hvCtfjkA6L3RC2ym9q6xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfCOqTDcKl621egq3i87GmszqhUjXYNFIJt+lXIu5VMbeTzpMY6DTj9GuYy/KnVaG
	 cCIZ8BnQIvM/dPZZfndpy4MrfA9TcudAVYggMDcrGTdudqtw/xkfZA/vQDHAwYw1lu
	 gX/W/XrUAVqr2jxGh0F9sVPetWO04HpLmCssgGsR02BDfAnfO8CEyuMgdnBluS2fhH
	 MBNO/7bbL+GtTH2+3CgObjJ8Of3RRqdhGWdRWMjkQ5QYidbWRUCIZi/5cSIIZdlxy1
	 T5Gm+3ULAoEtjymSHFSSSTMegsj4Sinua3MErGzCH5muigbr+rsLvyrGK5HNs9b5/r
	 Dl1BKXCk1Ixcg==
Date: Sun, 23 Jul 2023 15:41:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugh Dickins <hughd@google.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/sun8i: Don't fail probe due to zone
 registration failure
Message-ID: <ZL08A8J7fLJ3bJsl@finisterre.sirena.org.uk>
References: <20230718-thermal-sun8i-registration-v1-1-c95b1b070340@kernel.org>
 <5a9ccb708f004e70e2102417eb48b766b03777cd.camel@icenowy.me>
 <ZLwH9RFnJymdy7YD@finisterre.sirena.org.uk>
 <17dc1961-c629-e09f-8979-1e6cbc92534e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RmJB1P66QJ1Tbrkp"
Content-Disposition: inline
In-Reply-To: <17dc1961-c629-e09f-8979-1e6cbc92534e@linaro.org>
X-Cookie: Give him an evasive answer.


--RmJB1P66QJ1Tbrkp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 23, 2023 at 11:40:34AM +0200, Daniel Lezcano wrote:
> On 22/07/2023 18:46, Mark Brown wrote:

> > It did seem to be a bit of an excessively strict requirement, I was
> > going to poke at that myself.  It does seem worthwhile doing the change
> > in the sun8i driver anyway, there might be some other issue that causes
> > registration to fail which would have the same issue.

> Why do you want a thermal zone if there is no trip point ?

It at least allows you to see what the hardware is monitoring.  It's not
terribly useful for thermal management (unless you're doing to try to do
something in userspace I guess) but it seems more helpful than
completely failing to register, especially given the knock on effects
when a single device registers multiple zones.

--RmJB1P66QJ1Tbrkp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS9PAIACgkQJNaLcl1U
h9CQpAf8CXrJb/uZ2uZiPQxWc3K4AUQnhODnS9900hcXgY503ZuYYzRc99HclUxV
oikMyqyYkxnws/U/08HeOrCZ57O9GJFKd0Zf6WwJn1T/e7ruktnMk1XmdHVw87Dq
RrN9gkary/8yU7iv1NDkbMS5TcD8pDOSkZVSWVXdPQKf/xxRftjUZiIdeF5rWnPb
vpRT50ukw26xbtGedwZcijgU1daHor1QX2yPCxNG5JTqdb9aGKuWgV/sgveyiztf
3SmtXPrg3jS37z72iyCEZbv92Rin9C6CW6B3TYPipr7txk0mveoiwAQza1hrOgR9
WH2ytODtyQOt7JpihXq/rzyYx+SO3A==
=hAw6
-----END PGP SIGNATURE-----

--RmJB1P66QJ1Tbrkp--

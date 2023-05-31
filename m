Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7521114A95
	for <linux-sunxi@lists.linux.dev>; Wed, 31 May 2023 13:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984E3C433EF;
	Wed, 31 May 2023 13:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685540926;
	bh=5oiWn6L9rJqvMfCt+T7VTPNle9Rnvsv/ziJ/f7AOOsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQu9QtR0wBqSrRiiuepq4IExLg5r6UtNI9pderJLGcaJDMrkAbtMSLA/ccZClJHlh
	 ceLh1hziCxKv3Uv4cJ2ZP8FWOR8+cVonqIKTAOEnqtTxActK3j0LsiJDmDbd9JjgDn
	 l0uXBQLscmnWHb2ZfLooP0bsfPZLlJIQWifDetum5djG3yL3gtX4RRgiXxIPPei1ff
	 LbYkQf7aai9Yehjq/YOXfYVL+QQFnXKCc7d8bdZAyP8v1kIElycciWBQALnBmtu+MT
	 2eMI1Rm9LuqM2fio1ElVVnu3mCxr3iTgaZ7V0HqVcHPKoPDaCZcKUOmVmfyuan2W50
	 0fPO5tgMYxNTg==
Date: Wed, 31 May 2023 15:48:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH 0/3] clk: sunxi-ng: Optimize rate selection for NKM
 clocks
Message-ID: <flngzi4henkzcpzwdexencdkw77h52g3nduup7pwctpwfiuznk@eewnnut5mvsq>
References: <20230527132747.83196-1-frank@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ll2i5xo7tjkazzo"
Content-Disposition: inline
In-Reply-To: <20230527132747.83196-1-frank@oltmanns.dev>


--4ll2i5xo7tjkazzo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

On Sat, May 27, 2023 at 03:27:44PM +0200, Frank Oltmanns wrote:
> I would like to bring your attention to the current process of setting
> the rate of an NKM clock. As it stands, when setting the rate of an
> NKM clock, the rate nearest but less than or equal to the requested
> rate is found, instead of the nearest rate.

Yeah, it's actually pretty common, see clk_mux_determine_rate_flags()
for example. Some devices require that we don't overshoot, while some
prefer to have the closest rate.

Both are fine, and it's a bit context specific which one we should
favour. If we were to do anything, it would be to support both and let
the clock driver select which behaviour it wants.

> Moreover, ccu_nkm_find_best() is called multiple times (footnote [1])
> when setting a rate, each time iterating over all combinations of n,
> k, and m.

Yeah, that's expected as well.

> In response to this, I propose the following refinements to optimize the NKM
> clock setting:
>  a. when finding the best rate use the nearest rate, even if it is greater than
>     the requested rate (PATCH 1)
>  b. utilize binary search to find the best rate by going through a
>     precalculated, ordered list of all meaningful combinations of n, k, and m
>     (PATCH 2)

One thing you haven't really addressed is why we would be doing this? Is
there some clocks that require a more precise clock and don't? Is the
factor calculation a bottleneck for some workloads?

Clocks in general are very regression-prone, so I'd rather be a bit
conservative there, and "if it ain't broke, don't fix it".

Maxime

--4ll2i5xo7tjkazzo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZHdQOwAKCRDj7w1vZxhR
xY7YAQCRMdM5sXe5+PRdsFQ42wN/ON/BTZv5VyjJjPNXDSV+fwEAxbyTFNxkGl7t
ATFXYYJKY2m8tEcRbPXGriRr5AMQKQ0=
=vNhW
-----END PGP SIGNATURE-----

--4ll2i5xo7tjkazzo--

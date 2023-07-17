Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE0A4C98
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 14:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AFEC433CB;
	Mon, 17 Jul 2023 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689603153;
	bh=qfhbbwJv5aDzSLrzg8XRkxXRcjef0UeV+hzSGXZzqxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRhnMJOYfAFW+tpb90d2IMVUZ5kDsagtVxdUvHTg9he9RReFa0TQFixCb+XySbG+1
	 nW/H3p8C/eKLN/0Q3EpLrN2WF3pQ695s/U9PudEaEUdxkop2jcI4yo2ddYCxUG9gcz
	 JfpI3WlkgsdgwYd88nqN/hP0yWO8zB4op6na34xzUKSX9rPKLN60LXJGnQWH9RyCJD
	 pzsr067QfW0v510F3seZG+WaPaMZRxRUs4gLfHh0sMf8DPU/b9oGhrqd3DYfdVQ38U
	 7ntnBGmbvmlVUIOrBrwp1rmFbBoan0DhmmwdO55w8yYD8mB0S4qm4dnieXwc95nSE/
	 qLueazg23c+Ew==
Date: Mon, 17 Jul 2023 16:12:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Roman Beranek <me@crly.cz>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/11] clk: sunxi-ng: nm: Support finding closest rate
Message-ID: <htxtcpqimrloxvebm5iadqzybj3rt5c532smtm62kxeuaejaqw@syknyzrhgf7f>
References: <20230717-pll-mipi_set_rate_parent-v4-0-04acf1d39765@oltmanns.dev>
 <20230717-pll-mipi_set_rate_parent-v4-7-04acf1d39765@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t24u7yc3dj2s45pr"
Content-Disposition: inline
In-Reply-To: <20230717-pll-mipi_set_rate_parent-v4-7-04acf1d39765@oltmanns.dev>


--t24u7yc3dj2s45pr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 03:34:31PM +0200, Frank Oltmanns wrote:
> Use the helper function ccu_is_better_rate() to determine the rate that
> is closest to the requested rate, thereby supporting rates that are
> higher than the requested rate if the clock uses the
> CCU_FEATURE_CLOSEST_RATE.
>=20
> Add the macro SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLOSEST which
> sets CCU_FEATURE_CLOSEST_RATE.
>=20
> To avoid code duplication, add the macros
> SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT that allows selecting
> arbitrary features and use it in the original
> SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX as well as the newly introduced
> SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLOSEST macros.
>=20
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
>  drivers/clk/sunxi-ng/ccu_nm.c | 11 ++++------
>  drivers/clk/sunxi-ng/ccu_nm.h | 48 +++++++++++++++++++++++++++++++++++++=
+++---
>  2 files changed, 49 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
> index c1fd11542c45..35d00783d748 100644
> --- a/drivers/clk/sunxi-ng/ccu_nm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nm.c
> @@ -28,7 +28,7 @@ static unsigned long ccu_nm_calc_rate(unsigned long par=
ent,
>  }
> =20
>  static unsigned long ccu_nm_find_best(unsigned long parent, unsigned lon=
g rate,
> -				      struct _ccu_nm *nm)
> +				      struct _ccu_nm *nm, struct ccu_common *common)

The common pointer must be the first argument.

Once fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--t24u7yc3dj2s45pr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLVMTgAKCRDj7w1vZxhR
xTTeAP4knutmR1GxPcDRsDiuskf3/7DgS1IxkgPc6Q8ZlWOs6wD+Kyh9V78+vpqR
NkvgKKgQRVvoWmJwYa+z0lVEc//OyAU=
=lLGg
-----END PGP SIGNATURE-----

--t24u7yc3dj2s45pr--

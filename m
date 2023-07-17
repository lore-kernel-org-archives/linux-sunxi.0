Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C97BA33
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 14:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2314C433CD;
	Mon, 17 Jul 2023 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689603337;
	bh=n/y7Puy+QLO7pyomnsPv4n3B4YlS/lEyIf8pJI8o1+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gH0DZ6MuZvmlAQAbeQdzOMx+YEA/zD+HrVnXYNGZAzgV+Gi3WVXQtH8P5aq2rLodE
	 V2kdJILgioySNYF7FSnPcHeBIKaj2pIFCTaJ2q6WEiwjfiuGJeWacQmBp3WR2UlnRN
	 l7xHy6SvbYMet10JIzK5ERHKYuOwy6TxToWZckyJhaN4A9JrDdEQxLIP6GPRyABWhZ
	 Wsbfb+yB3bRZCrTK/ril2wc5tCmJNAVrwOW+8qOfS9Z0aLDBXAwFGat3PhqAhI1ONE
	 iVOSt+lJVcnCg5gQGSVv+xLMst47+WF/2rS/01Yr+yek3TmLTrgtofByjOC6D4Irbm
	 TN1dA3mv/LHRw==
Date: Mon, 17 Jul 2023 16:15:34 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Roman Beranek <me@crly.cz>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/11] clk: sunxi-ng: mux: Support finding closest rate
Message-ID: <upoq33e7zww6pudqvpzyy6o377pusj6inusrxr7gieabi54l6o@v4772ivtzjxe>
References: <20230717-pll-mipi_set_rate_parent-v4-0-04acf1d39765@oltmanns.dev>
 <20230717-pll-mipi_set_rate_parent-v4-9-04acf1d39765@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hcwomx4vpvydqutl"
Content-Disposition: inline
In-Reply-To: <20230717-pll-mipi_set_rate_parent-v4-9-04acf1d39765@oltmanns.dev>


--hcwomx4vpvydqutl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 03:34:33PM +0200, Frank Oltmanns wrote:
> When finding the best rate for a mux clock, consider rates that are
> higher than the requested rate when CCU_FEATURE_ROUND_CLOSEST is used.
> Furthermore, introduce an initialization macro that sets this flag.
>=20
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--hcwomx4vpvydqutl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLVNBgAKCRDj7w1vZxhR
xQ7lAPsEVdnYEfOYY2vxBplyTJ9D0tDMU1SNBwRHZd3+AvuYtQD/ckvXeTBux6DW
JbCZpyDA035wglj3uztomr2OYcQXrQM=
=KFSz
-----END PGP SIGNATURE-----

--hcwomx4vpvydqutl--

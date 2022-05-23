Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F67637
	for <linux-sunxi@lists.linux.dev>; Mon, 23 May 2022 13:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B130CC34100;
	Mon, 23 May 2022 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653311841;
	bh=7a4f/8QsblZThmyj+if9nUBQfdMZAwyozd8I6W8Kq40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbKDsydcvp0mc6eXKIzB00ki88V7g6i048hhWHWND/Oe4ZX17j9xOkS7db3nr2g4Z
	 EVB1sBT1kA3nlglPqC+ZoKZ0WBc+8VpMxJppsxOZvfH/p/L9N4eTCwkDhNp1DR9vjO
	 QCI5exa55LXT7UBBV7cm7Ip5qT53gFQa6D2Gz/ANkoPAu+RcropRvVYWXrBa5pkmst
	 bhvK4lAbX9ZeG5p51MBv0PVBboqtXn1jNpRv8ppOX47/5/NjVf14eFHJC+SGgB/3es
	 ZsjKYJ9YjchTJdR6rnKsftK1aIM0euZMihP/YXK2N2PohJw61H/yE6xpo+DSOJTdrj
	 P/609FmRmNMOg==
Date: Mon, 23 May 2022 14:17:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: andrew@lunn.ch, calvin.johnson@oss.nxp.com, davem@davemloft.net,
	edumazet@google.com, hkallweit1@gmail.com, jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
	lgirdwood@gmail.com, linux@armlinux.org.uk, pabeni@redhat.com,
	robh+dt@kernel.org, samuel@sholland.org, wens@csie.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [PATCH v3 1/3] regulator: Add regulator_bulk_get_all
Message-ID: <YouJWnMQJWzLU9QR@sirena.org.uk>
References: <20220523052807.4044800-1-clabbe@baylibre.com>
 <20220523052807.4044800-2-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IaE4B5GdbTL8QUGo"
Content-Disposition: inline
In-Reply-To: <20220523052807.4044800-2-clabbe@baylibre.com>
X-Cookie: Sales tax applies.


--IaE4B5GdbTL8QUGo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 23, 2022 at 05:28:05AM +0000, Corentin Labbe wrote:

> +	*consumers = NULL;
> +
> +/*
> + * first pass: get numbers of xxx-supply
> + * second pass: fill consumers
> + * */
> +restart:

Please fix the identation of this comment so it looks less like an
error.  TBH I'm not sure it isn't easier to just use krealloc() and have
one loop here, or just write two separate loops given how little is
shared.

--IaE4B5GdbTL8QUGo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKLiVkACgkQJNaLcl1U
h9BwMwf+MijZTV5zm6UVWDR+lDg3thlPKizYFdm0ORirfhyPz1mOojb8dZVKFqfo
EqyWBvVdP3rvimtQslIs1E3hG0ppjzv918+He7B4lvABrpEx6IBtXWMv9qQKNTz/
/KLitIR9hZ9axRV4e600OXhw2Yg2ut8MbBesfPiCqGDirBt4bk8ghhMbYhnIgii6
vuDPmr2YhTNRcuYyiVCVO3McrmWnJDSE9h2YUr0wsdtc1FuKJjwQPMSNAs2PvUsm
K/AiRfovshtkzll2TCZukYkFObFRYCf/xbYnXG0IyfRWoXzJKspimwQF94SHMuK9
DPMxLud0JF0QLM7X/MD08Njpb/4h7A==
=r53l
-----END PGP SIGNATURE-----

--IaE4B5GdbTL8QUGo--

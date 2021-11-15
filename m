Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B7472
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Nov 2021 20:16:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8ACA261BFB;
	Mon, 15 Nov 2021 20:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637007403;
	bh=EFJ5NEEe6AqTZtAipr4LPDuaZJt/yymu0pVh28kfRjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJnpysfcYWDtEYrxCsNoZdd1qfgqJ0FqcB8Ho1rdMfX7WG+QHN0sqncgFGNla9aRz
	 FnK0i39+cz382IXjnNWtm5LlylMv+xVkZUQHpcLsqr8eo61X6yUc8TA4qksRJVxnOg
	 VjdcCpktNps2nocuOGTb6oT0l2e8fyritvyL+o0xydNDVGnkR9owKr6TJ4dZyvwCan
	 xDE/dA2sesmxiK5fLgv5aadO5RHRJOctrkzmTglNcsdSm4aKzJc1IMvKObYZDqO4pT
	 qLkI0OPFVZA/kMaQg+3GN6btA7njqXzUN52WtAFcSu/rorJMAMf50ndeXY3Ptxk9f4
	 jfqJyak0NthWA==
Date: Mon, 15 Nov 2021 20:16:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, wens@csie.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sunxi: sun4i-spdif: Implement IEC958 control
Message-ID: <YZLAJi12yBLgYSCD@sirena.org.uk>
References: <20211115200833.452559-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mmo/3jm4MWZQwArs"
Content-Disposition: inline
In-Reply-To: <20211115200833.452559-1-jernej.skrabec@gmail.com>
X-Cookie: Custer committed Siouxicide.


--mmo/3jm4MWZQwArs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 15, 2021 at 09:08:33PM +0100, Jernej Skrabec wrote:

> +	regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
> +			   SUN4I_SPDIF_TXCFG_CHSTMODE |
> +			   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
> +
> +	return 0;

This should return 1 if the status changed, _update_bits_check() can
help here.

--mmo/3jm4MWZQwArs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGSwCUACgkQJNaLcl1U
h9BB1wf/Xv2qocY6b/8HytgoXLjYqLMkxgRWEizu9WKx5MDTpypAatJEY4DMaTna
CIs11POVpXEzW/7nYBQcPMtX1y87JFQf5oAyde7FlnlDcLOuRHH9xd8fm9t6uytR
pFi52RwI8jXD+43B3hvftQIeoGczmj4eviR5waX/C708V1fxhugbJqLYZqJwReMQ
4THbpkQiy1OD5mWTGYuzFkRHyYvn8tMEkJxav5bfWGs1RBlqDhg8sY1A1MsAXOmv
2lioByjfhvxJAcddBboQGjAZybRlO6cbdI2XxHpFLglgjV8CkV6wKDyN3wqaJV+w
NEprdmOKl39kPOkyWKrfw9KDE/NFNQ==
=XKK/
-----END PGP SIGNATURE-----

--mmo/3jm4MWZQwArs--

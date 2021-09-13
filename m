Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86933FD0
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Sep 2021 15:43:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD78B60F6F;
	Mon, 13 Sep 2021 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631547812;
	bh=iE0HFH0NNPFgkof/k+GQAAQOhVg4zb9WvqBH1HY3xJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ImLrqL0ByWQ5ab29nSi4j7UIJ3wlAyVn5OmPplWgc2aPveBGnx6uVkQ/WAwVaQHE+
	 1bYm/d05gurtsREmPDH6Kz0M3DCDTlDzUp7oXj71jncBhhK6tQ+mGHMW2w3dDlrb0x
	 sPrTFeGUEp+CzeNBFYouohZtJCJxKdxlYIL7rYdZ7SQXDctkRWk662JOzl+4NQNdzv
	 LCs1enD408VCN2QqF88/6PauwkgUVo8IjmKzZVrZNy33ufBtGImfRpZHlhyp947VR/
	 8WOYlFDtyXHt90RkTaYQ2qsJgWrBtycmpWG9g1Pw+uyYM6DCgx+6gyoEI2CnkMWEdI
	 AYXi3yfTm8vXQ==
Date: Mon, 13 Sep 2021 16:42:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
	lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH 1/2] dt-bindings: sound: sun4i-i2s: add Allwinner R40
 I2S compatible
Message-ID: <20210913154253.GJ4283@sirena.org.uk>
References: <20210912072914.398419-1-jernej.skrabec@gmail.com>
 <20210912072914.398419-2-jernej.skrabec@gmail.com>
 <20210913111117.GB4283@sirena.org.uk>
 <22661441.uYPlIyrNLm@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pMCBjikF2xGw87uL"
Content-Disposition: inline
In-Reply-To: <22661441.uYPlIyrNLm@kista>
X-Cookie: Above all else -- sky.
User-Agent: Mutt/1.10.1 (2018-07-13)


--pMCBjikF2xGw87uL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 05:33:22PM +0200, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 13. september 2021 ob 13:11:17 CEST je Mark Brown napisal=
(a):
> > On Sun, Sep 12, 2021 at 09:29:13AM +0200, Jernej Skrabec wrote:

> > Please submit patches using subject lines reflecting the style for the
> > subsystem, this makes it easier for people to identify relevant patches.
> > Look at what existing commits in the area you're changing are doing and
> > make sure your subject lines visually resemble what they're doing.
> > There's no need to resubmit to fix this alone.

> I did exactly that. But history is not uniform:

=2E..

> Most subjects contain "dt-bindings: sound: " at the beginning. I selected=
=20
> variant from latest commit (ce09d1a6800d).

If you look at more than just this one file the numbers look rather
different there, I see I will have to start being super strict with the
sunxi stuff here :( .  Other people messing up is not a good reason to
follow them, nor is the occasional thing that's part of a larger series
being let slide without a maintainer fixup.

Nothing in this patch series had anything about ASoC in it meaning I
very nearly deleted this unread.

--pMCBjikF2xGw87uL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE/cXwACgkQJNaLcl1U
h9B7yAf9GrjBcYYjoYmHk2ZHnH4FGIW1SIEuaNKaEJmJXHzcLzx4UAPNI2O4V+8g
FZ9vrvXdgrL+oSe55PWGaZBsht4c2v4girmAbjzHR38nRCJLhERN/6R5wEPbVByW
q4jCqRCp1NQ7QpRgz/2JguQEnyYkX0Yx3FJaH5T0O6Pj0XvkBVj1b1pSalwBcd64
LJnF21d/xcGgamIxvtmTPKihdz7qn60UVNXT1NHbb7kVfpkS5WOyVQ7LX5rW5GRS
yzMRhG0g94WnK2qpIjWTxIaTqjsC3mBnS48Y+zMVk53jmg1I/IzkTzz5ETNCD2i1
2YIUG6UpDNc+IaUbEvVfu+VwDtTZyw==
=5aW6
-----END PGP SIGNATURE-----

--pMCBjikF2xGw87uL--

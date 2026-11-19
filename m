Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116465;
	b=zMsgvpReITg8MzplvCgYS9UfdhcApKt61+oKE+Gi5GjN1ThTz/Jos7eqGED1qpKwn/oY
	 Qxo4ZHy6T7fzQw/nbHjTVk3pItzrI+1JlaAXhJfJgpK2TnuFTu78nHobdvqLRCtQ6mW9g
	 jGjKHMFJNREWZi/+V9bGRoyNotblAZZ9k27C4cP7GdLOHW+5A+NAeX+XNEZZ1fuCC8M/Q
	 HET52SxIKBRpZZruZWrbeRTtmH9mNUpM0bUMlC+ll0C1z9YtjZXNUIo/gO8gAgmmP2/Ia
	 BlW7Zm8y1hbnrJ1NuEPOxcXRvKWtyP0OWimbeotkT5Y5YFJeaZ+M5qfmtsN7uWroOAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116465;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=VJ1Ve8U88QX5zZQUf1ZxteuMa+HQQxDvpNTMLj2yzvw=;
	b=noVJg3GOCm8gPctj8mkYS3Q2zu2+uB1MPgKiFyfaan8oQIUg3Cp65oqeVP2zHd3gwaxR
	 KgrHGS2EFbMrq7VOIZ4NYGI/oFE4v/cT6WJzeu/2NaYLMr+rtMR5sRUg5PEFdkRGIOSg6
	 REHOaHW8/uRXcvrYwjsLJfck+g6KtUhfXCwcQrTciP4HiJvSXWgOZ6SpAxG8uV50EO+ay
	 1EsuvYpA559WeVcxOCnXgBNQDil3TM94vC+ZldesyJso+3Opq75EQEghpEDJrpzC+5vp5
	 ylJeEhBGdTJP3a/n3JtGp+gLspecNDrvT4aGYMGpjUcNeJO6QuWW4+zG+onTSNNdMQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=czcJ5ZAx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77D0606A320;
	Thu, 19 Nov 2026 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=czcJ5ZAx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1251F000C7;
	Thu, 19 Nov 2026 19:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795116464;
	bh=VJ1Ve8U88QX5zZQUf1ZxteuMa+HQQxDvpNTMLj2yzvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=czcJ5ZAxJgwZasZ+MZA2Daywvn8sNPJFJ9208T+K7jMZY+SI9kEacX9tpQrhRnpWd
	 RQarIyZRtNi6jTstWcAP8WixpVmRMoOSbPgjUMMidaNjb2A82hekgmGJKipT9v+JOD
	 KL4ihHuZd9t6aNX2AZkeMskOg5TZzln4Fwp6JNv7KJ3P0EE1zRoKHN3Bsl4OpxkPAo
	 cbFpFeH/F9jIyqDIF6vBvMWmUzGyBsQ937kH73vdfjUMZXcCzoGafN0zv1MClIVs4r
	 Fr12h77DOX8i7TaciXZVJMCoROaCA5Q9b+8iQRozWO32BKubi68/LW3dXAjtIzZ/8y
	 tQAcYQ9JHgJIg==
Date: Thu, 19 Nov 2026 19:27:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Hans de Goede <hansg@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] regulator: Add X-Powers AXP318W PMIC support
Message-ID: <d6f8650d-1713-4e54-aacb-b38fd57e004c@sirena.org.uk>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20261119191607.GC70182@joneslee-macbookpro.roam.internal>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TUyOO1K0kMXfv7U+"
Content-Disposition: inline
In-Reply-To: <20261119191607.GC70182@joneslee-macbookpro.roam.internal>
X-Cookie: I'm into SOFTWARE!


--TUyOO1K0kMXfv7U+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 07:16:07PM +0000, Lee Jones wrote:
> > This patch series adds support for the X-Powers AXP318W PMIC, which is
> > used recently on new boards with Allwinner SoCs (the A733).
>=20
> Okay, this looks good enough.
>=20
> Mark, do you need a PR?

Please.

--TUyOO1K0kMXfv7U+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/TaoACgkQJNaLcl1U
h9DoeAf9GRthjdeFgOpVh1EsCAVIFkpvF6qLBe6YHz+dgS4OjBHp1p0wRxupu2KP
wdTVmY7bI6X6PFx7iufYowpzycQw9JgWUR9EfwPbvk0FU2lKfUMHOION+Kp0fYD5
pPFkHyrEdZ+86LU9Q7Xw+2s3SCK4iXfEC6yrxnAr4BM1/mDbeJ+shquCO9C7sJ5Q
raVqXAKvNZ7URymgf9ClYmBFhDWVT4Q+dglrX8XpF55w3Npqz7JDw9HLeWsbjoQZ
5k+He47XW9v9l4fz+cxNWDEH24uZ450ST6fIebsnhEnHB5pC4DfJ7p68ZD7kZghv
NQiipMHpnwOGs7u/D0tKqXuWOq4XTA==
=J8cV
-----END PGP SIGNATURE-----

--TUyOO1K0kMXfv7U+--

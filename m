Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E9B2032A;
	Fri, 18 Oct 2024 19:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729279120; cv=none; b=TKSz2cY4NyeNvMvhThUxEfuQVkzyokaMPBBOfVjV/I4UGFEnxLySWNxxwANps7c/co5jw/UnqwAN8Oc+jJqntHZ+uEFLP+y3uOCSXkniHftMtcDSJ3LgogAYnQ3uVdY61G6r90dggCJivZOKvZe2KUBS9DG9PfkDkEt+hDspGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729279120; c=relaxed/simple;
	bh=3OErwReJiS6kFOiTKWT3jmN3Z65Qxiqokmi/xP1NhKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqquUNbqhN8sMvLFJPxOul9qSga1/8My3AmrVXk+FMzNQj4ZgqN2lSpJFLS93HAISjbNyff+wko/WaPJ6OLdoVzpDlX4Wz0f6s4VyyuqHz4dus1cwB/eJOJQ28qEq9iVuFGz7KFMWGU0R2UtJD/WYq0G0f+b78KtObBfRgO2IAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maKEK86e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maKEK86e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F1AC4CEC3;
	Fri, 18 Oct 2024 19:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729279120;
	bh=3OErwReJiS6kFOiTKWT3jmN3Z65Qxiqokmi/xP1NhKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=maKEK86eAmJmSuOxTJuqSD/L67PFEvl03hSjzY7e15o9zARX2HVPTwce1WIErmsap
	 xgtmQfE7QA2BcmVATPCfb/hAGHhM4STBVth//6qJzIuuAhckp2ur5yiIbm6H5myYiM
	 GagE1Tzakhnh8gTmCX5UC1lABG192w61KUgoL+GLJ0QJrqI6iCVbpuk80QAC9AoE3i
	 ytl5+mhZz5mDQ0CgqaGsTd2+5gcFuJEGy2HE8bkk1Rc3dqCWvCHUt0hKKTf34+4oJd
	 oiicpjFZ4OqG+pafgP5LmSWPP2h80uBGS0fZj4HpNupvaKPLzYJE+VK4TijI29+ToU
	 aMcArqJ5hf9TQ==
Date: Fri, 18 Oct 2024 20:18:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin Botka <martin.botka@somainline.org>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 5/5] regulator: axp20x: add support for the AXP323
Message-ID: <08b84b3d-c533-4099-8f89-bdcd7d304119@sirena.org.uk>
References: <20241007001408.27249-1-andre.przywara@arm.com>
 <20241007001408.27249-6-andre.przywara@arm.com>
 <20241015102314.GG8348@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CMcoAbdN5aVm4Nnz"
Content-Disposition: inline
In-Reply-To: <20241015102314.GG8348@google.com>
X-Cookie: What is the sound of one hand clapping?


--CMcoAbdN5aVm4Nnz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 11:23:14AM +0100, Lee Jones wrote:
> On Mon, 07 Oct 2024, Andre Przywara wrote:
>=20
> > The X-Powers AXP323 is a very close sibling of the AXP313A. The only
> > difference seems to be the ability to dual-phase the first two DC/DC
> > converters.

> Mark, can I take this without issuing a PR?

Yes, it should be fine I think.

--CMcoAbdN5aVm4Nnz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcStIoACgkQJNaLcl1U
h9CoDAf/e0HELFIXZZ2L7dYnvFTu+sxHCt9Q8HoyatuqPeIku3u7OWT+a0FJ/D/A
HVIhOG8lNhRVWabtddvYbYtKc+Lvnb4kj6YL39NLxevq3vT6MDlHfMYqpIzvWOPa
+RKgT1+sdYpGkbIa6CAhFwAXx8LdNOlOxhJo1bAPVxaPHMcWmDcTAukulGX/wt6n
LWeY4X+C/qbsZr03QLnIeQ2EOYRK30oFNR6rbRnsYBPTs1sZzTFWqKhoh7q790Tv
YAwIm1RVfGCo7jGgLyKknGLzikoWMt0TIeNR5q7ogkd/XaseGl+feqEZaI4nt+7R
neMtO6mNk4IPopuEFR3KoqfAs4IKlA==
=XLts
-----END PGP SIGNATURE-----

--CMcoAbdN5aVm4Nnz--

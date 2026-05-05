Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB784921AE;
	Tue,  5 May 2026 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999295; cv=none; b=OCJzh9I5FuQ+wSO8SZh9jd0QROrU7glkHc6vdKzcWUhVcXP5VObG/oMa16LwBB87atIUbO5Rbj6oBpvcD3n1L+df2Fh2K+wkUZo1ZPXVcjW0XW43oy2fdJui1S6j3gZY2++D8fw5Tf92q0pGphs1HbYYj/kRzz0X7jKkPdDP+tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999295; c=relaxed/simple;
	bh=XQus+btv25ras34bobUCWOVBVzfiLA69SAYN+cm89K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V82vjSkYyaJ1eiQbzehHrIwpZlAFDpEMC4yFDMZbFMdqyiL8eyRtiJX3+UAzXp3ERkUvPyL/0iYEiF4L+0Rdr5ETsg/8fYrr74mjxom2gsenMiIz2rysEIZjRTwh5UDCDhJtmd4/5uvg4K7ta/zd3QzdZxx7MwZ7J8Bi/bIVplA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSIaigtI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSIaigtI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D3CC2BCF4;
	Tue,  5 May 2026 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777999294;
	bh=XQus+btv25ras34bobUCWOVBVzfiLA69SAYN+cm89K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSIaigtIAGZF9G9yk+DR8fsY+Iz9+EhhoNqTZB4I6P/pdgL9i7X7N8/f7pme1RNhI
	 rr22AmlX2mxaiaWWwSbpxkusE2Zd+xWBbd2zqhpkxq0ySVniiKc13ivjc6J2fODm9u
	 XkNbcTCM1WZV/mCDbHIRXM3aScWZAA5Rx+Y+hsf4A2/sf470xdwPMxZX5KzZg4UKrp
	 EJ34fC+zeY2+7El0XJ4VGg5D1ZFSIsZmpFsZFmBpJaoiSSxNRxCS97BwcXd5th7qoG
	 ogyjpMxlYeNE/H6EdMfE49C8fegNCrCCaY0sEYOKW54W5PooO4JdGE2xNGqiQc2SKK
	 6Xd2yNndYisxw==
Date: Tue, 5 May 2026 17:41:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Baijie
 Technology Co., Ltd.
Message-ID: <20260505-crucial-deepen-996f7a025510@spud>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
 <20260503191842.2736130-2-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xpCcXftr8fukYDDS"
Content-Disposition: inline
In-Reply-To: <20260503191842.2736130-2-alexander.sverdlin@gmail.com>


--xpCcXftr8fukYDDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 03, 2026 at 09:18:36PM +0200, Alexander Sverdlin wrote:
> Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
> embedded products as well as customization of embedded solutions.
>=20
> Link: https://szbaijie.com/
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--xpCcXftr8fukYDDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafodugAKCRB4tDGHoIJi
0mK6AP46w4swwHaimdw+OKGuIcNCEYAhY/30IYVA9SUgHzExsQD/X57jj1pNcUYy
NM+us9A2zs7E7q5J4N/HoVQxBq1TjQY=
=vGw/
-----END PGP SIGNATURE-----

--xpCcXftr8fukYDDS--

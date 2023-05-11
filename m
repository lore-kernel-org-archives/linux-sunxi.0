Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48622115
	for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 18:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F252C433D2;
	Thu, 11 May 2023 18:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683831347;
	bh=51tobzSJ4CHR3t43CA/+6zmp7vaUcOP2gvXgutyaO+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDo9IB685bWp4uy1p75LcM03RQ1qDwjJy29C4jXWER1LAj5ZVBgmm+mtoISfPEyx3
	 TEgygUlqzI1Ez86xJmSG41lBg3ALBAWy2x5eOeTvOJTdHmBHwoOFSwork+gei8HyH0
	 KD4LoKyVRUaADkfp0PtTd16YGm4Grt3/X5vqpDhs6uhmLUQI6axSjb4Xb0BDFYTLjB
	 CsdBAK0ejLG7xBiFI8WRBGYHtbH8RPtdjGS88jpNvB90eTjklH+eXFY99yRzaR9HXo
	 gIyiNXD8r2+BkuQ1sFq4AeMgmiP5qkrxKk38OcHzJxeCbCIY2GHX31i0YCNqxOHj6F
	 hk2q8fsxoQm7w==
Date: Thu, 11 May 2023 19:55:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonathan McDowell <noodles@earth.li>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: gpio: Add GPIO3 for AXP209 GPIO
 binding schema
Message-ID: <20230511-lapel-onboard-ccac0b959921@spud>
References: <cover.1681580558.git.noodles@earth.li>
 <cover.1683719613.git.noodles@earth.li>
 <e22cd891ea966bc18411d01d5e3b0d94e7ba6869.1683719613.git.noodles@earth.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HWXMSkJJfXxLImVu"
Content-Disposition: inline
In-Reply-To: <e22cd891ea966bc18411d01d5e3b0d94e7ba6869.1683719613.git.noodles@earth.li>


--HWXMSkJJfXxLImVu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 01:01:12PM +0100, Jonathan McDowell wrote:
> The AXP209 has a 4th GPIO, so add it in preparation for support in the
> driver.
>=20
> Signed-off-by: Jonathan McDowell <noodles@earth.li>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--HWXMSkJJfXxLImVu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF06LQAKCRB4tDGHoIJi
0ryJAQDsVpUaAEJAA3CFENMLfIoTABI1Ik8bAkd4jMrr8C8ajgEAn49e8m267hN5
2UHyMX8OasllSM86Smdo966e+nqAYwg=
=wzug
-----END PGP SIGNATURE-----

--HWXMSkJJfXxLImVu--

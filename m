Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E6523DF
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jun 2023 19:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15B3C433EF;
	Thu,  1 Jun 2023 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685649325;
	bh=pEiUMwDdZiLE4fzh8x63srng8LjrjyaJOInarv+WMGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNHPLIZNLcCbn6k7oM1B1E1s6o9CxWqMVDoSI4EbHed0tgzQUvt/qOWgn5BOz6+YZ
	 KEMsyZ2tr/aFqnQrZFxf+iK73cAWFLNeKdzmxdh3NUVPg1zXSBCqgn9XwTrE5oPWMW
	 hxmC20+yr49uiLR/9IaXO1DG/ju15J8GbaedqmfKNRZdPeJX7xFIR4YW/So+oAPUjN
	 YHBfPvcCKDBZVNvqUmCS8a9qbNrT3YSRw2t2jqW27ndIr060srtvtFbQu0KptJJMtT
	 bqEfBWfTT1RCkKtqFxaXFs6jEEuzMoOUuUimcbo7v1Hz5AzvIQaaw65vd7RoOj038c
	 62wRqT9tUgAdw==
Date: Thu, 1 Jun 2023 20:55:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Keiji Hayashibara <hayashibara.keiji@socionext.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] spi: dt-bindings: socionext,uniphier: drop
 address/size-cells
Message-ID: <20230601-granular-landlord-bca8066a89eb@spud>
References: <20230601095908.563865-1-krzysztof.kozlowski@linaro.org>
 <20230601095908.563865-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9R4EOge1AfRw8lj9"
Content-Disposition: inline
In-Reply-To: <20230601095908.563865-3-krzysztof.kozlowski@linaro.org>


--9R4EOge1AfRw8lj9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 11:59:08AM +0200, Krzysztof Kozlowski wrote:
> Remove address/size-cells because they are already mentioned by common
> spi-controller.yaml.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--9R4EOge1AfRw8lj9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHj3pwAKCRB4tDGHoIJi
0tFGAQDZ+7BBBCl6MW6Po9YPoEAqs1z0qgs5UQWFDZcLr6zJPwD/ZpJcRU3ZmzLN
ViI+5IImvOuMsfgz5HAGCiueWtSn1gA=
=19EK
-----END PGP SIGNATURE-----

--9R4EOge1AfRw8lj9--

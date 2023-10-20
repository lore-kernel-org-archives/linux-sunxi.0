Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB171DDDC;
	Fri, 20 Oct 2023 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gx1siHup"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B01C433C8;
	Fri, 20 Oct 2023 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697816393;
	bh=+OCKXpXdzxESBJtSuBM1t66GV8/SeLSu2CpKQbfCz8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gx1siHuphdy8/nSerw/IJ8jpyI2uW/+SPVCN3I/CzPzs2iuW0L9V9ApYuJOTxPxh0
	 7wmk8zjSWYPlp1YIoIMwqgD0eSeYfYxcv05b3ozhXCzzX/MPuqFpvI+61vLqjszEdm
	 eTSIjEuy4XzRLsJYnKvRwODd/BWsqdP6Gb+mE8ru8vJKGhXUgGpNyA8NNSREv2fkzc
	 jcR9wExXsnPooVUxRHOwKQFlmEuzwoZC96/iH71bXDpPdnK8nUIFWTeytAJ2hZAPdJ
	 +dEBFeba4/hBs/ehYMGoqm4e+wLnIT8vIIsfjiOUNibQTvOBjl0wgLN8ODu7yia/lt
	 F2b0I1rE6//KA==
Date: Fri, 20 Oct 2023 16:39:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Marc Zyngier <maz@kernel.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: add Orange Pi Zero 2W
Message-ID: <20231020-lividly-provided-860773e90110@spud>
References: <20231020145706.705420-1-andre.przywara@arm.com>
 <20231020145706.705420-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7RnoDsnRaxG7lT4H"
Content-Disposition: inline
In-Reply-To: <20231020145706.705420-2-andre.przywara@arm.com>


--7RnoDsnRaxG7lT4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 03:57:05PM +0100, Andre Przywara wrote:
> The Orange Pi Zero 2W is a small board with an Allwinner H618 SoC.
>=20
> Add the compatible string to the binding documents.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index 11c5ce941dd7e..6f481e8bb4bf6 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -1013,6 +1013,11 @@ properties:
>            - const: xunlong,orangepi-zero2
>            - const: allwinner,sun50i-h616
> =20
> +      - description: Xunlong OrangePi Zero 2W
> +        items:
> +          - const: xunlong,orangepi-zero2w
> +          - const: allwinner,sun50i-h618
> +
>        - description: Xunlong OrangePi Zero 3
>          items:
>            - const: xunlong,orangepi-zero3
> --=20
> 2.25.1
>=20

--7RnoDsnRaxG7lT4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTKfRAAKCRB4tDGHoIJi
0tzRAQD0VQgH5Kuw550UXTLMKW8jNw/Qgu4hfvSpfXh3u9ADmQEAtjOzhOXawHbB
cq0DVwkXiUceYB6DFHdLwsoHM3DGLgs=
=BdVK
-----END PGP SIGNATURE-----

--7RnoDsnRaxG7lT4H--

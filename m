Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750C21E1D2
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Aug 2023 16:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E2FC433C8;
	Thu, 10 Aug 2023 16:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691683944;
	bh=OcqNCzObC1EKNtRyWAawRvnOnyFp+jPeVcOHVtyLdMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vEo1uoMv6Je3nMeV7pnuPSOi0e1OXzWRNRWkvPlyow/fdcmg8gRAOP7G7HjXWA29a
	 bv2TunAq0eHA7i/nX5/c8Lr3eqJxGOFyojctbtX88Xn2WOZF6W1aKmAKv+9kD/cZRy
	 q4u0QFM8Y9TRu3sc8TI48543QfAtnPYQro/kWvU5ROFhCVj5Crl6LWDP9BHORlwAYd
	 CgNt6oU4afQgMZaikM8EWBfjNPaBiJMaP1t9gC4S96mfJYinPZK+T6NOReYJvMpQNN
	 mrUtttZloojwATvGTQBcPpDRuAat/MoNtR0bGfrfvYhrt6mt2ZgKbPAOAhIAyvdmTU
	 OAm4nvN75CS3w==
Date: Thu, 10 Aug 2023 17:12:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksandr Shubin <privatesub2@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20230810-unmasking-sprinkler-d75e728cc0ee@spud>
References: <20230810145443.1053387-1-privatesub2@gmail.com>
 <20230810145443.1053387-2-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hPg5kcy3KfBtOZY7"
Content-Disposition: inline
In-Reply-To: <20230810145443.1053387-2-privatesub2@gmail.com>


--hPg5kcy3KfBtOZY7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 10, 2023 at 05:54:26PM +0300, Aleksandr Shubin wrote:

> +allOf:
> +  - $ref: pwm.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun20i-r329-pwm
> +
> +    then:
> +      required:
> +        - allwinner,pwm-channels
> +
> +    else:
> +      not:
> +        required:
> +          - allwinner,pwm-channels

Hmm, I realise I lead you astray a little. This can be reduced to
    else:
      properties:
        allwinner,pwm-channels: false

If you respin, please update to that. Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--hPg5kcy3KfBtOZY7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNUMYgAKCRB4tDGHoIJi
0k5XAPwK6ZnDy6YMcS7YyTbkZhp9bNvTudr9mvnqvkaKJWAqdQEAj6Ky6dhw1dD2
9IZEmfA6h0yN/+zGi1B3HLfafbpNzg4=
=Pcfq
-----END PGP SIGNATURE-----

--hPg5kcy3KfBtOZY7--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF79100A6
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Jun 2023 16:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9585C433C0;
	Fri, 23 Jun 2023 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687537556;
	bh=8BSU1uoOm7hSm6Lmw/MxVj8R8nDMM2P3Woosh1ZcvZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dpDW/le3KDwp9SrBMwFLunXeltQLNhKl2U8J0SM7Balu06xLVgppJtCvYuIlUP+1h
	 cEmFzUHLYjg3ZptCGYrGWyONt27rSixGJSUn/Zwu6ZSV0zNO7xlq/OhatNyqz9JbWt
	 tq4RRRQA+yPhQDYgk5GTMv1gwH/9ouerLgnlWXFtxv0jNRImQbRjpDeTzBtAGi/VMV
	 GpePlUptHQyq7H7WpIk/ovn6g7L9lEYHwMMA7nfrvBicbBIoN2JkY0wRv085fawxv9
	 n7I7VoaqcDfOeuFV0pUpNFas+NjIyDhudOigZ7AN9EOzJq2ubHxJsaCFtjLL3MCBT9
	 eGbmsbr/hXpvQ==
Date: Fri, 23 Jun 2023 17:25:50 +0100
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
	Andre Przywara <andre.przywara@arm.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20230623-elite-exile-5074bcd2eaf2@spud>
References: <20230623150012.1201552-1-privatesub2@gmail.com>
 <20230623150012.1201552-2-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1gOb5YGhbcjVPxc6"
Content-Disposition: inline
In-Reply-To: <20230623150012.1201552-2-privatesub2@gmail.com>


--1gOb5YGhbcjVPxc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 23, 2023 at 05:59:59PM +0300, Aleksandr Shubin wrote:
> +  resets:
> +    maxItems: 1
> +    description: module reset

Also, this description doesn't really add any value, resetting the
peripheral is the default meaning pretty much, and should be dropped.

--1gOb5YGhbcjVPxc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJXHjgAKCRB4tDGHoIJi
0jeaAP9fpvlP8uveLMQLZKt0Z7dT2q18NKXE+yLZo2WhRh+eMwD+JOXUIXIzpiIi
ZUc7H1i2K0OmCSMj/Bnbb1EyzhccTAU=
=CZ9F
-----END PGP SIGNATURE-----

--1gOb5YGhbcjVPxc6--

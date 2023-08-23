Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E284C125
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 13:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD46BC433C7;
	Wed, 23 Aug 2023 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692797376;
	bh=NFe09BLTwI6EXzfx6Y6VNCzXPE7zpcUy4rcY7EE0zr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCj+wBUt/EmZ6GHed1VrFjaZS9DehCo3T5PWHyIWqvgodHG1bOIrm+qPEnyUWXEAr
	 FgRt+2lYfXgJ1AKEfXFoITnrr/Z9GoUUVWQhVXu4FLWS9L7p71Tl+6JnK9c5cuhn8R
	 MydBvrMO1sAnNo+ZDOzU1slqaO0/Sb3gSn6/mFe+qiWZUs94NiXhyVXvf+xlGWmesq
	 vsEkPTKLhaI3R6r4rVjVoJupi6Awv4iRbUKj0WaHHIYnYgZlDvV47dMGxpzjbykHsJ
	 x8M4t6U1QhNo5Vhu386uzZp0hcFeMuqP6+2/WgmcF+2RcY+xoMrzGK2IlzGbV+eaJZ
	 iUE6uqbS0mnZQ==
Date: Wed, 23 Aug 2023 14:29:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: use capital "OR" for multiple licenses in
 SPDX
Message-ID: <20230823-alabaster-omission-a35a29198fd0@spud>
References: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zwG12TuW3Ar4PyZi"
Content-Disposition: inline
In-Reply-To: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>


--zwG12TuW3Ar4PyZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 10:52:38AM +0200, Krzysztof Kozlowski wrote:
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--zwG12TuW3Ar4PyZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOYJuwAKCRB4tDGHoIJi
0gLyAQD/H6s2mLMFq0aJbyPKB3WgSjepxLVIu2NsGm8Vn5FfeQEAqpZfLXseCpH3
tYdgNMuExBww/q2bYbRydZH7E/cbXAk=
=in4T
-----END PGP SIGNATURE-----

--zwG12TuW3Ar4PyZi--

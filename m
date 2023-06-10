Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91742206BF
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 22:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A29C433EF;
	Sat, 10 Jun 2023 22:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686435724;
	bh=3G3f8N5bw9bPZuUwFvkGw5TpAvDPD5mrCfUFG44YYu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZmRw6nJZmmJ3oB1R9o7fjsIjUNKxvqYmiANiWgX+JFujKMSWN6+5RLD5wp8Z8qq2
	 Rwbk8inB0HFKfzbjZkRs6FK3aX84bAFlXvImKdNEnnDgdyjhWB6t2PwNsyoPUf0qfz
	 JlcTU4OYKLdgXyrYs55Ek0ziOGHUgF1aTB/f+YTnmxtDmvfgF4em3TcObTSBg0+Ckh
	 vteZDpHcjgGTfLI+Fn8aDcoi4UhtTOXSmnjDRvzWoI7GUqcQeZX7FwV9hRvKb6mlEI
	 86q76+kP5j4LvybWodauHSN21Gub5ZPZEjnRTmjvbyorGpNqh+AsNJn8Yvbl1W1P3x
	 c9OPUeAUdxZ5A==
Date: Sat, 10 Jun 2023 23:21:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: thermal: sun8i: Add binding for
 D1/T113s THS controller
Message-ID: <20230610-shaky-candy-5114b855e2eb@spud>
References: <20230610204225.1133473-1-bigunclemax@gmail.com>
 <20230610204225.1133473-2-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tsbDwtX3UkzIgwos"
Content-Disposition: inline
In-Reply-To: <20230610204225.1133473-2-bigunclemax@gmail.com>


--tsbDwtX3UkzIgwos
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2023 at 11:42:18PM +0300, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
>=20
> Add a binding for D1/T113s thermal sensor controller.
>=20
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>

btw, please try not to resubmit patches while there's still some
discussion on the previous version, as things are likely to get
lost/muddled.
One of the downsides of email!

Cheers,
Conor.

--tsbDwtX3UkzIgwos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIT3hQAKCRB4tDGHoIJi
0pqaAP9XIUE94BjJUfjdeVAqkpCWVHs0k1o4amUxgGuGEWCJPgEA+CKVVZxSDEQm
j92laT4D1unIJ2y7+HMuphbA7JSAvQ4=
=mHXG
-----END PGP SIGNATURE-----

--tsbDwtX3UkzIgwos--

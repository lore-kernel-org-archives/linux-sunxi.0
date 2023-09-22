Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E09214F81;
	Fri, 22 Sep 2023 07:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7347FC433C8;
	Fri, 22 Sep 2023 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695368313;
	bh=xqJRYJ65z8ZCEW/tkOSG2viZcuPAtzTx2CRy/CMNdRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxYSXbjWUAASSBuRVGA0KOx0PbBxsXC/m9qqmFggy3rqTVKjShXOOpOjJJF1D9tl9
	 iyQ28LsxGOgidhKDcfITcBx9QXD7LDAu7tvOf1cJL0VbD5svULHfZVV4RvCwVkLAWp
	 oTwrFvU6w9DgzpgTNcqhLnLmUx4IPJu/0hsBcgKMxj9f1t9ykk8vVpaLKS9cMtwH6S
	 SgeskXBAh9ZmWkEFuOhD6XhNNpyMnF/o86jZ56thB5ut692NtK77QHIcZS/LS9jmI9
	 kwMS7NV20DTNrB2UWAMVoKz7mIkdpKylp8L7t7hh+ipBJdHOLDiKRoyjxXU7dTMmQ2
	 bW0ZVveJyLRPw==
Date: Fri, 22 Sep 2023 08:38:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v1 1/6] riscv: dts: microchip: convert isa detection to new
 properties
Message-ID: <20230922-ruined-deplored-a4c5b5866ad2@spud>
References: <20230921095723.26456-1-conor@kernel.org>
 <20230921095723.26456-2-conor@kernel.org>
 <MA0P287MB033245E15897C496789A0979FEFFA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="whMU1h3Bx3QRMe1H"
Content-Disposition: inline
In-Reply-To: <MA0P287MB033245E15897C496789A0979FEFFA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>


--whMU1h3Bx3QRMe1H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 03:33:13PM +0800, Chen Wang wrote:
> =E5=9C=A8 2023/9/21 17:57, Conor Dooley =E5=86=99=E9=81=93:

> > +			riscv,base-isa =3D "rv64i";

> should be "isa-base". This applies everywhere.

Yeah, I was expecting exactly something like this to go wrong given the
limited environment! Thanks for pointing that out, I'll fix it up when I
am back up and running.

Cheers,
Conor.

--whMU1h3Bx3QRMe1H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ1EcwAKCRB4tDGHoIJi
0knQAQDmHSJ0t81Lx1txBho+/P6JM6zJKeSXcYFtPiTtZSZYXQD/cU3exXwYZvy5
K17M7n0PpNtl8Gs9h8jhmv8p3ieyngU=
=PPuZ
-----END PGP SIGNATURE-----

--whMU1h3Bx3QRMe1H--

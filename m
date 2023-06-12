Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388C719BB1
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 17:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA9FC4339B;
	Mon, 12 Jun 2023 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686590832;
	bh=F/xfsUaVL/B3Qc4E2prwYl5t9MVB1CSnSrmP09x8b5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzTPTpPTd1To2ISnxdmYL8ef9TJZSAU9PdNRTmq/k9VtENcockLRuxRDPcn5NPxky
	 +zFFOaM8mFfDezhQPlKMNQ794b98mqyxxbYjjDmM211ai4i6uAsjYj3u9/r9XXQbSG
	 5boDRT4BO0vgX/nLPtzD4+L7AC9NI/Sclrq86Cn3oeaqm83Q7eKMkhSX8raJTWpp77
	 ofJLljmbbsdvCMYM7s8hkr0AmvajAn1P2Nsfl1PjyjwDpYUn8qXTFSbL83/iEA2R8d
	 ORGGVnJOC2Vkv72Hu8YqLkRMwhntgG6JRFJUJCQb3u6+WC/2WcHbGbv6goIdrv0UsT
	 3XFgo4p7+BTlg==
Date: Mon, 12 Jun 2023 18:27:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Vasily Khoruzhick <anarsoul@gmail.com>,
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
Subject: Re: [PATCH v4 3/3] riscv: dts: allwinner: d1: Add thermal sensor and
 thermal zone
Message-ID: <20230612-manhole-awoke-599b8ff72edb@spud>
References: <20230612063429.3343061-1-bigunclemax@gmail.com>
 <20230612063429.3343061-4-bigunclemax@gmail.com>
 <20230612-wriggle-remindful-89d5105c94ee@wendy>
 <CALHCpMjxboLn2eTjOJkE2JAzH3S8OB3v9fWqDOdeipAmLvLx2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YndCLQNRUhwsHafT"
Content-Disposition: inline
In-Reply-To: <CALHCpMjxboLn2eTjOJkE2JAzH3S8OB3v9fWqDOdeipAmLvLx2Q@mail.gmail.com>


--YndCLQNRUhwsHafT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 11:17:20AM +0300, Maxim Kiselev wrote:
> Hi, Conor
>=20
> =D0=BF=D0=BD, 12 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 10:55, C=
onor Dooley <conor.dooley@microchip.com>:
>=20
> ...
>=20
> > The RISC-V patchwork automation is complaining about this patch while
> > running dtbs_check:
> > arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: thermal-zones:=
 cpu-thermal: 'trips' is a required property
> >         From schema: Documentation/devicetree/bindings/thermal/thermal-=
zones.yaml
>=20
> I didn't add 'trips' because I'm not sure if they should be the same
> for the D1 and the T113s.

I'm sorry, but I am of no help there. Perhaps some of the Allwinner devs
can help you on that front.

> Maybe it's better to drop 'thermal-zones' from this patch and add them
> later in separate patches
> for T113s and D1?

Does it pass dtbs_check with the thermal-zones removed?

Cheers,
Conor.

--YndCLQNRUhwsHafT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIdVaQAKCRB4tDGHoIJi
0icUAQDwugDXiKIix1q9MpKsiXdSHj6OKofB7WNjaX+WRaIpQwEAkCWK9ab2/bj7
4IMW9hBtFvXjJov/I8+GOF9h4yNFVgM=
=fE32
-----END PGP SIGNATURE-----

--YndCLQNRUhwsHafT--

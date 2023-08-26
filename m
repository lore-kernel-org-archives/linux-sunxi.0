Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D67C2F7
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Aug 2023 11:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810BDC433C8;
	Sat, 26 Aug 2023 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693051052;
	bh=xpLEl94lz3bAHngyJDKUKnMgh36APQF/M1HRWRQ8NF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVINOEcU/sQCQXcrV+x89uUUvRQ/9nLb6jd5CdPohv0p6rgh7g1ItEFgMwmhPq8T4
	 YhLysA3OVcMDhILPzYZtzdZhhkAUmPZi9a8Kh1oJcWxrv2KClwXRE1S5hr3gnKoCpX
	 kYnSXYzcvD0+2jXtINOWVAKIXdXdjrXr/tyatxpQS/ioUQXZj1+jX1+OtTlau7bThR
	 VJ4Uz6rRHpiYUOCfQjQbUd8Oy+DK/N4aUEsgySDgUWO8TwzeIROApoBoJz/23xjuuT
	 DQvY3xN7W1aooqvaQOqgM7Jpxt4MEOXbFiognf6eWqgetcNmiTlYv8FIZOZlCeHAw5
	 NJua2CsZEqKaA==
Date: Sat, 26 Aug 2023 12:57:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Wei Fu <wefu@redhat.com>, Pei Chen <cp0613@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add PMU event node
Message-ID: <20230826-cubical-publisher-2580c5991069@spud>
References: <20230826-reverse-unroll-a2e0b2365dc1@spud>
 <IA1PR20MB4953161A592F3B8B00596FD0BBE2A@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uKHK42U+Ycbmhh8k"
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953161A592F3B8B00596FD0BBE2A@IA1PR20MB4953.namprd20.prod.outlook.com>


--uKHK42U+Ycbmhh8k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2023 at 07:25:43PM +0800, Inochi Amaoto wrote:

> >On Sat, Aug 26, 2023 at 04:38:53PM +0800, Inochi Amaoto wrote:
> >> D1 has several pmu events supported by opensbi.
> >> These events can be used by perf for profiling.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >
> >Could you please include a link to some documentation as to where these
> >values came from? I know several people have had some trouble with
> >understanding the pmu DT stuff & having some documentation would make
> >this an in-tree end-to-end example.

> The DT field of riscv,pmu for opensbi can be found on:
> https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_suppor=
t.md

There's an actual dt-binding for this.

> The value can be found in the R1S0 version of C906 documentation:
> https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf
>=20
> The meaning of T-HEAD events can be found in this patch:
> https://lore.kernel.org/linux-perf-users/IA1PR20MB4953DD82D0116EC291C2177=
7BBE2A@IA1PR20MB4953.namprd20.prod.outlook.com
>=20
> The patch above also provides documentation for T-HEAD events and a examp=
le
> that shows how to use perf with T-HEAD events.

What I meant was can you provide links to this in the commit messages so
that people have a way to find the documentation.


--uKHK42U+Ycbmhh8k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOnopgAKCRB4tDGHoIJi
0mSxAQDtF05y6F1rX6ExpSo7biIc/hisr+JfS70x6WEEbFwzAAD+LU33kG3lv3Xg
cDERdlj6Bvj0jstRNYumdBvHal7qpwg=
=CD0N
-----END PGP SIGNATURE-----

--uKHK42U+Ycbmhh8k--

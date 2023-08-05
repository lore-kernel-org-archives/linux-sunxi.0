Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9C1FA0
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 09:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61FFC433C7;
	Sat,  5 Aug 2023 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691226081;
	bh=dgEeBcrva2jOoR/AckWXtxOp1UtODnu4Z0eDZpObTJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qf7Xsi/7JNqXf/cgLhzWh9m18pm1NU5mXAnVpD9UeH7xIv/l4hJMmTKUOTm/T5hYl
	 Pgdi4TMZbfN+CiVIr/DmN5D+pGHTonbUnC+AO3USTz+w6GuI7KkJp9PyS7K39oegNk
	 3WsWGKSZKiaLLrvbQKYJMOlxa2+LJJyVRqHcmmjCtMDj8cTOdot9PWcUtoBH0ZpJoI
	 ZzonVbSQzarnJ2zKqena/M8r/uNqbB+zKjzFIfTBfzMCM2qpTFSLTpSsozB5WmNJKm
	 gOcHx9nhKPb+rtYjxMsW3UrVsO0OZBfMzft9e5kSEqS1BNwhkPWVfJrwT6MrUTzpNY
	 KfL5ZOKrY5wrQ==
Date: Sat, 5 Aug 2023 10:01:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Martin Botka <martin@biqu3d.com>
Cc: martin.botka1@gmail.com, Konrad Dybcio <konrad.dybcio@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jami Kettunen <jamipkettunen@somainline.org>,
	Paul Bouchara <paul.bouchara@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
	Icenowy Zheng <uwu@icenowy.me>,
	Ludwig Kormann <ludwig.kormann@ict42.de>,
	Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jagan Teki <jagan@edgeble.ai>, Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add BigTreeTech CB1 SoM & Boards
Message-ID: <20230805-whenever-likely-f16d8b2424ac@spud>
References: <5EB3DB1D7F80A40F+20230805083636.788048-1-martin@biqu3d.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R1/BBwzq+zlZ3S89"
Content-Disposition: inline
In-Reply-To: <5EB3DB1D7F80A40F+20230805083636.788048-1-martin@biqu3d.com>


--R1/BBwzq+zlZ3S89
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 05, 2023 at 10:36:03AM +0200, Martin Botka wrote:
> Hello,
> This series adds a vendor prefix for BigTreeTech and adds BigTreeTech CB1,
> Manta board and BigTreeTech Pi.
>=20
> CB1 is just an SoM thats based on AllWinner H616.
> BigTreeTech Manta boards are expander boards for CB1 and BigTreeTech Pi
> is an CB1 in Rpi style with few additional things like IR receiver and fa=
n port
> on GPIO.
>=20
> This work started before I was hired by BigTreeTech and thus majority of =
the
> patches are from SoMainline email and few are from my work email.
>=20
> This series depends on commit https://lkml.org/lkml/2023/8/2/801
> "dt-bindings: mfd: x-powers,axp152: make interrupt optional for more chip=
s".

I dunno what you are doing, but FYI the threading on your emails is not
quite right, with the cover letter disconnected from the rest of the
series. git send-email can send the covers alongside the patches and
correctly set the threading. Your 1/4 has a in-reply-to header with a
message-id that doesn't exist.

   1 ND  Aug 05 Martin Botka    (8.2K) =E2=94=8C=E2=94=80>[PATCH v3 4/4] ar=
m64: dts: allwinner: h616: Add BigTreeTech Pi support
   2 ND  Aug 05 Martin Botka    ( 12K) =E2=94=9C=E2=94=80>[PATCH v3 3/4] ar=
m64: dts: allwinner: h616: Add BigTreeTech CB1 SoM & boards support
   3  D  Aug 05 Martin Botka    (  41) =E2=94=9C=E2=94=80>[PATCH v3 2/4] dt=
-bindings: arm: sunxi: Add BigTreeTech boards
   4  D  Aug 05 Martin Botka    (  34) =E2=94=B4=E2=94=80>[PATCH v3 1/4] dt=
-bindings: vendor-prefixes: Add BigTreeTech
   5     Aug 05 Martin Botka    (  38) [PATCH v3 0/4] Add BigTreeTech CB1 S=
oM & Boards



--R1/BBwzq+zlZ3S89
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZM4P2QAKCRB4tDGHoIJi
0tXOAQCX5+cTghQzqfFftt0xtGKczjQw/G8gIxfV9+wNVo8vYQEAxEihLw6ZGmbV
2B+UvTVU0fWKKaFPd8/Kd7KNOHej/gA=
=G2Ie
-----END PGP SIGNATURE-----

--R1/BBwzq+zlZ3S89--

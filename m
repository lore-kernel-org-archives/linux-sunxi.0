Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646342F26
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 09:12:10 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oNscI-0002ox-1h; Tue, 16 Aug 2022 11:12:06 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
Date: Tue, 16 Aug 2022 11:12:05 +0200
Message-ID: <3881930.ZaRXLXkqSa@diego>
In-Reply-To: <5593349.DvuYhMxLoT@jernej-laptop>
References: <20220815050815.22340-1-samuel@sholland.org> <149eee7b-a9e9-94ad-1ab2-13812b541a8c@linaro.org> <5593349.DvuYhMxLoT@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Dienstag, 16. August 2022, 09:49:58 CEST schrieb Jernej =C5=A0krabec:
> Dne torek, 16. avgust 2022 ob 09:41:45 CEST je Krzysztof Kozlowski napisa=
l(a):
> > On 15/08/2022 08:08, Samuel Holland wrote:
> > > +
> > > +	de: display-engine {
> > > +		compatible =3D "allwinner,sun20i-d1-display-engine";
> > > +		allwinner,pipelines =3D <&mixer0>, <&mixer1>;
> > > +		status =3D "disabled";
> > > +	};
> > > +
> > > +	osc24M: osc24M-clk {
> >=20
> > lowercase
> >=20
> > > +		compatible =3D "fixed-clock";
> > > +		clock-frequency =3D <24000000>;
> >=20
> > This is a property of the board, not SoC.
>=20
> SoC needs 24 MHz oscillator for correct operation, so each and every boar=
d has=20
> it. Having it here simplifies board DT files.

I guess the oscillator is a separate component on each board, right?
And DT obvious is meant to describe the hardware - independently from
implementation-specific choices.

Starting to discuss which exceptions to allow then might lead to even more
exceptions.

Also having to look for a board-component in the soc dtsi also is surprising
if one gets to the party later on :-) .



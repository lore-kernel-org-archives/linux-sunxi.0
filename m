Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA13C443A
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Aug 2023 13:57:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B83D1FB;
	Mon,  7 Aug 2023 06:57:58 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 441163F64C;
	Mon,  7 Aug 2023 06:57:12 -0700 (PDT)
Date: Mon, 7 Aug 2023 14:57:09 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: martin.botka1@gmail.com, Martin Botka <martin@biqu3d.com>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@somainline.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Jami Kettunen
 <jamipkettunen@somainline.org>, Paul Bouchara
 <paul.bouchara@somainline.org>, Martin Botka <martin.botka@somainline.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Andrew
 Lunn <andrew@lunn.ch>, Icenowy Zheng <uwu@icenowy.me>, Ludwig Kormann
 <ludwig.kormann@ict42.de>, Heiko Stuebner <heiko@sntech.de>, Shawn Guo
 <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Chris Morgan
 <macromorgan@hotmail.com>, Jagan Teki <jagan@edgeble.ai>, Maxime Ripard
 <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add BigTreeTech CB1 SoM & Boards
Message-ID: <20230807145709.59156e51@donnerap.manchester.arm.com>
In-Reply-To: <3242042.aeNJFYEL58@jernej-laptop>
References: <5EB3DB1D7F80A40F+20230805083636.788048-1-martin@biqu3d.com>
	<3242042.aeNJFYEL58@jernej-laptop>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 06 Aug 2023 13:54:21 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne sobota, 05. avgust 2023 ob 10:36:03 CEST je Martin Botka napisal(a):
> > Hello,
> > This series adds a vendor prefix for BigTreeTech and adds BigTreeTech C=
B1,
> > Manta board and BigTreeTech Pi.
> >=20
> > CB1 is just an SoM thats based on AllWinner H616.
> > BigTreeTech Manta boards are expander boards for CB1 and BigTreeTech Pi
> > is an CB1 in Rpi style with few additional things like IR receiver and =
fan
> > port on GPIO.
> >=20
> > This work started before I was hired by BigTreeTech and thus majority o=
f the
> > patches are from SoMainline email and few are from my work email.
> >=20
> > This series depends on commit https://lkml.org/lkml/2023/8/2/801
> > "dt-bindings: mfd: x-powers,axp152: make interrupt optional for more ch=
ips". =20
>=20
> What's the status of above patch?
>=20
> I won't merge this series until it's accepted and merged.

So Conor ACKed it, and I think the only questions left were whether this
should be extended to all PMICs (not now, as I argued[1]), and that the
actual AXP MFD driver "implementing" the binding is not fit for that, with
a fix now here [2].

So is there any chance that there would be a second PR with the CB1 and
MangoPi DTs, still?

Cheers,
Andre

[1]
https://lore.kernel.org/lkml/20230807144229.5710738d@donnerap.manchester.ar=
m.com/
[2]
https://lore.kernel.org/lkml/20230807133930.94309-1-andre.przywara@arm.com/

> Best regards,
> Jernej
>=20
> >=20
> > Cheers,
> > Martin
> >=20
> > Martin Botka (4):
> >   dt-bindings: vendor-prefixes: Add BigTreeTech
> >   dt-bindings: arm: sunxi: Add BigTreeTech boards
> >   arm64: dts: allwinner: h616: Add BigTreeTech CB1 SoM & boards support
> >   arm64: dts: allwinner: h616: Add BigTreeTech Pi support
> >=20
> >  .../devicetree/bindings/arm/sunxi.yaml        |  11 ++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  arch/arm64/boot/dts/allwinner/Makefile        |   2 +
> >  .../sun50i-h616-bigtreetech-cb1-manta.dts     |  35 +++++
> >  .../sun50i-h616-bigtreetech-cb1.dtsi          | 140 ++++++++++++++++++
> >  .../allwinner/sun50i-h616-bigtreetech-pi.dts  |  70 +++++++++
> >  6 files changed, 260 insertions(+)
> >  create mode 100644
> > arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts cre=
ate
> > mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.d=
tsi
> > create mode 100644
> > arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts =20
>=20
>=20
>=20
>=20
>=20


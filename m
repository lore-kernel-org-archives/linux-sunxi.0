Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB810BA28
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 11:48:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62E041007;
	Fri,  4 Aug 2023 04:48:53 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E5C23F5A1;
	Fri,  4 Aug 2023 04:48:09 -0700 (PDT)
Date: Fri, 4 Aug 2023 12:48:06 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Icenowy
 Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH 0/3] sunxi: Orange Pi Zero 3 DT support
Message-ID: <20230804124806.2a9b2c40@donnerap.manchester.arm.com>
In-Reply-To: <3751904.kQq0lBPeGt@jernej-laptop>
References: <20230731011725.7228-1-andre.przywara@arm.com>
	<3751904.kQq0lBPeGt@jernej-laptop>
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

On Thu, 03 Aug 2023 23:07:55 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> Dne ponedeljek, 31. julij 2023 ob 03:17:22 CEST je Andre Przywara napisal=
(a):
> > Hi,
> >=20
> > Orange Pi recently released the Orange Pi Zero 3 board, which is some
> > updated version of their former Zero 2 development board. Some component
> > changes (Motorcomm PHY instead of Realtek, different PMIC), some board
> > layout changes, and it ships with up to 4GB of DRAM now. The SoC is now
> > labelled H618 instead of H616, which apparently is the same, just with
> > more L2 cache.
> >=20
> > Split the existing OPi Zero2 DT, to allow sharing most DT nodes, then
> > add the binding documentation and DT for the new board.
> >=20
> > Linux v6.5-rc boots out of the box (the PMIC driver just made it in),
> > and most things work: UART, PSCI, GPIO, SPI flash, SD card, USB.
> > Ethernet is almost working, I get an IP address via DHCP, but no further
> > packets come through. Might be either a problem with the new Motorcomm
> > PHY driver, or some missing delay settings, I have to investigate, any
> > help or advice welcome. =20
>=20
> When I worked with Motorcomm PHYs, I had to add=20
>=20
> motorcomm,clk-out-frequency-hz =3D <125000000>;

Ah, good point. Looking at the Linux driver code, that seems almost
mandatory, otherwise the PHY clock is not activated(?).
So that helped, I managed to SSH into my laptop, but it still hangs then.

Just for the sake of completeness, I also tried the other properties that
other boards use: As expected, motorcomm,keep-pll-enabled didn't help, as
the clock line just goes to the MAC pin, and is not used otherwise.
And also motorcomm,auto-sleep-disabled didn't improve stability. At least
not with the current settings, maybe it's needed later on.

> and usual reset gpio related properties. Have you tried that? In any case=
,=20
> it's not 100% reliable, but I don't know why.

The reset pin is hardwired via a simple RC circuit, so there is no GPIO,
and thus the delay parameters don't do anything, I suppose.

But as it's better now with the clk-out property, so I will definitely add
that.
Reports from others (Piotr) seem to suggest that Ethernet is working for
them, so I need to compare notes.

Thanks,
Andre

>=20
> Best regards,
> Jernej
>=20
> > Also let me know if the DT split is a good idea or not, happy to roll
> > that back if requested.
> >=20
> > Cheers,
> > Andre
> >=20
> > Andre Przywara (3):
> >   arm64: dts: allwinner: h616: Split Orange Pi Zero 2 DT
> >   dt-bindings: arm: sunxi: document Orange Pi Zero 3 board name
> >   arm64: dts: allwinner: h616: Add OrangePi Zero 3 board support
> >=20
> >  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../allwinner/sun50i-h616-orangepi-zero2.dts  | 119 +---------------
> >  .../allwinner/sun50i-h616-orangepi-zerox.dtsi | 131 ++++++++++++++++++
> >  .../allwinner/sun50i-h618-orangepi-zero3.dts  |  86 ++++++++++++
> >  5 files changed, 224 insertions(+), 118 deletions(-)
> >  create mode 100644
> > arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zerox.dtsi create mo=
de
> > 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts =20
>=20
>=20
>=20
>=20
>=20


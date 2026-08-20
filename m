Received: from lab.riabenko.com (lab.riabenko.com [185.143.146.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823C038945D;
	Thu, 20 Aug 2026 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.143.146.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219866; cv=none; b=BnZjgo8HQgY5sdX3aAmuvYcKnyDsMENcCs489G4zL3VzhS0gywzNzrylG3X65vOYvO4SnO8My/p6gUCkIyvg1Sl7GehmeFyWXhOr8Da5v0+hhhykZ9fRUfaKq4SkqT5BpkeZT1TS+OaeajPJe7od/vJGR21+GVvTUWGldQmr588=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219866; c=relaxed/simple;
	bh=rRcxrD7tiCwgpIhMHDXpfaqjTfUaepbfOtWXoCd3HsI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M/6iFFsxudyBBEcPrmEPBuBJaPV2t3rsskba/767esL68ehVqs0+764ZJ/vqIo1TGWEY+vhySf6uWnTjftAYWRFayVqTScUQJuti2k5ic9DHmnWEyQgMxmMjLWL9pud7M6tEaq83Dvr0nwUkoYCymBxxzoSumUKhpbs1e7AsEf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=riabenko.com; spf=pass smtp.mailfrom=riabenko.com; dkim=pass (2048-bit key) header.d=riabenko.com header.i=@riabenko.com header.b=ugrPLOCQ; arc=none smtp.client-ip=185.143.146.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=riabenko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riabenko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riabenko.com header.i=@riabenko.com header.b="ugrPLOCQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=riabenko.com; s=selector; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=GkAiy/wgR/8kbgT2A4gjDwuuCsWMNesTQo7LikwOjss=; b=u
	grPLOCQMhAMUn6kw315OlBRIjQBkRQikWNh2MDO+VCoqxEVhj8M1k7+fX30OxyD2CHqFwKjU5Xzcy
	4THinkWHcFfG55YajMeQKTy36nEsycIB+sIsY4Lzq2YSF/RLik+3CGSBkraNMjdgO68wDeBAJ48IS
	V747+OWTP1nPJ19d+kUCKo4tkBqTHawxu8RwDxIE7NxRs93wY9e1VQTbtZ1sZfO542wpiju/Kgz2b
	4T1+hfVda5bIlOiZB3VM9Cqm7mp27LX97+9euYNaEZVhvVpDlVxnxNYF6X4nZIh1dI/OS/YoHowAB
	KYb6CXjw2imCEDjxYTKP6QnhPibaRqOEg==;
Received: from desk.lan ([2a01:d0:333::831] helo=desk.local)
	by mini.riabenko.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <roman@riabenko.com>)
	id 0000ng-0000000006W-0C1H;
	Thu, 20 Aug 2026 12:57:28 +0300
Message-ID: <badf09f4411ad450b7a5def37099af1edbb40d8e.camel@riabenko.com>
Subject: Re: [PATCH] arm64: dts: allwinner: sun50i-a64-olinuxino: Add RX
 delay
From: Roman Riabenko <roman@riabenko.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-sunxi@lists.linux.dev
Date: Thu, 20 Aug 2026 12:57:27 +0300
In-Reply-To: <e9c26d2a-2426-43b7-8c68-89cc52a2c7cb@lunn.ch>
References: <20260815005316.28998-1-roman@riabenko.com>
	 <e9c26d2a-2426-43b7-8c68-89cc52a2c7cb@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.0 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

=D0=A3 =D1=81=D1=80, 2026-08-19 =D1=83 15:48 +0200, Andrew Lunn =D0=BF=D0=
=B8=D1=88=D0=B5:
> On Sat, Aug 15, 2026 at 03:53:16AM +0300, Roman Riabenko wrote:
> > The Ethernet on Olimex A64-OlinuXino computers requires an RX delay
> > greater than 0. If the value is not set or is 0, packet loss in the
> > downlink direction is severe enough to interfere with downloads and
> > disrupt software installation.
> >=20
> > The range of acceptable values is wide. The vendor has been
> > applying
> > 200 ps in its downstream DTs since 2021. This patch matches that
> > common practice.
> >=20
> > Signed-off-by: Roman Riabenko <roman@riabenko.com>
> > ---
> > =C2=A0arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> > b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> > index fd3794678c33..6c8b79c257b9 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> > @@ -106,6 +106,7 @@ &emac {
> > =C2=A0	phy-handle =3D <&ext_rgmii_phy>;
> > =C2=A0	phy-supply =3D <&reg_dcdc1>;
> > =C2=A0	allwinner,tx-delay-ps =3D <600>;
> > +	allwinner,rx-delay-ps =3D <200>;
> > =C2=A0	status =3D "okay";
> > =C2=A0};
>=20
> The full node is:
>=20
> &emac {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&rgmii_pins>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-mode =3D "rgmii";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-handle =3D <&ext_rgmii_phy=
>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-supply =3D <&reg_dcdc1>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allwinner,tx-delay-ps =3D <600=
>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> };
>=20
> Please take a read of:
>=20
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bi=
ndings/net/ethernet-controller.yaml#L287
>=20
> phy-mode of "rgmii" is questionable. Does the PCB have extra long
> clock lines?

The PCB tracks for RX clock in comparison to RX data are approximately
the same in length in the PCB layout file (12 mm or so). The tracks for
TX clock in comparison to TX data are approximately the same as well
(roughly 14-16 mm). Thus, the tracks themselves do not appear to
implement the 2ns RGMII delay. Any delay from the tracks' lengths is
likely insignificant.

When I change the phy-mode to rgmii-id and remove allwinner,tx-delay-
ps, the connection is stable in both upstream and downstream direction.
There are no retries in my iperf3 tests. According to KSZ9031RNX
datasheet, it adds a typical 1.2 ns delay to RX_CLK with respect to
RX_DV and RXD by default, but no TX delay is provided by default. The
rgmii-id configuration causes the PHY driver to enable appropriate
internal RGMII delays.

I will submit a second version of the patch changing phy-mode to rgmii-
id and removing allwinner,tx-delay-ps.

Thank you for referring me to the linked document.

Roman

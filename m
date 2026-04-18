Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D0A244694
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Apr 2026 11:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776513342; cv=none; b=pO5lsdHm7xO8Lag6PxbIboMmrbn+9lMcBRxVKuWVF7DKaoisFePXTo8VsnSbMmsKt7iP2TofUk9qnNAPGin6/O1Vms0R7FZdzqR57CLjSpPfLBihoAsNAxB8zFBXka1/ksQI/Srjo0PezJsgDU7ktuGZNMl/POvYcOpW2f6zZHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776513342; c=relaxed/simple;
	bh=cGEAy3W2Hgjbx+Rpgzb/NTGU3TEbtjntAU+pNGtk3uo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sJqYoGhAlOE+rdHBFeaBMOKwmk5zwlKOz8dG+YSmI46HuZUbAus3sSYibWItI9jcxdU8TYhykJdCLVoO20QK9hHIwpFkwgyG7sgNeCi+8TulYLhDWU5wd6Sd8mvI2NerqO7PLme/vC0W0sufh0TN6msCS8plZ8hyinrlIu5fXq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=I77IGIhf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="I77IGIhf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E42E1A32;
	Sat, 18 Apr 2026 04:55:34 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C79563F7B4;
	Sat, 18 Apr 2026 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776513340; bh=cGEAy3W2Hgjbx+Rpgzb/NTGU3TEbtjntAU+pNGtk3uo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I77IGIhfG2oOTNKY29yxyRzy03ikR066Bf0UIC+xT0+oE5iDSQmGJsRT10wsFPrz9
	 a7stl6AZSe1Zo6+3IRh0kqsUl2qmZZ72nnDjWTdskqAGAHZKaDTvrfDfx0nVIPaVVz
	 GkhaABXQM85B71RsWimBNtjtlIVlY83Q3wV1GUeY=
Date: Sat, 18 Apr 2026 13:55:19 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Samuel
 Holland <samuel@sholland.org>, Michal Piekos <michal.piekos@mmpsystems.pl>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: dts: allwinner: t113s mangopi: enable watchdog for
 reboot
Message-ID: <20260418135519.16e41490@ryzen.lan>
In-Reply-To: <2825865.mvXUDI8C0e@jernej-laptop>
References: <20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl>
	<2825865.mvXUDI8C0e@jernej-laptop>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Apr 2026 20:19:20 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

> Hi,
>=20
> Dne nedelja, 12. april 2026 ob 19:42:10 Srednjeevropski poletni =C4=8Das =
je Michal Piekos napisal(a):
> > Reboot hangs on MangoPi MQ-R T113s because no restart handler is
> > available.
> >=20
> > Enable the SoC watchdog whose driver registers a restart handler.
> >=20
> > Tested on MangoPi MQ-R T113s.
> >=20
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> >  arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.=
dts b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > index 8b3a75383816..f0232a5e903b 100644
> > --- a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > @@ -33,3 +33,7 @@ rtl8189ftv: wifi@1 {
> >  		interrupt-names =3D "host-wake";
> >  	};
> >  };
> > +
> > +&wdt {
> > +	status =3D "okay";
> > +}; =20
>=20
> Move this to sun8i-t113s.dtsi. All t113 boards have the same issue.
> Watchdog should be always enabled on ARM.

We actually have that line in U-Boot:
https://github.com/u-boot/u-boot/blob/master/arch/arm/dts/sunxi-u-boot.dtsi=
#L22-L27

IIRC, the idea was that it is *firmware* that chooses the watchdog, so
the generic DT should not be the place to set this.

If people use $fdtcontroladdr as the DT source, everything falls in
place neatly, no need for changes or runtime patching.

Cheers,
Andre

Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71E97E9
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Mar 2025 00:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742258078; cv=none; b=pCR2LFWhYk1n5mPBEmer9E9Zso8sNpuls9Tpiyz74+yWa25uIwN2NxvLFOzUIClVp2NOvfWV7JsaGNVAvIAzvEHsUXEfpBSrj1sXFu/GYmz749yLG9opJEkyyXc/Zc/A2PX0cRgjuRPsk6ToNthhaBKPACe9rXsw9ZF+ELcx1q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742258078; c=relaxed/simple;
	bh=biqnJCjj8mhppXfAw2NFfyoiXyJ1r7GKXQXYVsvLK9k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jm3O7aNq5nnFv719dhzWdUrnQ4RIGm7onED50F3m7SYkd1R8i3dT0XaKj1T9qZIMJBu8M7CxtqHybHuAmmi37t3tIH1mZVTzeFcN2Ijm3V3eFmJJ6KsNeUuDcLFO+FQsZzikKNcXQfGPO7si9gGcZ5ZoUM9bUavCiA6MZP2Y4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 354A413D5;
	Mon, 17 Mar 2025 17:34:38 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26E8A3F63F;
	Mon, 17 Mar 2025 17:34:28 -0700 (PDT)
Date: Tue, 18 Mar 2025 00:34:08 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Simon Glass <sjg@chromium.org>
Cc: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>,
 u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>, Sean Anderson
 <seanga2@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>, Tom Rini
 <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 linux-sunxi@lists.linux.dev, Parthiban <parthiban@linumiz.com>
Subject: Re: [PATCH 2/8] sunxi: pmic_bus: support alternative I2C address
Message-ID: <20250318003408.4408c16c@minigeek.lan>
In-Reply-To: <CAFLszTg95xH08bVt_LnVO=Gu+dEQh1+vNAszxQv5a6Rdt3u8WA@mail.gmail.com>
References: <20250117014537.22513-1-andre.przywara@arm.com>
	<2352334.ElGaqSPkdT@jernej-laptop>
	<20250119222530.1fd97018@minigeek.lan>
	<4622391.LvFx2qVVIh@jernej-laptop>
	<CAFLszTjDq4E05Q_esYA2tAGOYdhgbRp3B38gAsF0hX44Nf-34A@mail.gmail.com>
	<20250121000508.22db819a@minigeek.lan>
	<CAFLszTg95xH08bVt_LnVO=Gu+dEQh1+vNAszxQv5a6Rdt3u8WA@mail.gmail.com>
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

On Thu, 23 Jan 2025 07:37:37 -0700
Simon Glass <sjg@chromium.org> wrote:

Hi Simon,

thanks for chiming in, and sorry, just realised I never answered to
that email ....

> On Mon, 20 Jan 2025 at 17:06, Andre Przywara <andre.przywara@arm.com> wro=
te:
> >
> > On Mon, 20 Jan 2025 12:21:28 -0700
> > Simon Glass <sjg@chromium.org> wrote:
> >
> > Hi Simon,
> > =20
> > > On Mon, 20 Jan 2025 at 09:42, Jernej =C5=A0krabec <jernej.skrabec@gma=
il.com> wrote: =20
> > > >
> > > > Dne nedelja, 19. januar 2025 ob 23:25:30 Srednjeevropski standardni=
 =C4=8Das je Andre Przywara napisal(a): =20
> > > > > On Sat, 18 Jan 2025 08:21:31 +0100
> > > > > Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
> > > > >
> > > > > Hi Jernej,
> > > > >
> > > > > many thanks for the review and your opinion.
> > > > > =20
> > > > > > Dne petek, 17. januar 2025 ob 02:45:31 Srednjeevropski standard=
ni =C4=8Das je Andre Przywara napisal(a): =20
> > > > > > > Some of the X-Power AXP PMICs can be ordered with an alternat=
ive I2C
> > > > > > > address, for instance an AXP717 could be shipped with address=
 0x34 or
> > > > > > > with address 0x35.
> > > > > > > The datasheets for the AXP717 and AXP803 list two possible ad=
dresses,
> > > > > > > and they are always consecutive. For DM (DT) based drivers th=
is is no
> > > > > > > problem, but the Allwinner SPL code relies on a hardcoded add=
ress.
> > > > > > >
> > > > > > > Add a Kconfig variable that will add "1" to the existing addr=
ess if it
> > > > > > > is set.
> > > > > > > This enables to use the AXP717 as used on boards with the new=
 Allwinner
> > > > > > > A523 chip.
> > > > > > >
> > > > > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
> > > > > >
> > > > > > This works until some board vendor start mixing one or another =
address
> > > > > > PMIC. Note that BSP boot0 does address autodetection, so it's n=
ot entirely
> > > > > > out of the question. Anyway, let's hope we don't see anything l=
ike that. =20
> > > > >
> > > > > I looked at the datasheets for all supported PMICs, and they eith=
er
> > > > > state one or two supported addresses, in the latter case both
> > > > > consecutive. Autodetection sounds nice, but also unnecessary: we =
surely
> > > > > know what address it is for a certain board? And with those A523 =
boards
> > > > > having two PMICs, autodetection might become sketchy, as we don't=
 know
> > > > > for sure which PMIC we got? =20
> > > >
> > > > Speaking for T527 BSP boot0 - they check version register to make s=
ure that
> > > > correct PMIC is installed.
> > > > =20
> > > > >
> > > > > But that got me thinking: what about putting the I2C address in K=
config
> > > > > directly, with defaults depending on the PMIC type?
> > > > >
> > > > > config AXP_I2C_ADDR
> > > > >       hex "AXP PMIC I2C address"
> > > > >       depends on ARCH_SUNXI && !SUNXI_NO_PMIC
> > > > >       default 0x36 if AXP305_POWER
> > > > >       ....
> > > > >
> > > > > That's should work seamlessly for all supported PMICs, and we jus=
t need
> > > > > one line for the Avaota, same as with this patch here.
> > > > >
> > > > > What do you think? =20
> > > >
> > > > Yeah, looks more universal and avoids code changes in pmic_bus.c wh=
en
> > > > adding support for new AXP PMIC, which is very nice indeed. =20
> > >
> > > Shouldn't this be in the devicetree? =20
> >
> > It is, and the DM based I2C driver used in U-Boot proper does this
> > properly, and works fine. But this here is for the SPL, where we don't
> > have DT support. We need just minimal support to adjust the regulator
> > for the DRAMs. So far there is one fixed address used by each PMIC, so
> > this is simply hardcoded, based on which PMIC is selected. The patch I
> > am now proposing (snippet above) just moves that hardcoding into
> > Kconfig. =20
>=20
> I suppose you could use of-platdata?

Theoretically, maybe, but from what I can see this would be a huge
effort for very little gain. It's really about some odd board using a
different address. I now made a new patch which selects the I2C address
by default in Kconfig (it's just four lines there). Those special
snowflake boards can then select the differing address in their
defconfig. That's both flexible, simple and lean.

Will send that patch in a minute.

Cheers,
Andre

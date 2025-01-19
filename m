Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47741A260
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jan 2025 22:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737325628; cv=none; b=bP9L/+tR6Dm+Nh6sdNKPXALys61wRqGI9CsiTEElZhKNNZOar52ccW+Hm2kO5Dh5uJeA9mVIpX8UQWuqest1rOSjG7hf43OmkuJU2ZtK14rREV6xjnFrD1xI/wk7G+kXCtevHCdAhgYobJsMFNAqbvQv78ljGrsI6Iw2AcSEMtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737325628; c=relaxed/simple;
	bh=+vivGQ54LggTI8YExUUH54Q3UzaDaptTOdikpSrh9/4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hUqq7vpcg/yy494zeEpgqd3r7rq47p4nI3SaYBUQRC0FpX+UYQVVO48WauUy/SOWrSL9qWVJLUiqksi9Zkr6I2ajKz9agE84jjcIeX/4NH/fm/GNyMhW5t0cZ5NRDgM26n9ps0+7PIG2NbqxYTQVhRTijEtw8FsjFacbCxVIYTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDB771063;
	Sun, 19 Jan 2025 14:27:32 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 256EC3F5A1;
	Sun, 19 Jan 2025 14:27:03 -0800 (PST)
Date: Sun, 19 Jan 2025 22:25:30 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>, Sean Anderson
 <seanga2@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>, Tom Rini
 <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>, Simon Glass
 <sjg@chromium.org>, linux-sunxi@lists.linux.dev, Parthiban
 <parthiban@linumiz.com>
Subject: Re: [PATCH 2/8] sunxi: pmic_bus: support alternative I2C address
Message-ID: <20250119222530.1fd97018@minigeek.lan>
In-Reply-To: <2352334.ElGaqSPkdT@jernej-laptop>
References: <20250117014537.22513-1-andre.przywara@arm.com>
	<20250117014537.22513-3-andre.przywara@arm.com>
	<2352334.ElGaqSPkdT@jernej-laptop>
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

On Sat, 18 Jan 2025 08:21:31 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

many thanks for the review and your opinion.

> Dne petek, 17. januar 2025 ob 02:45:31 Srednjeevropski standardni =C4=8Da=
s je Andre Przywara napisal(a):
> > Some of the X-Power AXP PMICs can be ordered with an alternative I2C
> > address, for instance an AXP717 could be shipped with address 0x34 or
> > with address 0x35.
> > The datasheets for the AXP717 and AXP803 list two possible addresses,
> > and they are always consecutive. For DM (DT) based drivers this is no
> > problem, but the Allwinner SPL code relies on a hardcoded address.
> >=20
> > Add a Kconfig variable that will add "1" to the existing address if it
> > is set.
> > This enables to use the AXP717 as used on boards with the new Allwinner
> > A523 chip.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
>=20
> This works until some board vendor start mixing one or another address
> PMIC. Note that BSP boot0 does address autodetection, so it's not entirely
> out of the question. Anyway, let's hope we don't see anything like that.

I looked at the datasheets for all supported PMICs, and they either
state one or two supported addresses, in the latter case both
consecutive. Autodetection sounds nice, but also unnecessary: we surely
know what address it is for a certain board? And with those A523 boards
having two PMICs, autodetection might become sketchy, as we don't know
for sure which PMIC we got?

But that got me thinking: what about putting the I2C address in Kconfig
directly, with defaults depending on the PMIC type?

config AXP_I2C_ADDR
	hex "AXP PMIC I2C address"
	depends on ARCH_SUNXI && !SUNXI_NO_PMIC
	default 0x36 if AXP305_POWER
	....

That's should work seamlessly for all supported PMICs, and we just need
one line for the Avaota, same as with this patch here.

What do you think?

Cheers,
Andre



>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Best regards,
> Jernej
>=20
>=20
>=20


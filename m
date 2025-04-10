Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CD520C012
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277006; cv=none; b=Az7Mbpi9WT7OgsL5b1fZ8H3QJr6R8pGi8ZlPhzEp1RUdQCGrFLpukPfrNlDfR0GO48hpf+3u10as3MMQ6X5T18P5iUbQPH2EGszVsCwPjPpTtASzO99KmQHjZdTo1tS1xXDsQ39RaFkAFmxSm9t8Rq03TabpvoUW9i+CSNelHoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277006; c=relaxed/simple;
	bh=2aWCWtwS8IGHbVhobD+oM2xISKPD2JkLp+UMuM9Xsu4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XqsyBfaTAg2EIQd8c70psi+pB1DFQPk/0QISMq0nfeMNKJFbxRV+M+sOOCET+Xqtt5g3FwQoDx4zLfeavvZA0PwGFd/H25jZKruhN7fL3rqZecFFnfTalDktFl2B1Ex58s7U8tYEW2gKkhfnAeD/3ycSWndY/8GYvmPMoE6DbQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BB2D106F;
	Thu, 10 Apr 2025 02:23:22 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E45D43F6A8;
	Thu, 10 Apr 2025 02:23:17 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:23:15 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Samuel Holland
 <samuel@sholland.org>, Tom Rini <trini@konsulko.com>, Simon Glass
 <sjg@chromium.org>, Hans de Goede <hdegoede@redhat.com>, Olliver Schinagl
 <oliver@schinagl.nl>, Iain Paton <ipaton0@gmail.com>, Marcus Cooper
 <codekipper@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>, Paul
 Kocialkowski <contact@paulk.fr>, Chen-Yu Tsai <wens@csie.org>, Maxime
 Ripard <mripard@kernel.org>, Ian Campbell <ijc@hellion.org.uk>, Adam
 Sampson <ats@offog.org>, Zoltan Herpai <wigyori@uid0.hu>, Siarhei Siamashka
 <siarhei.siamashka@gmail.com>, VishnuPatekar <vishnupatekar0510@gmail.com>,
 Rask Ingemann Lambertsen <rask@formelder.dk>, Aleksei Mamlin
 <mamlinav@gmail.com>, Peter Korsgaard <peter@korsgaard.com>, Michal
 Suchanek <hramrach@gmail.com>, Icenowy Zheng <icenowy@aosc.xyz>, Stefan
 Roese <sr@denx.de>, Phil Han <pengphei@sina.com>, Quentin Schulz
 <quentin.schulz@free-electrons.com>, Jonas Smedegaard <dr@jones.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>, Heiko Schocher <hs@denx.de>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/8] power: regulator: Add a driver for the AXP PMIC
 drivevbus
Message-ID: <20250410102315.6e080dbd@donnerap.manchester.arm.com>
In-Reply-To: <4971028.GXAFRqVoOG@jernej-laptop>
References: <20250409002036.12212-1-andre.przywara@arm.com>
	<20250409002036.12212-2-andre.przywara@arm.com>
	<4971028.GXAFRqVoOG@jernej-laptop>
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

On Thu, 10 Apr 2025 09:04:35 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

> Dne sreda, 9. april 2025 ob 02:20:29 Srednjeevropski poletni =C4=8Das je =
Andre Przywara napisal(a):
> > From: Samuel Holland <samuel@sholland.org>
> >=20
> > AXP PMICs have a pin which can either report the USB VBUS state, or
> > driving a regulator that supplies USB VBUS. Add a regulator driver for
> > controlling this pin. The selection between input and output is done via
> > the x-powers,drive-vbus-en pin on the PMIC (parent) node.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
>=20
> Would it be less error prone to auto enable Kconfig option when compatible
> AXP device is enabled? That way defconfigs could be smaller. Driver is pr=
etty
> small anyway.

Yes, but the whole PMIC config is quite a mess at the moment. Those
AXPxxx_POWER symbols are really for the SPL part only, and do nothing
in U-Boot proper, where everything is guarded by CONFIG_REGULATOR_AXP and
properly detected at runtime through the DT.
I tried to enable this driver for all 64-bit boards, to be able to drop
the TF-A code, but ran into problems with the H616 RSB boards, because of
this overlap and this "PMIC bus" feature.

So I have patches to enable this more universally, and will look at this
in the next days and weeks, but first wanted to get the non-controversial
parts in, like the driver itself.

> In any case:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Many thanks for that!

Cheers,
Andre

>=20
> Best regards,
> Jernej
>=20
>=20


Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1980263F54
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489317; cv=none; b=fAp1k/DRqJ7dMttxvhtYRgRoTDC9Uj0uJ+fI3cRTY+R0MuMpo5m7r/MQ9n/noJnX0/95guUORHuFRSmvCHxq5gF0GVIYbaQeG70ZBV8p4XoiKUUphKxYyRQqqD3ww2DUeOTiUFvg+ouBbPINK1290zoN8jo7UppIJD2Fgf6OHiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489317; c=relaxed/simple;
	bh=qdQgkRjRa/9lwYUupnKPCQ2uwXYMz+1y2L/jjbq1EAE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fl3igYTHL1wLdOhPx0xZ7X9P5MRxLSObHXXocKG7nHcgi/2HIzGeAUz0vfNpsNue7ZN4BJ6Dq6wZWz3z2I6aZiZk35OeZstZ8pDnlmAvOiYjy32POaTRKdtkamrumcNBQIkXkDPbnLrBBo3WuxZDw+sAyMKm2s/nRF7YsDzv9e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1uwFFc-0000tx-T8; Wed, 10 Sep 2025 09:28:20 +0200
Message-ID: <8192c4d04f1640f140a8f2cb43e694a7476bb0ca.camel@pengutronix.de>
Subject: Re: drm/etnaviv: detecting disabled Vivante GPU?
From: Lucas Stach <l.stach@pengutronix.de>
To: Andre Przywara <andre.przywara@arm.com>, Russell King
	 <linux+etnaviv@armlinux.org.uk>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-sunxi
	 <linux-sunxi@lists.linux.dev>
Date: Wed, 10 Sep 2025 09:28:19 +0200
In-Reply-To: <20250904002924.2bc63b73@minigeek.lan>
References: <20250904002924.2bc63b73@minigeek.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

Hi Andre,

Am Donnerstag, dem 04.09.2025 um 00:29 +0100 schrieb Andre Przywara:
> Hi,
>=20
> the Allwinner A523/A527/T527 family of SoCs feature a Vivante
> "VIP9000"(?) NPU, though it seems to be disabled on many SKUs.
> See https://linux-sunxi.org/A523#Family_of_sun55iw3 for a table, the
> row labelled "NPU" indicates which model has the IP. We suspect it's
> all the same die, with the NPU selectively fused off on some packages.
>=20
> Board vendors seem to use multiple SKUs of the SoC on the same board,
> so it's hard to say which particular board has the NPU or not. We
> figured that on unsupported SoCs all the NPU registers read as 0,
> though, so were wondering if that could be considered as a bail-out
> check for the driver?
> At the moment I get this, on a SoC with a disabled NPU:
> [    1.677612] etnaviv etnaviv: bound 7122000.npu (ops gpu_ops)
> [    1.683849] etnaviv-gpu 7122000.npu: model: GC0, revision: 0
> [    1.690020] etnaviv-gpu 7122000.npu: Unknown GPU model
> [    1.696145] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor 0
> [    1.953053] etnaviv-gpu 7122000.npu: GPU not yet idle, mask: 0x0000000=
0
>=20
> Chen-Yu got this on his board featuring the NPU:
>     etnaviv-gpu 7122000.npu: model: GC9000, revision: 9003
>=20
> If I get the code correctly, then etnaviv_gpu_init() correctly detects
> the "unsupported" GPU model, and returns -ENXIO, but load_gpu() in
> etnaviv_drv.c then somewhat ignores this, since it keeps looking for more
> GPUs, and fails to notice that *none* showed up:
> /sys/kernel/debug/dri/etnaviv/gpu is empty in my case.
>=20
> Quick questions:
> - Is reading 0 from VIVS_HI_CHIP_IDENTITY (or any other of the ID
>   registers) an invalid ID, so we can use that to detect those disabled
>   NPUs? If not, can any other register used to check this? The whole
>   block seems to be RAZ/WI when the NPU is disabled.
>=20
Yes, 0 is not a valid core ID.

> - Would it be acceptable to change the logic to error out of the
>   driver's init or probe routine when no GPU/NPU has been found, at
>   best with a proper error message? As it stands at the moment, the
>   driver is loaded, but of course nothing is usable, so it keeps
>   confusing users.

Yes, I think it would be fine to not expose the DRM device at all if no
usable GPU core has been found.

However, I think it would still be good if your bootloader would fix up
the DT to avoid probing the driver at all if possible. It may work on
your system but access to a disabled GPU MMIO is not RAZ/WI everywhere.

On i.MX8M* we have a similar situation with disabled peripherals. There
the bootloader can detect which peripherals are active by looking at
the SoC fuses and fixes up the DT status property accordingly. Not sure
if you may have something similar on the Allwinner.

Regards,
Lucas

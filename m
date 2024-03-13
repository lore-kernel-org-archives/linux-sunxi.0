Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8122F5B666
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710352812; cv=none; b=ARCn30chy640o1XeFrx1LVu640CGOFrwTf1TeitGMasvn0rvIq172wH/GQmgtw2ofYUnuQOSoG4bhOAYk7xrbIeS/HptAXRRWwmhzeH4piW8D9GLedlx0IR6dMnMOMpoAmpQQdUHyXvqe5Za16oKQoMtaRl2ORYyZlscHGN3BoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710352812; c=relaxed/simple;
	bh=F42kIbIk/43SiWPpzXA3ztz6/BrGgO6AUNMOlP2miIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BLaA0trB+REUA+UdVrnOeLZoPA0CSJNkQcQZclzkBalK2d+4IphYYh9WMxBOoY/ShdIK5vruKzbl3CxeE3mBiWpuylWPoT6yZCvF2J3AeoNO0eL1Lleb2Z3cgiJ3/V8FZ0iFcz46WZGhc3gHchNrPIKM3/UZPFJdNq0pXdjOajg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoDJG4OX; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoDJG4OX"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513a08f2263so165392e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710352809; x=1710957609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=derrcjnwSJJNCziG4NqwFO9vgc3iqv6k+AF2mT8DS9E=;
        b=MoDJG4OXBC5Kg8Z9aY+dqhXEWmfbgCq/mtZn1Uw5HoTNWGxr+t1X+eknAaHQa/Xm+r
         YLIYAMD7DrJLZEUQttusNt+RkutzCKmuWGGpEFrHsN/uqjaXOAYTOSzHZrge1dLvHhH/
         hERFW6yaz0IPTtGVLYKhrpSc+WK32M5m1zGBrtv1gh6DMIhFVPgl6QOFth50/ejr8E8f
         GLMMpqiCIu+4Jj0EppW4Q/plWp3C5P2RkbctuKWxCIQtVX7/YCLeaNV6Mt8zjcAorJFg
         lHNHiVm5UAGMr7eNZ2Fkg5OujXAbALOVEUMvncImnCpt10JoNviAhZmzQ+kCfVkGKmFz
         cM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710352809; x=1710957609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=derrcjnwSJJNCziG4NqwFO9vgc3iqv6k+AF2mT8DS9E=;
        b=GSq9p5ocBzKdNbn9TzM7VGv3hNty6sNFpiu8kYGncS99fn2AvORj3JV2pUfz6D6D30
         6hlndi/3TGqQwqgju9uXNEciWwBmd3xALdJWbqJaPiJPsTsf1gxU1ayr2DHDbu+J+em1
         iDzsvwOupfK+yt5Czs+41h2kHsMBqdzeFgswIVt81dY1sZhpMevJ6QhSwCBqT3XpnHaV
         PXmJ1gNB2nFWsBqNQKeFv3y55yZskkUr5057JIrCCEPgxPL/a5ofjD3jNpciaZiSpHT8
         U6DXRZhHAgdSCgowDdm2XG5K4N36DE3q0VOaGbwKdiiHZduiSv7F4q3Z1nCZ5M506Bff
         aFUw==
X-Forwarded-Encrypted: i=1; AJvYcCVbTtAK3rzJe64nhbyjBM+p2VnHDURJHCon9kfIkn1ak5DGc9aEI+XkV6b0eXfy0NLv3zEJM6MxHaxRVHVnqTdrSO4wmUwE/7i69ds=
X-Gm-Message-State: AOJu0YytVMGsvcaeSKdGJpZ7KwJrVpTygDuyB9LN+Fh29DY3creWhbml
	+poOM39UqOF17TxS5yw7u4n4OpLYnDpO30NP85azzUYR4mNKcRPG
X-Google-Smtp-Source: AGHT+IFqVBnwTErrJW1JlpTp+YoKswH61zcdqC+BG2gIwV2l620ZcdYjNYXIMOKYg6GGHWZ1uC27mg==
X-Received: by 2002:ac2:4a70:0:b0:513:c9f5:cbf2 with SMTP id q16-20020ac24a70000000b00513c9f5cbf2mr1549904lfp.59.1710352808450;
        Wed, 13 Mar 2024 11:00:08 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id bi15-20020a05600c3d8f00b00413ef6a6930sm287284wmb.17.2024.03.13.11.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 11:00:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: wens@csie.org, samuel@sholland.org, Kamil Kasperski <ressetkk@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] dts: arm64: sunxi: add initial support for t95 tv box
Date: Wed, 13 Mar 2024 19:00:06 +0100
Message-ID: <8344274.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20240313173808.38d893b5@donnerap.manchester.arm.com>
References:
 <20240311174750.6428-1-ressetkk@gmail.com>
 <13468418.uLZWGnKmhe@jernej-laptop>
 <20240313173808.38d893b5@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 13. marec 2024 ob 18:38:08 CET je Andre Przywara napisal(a):
> On Wed, 13 Mar 2024 18:25:14 +0100
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> > Hi Kamil!
> >=20
> > Dne ponedeljek, 11. marec 2024 ob 18:47:47 CET je Kamil Kasperski napis=
al(a):
> > > T95 is a most commonly known for being a box with a pre-installed mal=
ware.
> > > It uses Allwinner H616 and comes with eMMC and DDR3 memory.
> > > This device comes with two versions - one with AXP305 PMIC and anothe=
r with AXP313 PMIC. =20
> >=20
> > I have this board and it always felt like a clone of X96 Mate, which is
> > already supported in kernel, except for broken sd card detection. Would=
 it
> > make sense to unify those two boards and just overwrite or update parts=
 here
> > that are not the same?
>=20
> I think the box you have is an older one, with the AXP305? IIUC, this is
> about a newer revision with the AXP313. There are quite some differences
> between the two PMICs, though it might still make sense to share the DTs,
> see the OrangePi Zero[23].

Right, mine is with AXP305. It has "T95MAX v4.0" printed on PCB.

Kamil, does your board also have "MAX" mentioned somewhere?

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
> > > Kamil Kasperski (3):
> > >   dt-bindings: vendor-prefixes: sunxi: add T95 to vendor-prefixes
> > >   dt-bindings: arm: sunxi: add t95 compatible string to list of known
> > >     boards
> > >   dts: arm64: sunxi: add initial support for T95 AXP313 tv box
> > >=20
> > >  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
> > >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> > >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> > >  .../dts/allwinner/sun50i-h616-t95-axp313.dts  | 138 ++++++++++++++++=
++
> > >  4 files changed, 146 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-t95-axp=
313.dts
> > >=20
> > >  =20
> >=20
> >=20
> >=20
> >=20
> >=20
>=20
>=20





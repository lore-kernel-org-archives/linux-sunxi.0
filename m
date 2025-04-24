Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F891C6FE7
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 18:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519920; cv=none; b=rzkEq+gaJr8mX2i2io9sxlfXWNwzu71+NbwnYVO/qSv4jP/2B+OpXzq1Hoaf00+31jXGI6tdkVOIVnkEbTVEAmKBZA8TC1sMkeZWqBt6CuJKjx3wuH0HG6uEe8nKTIfKjii17WViykQHaWsX1qMXKh0FcHOzCbI+xCmqnGQsqoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519920; c=relaxed/simple;
	bh=VGOgkj7Lm3vCSFlZ6rTuUndDoGWXb7K0a/UzSlh6Gb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hizBYhjqvnZpn7n7e6GEHYgrRjzRup/rUfEPaghtnU6QjVZvZu00DVxT0I1x/IqC+g9vbL7iS09RWyXkYXOCI7bBLEQk0WKz8x1DvCTS5g5zmur/YaDbroGsRrKQm0Vyp7l5n/mrDVLsNfBKszUXxn6crtB1yAYrdB/vUBpWazQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwIWssEQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwIWssEQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so13899505e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 11:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519917; x=1746124717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUW1+wM6wE9E5sI+N8I+dqVg9GKImy6JdTSSO/EwCtg=;
        b=HwIWssEQdd7BuGMQ2n5axh0tlowj4lJi/ikm4U9v55hJKkFTlOOovYMFb8QAyCIRCP
         +WnwxpnbnNGHZxGTwrjiD5HdN0pe6kufyuQDlwbry0AeeAvLE/6iwbHXdLq7OpqKLn6G
         PEZkN58BZVOlC+YCWOi/LtxIhAnQLxYrJlhHYCrtHUV5Uhi3a+3BQpHPf7e5ShFDpanA
         Q2xFgI8/j+zrqZzAyT/O9MW4F/AT/40aQEhcGNcRwW+Ve2xfECoGuHAs3+GMZX05+Jr3
         D9wVfSiFn3ApDSWvF2vObe6O8jYhe2y2apKv1gOlUaLd0KmrUucdicw7IH1esdrzlDJy
         1Nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519917; x=1746124717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUW1+wM6wE9E5sI+N8I+dqVg9GKImy6JdTSSO/EwCtg=;
        b=veo1CWEr/7xiMLRmNBZ/lgPxXDrz/envDHa96uDxTxOenPpdDLHKZ3S0zWu58PciD2
         jBa8zwRkI3KRl46+XRHDohSFOkhZ9sQtJqWqP8DO5EdUCOFOy6Ph7J883FE1Ml1SnYdR
         Sy2MMN6+lFJ3bVyCOHeaMyT8sfFHNT/YJu0u+677Ex02EF8e85VjOi8lhPKAiNgH3iO1
         DeG9P+4y7w+nP8HJOj1FbDh4mN4gFl4XH8Ipz3PmdStpSaBlX+dtHnQbHGsyS8PBpPTO
         2DYW4eLclafs6m+fD2XsigZsvCogh4X4QvbtHSn9/wQf7LBSVyqQkPGksRMYLf6WG/OA
         edWA==
X-Forwarded-Encrypted: i=1; AJvYcCVgePcmpY62k8eEvumwrwuTFAFjDcdMh+iGKzsx/Fa0BXEiDDrynP2/sJo98UkMymvJNEZKZlNQ/2wwbw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3l8ihkV94ZsgOG93XftDKYe8iAUOgGomjp6yCtvaebiYYYgmg
	LTC0qnpU3WuuHOKMNAVI/jg/FgKsuQt/D9gQT+7rYcvSGBgHv0FA
X-Gm-Gg: ASbGncvoBji9YvVUF+YM5eBbVbnPrcfuCwO/AZ8nfhQxy+QWG8DkOTeYvmq+N5xjEyT
	OVPPiWOfywzQ/giFawq+EbaWSBO56UX4ETkBHD7RtFq3KhE4yOCyysOUmAIbOr9ul2hMmDOWZoB
	Vg7NAGPUnU6xlbXgaiQpJMQ/H3I0VhfvQ1++MuWmpZFcsJDHLBbXtF7tmm4FrjYVj2+dnBLbC4X
	9sQMAvWG135/yMEbl3A5DmgDu0DG2T0xgQFAR8FJLVKnS/VkIs03HkhfgLaLerzoHNMNGtls0ib
	YlxaZNrK5ZDzd4n0EF9rDWeIWDaoU/iGK14PdUK4CtBEUs+uR0rJyd5A37GK8A3VC2ELzWIl4bc
	8IIRbDiO8vwYRXOhc
X-Google-Smtp-Source: AGHT+IEpAoErom85lXT+Ms+IZ5Pa5nv4OGyWLcc9eT62MXW2E/nESWqqbOj69cX0qNLPlyMUh70Wzw==
X-Received: by 2002:a05:600c:1e0a:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-440a3112c9cmr7440655e9.15.1745519916942;
        Thu, 24 Apr 2025 11:38:36 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e464eesm35491f8f.68.2025.04.24.11.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:38:36 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Andre Przywara <andre.przywara@arm.com>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, clabbe.montjoie@gmail.com
Subject:
 Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
Date: Thu, 24 Apr 2025 20:38:34 +0200
Message-ID: <4643958.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20250424150037.0f09a867@donnerap.manchester.arm.com>
References:
 <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <4ba3e7b8-e680-40fa-b159-5146a16a9415@lunn.ch>
 <20250424150037.0f09a867@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

cc: Corentin LABBE

Dne =C4=8Detrtek, 24. april 2025 ob 16:00:37 Srednjeevropski poletni =C4=8D=
as je Andre Przywara napisal(a):
> On Thu, 24 Apr 2025 14:57:27 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
>=20
> Hi Andrew,
>=20
> > > > Just to be clear, you tried it with "rgmii-id" and the same <300> a=
nd
> > > > <400> values? =20
> > >=20
> > > Yes, sorry, I wasn't clear: I used rgmii-id, then experimented with t=
hose
> > > values. =20
> >=20
> > O.K, great.
> >=20
> > I do suspect the delays are not actually in pico seconds. But without
> > a data sheet, it is hard to know.
> >=20
> >        if (!of_property_read_u32(node, "allwinner,rx-delay-ps", &val)) {
> >                 if (val % 100) {
> >                         dev_err(dev, "rx-delay must be a multiple of 10=
0\n");
> >                         return -EINVAL;
> >                 }
> >                 val /=3D 100;
> >                 dev_dbg(dev, "set rx-delay to %x\n", val);
> >                 if (val <=3D gmac->variant->rx_delay_max) {
> >                         reg &=3D ~(gmac->variant->rx_delay_max <<
> >                                  SYSCON_ERXDC_SHIFT);
> >                         reg |=3D (val << SYSCON_ERXDC_SHIFT);
> >=20
> > So the code divides by 100 and writes it to a register. But:
> >=20
> > static const struct emac_variant emac_variant_h3 =3D {
> >         .rx_delay_max =3D 31,
> >=20
> >=20
> > static const struct emac_variant emac_variant_r40 =3D {
> >         .rx_delay_max =3D 7,
> > };
> >=20
> > With the change from 7 to 31, did the range get extended by a factor
> > of 4, or did the step go down by a factor of 4, and the / 100 should
> > be / 25? I suppose the git history might have the answer in the commit
> > message, but i'm too lazy to go look.
>=20
> IIRC this picosecond mapping was somewhat made up, to match common DT
> properties. The manual just says:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 12:10  R/W  default: 0x0 ETXDC: Configure EMAC Transmit Clock Delay Chain.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> So the unit is really unknown, but is probably some kind of internal cycl=
e count.
> The change from 7 to 31 is purely because the bitfield grew from 3 to 5
> bits. We don't know if the underlying unit changed on the way.
> Those values are just copied from whatever the board vendor came up with,
> we then multiply them by 100 and put them in the mainline DT. Welcome to
> the world of Allwinner ;-)

IIRC Corentin asked Allwinner about units and their response was in 100 ps.

In my experience, vendor DT has proper delays specified, just 7 instead of
700, for example. What they get wrong, or better said, don't care, is phy
mode. It's always set to rgmii because phy driver most of the time ignores
this value and phy IC just uses mode set using resistors. Proper way here
would be to check schematic and set phy mode according to that. This method
always works, except for one board, which had resistors set wrong and
phy mode configured over phy driver was actually fix for it.

Best regards,
Jernej

>=20
> And git history doesn't help, it's all already in the first commit for th=
is
> driver. I remember some discussions on the mailing list, almost 10 years
> ago, but this requires even more digging ...
>=20
> Cheers,
> Andre
>=20
>=20
>=20
> >=20
> > I briefly tried "rgmii", and I couldn't get a lease, so I quite
> > > confident it's rgmii-id, as you said. The vendor DTs just use "rgmii"=
, but
> > > they might hack the delay up another way (and I cannot be asked to lo=
ok at
> > > that awful code).
> > >=20
> > > Cheers,
> > > Andre =20
>=20
>=20





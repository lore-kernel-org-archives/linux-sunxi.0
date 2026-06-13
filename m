Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005A73ACA59
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781343505; cv=none; b=jd3ADv5yIP1aE6lyEsEou+w6raiZb0RsCjxVSPkgV/f59dAG3ghnDw42a+Pt+XvmyzCb4NIlhWmqH14N8LLNWYujmMKLwl4hQGF8UJfhKZnTB67YULinA3ddvm4jCPLgwvmyCqE7QXScMoFTTo56fY/G4C3QaHqZ3vR2v0hHKe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781343505; c=relaxed/simple;
	bh=1sX3QYXGeCW+Lv5W+F5sZN6MOeOyiU6kXOMbPlP1lIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AHdus8rstcCqhAmo0zw33NE731gfx0+2/vr4oRZ/HZdZd9RcnM35cIGsNbFuRIFWAsvPC/48Hw9PamEE9WRe6mRmhna65HgUlrLfwO/PClijfdZNTLSVKvdGHrEp8TAquq5otCr6lCDDTq9J+YLJWE06ikAp/yXnQk7o3k3Jr/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xmlkq4co; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xmlkq4co"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eee266c6cso1528050f8f.1
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781343500; x=1781948300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSPcHOrJhwoZ6fKHrLRI2q23k/nKTvAXHvk0RF9YXD0=;
        b=Xmlkq4co1Stk0csZ8ERxBxw9G+osSS8PG03ooKqDEKJh83oLR8Q9go+b6jXY/loVet
         P8wLOFncSP35/EFwbyMvv9gmLdMvEbHZPnHLyDWp0m/y+Kj7CBO8moqouZ1Jf3eA2HPr
         O1SUmtposl+ouCoGkmYtcjiK4pmj1MKm0+v+Muj46d5DJGo0JBZymx+90awp1PGisY4s
         MxJT5N7FQC/Iv9WoHzSSgvIlyxcbBU6vC/D0KCGFGI+ZuvRohU3O9kl5XFu35uIS9ggd
         DtQ1r4TMBTDlMa68zKilDtZDA6s5x4a92vJ5DjrLPlP/a4o7mZll2zZdjeXo193NGcMN
         kMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781343500; x=1781948300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hSPcHOrJhwoZ6fKHrLRI2q23k/nKTvAXHvk0RF9YXD0=;
        b=eeulsJpXjMUYdpgcV/vBUMX+AXhKCwyEAqpNZUBsz4dLT+8nrYxY4RdYwCHR5s+FKB
         nvEviLXF96aCln2cd3t49KqFyCVORhhWughxv3lSs560eEVS+oVg7DOLZiuHpkyomOqv
         z4hp7vVzwHbEBf9cE7Z8OQQ87eb02pkZUjfnzb1DPSEFnlSTbm0OK2NuwzCNSI6rEvko
         XIwSOppGdOCSnPNfIJyrzr53/GLjP080ZqcoZYGy/VEw+AVBcEzEwiwit7An4XJkJxaW
         mRmE91++1i1oRDwZntMO+c/kZE40ZooBfWT/MLp304Kyo104qk3KerJxZUECzg55Th5r
         OGNA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZWTB0Yq35tC6LuP2GMACb58qiRo0fuITPWuYJ+F6gFGD2QjE5OKlDbc0Rzi6pCEGPj+/cXiHxn0+7iA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyE+JRUBVzpNXbcAuRzgSwim7U5AHn73n2MHoVPKto4zqRUgI1r
	nAua70xnPpzGMEK2LbiJSNJyGdIKi7baHiQBtmF5jxuzj/s0k0EV2TIB
X-Gm-Gg: Acq92OFDdoLXfkWnO7z2JJrErjsKSNZdtJci9+ITZfFrkrtn8daKRbZETGgLn0aKuLu
	U6R5uSIDd5Zwv9yHX+bcqyEd2y1+EfCzKXgqBy6ZY1dhz4fQtNzsjxqyghUY2Yrg1U0D0tQzAl4
	jA1fpIB2aVUGJEii7WH0kpbb7AKtOY3WIV3z0DNtW0KrX9wRKoLn0l5BSXbEvijhJ/iCp7Ax2J1
	HZlbXxRRB2l352y9u//k2StdL81cgD2X2oO8fIix06sA1WxwhvFahAjzP8tvQK4H4Zd5Sd49aWE
	8jqFP7s1DhkkqWpqx7PyvtqZyP1mZfw7neHF0fxbKa40CemGBLO+x89G8xIwQ6sJU7FDpsSj5sJ
	y+m+2rahkz6twmn8xv5PFl1oKFPGRlQN6f3qj7EThzZJjx4W7Sy7jjerA2ivlrG3xCg+P8itM3K
	JXNa1EEExoy6o+21L/oS9wme37XwimhfBT4FTTWkKIgMpu
X-Received: by 2002:a05:6000:2684:b0:45e:f228:830d with SMTP id ffacd0b85a97d-46077d40be6mr3398045f8f.23.1781343500099;
        Sat, 13 Jun 2026 02:38:20 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2e592csm14464581f8f.36.2026.06.13.02.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 02:38:19 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 6/7] arm64: dts: allwinner: a100: reserve RAM for ATF
Date: Sat, 13 Jun 2026 11:38:17 +0200
Message-ID: <FE7Vh4yfTmGMM24i18Wwwg@gmail.com>
In-Reply-To: <b428d57ba5464f1226daf099877f4c25fa4fc191.camel@gmail.com>
References:
 <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <_6NEZ78hR8a_3V2bhBAGoQ@gmail.com>
 <b428d57ba5464f1226daf099877f4c25fa4fc191.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. junij 2026 ob 10:34:42 Srednjeevropski poletni =C4=8Das je =
Alexander Sverdlin napisal(a):
> Hi Jernej,
>=20
> On Sat, 2026-06-13 at 10:22 +0200, Jernej =C5=A0krabec wrote:
> > Dne petek, 5. junij 2026 ob 09:09:20 Srednjeevropski poletni =C4=8Das j=
e Alexander Sverdlin napisal(a):
> > > Add reserved-memory node carving out Trusted Firmware-A region spanni=
ng
> > > fixed 256K from physical address 0x40000000. Even though Allwinner ATF
> > > itself passes the address range in the fdt to U-Boot, U-Boot currently
> > > only reserves this memory internally, but doesn't carve out the region
> > > in the fdt passed to Linux.
> > >=20
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> >=20
> > NAK. It is job of boot procedure to properly inject TF-A reserved node.
> > Any issue should be fixed there.
>=20
>=20
> like in commit 0d17c865118881609ea7e381c7cadbb7979cc596
> ("arm64: dts: allwinner: Add Allwinner H616 .dtsi file")
>     Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> ? ;-)

I was against that too.

It's time to be fixed in bootloader.

Best regards,
Jernej

>=20
> > Best regards,
> > Jernej Skrabec
> >=20
> > > ---
> > > Changelog:
> > > v4:
> > > - new patch
> > >=20
> > >   arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/ar=
m64/boot/dts/allwinner/sun50i-a100.dtsi
> > > index 7cb06b19b5a5..d8391663fd1d 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > > @@ -87,6 +87,22 @@ osc32k: osc32k-clk {
> > >   		#clock-cells =3D <0>;
> > >   	};
> > >  =20
> > > +	reserved-memory {
> > > +		#address-cells =3D <2>;
> > > +		#size-cells =3D <2>;
> > > +		ranges;
> > > +
> > > +		/*
> > > +		 * 256 KiB reserved for Trusted Firmware-A (BL31).
> > > +		 * This is added by BL31 itself, but some bootloaders fail
> > > +		 * to propagate this into the DTB handed to kernels.
> > > +		 */
> > > +		secmon@40000000 {
> > > +			reg =3D <0x0 0x40000000 0x0 0x40000>;
> > > +			no-map;
> > > +		};
> > > +	};
> > > +
> > >   	timer {
> > >   		compatible =3D "arm,armv8-timer";
> > >   		interrupts =3D <GIC_PPI 13
>=20
>=20





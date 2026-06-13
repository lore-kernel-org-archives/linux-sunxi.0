Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BC4375F82
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 08:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781339686; cv=none; b=VnGVT0PwE46JqEjQl1avWMXaFK0arec+f+S/825Y74B4S/xoF0EJGiNJCpfX1RcRyB42SmHoNJr0NCuLm8/ZDOWCSXIDml72nfNSYNeh9NTHoRxpBYhPqn1AKy0lqRYFmxgs2egAtKtE6K3tRsXhT9c0dbGiN4WIcRjtU4vLZoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781339686; c=relaxed/simple;
	bh=mbzvuH7IfNDrZaVdLFw9eoGGYP0QvKcW4I7S/aIG17k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OBKceRgwEHFvpeEx6Vr3hdLORRh5lqH59YIRy1ZpmXa6nkNNg9RnGbMNj8uhz1cujppGLEGRaKNIl6Ojb9MgTOX2LkvnTDxjD+MFCPG5AH94DMWvdgL346Em4F5GbLkzjw2KXztyZ5//MIkVyoBUooy9Xj6ye8Ann8CbtxMhRFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwNfQ+LJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwNfQ+LJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so17609985e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 01:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781339683; x=1781944483; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QHs9yK5AtFf0IN6y8bIIPCYpjsJCXaUVqV8EKE6IMM0=;
        b=GwNfQ+LJ2fYqSNcDdLH4CeckdZLe061wIHNugQic5ut9HbUsTCDrXGpg1+7TvQvW91
         4LMRQurn14296Q9+KWDLAnT+r9KGupCVJWNZmGYt8FfCBmbxva/ZVOlfocskwIgQUaEP
         mZ+1tdIUZYQz0ao4yP9VAcgcV1RZfMsw5I2pmwCtC0CXksaWXd/QbEpm87LGXgHicl/g
         2goN1Ns5zw0pmzGrw8CthFFJryAH80yXHkTcUlW32eFSmmQNh/K4qClmxP1nyAbqONUQ
         D/jX8GgYSDDUZIXgw/MPG2oxMxZNNo5xz9589X0FHTkwZ4kEFcCcW0rb0pdfloShfgnk
         3RVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781339683; x=1781944483;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHs9yK5AtFf0IN6y8bIIPCYpjsJCXaUVqV8EKE6IMM0=;
        b=GmF+1FdYDkv/HYn9MiRU3tsEIqkaeOzwe8IL+AR2jeL2RzMh5InVRmop9kklkfB9oY
         kbHJfuB/ecQ6KMufZYuxkBfIPCMrJe50giZ66A4kzbPtma6bWnrg4cLFdCtpg/+EfidE
         c1sf536SiSUHVH8hUTpLYLPVgv+bdjw2gVBtACts0zs1+UG7/pmjgdw/q/ZXx86n0WhE
         jmTFrwLW2GkPkVjOswwz8nCC2rvWQRXq3s7PqfAilrmW30nmnMGea2uaD9YUpR5vBTos
         QJR489NViAkMzt7OaN/ZoYaRY1M4R85z8mGRCOkXxcGfBZlyp7KMcuZ8aPBJT7Lstzsl
         FScA==
X-Forwarded-Encrypted: i=1; AFNElJ+XVElOiBVK3XxiXXvLjhl2BcMGrfI34JSEqn+i+MjspkYpKvvBG92/8B73bYn04TZGO8bID8gVvUs3HA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiSWtN/lZCMi3LsDFCeBfZoOnz/dKYft5gSNmDBWyvT7PvGyj8
	bY1qxpjxqy34pkmenVcAYQpbcO0HYb3D81RbQBdf5WaVlV9bsAObVe+K
X-Gm-Gg: Acq92OHCCf3K5jNoIvG46JreSA0zRqwFbFSj1cALq+dg/EGks0GPNsivKGehTU8WbRO
	TINnfhkFhyyHRIyOOs42oQPhM3hEgEccR9cE5L5RfdepY6zZe/A/beCrcm79w1WcigeeXG0vut2
	7njCwzAbNq3XZk2b1mPXOu9DDAuiz4NvHCXy43FAJ1JMtmt4G5LgENfumH09Y6dOgqCHgSbustT
	CTLVFOaiqhfeknVuf721x9cEqRjZ34pDTnx1rUo7N1DHqCJ7DTIF0tG8vjSPgLe7r0GQgZD0ZIt
	uC1Uv8FP5M5LUjVkl71I2GuFBmKbOOQwVKa/jbHqizrn/9iS/cU2UwCQuzZH9oGPuoxfkighIiK
	fwlvXB0k2/6Co4krf4r5bTfKKebgYtA4GXh9acA5om2FJSQx21jvfxyqoWKev7ldGgyHFkCF0iK
	p7n7cLW4GYk8jR8QuVia5Lv+Fq/3FOy6bcLaDYU65eMgVuVhE/94AttFGcVC0vmdSNXSjCAVj3Y
	MUtw/dxhUZAdOdEWA==
X-Received: by 2002:a05:600d:8494:10b0:490:c7dd:de3e with SMTP id 5b1f17b1804b1-490ec521187mr55836955e9.31.1781339683115;
        Sat, 13 Jun 2026 01:34:43 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203d05d1sm72320885e9.12.2026.06.13.01.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:34:42 -0700 (PDT)
Message-ID: <b428d57ba5464f1226daf099877f4c25fa4fc191.camel@gmail.com>
Subject: Re: [PATCH v4 6/7] arm64: dts: allwinner: a100: reserve RAM for ATF
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Samuel
 Holland <samuel@sholland.org>,  Hans de Goede <hansg@kernel.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Andre Przywara	
 <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid	
 <lukas.schmid@netcube.li>, "J." =?ISO-8859-1?Q?Neusch=E4fer?=
 <j.ne@posteo.net>,  Eric Biggers <ebiggers@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Luca Weiss <luca@lucaweiss.eu>,  Sven Peter
 <sven@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
Date: Sat, 13 Jun 2026 10:34:42 +0200
In-Reply-To: <_6NEZ78hR8a_3V2bhBAGoQ@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
	 <20260605070923.3045073-7-alexander.sverdlin@gmail.com>
	 <_6NEZ78hR8a_3V2bhBAGoQ@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Jernej,

On Sat, 2026-06-13 at 10:22 +0200, Jernej =C5=A0krabec wrote:
> Dne petek, 5. junij 2026 ob 09:09:20 Srednjeevropski poletni =C4=8Das je =
Alexander Sverdlin napisal(a):
> > Add reserved-memory node carving out Trusted Firmware-A region spanning
> > fixed 256K from physical address 0x40000000. Even though Allwinner ATF
> > itself passes the address range in the fdt to U-Boot, U-Boot currently
> > only reserves this memory internally, but doesn't carve out the region
> > in the fdt passed to Linux.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>=20
> NAK. It is job of boot procedure to properly inject TF-A reserved node.
> Any issue should be fixed there.


like in commit 0d17c865118881609ea7e381c7cadbb7979cc596
("arm64: dts: allwinner: Add Allwinner H616 .dtsi file")
    Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

? ;-)

> Best regards,
> Jernej Skrabec
>=20
> > ---
> > Changelog:
> > v4:
> > - new patch
> >=20
> > =C2=A0 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 16 ++++++++++++=
++++
> > =C2=A0 1 file changed, 16 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun50i-a100.dtsi
> > index 7cb06b19b5a5..d8391663fd1d 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > @@ -87,6 +87,22 @@ osc32k: osc32k-clk {
> > =C2=A0=C2=A0		#clock-cells =3D <0>;
> > =C2=A0=C2=A0	};
> > =C2=A0=20
> > +	reserved-memory {
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <2>;
> > +		ranges;
> > +
> > +		/*
> > +		 * 256 KiB reserved for Trusted Firmware-A (BL31).
> > +		 * This is added by BL31 itself, but some bootloaders fail
> > +		 * to propagate this into the DTB handed to kernels.
> > +		 */
> > +		secmon@40000000 {
> > +			reg =3D <0x0 0x40000000 0x0 0x40000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > =C2=A0=C2=A0	timer {
> > =C2=A0=C2=A0		compatible =3D "arm,armv8-timer";
> > =C2=A0=C2=A0		interrupts =3D <GIC_PPI 13

--=20
Alexander Sverdlin.

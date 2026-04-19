Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D842EB856
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Apr 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776595139; cv=none; b=Cw3LMq/zCAnAeTMxpqOmlM35elp7op2nNrXkM1GWVAxshKG8Y/8m/8/EDrGfC/DRC5BkLkmHPfidjuJA6bO563WJoV7N4NtMg3+PJC07F0WBWTv/nPV1DN2b3C2ueAwMhdNTFZVfFK4h/LG9kLQjtWVzUydX6KyZhZrQAY2jKJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776595139; c=relaxed/simple;
	bh=YF+RdPrpjlfkCj61O6WOCKrSenzgxhuMzg6jRTpJ84Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pVXxJdDZX1Jp7zbkT1ToSd5WAEYWL4xpfubvhXtVsys14LBpbWhDdwTWbXZCVLNYbQ9DD1scIYRHV/OdXV/+20MogldFI5EzADoamO2sxG2CPJKENJM+IZFO94qfAbBt1laNB0jvbgRT9xXiPbQQGcCIAtasvALcDYcrvD8Qao0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZk+QKqv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZk+QKqv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so1601032f8f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Apr 2026 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776595137; x=1777199937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSNMSL2yf7R55Mkk0U6fT14ULpUWkywT0FjbSBd+zG4=;
        b=KZk+QKqv2J0VpczPxKQJWrsO9my8nSUezzLXyXfQTDI7qvew93A1oYEeOZRWtFiEo1
         0OlPIt1t+aC6ntbw9BchUvgLhlbV8LER3o5JiFXX4cFRhGRATfpsff89LqgxAqcIAF9O
         UNojz1uWtXZlxUfOvApuBehqU1Dc3qR4T/v/JuM+jp0/tvLDc3ZEEaOkW+J0fzNagBgu
         fE8Poh4ziXZ1GtvWdonOhCjHj7+uMCgGhrwi4GNGBCwmDFz7aJOlAWCG0LtwK/uKho5g
         Ub9GQ1pkuT4+/SDYXn9F9vZAcuMSW9ppSm82MAXDMFUYVDMVnV92vjVO+CrcAI2g12VM
         20UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776595137; x=1777199937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aSNMSL2yf7R55Mkk0U6fT14ULpUWkywT0FjbSBd+zG4=;
        b=Nx1G+buTJrRPtQNFBwDJycNUItvMCWn4XmZ0QBdtQL3n5jzuQbseziuuiqcfzTkth0
         MmKKAODGIcjVCUs97rfuWzwjaKnZFota4P5ZaFafwtUnn+DzFsVpj7ktU3C1QSdC5KUX
         q2+LsjHKKGlagpLYirRYXmgVCJWoMn9odfBeh/oGojv09P+g3DS8ieRgliuNVFEunTvp
         nmTPZ5t76oA9wixfhb/UNbKapSB7/myy7u8VSCZZgGx9jzFy//9gCdQi7cwZgHMqaFPK
         ZcAZNUgr2zFu5W6sO6Wq/60M5R2+R+3ltDONni1Di1ZW0aMFjSHcl9KgOj3PaRYfJJlP
         m8kg==
X-Forwarded-Encrypted: i=1; AFNElJ80uzfuMMSb8iuWuJxplKGS3Ym5t0K+AIvf8pyq8tcBp3yATwuVK2nIlyj7pO6d8svSb1qEFHyum0Ehvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKZnQecsFUb/A+gDyqw2q31VbRhEDLav5z5xhCgnjcKcOJMTtH
	wPl7hjYQqsO9lh9GhEL7MMcgnV0HuaGkTL90RHvUoTUtGmCsso2+55M9
X-Gm-Gg: AeBDietzLIb774AeInjG8AVKCioXN3JBGB/Zm2b1DpEgEqL/85PBY2ETUjaZT3u1g54
	Cy0F6ZTcQYpsIyhK3h8yhlIDoI7yBUWPrRAERNI7a1lWEvCk1CdPTiThEglMXUx5r3jiLxdZlge
	FrCKzxxCdRFWdq94pIdAKL9qO/tw4ohN+Ddc/eOeFMUUTR/rESZYLKOhs2vtBwYDaz8fQcaAM00
	XCyRqCgTNPKoXKnyNAGJG666gPDGnYCctz3nMaHF9VoY4/S2GddJCjH4nHVlSAGviynZg0+5vNW
	p8F06Iv9a7Oo3qyWmK24scRONwG1bvVtkM3BPY6YaewePLcACNZ1ZSrNllhxOnXi8/TEuVGtK90
	N0vWrLjo6blxpjvo1Wv+p5k9Cb7u0jwjmwkJK8L58qTJ4zxvH8f3fJShwpypa4mn+LZDhlQd9xW
	gAvk9QUdxC+ybyLKPi2PXsTcIDUrTNtFeF9HSmcGnEhchBXMVddhJImeA=
X-Received: by 2002:a5d:5849:0:b0:43e:a8ad:975e with SMTP id ffacd0b85a97d-43fe3dfbedbmr14792261f8f.27.1776595136543;
        Sun, 19 Apr 2026 03:38:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46898sm20259211f8f.27.2026.04.19.03.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 03:38:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm: dts: allwinner: t113s mangopi: enable watchdog for reboot
Date: Sun, 19 Apr 2026 12:38:53 +0200
Message-ID: <ar7Vj6maR5aXgp7KQK7v1A@gmail.com>
In-Reply-To: <20260418135519.16e41490@ryzen.lan>
References:
 <20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl>
 <2825865.mvXUDI8C0e@jernej-laptop> <20260418135519.16e41490@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 18. april 2026 ob 13:55:19 Srednjeevropski poletni =C4=8Das je =
Andre Przywara napisal(a):
> On Fri, 17 Apr 2026 20:19:20 +0200
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> > Hi,
> >=20
> > Dne nedelja, 12. april 2026 ob 19:42:10 Srednjeevropski poletni =C4=8Da=
s je Michal Piekos napisal(a):
> > > Reboot hangs on MangoPi MQ-R T113s because no restart handler is
> > > available.
> > >=20
> > > Enable the SoC watchdog whose driver registers a restart handler.
> > >=20
> > > Tested on MangoPi MQ-R T113s.
> > >=20
> > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > ---
> > >  arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts | 4 ++=
++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t11=
3.dts b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > > index 8b3a75383816..f0232a5e903b 100644
> > > --- a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > > +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > > @@ -33,3 +33,7 @@ rtl8189ftv: wifi@1 {
> > >  		interrupt-names =3D "host-wake";
> > >  	};
> > >  };
> > > +
> > > +&wdt {
> > > +	status =3D "okay";
> > > +}; =20
> >=20
> > Move this to sun8i-t113s.dtsi. All t113 boards have the same issue.
> > Watchdog should be always enabled on ARM.
>=20
> We actually have that line in U-Boot:
> https://github.com/u-boot/u-boot/blob/master/arch/arm/dts/sunxi-u-boot.dt=
si#L22-L27
>=20
> IIRC, the idea was that it is *firmware* that chooses the watchdog, so
> the generic DT should not be the place to set this.

Why would firmware need to select watchdog? We only had issue on H6
with it, so I kind of get it for that, but in general, all ARM based SoCs
have it enabled by default which is IMO how it should be.

Best regards,
Jernej

>=20
> If people use $fdtcontroladdr as the DT source, everything falls in
> place neatly, no need for changes or runtime patching.
>=20
> Cheers,
> Andre
>=20





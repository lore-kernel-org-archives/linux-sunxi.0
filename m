Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30E7262D0B
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115890; cv=none; b=Ea2X3Fnv0aL8G80OAUY+x4UPm295C819yP55ENk39Vvs3Kq9+MrrKYBZIbwW8M01k2o5tFc2jtIXR3mlqSDNfKi44Kra5htMiTn2oTFA3d+uGXAanrrM6MKrSrkh76bQ5E8guBW6JIjYhbhvs48MlhPQvRB0NhojeNYGMuTC/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115890; c=relaxed/simple;
	bh=q7N6f0O1fL7CnMh9vlnmxZC9H0Mq5P8xsNIyAlAW370=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eByuVZhTXkxRXR/qBuI5jkh+wgBQxX6Yb9br33b+kLezYXyxKaYYI6Lsk8IkazLGr5947wu9SYXkIOBkLBaa4rSHVUuv2U4jmO3331c6QXstNMQ8LAitfv2auwluDeLlh7Be2qN14BE70npCGirxefdgZ3CQxwLVmdlW1jYrxq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hObv4Dai; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hObv4Dai"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b150559bso18719165e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779115887; x=1779720687; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q7N6f0O1fL7CnMh9vlnmxZC9H0Mq5P8xsNIyAlAW370=;
        b=hObv4Daitl9FE8Zl189fJJ7O1MHdMXptYV+zL8izvB+dumm1edWoA8JzacXUCCJ6fA
         Pw2N9lhB4ef0iCqPVIMVD89no0Xku55ERoBMmKtvTLqiebSGPPXA1xlfndUypmdFn004
         JUKUSnMZsofV+WynfYwObMBec9SAG48GOfRH7NH1Dk0WDVIcNXre1xJdodSSUNAdaKqo
         65WBqwNj6crcVZfN59Ngz5GSNkHlUveSIc1G0if3xDGwZYTDjLxNlFsYlojWgX/XS0oy
         2ArrhHDQmHYyW7FbnNp1UkS+M2b2jGyo9duow9A1TjCJcUZQ10viHVu9KQbeB6SaV2cH
         eIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779115887; x=1779720687;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7N6f0O1fL7CnMh9vlnmxZC9H0Mq5P8xsNIyAlAW370=;
        b=ZQHhpNr7a1LdidZQ8R+FccDTovAIyE3I1rztUpVfS6XJ1UWR+Bq8Vljv2NUKiSFzjS
         sYSaO7ZZZscA3VFmV/udCRkzt3hMqZzYLzdAt7lQPjBqw6U3kDUXhVzx9Q53kOqLjpEC
         jmqgIiS0X5qaFuqwze37oKqtuUxfX3LReJ74TjPQA8KReuSjy3R2bGMcESyRiANiRcR7
         BZvM5BCIx9K+7mw00uEOx8+n5K62IO9Q8Z3VrUOvUi5aSZRK75v86lKuGr5KJFfaCDuT
         jY05U+IRjJsen42pDTuKFZ5VZ2Gu8JaahYFgZaKxn52HDpeg07ubeC9t8tYVzeIeyvLR
         j85w==
X-Gm-Message-State: AOJu0YwKss32aVp2ms0utxKyVKnvY4LwBlBxt7OVtIC9LXaOug6v4iyI
	Qqre3XAW9DqaApJAOuS/X69UeopnU8dvecDK/h3ztjty3YCCtSMVWw3b
X-Gm-Gg: Acq92OEkJU9wjy0qhcJKhz9KwwEh2zyO48J588GqyUUg0+qE64w5+1ok9/A9f0NelFd
	XqXeFgOuTRPj9ai2J2AHjS2wAjQvcCqhqMrrbUHa3TRZKntSiCn0DaT8R+xTvifAouP7ajcl7LK
	0OE8QogWAjYK6Fskx16mR1PMhPG44VqRecnR3UHJ/BdL0BsCpjGoIBkKj5XPGHA+u+15vxHp7FG
	AEObuCni2Odcel+2U8pkU7L5gqH2Oa8B/1ihHqH9xlACsPa0KSgNocGPGeLKHsP2FdvWYCVVLQA
	0F4PafhvdCNcrF8jrliBK9jS3s8goVs926FGUSy8ia1FJfAVyIt/8Zrbo9dl3oVSgOb5c4FbadD
	3TwiIt7jqVdxkmUlr3ZZzPqzgRALivIwDU7RZhOY9CP89Ef8qJyxQc4tlmVT02ORwf7LDdJt/K4
	06nQhaiYEkHcOFFW4VU780wVOA0mzVnG2r9efFlNEmpUZS21RzmqVKKjGKhoAlu1pUILaLnLhEZ
	A0=
X-Received: by 2002:a05:600c:698d:b0:48f:e230:2a1c with SMTP id 5b1f17b1804b1-48fe6631158mr246804535e9.31.1779115887039;
        Mon, 18 May 2026 07:51:27 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2a878sm131021135e9.1.2026.05.18.07.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:51:26 -0700 (PDT)
Message-ID: <22731dae5ed48680bd456a3a5fe5e7086d17a54c.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: wens@kernel.org, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej
 Skrabec	 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 16:51:25 +0200
In-Reply-To: <CAGb2v65jpG-XXNjT46H2KnLoM_SHOatFw82u38ZGEELgXmvDtQ@mail.gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
	 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
	 <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
	 <CAGb2v65jpG-XXNjT46H2KnLoM_SHOatFw82u38ZGEELgXmvDtQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Chen-Yu,

On Mon, 2026-05-18 at 22:47 +0800, Chen-Yu Tsai wrote:
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > > > > @@ -0,0 +1,162 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +/*
> > > > > + * Copyright (c) 2025 Arm Ltd.
> > > >=20
> > > > Please put your own copyright here, even if that has been largely c=
opied
> > > > from an existing file.
> > > >=20
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +
> > > > > +#include "sun50i-a100.dtsi"
> > > > > +#include "sun50i-a100-cpu-opp.dtsi"
> > > > > +
> > > > > +/{
> > > > > +=C2=A0=C2=A0 compatible =3D "baijie,helper-a133-core",
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "allwinner,sun50i-a100";
> > > > > +
> > > > > +=C2=A0=C2=A0 aliases {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ser=
ial1 =3D &uart1;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* BT module */
> > > >=20
> > > > Do we really need an alias for the BT UART? And is the BT module
> > > > supported already? Then please add a child node to the UART node.
> > >=20
> > > That's the only thing I can do currently regarding BT: stabilize the
> > > serial enumeration, because UART1 cannot be used for anything else
> > > except BT module, because this is soldered inside "core" module.
> > > We can avoid different tty enumeration, should the support for
> > > BT be implemented in the future...
> > >=20
> > > > Isn't the WiFi/BT module on the SoM? Then please mention and enable=
 MMC1
> > > > here. Provide the child node for the WiFi chip, even if there is no
> > > > upstream support in the kernel for it yet.
> > >=20
> > > So both the above BT and the WiFi is AW869A/AIC8800 combo chip, which
> > > has neither upstream driver, nor [upstream] DT bindings. Even github
> > > driver for AIC8800 doesn't seem to use DT, therefore it looks quite
> > > pointless to me at this point to specify anything in the DT for the
> > > chip which doesn't have the bindings idea even theoretically.
> > >=20
> > > Nothing in the current DT shall block any future work on the AW869A
> > > support though and the above "aliases" entry shall even guarantee
> > > unchanged serial enumeration shall such support arise.
> >=20
> > Fair enough for not providing DT nodes for those unsupported chips, but
> > why do we need to force enumeration? For the eventual Bluetooth usage,
> > the driver will find the respective serial interface by just looking at
> > its parent interface. IIUC there is nothing referring to ttyS1
> > explicitly. So we wouldn't really need an alias, would we?
> > I see that some boards do define an alias, but others with Bluetooth
> > don't, which I think is the right thing to do. Which name the kernel
> > comes up with for UART1 shouldn't matter in any way.
>=20
> It does provide a hint for any users enabling more UARTs and adding
> aliases for them that they should number them starting from 2? And
> just stable numbering overall.

that's exactly what I had in mind, as the the status of BT/WiFi might
change in future, we might want to make UART1=3Dtty1 and UART2=3Dtty2
today and this will not change with potentially coming AW869A support.

But that's not an essential feature to me, just nice to have.

--=20
Alexander Sverdlin.

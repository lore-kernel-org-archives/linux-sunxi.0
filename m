Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CD4372
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jan 2025 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737391327; cv=none; b=MDxTGEQu/YWr8LXLSdEjTB1kIsMOdD6XbGofFfQR0CIbI0J+IQb3JmNe2OjCUGqC3THzp8oIgmSWZFbNoy76uqHS2V2IKT5hq5L/L9lulQBINiBT2L0HfcNS6VJlk5vA4h90f8Ln1YaAQAJK3hVplQAyjav9Xw9pXL00/Bc9I2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737391327; c=relaxed/simple;
	bh=WPv7C77rzQOWHpPISfer8dJh7UTBkOIbHFDTHSBy6Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rffamYtNxcZuxpRIo0fYOj7jnGKEPvFnvRwIvg2qvxN7kcR5uPzxDXJQoQ61xNTLmhgBxjT21O3gkKZL+xHO5XFPd+b+NuVK7uAc+LbQNIrPPKhT7ji7droXGDJBPWgqjWixTovajl2kQDLjQGasongct4PTO7rKIF1Cbk3gdgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTMjmtGI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTMjmtGI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso32498685e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jan 2025 08:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737391324; x=1737996124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVPp2o15ya5nLXWtzz/e9q/lKwTJqeEhK0+mxLZJB4c=;
        b=fTMjmtGIVdDfbG/vuh7JjztGyJ4q6srxd5Cqu/jfwCyH0pEmOmQgTck/5Ysm4cT+ro
         7t7nW70DsijqZMdBiqzOLgQwZvSczfxhqRPg5FSyKr0lcifx9/gjufLXo842r8ouOg8M
         IYCPDo2ocnkCXcqLhmDSTJ5vvHDK2XszCy2e9vFdruG0+LwvTB+AGsmfYt1pUlb+tIOM
         Ze5FMZKWdKsVh3zLs9fUsKWqHiBrI6++h+fJAnC3jOJdk7dZaYhLmQO6RKmKS07bCXto
         R6kQQw31f7T6my/2gvFu4WUCZuoViS6Cioi4PY71Q/xp1DTm4o6yFZ1l1UyltRK8LqED
         EQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737391324; x=1737996124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVPp2o15ya5nLXWtzz/e9q/lKwTJqeEhK0+mxLZJB4c=;
        b=w9JQFCtouuBmUWe8l6RyZy12uVy37QjFMqwRByAtpccVOIhaZlvPFRvXXaDEpPHWRk
         ohvuEf2dxlrbs5CHXnajBqUzmBaehjBVW4S2uFBfFnW3Lz+HihWG5ue5+tM51vV4qUov
         yP1bFMudkbAaCzUIoQxzN9shPvNLxyKphZ/dXTJK0dp8Na8U0uvYFPpzHjqf1WpA0NUy
         iWdO9iEsQxXCY2nGhRSeJhN9GvJT4400MoqzS4MqJKAwe8S4FAmT5F84ISUjdbTw615q
         NXHRayGNPfLc8JYLtLpV7bO2lIg1N4styxNkT8n9RwB8YqiGaPIoh51AI4O6wBmz7HjA
         ojkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrrfmsO3IU/q4pm7URXS3xECEIUSP56SG4QyhBwqX8XnVbhWoOe7cI+DcLOaL/reFQs7tAayakDVOCLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwklKXvjBXHJn4/JQmytTPjIprD3sEngJuARIV4G+Uq1CkmITBq
	PniRcieukPQ3s2xamvRZpnD4yx9vF5n7yXQ1ZKDYJ2CyGNVnocX2sx1UGg==
X-Gm-Gg: ASbGncs/wgZHA3pXdeJORbjwdLewAWS1X85uqRR+s+ffM5EjBcLdBcInxwbyx1MZCJi
	YuzcJbH9e7eMZEqZsJTsyslsSEMbPImMj1lve/bD8I/tjPm2b1btZuwXquRmAzh0BOHP2F6Jaqj
	6UYJnG5Afj2CzW4qO4Q0eswynAd3ODBjf9JmNEgt+pQUcgqD2i3tyDf04hoEpnDSexYExua6rlv
	GqkKCDDCW2nytcy3DQ+KXYjMnCHYmqPJWGrPIm1SFAhj9uSVajfH9H/fHz8qjxJPnNlw9LXZvio
	BMa0J6EySooywcLIw/cNGr59EeOzbQP/8uOAPCWUndbPeA==
X-Google-Smtp-Source: AGHT+IFHP7otWNbgEg2It8KWJWZdnxatAWrDP5T4lXoq8OUr9c2R8TiIBVFTqLbF8tjClAYFN3XleQ==
X-Received: by 2002:a05:600c:4e89:b0:434:f739:7ce3 with SMTP id 5b1f17b1804b1-438913cb518mr126509645e9.8.1737391323563;
        Mon, 20 Jan 2025 08:42:03 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890412f7csm144213735e9.9.2025.01.20.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 08:42:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Tom Rini <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 Simon Glass <sjg@chromium.org>, linux-sunxi@lists.linux.dev,
 Parthiban <parthiban@linumiz.com>
Subject: Re: [PATCH 2/8] sunxi: pmic_bus: support alternative I2C address
Date: Mon, 20 Jan 2025 17:42:02 +0100
Message-ID: <4622391.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20250119222530.1fd97018@minigeek.lan>
References:
 <20250117014537.22513-1-andre.przywara@arm.com>
 <2352334.ElGaqSPkdT@jernej-laptop> <20250119222530.1fd97018@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 19. januar 2025 ob 23:25:30 Srednjeevropski standardni =C4=8Da=
s je Andre Przywara napisal(a):
> On Sat, 18 Jan 2025 08:21:31 +0100
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> Hi Jernej,
>=20
> many thanks for the review and your opinion.
>=20
> > Dne petek, 17. januar 2025 ob 02:45:31 Srednjeevropski standardni =C4=
=8Das je Andre Przywara napisal(a):
> > > Some of the X-Power AXP PMICs can be ordered with an alternative I2C
> > > address, for instance an AXP717 could be shipped with address 0x34 or
> > > with address 0x35.
> > > The datasheets for the AXP717 and AXP803 list two possible addresses,
> > > and they are always consecutive. For DM (DT) based drivers this is no
> > > problem, but the Allwinner SPL code relies on a hardcoded address.
> > >=20
> > > Add a Kconfig variable that will add "1" to the existing address if it
> > > is set.
> > > This enables to use the AXP717 as used on boards with the new Allwinn=
er
> > > A523 chip.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
> >=20
> > This works until some board vendor start mixing one or another address
> > PMIC. Note that BSP boot0 does address autodetection, so it's not entir=
ely
> > out of the question. Anyway, let's hope we don't see anything like that.
>=20
> I looked at the datasheets for all supported PMICs, and they either
> state one or two supported addresses, in the latter case both
> consecutive. Autodetection sounds nice, but also unnecessary: we surely
> know what address it is for a certain board? And with those A523 boards
> having two PMICs, autodetection might become sketchy, as we don't know
> for sure which PMIC we got?

Speaking for T527 BSP boot0 - they check version register to make sure that
correct PMIC is installed.

>=20
> But that got me thinking: what about putting the I2C address in Kconfig
> directly, with defaults depending on the PMIC type?
>=20
> config AXP_I2C_ADDR
> 	hex "AXP PMIC I2C address"
> 	depends on ARCH_SUNXI && !SUNXI_NO_PMIC
> 	default 0x36 if AXP305_POWER
> 	....
>=20
> That's should work seamlessly for all supported PMICs, and we just need
> one line for the Avaota, same as with this patch here.
>=20
> What do you think?

Yeah, looks more universal and avoids code changes in pmic_bus.c when
adding support for new AXP PMIC, which is very nice indeed.

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
>=20
>=20
> >=20
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >=20
> > Best regards,
> > Jernej
> >=20
> >=20
> >=20
>=20
>=20





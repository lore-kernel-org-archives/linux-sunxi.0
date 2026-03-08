Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB99D30ACE6
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Mar 2026 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772958186; cv=none; b=Xjpfnc8NqVTpLvFstu/yGukulXfO0Y/2Ri6B5IRtpp2pyLjMJW8nbkGFAtqCYyauGtsz/CyoMLr/HDSylPYhFJYAYPuNNSzg9EIX0EGJsvfTqAmDtiFHGbIEDmN/aGGmDrhiR6xEawQLKn2J4CngyB/YPwbOZ8eLrc3o5jEm9vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772958186; c=relaxed/simple;
	bh=hvDoSy3zhLMt2PSWtXgqb4w044bqYBFn3QDnwo7J0wA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=leH8jwWOlauBF2tDm5Lm4aTE8YRezv0gp5NpgHbQQ45SrOKOQOWtFgvAohwOJLidjsUKePfCqsFKyoxWPaSi5XPzyTxxiswvc8pVwKjKDk8AtFIf46FtLNvvLORbR/FLcKONCQ1Y/xTAyUVLU3xtAIJiz2KtJnjKtdfbW2y8sWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFqJdU4s; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFqJdU4s"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439bcec8613so5132336f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Mar 2026 00:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772958183; x=1773562983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8aMocQM9u6X2gsio5xSbmOAH1sSfPIdUgMQJD6cnQY=;
        b=bFqJdU4ssk38penX3j/QWVV/H2QUvDBP+8PY614JONTPADaBprqSQDMeVPtA9EMbmK
         qxHO9TDyiyVsQHvd/9YmYdioxhI3e5ueod6TJViQpsQCHmR58YEYDYg4hVYUa9ClgqI6
         hUJLC5A7ueAfpVOQatjTnTn7RJ8ZHHncTZEatuPAM1JNM5VlfEXd04jfbk5qxMo2NkXi
         WnWLdCjSgL3hfTCAaxH2kX3STUWGPD2wZfN93gUpQZIrWY4ZDDp4s8ptv+NhVEjvjAXm
         SE0Z/vhKYPT2WVV+RPHtIxatndJS/6X44LEmtgFNx5yrIFZZ5zoWN+j0jkDyuUMxMAw2
         cTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772958183; x=1773562983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z8aMocQM9u6X2gsio5xSbmOAH1sSfPIdUgMQJD6cnQY=;
        b=nRRNVZEvhk4UBqCnj0Y9lUSdWfLEATNovAF6pVpUuxm96t4F0E6aOFppu+FRaWPzuB
         wEWfhqPbhakDjWYoxcZAucyajwLfONyj50qxaQllcCQKXDrD5gbsLia7raeHb85PnKvr
         LV4oixRa+oGaA/sCJOCiz3CvNy7GfQjItoPqEaA9nDUEhIF0xS89BFUhSFk2u7cYQjBE
         rOJBkzIjkPyg6ubajccs/HtXD3gdfXkMONVsvDff/vuWi/zeOiI20loqZMXk7IsAfk0B
         nTOwLJzAJiJix4jy5nqLF2tKxENcl1VHZK+t11KPNGBd6f1Yf2eY3/2kDLtVnYa+7NHN
         GrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2EgkzoRQVSg3Aa2UFOVEw0+mo/7kDBJmVQkc+nIbBLbsUr7X48flcz9+tBEw//euuikJgYoeTpnDV5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVz4H1dmFTkwornZwPxp8XSbCNfiOxmtLrxCbOZnECSeNTrYMu
	x1tdgCY4PxKeeQJ2l2kqVRUfrV/cAKhN34K4HRsn5M2NxL3unyWNvrt9
X-Gm-Gg: ATEYQzy0v9zjgesLz6//GysIw4MEyxNqOdks2nThZzmzqxw31zI3Q1C2BkVBPoLhtCx
	N/rK/vkOHfpVHjI4DTam5EvmKsZrdQCZm58VIEDJMpX0kucJdLr0+4D2MYyONF8iAKoaQc6hPj5
	DC9Fr9wSrXm2z1XCIx9z06VjExHDZx3WJ1cfxaVedfsJLEANGRwqGWR92w9KODPB5fpEEhwiTJZ
	hwPAXA6AjBzK5kdcRsmsho3kKqNx/cj2ED2r7i0CdE2Xb2WHXC7e+GvjRQlvBmI4iaXnRbTipbm
	iaOdoezRxVkmqclNTCwYq7Nt8k0XZKVOHzdoUsU/gJ4NSlakouRbRK9geCOaj4RFPSfT7yODRfc
	IR3/sMQuw93TZpKZZkjSby9U+flwfnTpyBLvro7VEO4oGUT8j0dqXi4BqEkD3DcwSeW7S6bm6l8
	g7nvUFFGMKvqA1vzE4032OdNe79DxFMciIIbi3JTBVECpBU2bO7OckBCNmVeixqRWiq2+inxZoO
	bU/hg==
X-Received: by 2002:a05:6000:609:b0:439:cb10:dfcd with SMTP id ffacd0b85a97d-439da67982fmr12882158f8f.39.1772958182927;
        Sun, 08 Mar 2026 00:23:02 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net. [86.58.12.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bdf8sm16891038f8f.25.2026.03.08.00.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 00:23:02 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Subject:
 Re: [PATCH 0/2] arm64: dts: allwinner: fix Orange Pi Zero 3 PMIC interrupt
 routing
Date: Sun, 08 Mar 2026 09:23:01 +0100
Message-ID: <3404622.44csPzL39Z@jernej-laptop>
In-Reply-To: <20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl>
References: <20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Michal,

Dne nedelja, 8. marec 2026 ob 06:16:50 Srednjeevropski standardni =C4=8Das =
je Michal Piekos napisal(a):
> This fixes a kernel hang during boot on the Orange Pi Zero 3 caused by
> incorrect interrupt routing for the AXP313A PMIC.
>=20
> The PMIC interrupt on is connected to PL bank GPIO handled by the R_PIO
> controller. However current dts routes the interrupts to PIO controller.
> This causes the kernel to select wrong pinctrl instance when configuring
> the interrupt which leads to invalid register access and a kernel hang
> during boot.

Where did you get that info? Publicly available schematic clearly shows
PMIC interrupt pin being connected to PC9. Additionally, R_PIO controller
on H616 is very basic and has only pins PL0 and PL1, which are used for
PMIC communication already. Neither of those pins is interrupt capable.

>=20
> The problem existed previously but became visible after the commit
> 01e10d0272b9 (pinctrl: sunxi: Implement gpiochip::get_direction()),
> which causes gpiolib to call the gpiochip::get_direction() callback
> during interrupt setup.

I think proposed solution just bypasses the problem, not actually fixes
it. Can you share kernel crash report?

Sidenote: Tested-by: tag doesn't have any value if you're also the author
of the patch. It's already implied that you tested your solution/improvemen=
ts.

Best regards,
Jernej

>=20
> Patch 1 declares R_PIO node as interrupt controller so it can be used as
> interrupt parrent.
>=20
> Patch 2 fixes the board device tree by routing the interrupt to R_PIO
>=20
> ---
> Michal Piekos (2):
>       arm64: dts: allwinner: h616: declare r_pio as interrupt controller
>       arm64: dts: allwinner: orangepi-zero3: fix axp313 interrupt parrent
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi               | 2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> ---
> base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
> change-id: 20260308-rc2-boot-hang-269e8546635b
>=20
> Best regards,
>=20





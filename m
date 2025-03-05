Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18271DE3AD
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Mar 2025 18:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741200544; cv=none; b=lNplvzCl4LqVNfm4qfGFVtHzywRrxAXUkJwFByGVgacOj3W9j5raUMpjgFLr6VOexTgC1thLhBLD5W5PnJVBslNx/ibO/PX4T0lon0V+nzUdn6nL1KqCtsjMmtWKZN094HYFhrNLVAxJUk4KW0SlsuM33QafuakWOGm7ATCuHL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741200544; c=relaxed/simple;
	bh=ymUZ1FCwcuUyrRhWxt4QnybrFkaPnszRqBqt/ownpms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7eQHVM6EtQDGX0DZhKwiG20KsCe5n70ewvyr/swx+zBTAHlFfklrO0+QNB8Ag/dZyLuiWg9v8PICeeDSqUom9lR44+wbWGbAA2lKTzaAzFoJKwUmX6im+VG3HL8c1saHM5pWFxxbBcWzPKZQQqjLOtABOZ+xadV1ad3JyIpauA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJr7IqnL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJr7IqnL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso49214375e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Mar 2025 10:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741200541; x=1741805341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xJE/R5/BnCgol81UrY/cLHMX89sZpiDt1jINbKrX0o=;
        b=AJr7IqnLHWUsyMPXkQ40iMfHpRQYKf2oujcmmVNPBQd3q6dpl2uiVkNKO5YntECcLT
         yfuvsiV14iF1hVDqzE4jqLww3/FlspXQ6R/8EGtPdqjZ51LxVPdQ07mazVdiS5/sPlhg
         sRWDy7ewpy6rLNhL84nHU6f+c+Ctl97uOuvBdkvCBcHOSKKWHW3YSqsu1+SJzg23ll0o
         a/V1DzKixyKGXmTUSOXrDHddIxf7QhjlwVWPPmDa3AGWUPWB1qb+mpm3jU0NaUUL/POH
         t1/bS3u8T+rhmJV3Y4vfVTVSomNwvl6okP9RPKEAEaU2naYq6fhOBL5laVWfiPhFfNfL
         UuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741200541; x=1741805341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xJE/R5/BnCgol81UrY/cLHMX89sZpiDt1jINbKrX0o=;
        b=uPTkWZg88s2CkBKgixwMhvvar6iHGLspQ+dHrhhYZxu1TVLqw1ErznqAHDPy+OJlO3
         yRCg8vtlUHWs/VogkODO0CdpF1sck82kL9JChLEBgZtvnK5Xf8pmvLM0i2FsdQ/gTaO3
         PYavvFOZGl9bFW1SHpU26e2Rv8dglbx9Xw6CtbSWofj+qXdBGOABwMC8ss3vTwpQoX+Y
         DaxrqlNRstsqDoPvl0P0yji2W6QXoo6K5OiIsXlkzoCcvdLiP/+8693xvqWda5ByqpDn
         Lit1w7yC9H5oDYN4EgNkZVPd8o/mjMjHgpKla5hOY33bA1t7e466Pqi+mrtnSO1a8CxF
         CXkw==
X-Forwarded-Encrypted: i=1; AJvYcCXp6D1M0veUkch7+VrfRtPuiJeXf7PasE+tnrhQ6rfpFxvxTxV54UlBcFBkzMWT9trUwK8Nz+DMFFBbqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxwjA1eYOWnGaS0ie/1u2GAd1T50UoM+57D0nmRwojxxEm1AsL
	QB3e0rqDGvodAg98Ou4Iuqun6jaSsQZjpQB9G/I9Jd6LuNmYVk4g
X-Gm-Gg: ASbGnctnA6LX0vRcZ5YxziQnEfdiAeVw31tMhRQLXi2RBBZFrwxe49nyHkRSwg+BO1r
	cY1uaVTCBl15uribm6mdSbAaAT2N7MY24zeWLzWap5WHnsd9cbFDJ9FPOqVAeF6vsUS7ZNbrtd6
	Iq0mwqqCrJ3/nXYSk2vyRuXmWMPb6Qwyf8GUm0bfLFpDkb1NFkX2I5hSep6Q0ssTukPvO7XF0PE
	nY9MGeDkXfq0xZSfgF97a7vLw/HukzVCbeOqf5Qm/EEZY+FEphI2v1F+Do/0GijrktTzW2HBVJy
	jwEzcRTSaIkDe+jP3hq9ULmfY2KqfAl1tgsvxh/YDRoZUYX/ZMx1mBrDEc4BrS6p2zUC9V4iY+w
	elPbPVV4xCHIg6nVisEXr
X-Google-Smtp-Source: AGHT+IHQsfFe9LIIU1ujnavCZmAwL0R31Bsaw0Zh+cWaDPDDqIrdoQswxVtXfq3deH8/EgbbGU59Qg==
X-Received: by 2002:a05:600c:6b10:b0:43b:d531:ca94 with SMTP id 5b1f17b1804b1-43bd531cc69mr25654365e9.3.1741200540856;
        Wed, 05 Mar 2025 10:49:00 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391253b3e23sm1928230f8f.76.2025.03.05.10.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:49:00 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 11/15] arm64: dts: allwinner: a523: add Avaota-A1 router
 support
Date: Wed, 05 Mar 2025 19:48:59 +0100
Message-ID: <2224762.Mh6RI2rZIc@jernej-laptop>
In-Reply-To: <20250304222309.29385-12-andre.przywara@arm.com>
References:
 <20250304222309.29385-1-andre.przywara@arm.com>
 <20250304222309.29385-12-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 4. marec 2025 ob 23:23:05 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The Avaota A1 router board is an Open Source hardware board, designed
> by YuzukiHD. Pine64 produces some boards and sells them. It uses the
> Allwinner A527 or T527 SoC, and comes with the following features:
>   - Eight ARM Cortex-A55 cores, Mali-G57 MC1 GPU
>   - 1GiB/2GiB/4GiB LPDDR4 DRAM
>   - AXP717 + AXP323 PMIC
>   - Raspberry-Pi-2 compatible GPIO header
>   - 1 USB 2.0 type A host port, 1 USB 3.0 type A host post
>   - 1 USB 2.0 type C port (OTG + serial debug)
>   - MicroSD slot
>   - eMMC between 16 and 128 GiB
>   - on-board 16MiB bootable SPI NOR flash
>   - two 1Gbps Ethernet ports (via RTL8211F PHYs)
>   - HDMI port
>   - DP port
>   - camera and LCD connectors
>   - 3.5mm headphone jack
>   - (yet) unsupported WiFi/BT chip
>   - 1.3" LC display, connected via SPI
>   - 12 V barrel plug for power supply
>=20
> Add the devicetree file describing the currently supported features.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



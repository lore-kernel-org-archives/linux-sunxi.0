Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9F839FD9
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 07:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737184897; cv=none; b=MLAkdSBP70L5GhpzFwTFZYm7IU0PLJ6Ot2Aud3kuraL2js1OCKQR2W8Xqw7tFjiDxXj4IXANT7G67K/dV5z8KyKiaXeo94ZIucslXFQXLildo5PwONxjZjTWEBQQN3LEyWBw/x6ah/hRNNQvuCoIVLhWi8Y62EimjyEwSNAUuCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737184897; c=relaxed/simple;
	bh=dOw3EjHeVdvVyFFnaXBnLqOVXi3XKNlO2cpC4OVs1PA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KZRzlvpks8exgtxxs9J+TNBkZIYbVW1z13drbJugOuM/J8iVvYIOK/n6xrVnxRvE53yClraERcyV8Rp55CVte5dtxlgD0YHFK0O4/dqpJ1T/O9bjWdhIeX6p9Kb9JCONSA7qEGgZOEl9Ku+vbF6JnXBnKDdVSR/EXdy7xhHjE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwMG1zmZ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwMG1zmZ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa679ad4265so766092166b.0
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jan 2025 23:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737184894; x=1737789694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOw3EjHeVdvVyFFnaXBnLqOVXi3XKNlO2cpC4OVs1PA=;
        b=dwMG1zmZZYnDYYnjMKQqa6SQ4/ojLece4DrG14USe4C3rGhwJMgOnwmk6Z4XPW1hv7
         hgL0BdDl75GgzeuNKgaFcH6SwuewRZpcj/RXzn0YErM9lCHiPQ1CB6WurE0fBrMPtyo1
         LZy52vm6Di0klCZysGaB9qzKkHqiUKeQH46pujsO1c9tPFiM/2dy1ixyQ8UhMU7HnheD
         UD1lGVkxPFo2349Q+s8GIJbEVsVkY9QxLXw4hrmKDis+9RQsEOhFTUMl2OPd7jCH/RfD
         bEr0W9Zwoh1wnJJLi9zcW8HVA0IpDNOjFwHNOnSbSwpqM98FEjv61uE4klAiTc/kgeRp
         WW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737184894; x=1737789694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOw3EjHeVdvVyFFnaXBnLqOVXi3XKNlO2cpC4OVs1PA=;
        b=xShFLH1NTEh1ay1c8CYBLvSHe3nTUDUhk9i3VDOOHGbcPU2pfNF3EJxSPVrCNv61pe
         OHENltdVdhxHWZ0nVwXl7mZeK05/OPN0EeI6/Ck/SeIsYcbqQMWirwsZZhkHqMimNMBq
         BFbpAgoRb/vfnJtznXI8gpl2OkzymvSXAsi3h4vYOnaQGJ6rMFjw+LQFByJMLCBAoZ4t
         YxzYtAwlPfnKXlHdRapCHeBwi2Y8KlVmYkzrcYZQI/SHl/EgR/TvyCNubjMYaEL6GpX5
         kebeDDGxxX7DQwSTOAySEGAsOhNsRFqHWVonoUbbPluCkA3ZwL/y51PDXpcpLJXjiycQ
         eKbw==
X-Forwarded-Encrypted: i=1; AJvYcCUSAekAhhOBmtt2mBGqQ0hX8Tq9opGkO4AapLUVNzcFgDzL5rLs+gVLlJNn5YTjY1nUTu8o8OK6OJoELg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf16Z1iiYRWOYl96tZytIsxoQSm35LMAK28+NvG5qro/m9hfk4
	I5w51K5jYQLi322GjIAUsO0tu1/v0hgSv95rP9ZF7B5nvROM9k41
X-Gm-Gg: ASbGncssbxw2NBz6yVWd0pDGFo0OgPYHwe8QsZTEZFxpXEdKc6ABNYxp+oK5+5K+zmM
	OWI2NL3j4bwsftETqP5DsaPVIIpGdLc8qJfSU0YxosSHPY0zdldydY5skdytrrxStGlt0EntjTV
	5B/KyNDs6JyRhkA+0tQ59uQYVMGLoA02aMJ++lla2fiCrkVsNS/8uJv0y9gKEF8/97Uaa95e0XW
	3oBwMybBJIi6y19wUS6HoRVqGxc934O2s6gPYwd+VLnaGeLAbGSOQsjKLzNEu8i1IUkEl1X61CS
	HeB/fl6Y9rN7QQ4=
X-Google-Smtp-Source: AGHT+IFynQ2xDKfottgy4xeDwMKTu2nTX2pX5SOhP0DN69x7BrJDXGQPVgXPPBrMQNjY+9meDBPjvw==
X-Received: by 2002:a17:907:743:b0:aa6:75f4:20df with SMTP id a640c23a62f3a-ab36e241bc1mr804825266b.9.1737184893407;
        Fri, 17 Jan 2025 23:21:33 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab3848b2047sm289390066b.0.2025.01.17.23.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 23:21:32 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 Simon Glass <sjg@chromium.org>, linux-sunxi@lists.linux.dev,
 Parthiban <parthiban@linumiz.com>
Subject: Re: [PATCH 2/8] sunxi: pmic_bus: support alternative I2C address
Date: Sat, 18 Jan 2025 08:21:31 +0100
Message-ID: <2352334.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20250117014537.22513-3-andre.przywara@arm.com>
References:
 <20250117014537.22513-1-andre.przywara@arm.com>
 <20250117014537.22513-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 17. januar 2025 ob 02:45:31 Srednjeevropski standardni =C4=8Das =
je Andre Przywara napisal(a):
> Some of the X-Power AXP PMICs can be ordered with an alternative I2C
> address, for instance an AXP717 could be shipped with address 0x34 or
> with address 0x35.
> The datasheets for the AXP717 and AXP803 list two possible addresses,
> and they are always consecutive. For DM (DT) based drivers this is no
> problem, but the Allwinner SPL code relies on a hardcoded address.
>=20
> Add a Kconfig variable that will add "1" to the existing address if it
> is set.
> This enables to use the AXP717 as used on boards with the new Allwinner
> A523 chip.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

This works until some board vendor start mixing one or another address
PMIC. Note that BSP boot0 does address autodetection, so it's not entirely
out of the question. Anyway, let's hope we don't see anything like that.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



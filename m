Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CD67602D
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 06:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741502289; cv=none; b=UDcIW5vmL82lqyFKDlLcRGoikMgPRnQQVLUGys+80cc8rchZpHdSf4IS0RxViDX48ll0aXJmJU0x/e3D42lPQHGDdBIhUW+FePaOoQfhxbJCEvKsDxT4R2klHFWuuztB5QTn60RuUT5CH8Nau9dhocc30+VVvRM6kpAbiiNQEcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741502289; c=relaxed/simple;
	bh=Fz6Jf36xcTh8dqFosjtzLD6W+gVvPK4QQTcyeflwbf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mp42AnEY3npcm4v1z3AAv2hZZJKISNl+Yx8Nrt94HzzdhBdS57423LJTx+J1F6VnfOK2vxcE9JPdEXpmeFSDVj52rC1AziOlpvw/NaLuFFSBWr7sTZIaKltvfWta/x00i5Xj14mYIJ+WrLHU7YifAIgzAlKmggMuKUinN8J2YTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W50s+6QW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W50s+6QW"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abbb12bea54so595570066b.0
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 22:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741502286; x=1742107086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz6Jf36xcTh8dqFosjtzLD6W+gVvPK4QQTcyeflwbf0=;
        b=W50s+6QWzhX34Hu1+bJauTZ68/599vJ+N/sTDB16Ny8sfyNucReNqm5T1ddielS02z
         RuUggPj5QgifRIyd2DMtzCmYKtnsfmIruPemdYWzoEBbo12xmXrp7eUt1T1hSlEtLNLu
         dQyf8r/QTeqT85LHbFY4aRtxegwfvDm6BRtYLMMlXDmC5reqDbyykrGi9OjFPuVOKuN7
         NYExVwTxYTMfdhU1QXlVC4J/UTS8OsxgP0XnNcvAtJj0LF/1r9qeABseRKXEwtM6q8i8
         IX9vZNGeL647XniEblC6VCmMb7QYCaoDKcII9ezftjZqsVwUdG4nAwv3/fO4p/vJZxCU
         8O/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741502286; x=1742107086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fz6Jf36xcTh8dqFosjtzLD6W+gVvPK4QQTcyeflwbf0=;
        b=gpqWgHnAl54JY6An93z0+ma6clPu3h3z9TfLBRAFVuOC7gTHhj3izaq7czggbCb5/7
         LevJkI4bby5awSD/jef6MhP8FpP0d3fTJj5TapFzwETyXKurD3gmbhb5O8p5p726gcEx
         TZP3kWwJjMLz/ccGWZdhYVfCdfOKlo6Zf43sqxITxQ6VMLWYi1ZkLtajHU6hc/bLZPGl
         VAeFOP7oZhF4AvgEfWnKtCPKu/z6IrHRUbOd1dyVSXzR+6tdNYgbPBA+NXyTuJAEzI8k
         5XtQrkV+fJJFRnk88mwnTX6A3PVv1dpoPCUB+qf0HnX2NcNF6a4PfK+Njyo9+WRe6hpk
         Xciw==
X-Forwarded-Encrypted: i=1; AJvYcCWg+XXKHK94SUviALIgEINiNkZ1IAYZfBEsk/LKoQvQH8EEc+X6mG8KxhDz2Zg/qsXAObN73/aSrRxWRA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3CNn6tRCn9ecTsgdmgsePhV1XyV3cymuzbWo7b30tlI4vhVqz
	2LDfL8EXrPjVU5YXDEx+KNwwfhHOYeAObgzX4gfBOa6GlhxEj1RK
X-Gm-Gg: ASbGncvdhZB7sdlOcruj6UjaBSC2UjCH3cO2e9shaCS8iIM00bpl12VlOMabSuEFBHg
	HLKx+WxETD0h3zd/ki1EGSfimthZy6RuFKs72E8irmgF1w4pIl8rcT0vH5eTlIc2Ynm9rzzp8bj
	zixzYqEK1AmvdbUvQq3GfztGFbFnXNYwYRERsX3LqiQ81NtDFpL6okKhdmbA+0xfoKDE6/4qvPh
	S54D59UUWn/7T/Rzj6wRyyPAT+nS921pxs4gNN9yLGILYd+Z2rvg6PSk+NsGqXKz1f6jmEH0JG7
	ZA/D/axevEeYLTFct5MK8XrDtEITWP5AxhxuZIfIqnIa8pU5T31IYXHPcrCUuB5qNg==
X-Google-Smtp-Source: AGHT+IHhG0nyJSWhRdWZlqSDCjjx4E4luGYWfPo00aAv/HBDZfhIYjAS5k26NpukDfuKeycSfkBWmw==
X-Received: by 2002:a17:907:97c6:b0:abf:4c82:22b1 with SMTP id a640c23a62f3a-ac252738126mr1024070266b.32.1741502285623;
        Sat, 08 Mar 2025 22:38:05 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943945asm538979266b.22.2025.03.08.22.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:38:05 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 02/14] clk: sunxi-ng: mp: provide wrappers for setting feature
 flags
Date: Sun, 09 Mar 2025 07:38:04 +0100
Message-ID: <5865232.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250307002628.10684-3-andre.przywara@arm.com>
References:
 <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 7. marec 2025 ob 01:26:16 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> So far our sunxi clock instantiation macros set the required clock
> features depending on the clock type, but the new "dual divider MP
> clock" requires us to pass that piece of information in by the user.
>=20
> Add new wrapper macros that allow to specify a "features" field, to
> allow marking those dual-divider clocks accordingly. Also add two
> convenience macros that deal with the most common cases.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



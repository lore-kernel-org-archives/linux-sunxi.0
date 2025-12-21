Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE98D2417E0
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 15:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766332260; cv=none; b=NpbdUnYfq0ND/uViiJFfbKQJ+xtDwKDIn7b5hoAgF7e023BZ45HSAXyifgQKpAeKUGVZDTUk58zjqF+ZSRmyaCDHCio1IkoSUs8Hxtc9Rx+XLNP1+A0ogEpQY2WdLM+SXNRvjdY+/BKfE4hy9Yb9QAewEdcAN7KNj69NXlsm2yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766332260; c=relaxed/simple;
	bh=8fCSODvcBdp2PEhtURkA7UUjirAp4XG9bUc5v/PYx98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MfvY9suJD9dApTA5IrztwHmLkg0KvrDfn1eesJRY23HCnr47ceGpoWQ4Q/tq6OgfsRTzmu5UVeqUVbNWVvN5pPeMkteb3/fwRpiWY0/5l/1jCO7QkJtUpbtmuDOFOrkUHWA341hUjXmHkjHXOGN8jDafYxbyOtsSEIvM+Vo2o/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoV2+7bZ; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoV2+7bZ"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so21273235e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 07:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766332256; x=1766937056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fCSODvcBdp2PEhtURkA7UUjirAp4XG9bUc5v/PYx98=;
        b=LoV2+7bZBqazrspa2wXuatQWhfvWOBtPEK3gju4vuf6GmNKv/yr7Hkt5TM59GJ0ZD6
         zkibpGLlwtc24D4xxRKSVpUm9KBchsnSnv6zFsZONRzv10dEbtAT+ay2661ZFKA014sT
         Iz6GTleaUcx91tqxDKbUvbKCMJ4c+aD8sILgksmn0Et+naTYDB/9SYV5f4gZXWzhtHKG
         7iSuFw9VdWpNFdYAJwrto9tClS3km7WPuKqoif37qhlZzRknGpS47Z6LQykrN6wwa1fN
         g1zxQTv/T32qwHDI6mydV5kYcvn0xnk7AfcsSUfInP0wayRPEtkrjXicJZC+IHspnff3
         oqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766332256; x=1766937056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8fCSODvcBdp2PEhtURkA7UUjirAp4XG9bUc5v/PYx98=;
        b=ZIh+NPJUnuoSMdOyFwGsjcpz5WAa6+5X0J8RLToXpj+d2PqM2nX1xnmVHHyawPu2d1
         yqNhXPvvEZNX3B3NVySnpR3cDpPMA6hiDq0NRgM7GkFPnjKOGRGUVOvjve4ANeTHhbUw
         KA0TBoAQoFccF6xpuW2ljKtt7fv3TL1fYQywdc2JrDL1N55mYCtMkQv+DsdUnUi+ifeV
         jRe/7phiSQFNb/BPQv36cWJmFx7sUAWY3o1MJIMpjFw5X+bQbBOX5NHPySRPlqjpCBPD
         ugiz/SVjBrc7MgdVltWvYWgVPwjCfXFAv6SNygwXw7qc3beW/DCAPtqLSHl/x5CRU9Wi
         Epfg==
X-Forwarded-Encrypted: i=1; AJvYcCUy/iWtUpO1PzmRHuQc1pRsyUy2VxrDezyj7gRtUCy4BhNqLY+W6F0cQ/ixnJ/ZQoH49noP0UvpEq0ZUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpteXkFPaq3RvM2ivbH39s/82JB5W9ACvhUIBAn4HxMQ7JBM/o
	0MjRUXANs9ccAyuH5LW9kYowwi5TU5ExfzgSjECBvvgkI51wAgWTrGoaZ41xBvZw
X-Gm-Gg: AY/fxX4JgH/BfaKwMak+35d/E0ZISIcB4PZjq86/+H2zKRhuJEEkWg0Ic+Z/1j8fHn5
	Ae0dIjydSl3Lfqu4pvvGdl4KWysqtoYs4ZyITNwOjAaPyAUJW9iiWMESEG1HVGlZ+g00+CTqzpq
	2RjgyFaxoYNJNdbysjH/pziX902FeT1Rz6Ed7/gMCEqWsc8Bg7i8lffJhhUUaVgGXEQZ7t4qhfn
	+hrQtj2jIF89sTlOoExl/UX7xjxx6U4q9O3Ehc7FstW/uyCMDsgs3ytD7CCh+djltNXi6t4Eer3
	mu7P63/F7W6eWYGh4al4NU5x9dJLCJ4ZMgSaYwoTN747uCOjBzCeIkvlALKPlGQpXLG3zJvGHcU
	NyPwSYsdttM/odQtJ3RkIV9LMIWCGNCoO3MLZWcZNW/BpwDCuPXkda0EdyvgaUyOcYdYb9d5TPa
	alqYWCcCn4NI5Ob6t2swDGQyTTdm+hKNN3tA4da8k67F5LyJaNcm6YMzVVB8sROXZzRguJ6OpwP
	F/K9Q==
X-Google-Smtp-Source: AGHT+IEbzuiMyIUOvROlypd6C5VqTcqsXBg5CYHBj3GvTOlnnKn2/wIG/gIMrEnzDQVWqbyemA9QRg==
X-Received: by 2002:a05:600c:5251:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-47d195a425bmr82073325e9.34.1766332256115;
        Sun, 21 Dec 2025 07:50:56 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a40c5dsm79185175e9.6.2025.12.21.07.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:50:55 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] spi: sun6i: Support A523's SPI controllers
Date: Sun, 21 Dec 2025 16:50:54 +0100
Message-ID: <2391651.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20251221110513.1850535-3-wens@kernel.org>
References:
 <20251221110513.1850535-1-wens@kernel.org>
 <20251221110513.1850535-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 21. december 2025 ob 12:05:09 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> The A523 has four SPI controllers. One of them supports MIPI DBI mode
> in addition to standard SPI.
>=20
> Compared to older generations, this newer controller now has a combined
> counter for the RX FIFO ad buffer levels. In older generations, the
> RX buffer level was a separate bitfield in the FIFO status register.
>=20
> In practice this difference is negligible. The buffer is mostly
> invisible to the implementation. If programmed I/O transfers are limited
> to the FIFO size, then the contents of the buffer seem to always be
> flushed over to the FIFO. For DMA, the DRQ trigger levels are only tied
> to the FIFO levels. In all other aspects, the controller is the same as
> the one in the R329.
>=20
> Support the standard SPI mode controllers using the settings for R329.
> DBI is left out as there currently is no infrastructure for enabling a
> DBI host controller, as was the case for the R329.
>=20
> Also fold the entry for the R329 to make the style consistent.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



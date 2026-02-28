Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C593FB058
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Feb 2026 19:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772305927; cv=none; b=I54xXbXXn5UpENZk847m2ljSumypRufStn6HLurAzPst0uahTPxulxpJFW0qJ13HyA/mpNZl8ZjOGduQMrXOii8oaoMhXElsU3K+a4P7Qm79dIfLOq6tfs2jnKINX4h6jX7nAh8lv3oKkPTlPIhLi8TNn+eu86ht1W6/nuoVZI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772305927; c=relaxed/simple;
	bh=uCBZJM2fAnD/3wRO5BCr9InnsCPcuxyUKxMyds7Z81A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VFebfxrWbHVgpf9O/+JYxqQm6T/5JUoUCEQAoDGuo87qTKIfliMxW64MEGjGFhXrNuHHIcmYqPGS5FPUFRQzgJP0fjm0BRy/7PO1sAZZbK1v4ErZ8xRXXakPVKb8qIbzbsUDn8q/1CbezUw1sKMbpcAiVuy25nEclV0RlDcxCxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQ4Id/FO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQ4Id/FO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso21030505e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 28 Feb 2026 11:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772305924; x=1772910724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCBZJM2fAnD/3wRO5BCr9InnsCPcuxyUKxMyds7Z81A=;
        b=fQ4Id/FOeUJukbuveSs61SdYK5f3qEnB3/4Pql2y6tdZ071x/zWZ5f+JbZs6vNEH4w
         nymLKvjzqwc/V0zwLbpQUMB+jmwxZrQwoUDmoUcjsXGzTa2LJr6nkr6EP/x7bRkXXpH1
         9PWk/XxGEF/jLgYHC8X7jPYyPWiyqP4BWA5mm5MQV/itjeSesEoC4M/b9q3BoL5oxVIY
         MKfy2HM6vsJqc0gIEMQ4IBPiXItKGkGfKLgEAPiDWyb8leNgcdhVy0T1bbXdIVn0a1Zl
         Ko0su3GmQ1PaweF1akLrANLGu5Pq1h//9v6WxGF4k2syfO9GyxRRqOjwbFRQzSrOvmMJ
         xNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772305924; x=1772910724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uCBZJM2fAnD/3wRO5BCr9InnsCPcuxyUKxMyds7Z81A=;
        b=KlWpHg/XH066eFemSYTmm11Lvhb//ja0SE49xzUQN7eshwp1NdpN4cWBBH0p5T4SIo
         VWC6YLG4RSZY2HBTfB/ul+z3HreOO8dhbuUO81v29H0Sy7zuhJRJSlpfv/fwefigGhCd
         VkmgvJe8EmdBmRmahw2K0H0GkqG7T3zeqYm9fUBt89gbNbWXbtMJOJcO/wQx4HF+I0bj
         pLElTuVhv8nvs+h+Cph7MQDbYECueSJSNtB8ardTi5NsGe+nGhzsKER86CcULUUcvxI1
         7gGs4MnSXLzOgtDQohVw/RK0qnMPBU5IfZfBJePkm6VyHac4BsQEGnRXn3TqXNt456Ld
         tzXg==
X-Gm-Message-State: AOJu0YxnPcTbWyl4V3yqYSM/MpW6mKYxzzYvKuSsDbb1xPWeiPDI5fhE
	IX2xY97UiW83EbyA9Z8VtosdNjSA04zWjnEgVyfr5hoITB9+Jma7ALQP
X-Gm-Gg: ATEYQzz1d9YfZkLW39COTB/xU94CeihPO0UcsFnrzy/Iv9mQJqmS5N8rbMDc7d45fTS
	l+UdDoEXCyiUAdOE3o7dpJdAjYAIbKTh7hl5ePxlZRuJHl/ySg9KsIoCWv0PVNf/TIxGetYFYO7
	N+8VAdgUBSx1V9J121DXQ2hs4wE3AUkYAIErnJIQVdrDRDWNfnL34QkVl72//yikGs2bOA1X3mj
	fGNG4C9x2yHqw/l40Pu//wKXfcS4Rary8ykvTUl6w38qbe0f+spTQrvp21PIN/sVIgV3QA+26HH
	XRDIvx6OvofjmOlqLFmREOGkSBgQ+G22h6DUIlMfHe6cIt41iEfaI99xblYucif0CijaKqwjeeE
	sPSNsGinyUfYZalUnTxqbxGy1Lg7epxIvC9pXBOeX0MOFtODlSiKDWELCqERsaSCnB9/jMNLSKk
	6Q+ApCTON4MxNycC/6ETSypIcY1PlcEn7ysKm61UQ8ZaEG
X-Received: by 2002:a05:600c:4e15:b0:483:29f4:26b3 with SMTP id 5b1f17b1804b1-483c9906a11mr129611565e9.1.1772305924223;
        Sat, 28 Feb 2026 11:12:04 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb85c58sm89513845e9.9.2026.02.28.11.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 11:12:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/3] arm64: dts: allwinner: sun55i-a523: Add pinmux for spi0 on PJ
 pins
Date: Sat, 28 Feb 2026 20:12:01 +0100
Message-ID: <5968992.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260227175157.2339758-3-wens@kernel.org>
References:
 <20260227175157.2339758-1-wens@kernel.org>
 <20260227175157.2339758-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 27. februar 2026 ob 18:51:54 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> The Avaota A1 board uses spi0 on the PJ pins to connect a SPI NAND
> chip.
>=20
> Add the full set of pins. Even though this board doesn't use CS1, other
> boards may do so in the future.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



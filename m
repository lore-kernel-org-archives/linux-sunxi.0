Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93622CCC0
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741502623; cv=none; b=f5QpxEuhs5w5ABv1GBEJQnAa0M0JfXojtENFdyDUf44xMLR2mq3UPuUc/grKPYjARf29jCZQ1+xHDmOGKZs8FctwDzu47VzwhJAj5j0GO5WZkJ2JHRlz0fZbWbd7iX4rzwqO26kbUccriqrxajBV4j2BftEtV7BfgIf3hCkpNU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741502623; c=relaxed/simple;
	bh=pcbrVw4Njs0Kum/2VhRZM7j2L0V2JUwYQMRq+XXSVQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z53PORWtPYsqLLge1WaBEx/CNT8h9qO/z1y6aBvN9bi054CYeHoJYlVGu73JKm2z594mbsKomVc+vrhLbjRhZyKK7nhs+8Et26N6IHswV2FtRUZrUNP8bhygp0vk5dRTf8kyMwrmQM6CEypD1k0Uuqermgi7iU7i7GuB8CQgwvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLCnBiI3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLCnBiI3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so558403666b.3
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 22:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741502620; x=1742107420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcbrVw4Njs0Kum/2VhRZM7j2L0V2JUwYQMRq+XXSVQ8=;
        b=HLCnBiI3BWiE/+kUnvg6pfuG2DcEb0Lcko/781YWZLDpGfOi7yLVrKS+mfFI0BicQp
         GHaa5d9teAjHAT4FIKkCnNHt4Sc7kFh0HYBlWUWIxGNPsbwwk8wIpOhE3cJ7nhlRRxQo
         HOTksmBISXPPQpM2CS32BYkSMYaNvd+7PSg7FIdV6iz6EizAv2RIvhORsGd/GRyTkc2h
         WievbzlAhz/OUxhEumq6wkmF0w0eeou40H20lxoAzclgi/CLpRY+d9GdC40haNIbrSw9
         L8QRv0QQZIlIKEh5HVhScd1kpjUkGNHnnjiNe6txOckR9ZkyufF2THkrE1Ect1QtVfJC
         l1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741502620; x=1742107420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcbrVw4Njs0Kum/2VhRZM7j2L0V2JUwYQMRq+XXSVQ8=;
        b=po/QYobNDQAMVi66oUHtXhOj8X0dpuswPAMqaEGzKz/V5ebX+ao/JqtTCMqHZnRYQs
         I2Za21fF4HrYQBcrMC6acdY99TmrONxzCt6P9JlA13HxeD+66wxIXv2Tvx4tmbtxJ7u6
         zPD4FnJ/rC9MAWpwB3qVyPIPiIkMKxmqvm01xOy8vSzyfMnRl1cdHEv6drvvHiXdZH7C
         mWWMMxQHWo/RNdu2wqrcvUzvNfVF9h/IsvvpSXsb8urNwcSaQC4mtSAW4BNJAWcyU4NC
         ImNnKiwhujYmjElZ2yu3XP6YyaZUZO3ENOao7UYO2RY6+9u9Q/u2zbFL/CI9KfbG9Y7Y
         0Yng==
X-Forwarded-Encrypted: i=1; AJvYcCV7BbgUhv1SseLKg2moBnWJ6JfCea+GDHmPwHq8X9UficaJlCgdgSrv106oxxJTLk+WPRH8upMjN/kNDA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxat2ztuPqvxeGIsWEjBUnaUQMjUhQhgFXOaHDT7QDxuQrk+ltZ
	QRa9xDmOErecIEV5lUGTAkEBmqukUZm3VXPC20FXA285OiYC1r3l
X-Gm-Gg: ASbGncvZs2rfNiefiWsqKe/BWYLdPP6rbUz33G3KQDGMWxyuXlxNPeYKalq8f0HV70F
	4xE2UkpWZ/qmdGUmbnHVtxT+HL9hOz02WEC1HgLak0eMwTRaOcZakP7aa//zK5romdeI4lpTG09
	D54WBiFVvS+H3KD8BAmAmMedjrauvURUSEKty/mUwGPTn/8aPuMJF4m2rueliwGNGIvhXaJ84+4
	OjyYSyKHLbnEzSvomD/WVplKEAc/XqsrDfIvw48WQ/9+WGPNksDyRoE/ktOfCAZAPHRsv2iaKg5
	4dZj2WkyLcjUgEjjB5GmY76D+UcCtQH8aTSF8+oQaj8r20BvFUClXeDXME+0xhMDmg==
X-Google-Smtp-Source: AGHT+IGoHXU/ZKdJQBXrrTuO1peZxmq65riLT31sE4BFWMi71oPY28XqAsCq2AVsnbOJtj538rdAGw==
X-Received: by 2002:a17:907:2d92:b0:ac1:fab4:a83 with SMTP id a640c23a62f3a-ac252b5a837mr1044767666b.25.1741502620028;
        Sat, 08 Mar 2025 22:43:40 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac287653e64sm109036266b.136.2025.03.08.22.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:43:39 -0800 (PST)
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
 Re: [PATCH v4 05/14] clk: sunxi-ng: Add support for the A523/T527 CCU PLLs
Date: Sun, 09 Mar 2025 07:43:38 +0100
Message-ID: <4633243.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20250307002628.10684-6-andre.przywara@arm.com>
References:
 <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 7. marec 2025 ob 01:26:19 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Add the PLL clocks of the main CCU of the Allwinner A523 and T527 SoCs.
> The clocks were modelled after the A523 and T527 manual, and double
> checked by writing all 1's into the respective register, to spot all
> implemented bits.
>=20
> The PLL and mod clocks for the two CPU clusters and the DSU are part of
> a separate CCU, also most audio clocks are collected in a DSP CCU, so
> both of these clock groups are missing from this driver.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D7319C553
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740586021; cv=none; b=XLG7MGl6enf+sBEEIhdBplhzIOacmmqHKlPKsqm6in1zgZbJvXfHqBCaTX+8L3m2W/NYngAWjB4m8qjAcf3u/G699TtnPni1HMIh1QCEvJcWbdfCtNZp2ZX6AEiYvomfmzj2zMqEvETgssb7mfyGY6s4Q9kZH5k5sfeBohf/nfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740586021; c=relaxed/simple;
	bh=sVuX0bpHYTirziy6vX1FkmZQ6Idw9gPtVc4HEBMx30Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aa1q18pSVftO9NMdSij/BgfkwU3r+hQUENyicOgC8l1P71mPGMMvONoj0WIbTd+uxqpK7nZ5ZH67M1s++GsapaEEokPkLg0wrRlYI6BerskUT1TOWlZ7EO3VgN50F7GrnsR/jcyWk0lY/DBr0cIyIz4Fm6do/bQK+8sTUVzp7bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvKWG6HZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvKWG6HZ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab78e6edb99so988531266b.2
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 08:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740586018; x=1741190818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVuX0bpHYTirziy6vX1FkmZQ6Idw9gPtVc4HEBMx30Y=;
        b=DvKWG6HZr7BmwzPISQ1qeqGdLiaa57in//tzZpdk9PjG2SJPCUbOjnfQwtFLgmuYsT
         u8C3cc4UgDavgGWqptu1QXRnjvkZ+YdnJOUmb7znAEa7BSu9eUpxEs+jpI3UGegL8Vuk
         vNnHxZ4BOSUuQHgC/cGkMBHwvCdAFXOT9eFkajzHDWWCNBBMwmtMGiaxN5p5eKqXhj9U
         jtTbupX0j8HYwpmpfbIItK1sKllFjx3pobb5KfwrDMakXBHVniqGpM1RS3IyV5QHXAvw
         e+OGd/zUYemV1hYrx0mtleUSXLKKLsE+pA8I1BJph5zXPYx971fNBzd8jeA+q7RxiRr6
         vD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586018; x=1741190818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVuX0bpHYTirziy6vX1FkmZQ6Idw9gPtVc4HEBMx30Y=;
        b=SxHGfJl0Qb1379pFHVETj5OGrVJ7t0aueg1eRrenlCRV+ctQvhlGjP/PxieH4Ok3Wj
         xlzK1VoMsng8HSp1U2bXQCOAY+H2JvpPCprGtLf3JPm1NiXd4uQcg+3AFtrLDTP4cdZF
         ECvqqMgDN0cW1aBcZsz0BrmTqj0ldmcMOvAzDyuUssjaqpAIMGdJWMczdK3UCw59oZYv
         qb2xz0HBv9XVXHyCji8NCOtXZQAWjdMvs+fvuXZrRmlBxuz1XyUpMHYLosnzkmNPZ/b5
         S1du6qHpKM3RrV6OYLKpGsL/rZJaNyO9M2npq00ptmcXWN/l2FdCM75s5QQRF9ggbR9F
         ZX0w==
X-Forwarded-Encrypted: i=1; AJvYcCWLho4QzuwcOmAYI+Tzgv6uEeSRBtuAW9TGaYQBTTkNt/jrXf5wPXt5h7dmRyKXOq0p/MjXemPnxS/Hlw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2lxi+0hzE1ykAym3Vuv5Y2Rod0PO44vDdQEe11fC2sm2CrWFi
	ugTTRDZN/e7LSWwovdtdLFpGR4V/58xApjOO/FkdoWl+ylHEzyEp
X-Gm-Gg: ASbGnctETq/MacDvAZhcW2wSljMByzilUV1S9W0Rp8K9TvR6Xj4IB1XsyAo7F5vWbWg
	WhhyEfurILViiLx8NiW/IjpgksUtkujdRH6LbUqJVv/VXIYiuAVJufge3+XfaELl3IoPgsvNQkM
	Adv9T8lgKzeR/pZO8PcKLvzvpRQww+P2tXrVmQrT3C//CDvHg+CM9hPjrANiVMYtUgB1ZHYZY8H
	UuAZUpokKZ0OdSf34jgKAV0/nKfzYX822kae1RfmleOVjvdeSBUQvWWjbho0i8zCzXZ7qZtsHLa
	2z6Qkgf1OhDKdiaPXztLrs6pRQRyFLupr3SCTHFaXzFp5gtlKO7GjlHSxz7FGt+qeltFNnfkreo
	cQg==
X-Google-Smtp-Source: AGHT+IHKSaBNAQxae8uGh3BHw0DdJPoRYYOePYjoHC8k2jlh5nxTseGqTp5afK3YJqsDzF/GYBcwww==
X-Received: by 2002:a17:907:7d8c:b0:ab7:d87f:665a with SMTP id a640c23a62f3a-abeeef36285mr435058266b.46.1740586017406;
        Wed, 26 Feb 2025 08:06:57 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abef7132491sm123062766b.166.2025.02.26.08.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:06:56 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Kuba =?UTF-8?B?U3pjem9kcnp5xYRza2k=?= <kuba@szczodrzynski.pl>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 2/2] clk: sunxi-ng: d1: Add missing divider for MMC mod clocks
Date: Wed, 26 Feb 2025 17:06:55 +0100
Message-ID: <8494506.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20250226103734.1252013-3-andre.przywara@arm.com>
References:
 <20250226103734.1252013-1-andre.przywara@arm.com>
 <20250226103734.1252013-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 26. februar 2025 ob 11:37:34 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The D1/R528/T113 SoCs have a hidden divider of 2 in the MMC mod clocks,
> just as other recent SoCs. So far we did not describe that, which led
> to the resulting MMC clock rate to be only half of its intended value.
>=20
> Use a macro that allows to describe a fixed post-divider, to compensate
> for that divisor.
>=20
> This brings the MMC performance on those SoCs to its expected level,
> so about 23 MB/s for SD cards, instead of the 11 MB/s measured so far.
>=20
> Fixes: 35b97bb94111 ("clk: sunxi-ng: Add support for the D1 SoC clocks")
> Reported-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




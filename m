Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A62D320CC3
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128020; cv=none; b=DOQlkGVf9ooThx/A9iyJZNdA/kmpDMAgNPkH+DhGSjnAF7Kv2DKXim7JKi86jaVV0LiMobIEWyyUENe+gQ6e54nleiIpZPmDCo+ejXohS9+5lI9BgYjXT05BwSlRR2X1lkv5WZwChqE5Z3U8k7szs37RSYSsdAUbGiDTbmw017Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128020; c=relaxed/simple;
	bh=59/49K3ZN1tUBWEWYa+DC5Kzr4dbDuxfMnqefZEkseg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tm0xxyQrK2ohuGooA53dAZiuSOr7d8+SMicLbPIXqorG7Hv/QHv2sSujCvkycKUhLM6Wi1B2Xbvd2g6BI4MThK7KyXRngBJkgCrUCoztGcXvjXmNQkFX3obMaWYBPT/A+2U/WE4UyQ6E06izJmqDtxakCelvuDpvs6w43W1ML/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-78ea15d3489so76852516d6.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 03:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128017; x=1761732817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9nsZS9cf0Yesyto3hqsvaV4sJKL6LJk8tudSlukngM=;
        b=VdgWz5W8pOF8L/YoqXH+26gMcMuTawoF+3hwpdhf9k5wESbPl/1dCCWZaRq2pIii5o
         V3OgWmo7jCGWU8YJ6DtHg1e+PLO4upbvNYcu2nJwRGoimogLhY0+SnM5R2NTWKQzRwn1
         XwBD7wgarBhzAPkkYMK7SsHNygAmH4w+4ivAs/vyVjgDnfdITfWi6zk7Oz3ckCenLmmQ
         /KijkpWOu5aPNpqXzCGl4sVczFXzEntlMqD68pEt+X9tGvjdEqnGsebwApz6lQyfEw+q
         KjJLaUkAaWY32+spWJ0AfKUARkZGa5vonpCLVNaKWRDkMqu2iFdK5DJch3FvniN6YKul
         dkwA==
X-Forwarded-Encrypted: i=1; AJvYcCXD0ZOvQzgoAEabiw73CLznwVhAPxKd0NMo0jGNLVJ3gbd9kgySzP98AYp2ei5Cvn0lR1ka/53EUyPiDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeDw6wBAQBfbjpSMkFEvmcw9K+Ez+rS2si/a4Vg8h9J3/+nwUt
	RvBT39lC+jiTKCzoAMiM4HpN/FyNbsAAmQpiFH+/x0qQ+rKB1B7nA7mp2RVBBjIg
X-Gm-Gg: ASbGnctL968DxYqCsUJM4O6/Cg0jkZC7m+Ck75NuATUgQFfue2L6R2yIHRcCbAUGe8p
	KM76Pzqnoe3h+nOIJ9+YGOUCrLy2N1ghT0tShCol0G4wu/HNawOHm7gH4DEoUlMen6KO3lKap4x
	3HvD36BLmgMzUxPZQbYbvzOr0LESpVswwysB66FGhpkljRvg/XD3oKLl+fhcoQPsehMc5vIumGk
	TLAd3ja4pClGSfr1aGx610L3T0X4j6qdKbqRe36Ec7qx1+dOXinfC6j9iNfe4p8l9zzG2tcxq4o
	nnLwXpOlzj316gTbiCCf/RNV86QM13fWTg/sv9lFS9flNvmDMyLXjkgPXIsTUeiawOLWO0sqO1P
	t3mN7Dk0GcJ/ymPIRLaW1HuzrKH+s5tUXVj3RNV2WXQkwpDh6re3FoaT1MUvWg9kKpMo2Dlll6Z
	bnI3J47fJtPzCNR9DSLNBeds2Zfs84+3R8ap4JJZkpsZYhEHoHScz2
X-Google-Smtp-Source: AGHT+IFLRoKtzi6cE/CvfBV4Rz3MJZ0u8ScCbAW5qGk3vIRfUo2tv9bUC7gh+TXm6yXPCEOY2j5A1w==
X-Received: by 2002:a05:6214:248a:b0:87c:113c:f1d2 with SMTP id 6a1803df08f44-87c206129b8mr285166736d6.38.1761128017255;
        Wed, 22 Oct 2025 03:13:37 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87d02d8ce5bsm85084256d6.57.2025.10.22.03.13.37
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 03:13:37 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4e8a9b35356so10181501cf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 03:13:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRbServlbOoG55K+prQaIj9Kn+xFGnnquwVKFQcpqoHR1dxjrpzbmRUX/AATIyc+VmfxZDTMXFBb7Fbw==@lists.linux.dev
X-Received: by 2002:a05:6102:32d3:b0:5d6:fcd:dc86 with SMTP id
 ada2fe7eead31-5d7dd568745mr5376089137.4.1761127531051; Wed, 22 Oct 2025
 03:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251020101311.256819-1-richard.genoud@bootlin.com> <20251020101311.256819-6-richard.genoud@bootlin.com>
In-Reply-To: <20251020101311.256819-6-richard.genoud@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 12:05:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVf2dgWqsfVt9HCytJmmRLYiCkhzSJVp3drZ6KDq0Wwg@mail.gmail.com>
X-Gm-Features: AS18NWDWB3ss9iz68cJvppf6RUhrU6v4v0GhpWefkhntn5szf5Osn3JvNoovQ3I
Message-ID: <CAMuHMdUVf2dgWqsfVt9HCytJmmRLYiCkhzSJVp3drZ6KDq0Wwg@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] mtd: rawnand: sunxi: rework pattern found registers
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Oct 2025 at 22:51, Richard Genoud <richard.genoud@bootlin.com> wrote:
> On H6/H616, the register ECC_PAT_FOUND is at its own address, and not
> part of ECC status register.
> So, introduce the pattern found register offset in sunxi_nfc_caps, along
> with its mask.
>
> Also, introduce a non compile-time field_get() because FIELD_GET() and
> u32_get_bits() don't work with non compile-time constant.
> https://lore.kernel.org/lkml/cover.1739540679.git.geert+renesas@glider.be/

FTR, v4 at
https://lore.kernel.org/all/cover.1760696560.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

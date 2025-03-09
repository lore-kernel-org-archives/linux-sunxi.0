Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CA7175BF
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 07:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741503824; cv=none; b=N8mefqaiTU42X0/wITpFBmgWYlyedGYfG0Gf2YcMUVErMlfwvO2g6O96QzVBrWrfCVfDOvM89lSmIhjWeZ4GRA63YJ5AMmuBxRTwsUw4/SmkrfprpApMZ4u9s3hp+I84OCErnat4qf9hecuCgcjZ11GlMvwFWaCpuB6YZzyjKm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741503824; c=relaxed/simple;
	bh=4/qs3Uwkfo+ukkyY7y6RUTEw3elPT4tc7TjK0JH5xRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NiNoBz2nlX0cb44d3OIIELUfRvjg8OL45Plb/VPhSSgQdqDpTwQP7suhBUmVYtyMbfd2QT9ssfEwRgOO0lIdl08nSieGWassaoOjWCDIFYxSqLEW0DuRN9BbKgS1FNDIuLPq3uydnyLgAE5wTfl1ujXY6XwwmMckqPjAee7+XLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeroV25q; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeroV25q"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so3361415a12.3
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 23:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741503821; x=1742108621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/qs3Uwkfo+ukkyY7y6RUTEw3elPT4tc7TjK0JH5xRw=;
        b=WeroV25qldm+oZZB9V1AgxvKa9jMSAfyuz7Lwn0ppHFoqIrDjjSh/k7LcRyXbCzzpY
         DUaYg5ZAiz7cmpdBEH0iu+5oV2M4WQj5EeC7hQ6pCM8DWn+PXWM96R2mdIzwdWKCde2e
         KuZMmfXtcn5T5ys1qdEgQiBJF7U2P0Y/zH4K3Se1HXCGT6wYntBXGMzvHshKjWW6xbyn
         G7UH8QT6fcrrpWAsSBO1pBQLrwhNmZ8suTzKyVC4WbEzgZM+V86PuupF7FEP6ItMQ3Gx
         Pikcd/UrnWvLtov8RpYecDC5xnAx0tkPxTqu6cYMt4yhsG5DqtirS2t1kdj9HmjR4YcN
         G5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741503821; x=1742108621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/qs3Uwkfo+ukkyY7y6RUTEw3elPT4tc7TjK0JH5xRw=;
        b=GS8b6cTQr+z1SC1D/VWNUJa6EFdddEVQzcYrPJmY5k24D1rknPRmp+3vFzX+5KLSso
         0IMdTqjH7BQprjVHb1iemzyfdqMVcB5UCmqHS1iZHzRknFY3YV0QnMv1Mv4OFqWr8d5c
         tVJ/UOYmx3ymeEfUC9d8Q5hhG03sHADnDuDIXEcZ1nfeNhTYeeYk9QDt219d9YlVX7FN
         mg+Ap9SCdVl8gdEsiJP7BsaQdp7Z71vKvdvgEJzlbebOX8SngrKSDclO4Pqcz3G/NJh1
         8H0i/2o6pFuAxSrXrBDG/D2G8YarvXQx1jh7VZe88OeUo0E/7bstWbg/9xfexbC+oKG6
         dJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCVr89oAVt+b9oL9urbjWf5TV8I7q8+Hv1tWqiwZvVmtN5+/C+SqAeHoTjRLY9IC4f5GfgElu4YZ6xLg7w==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc/V51QlSnWrDj1dOveHxvgUKTrYA0AdzSGPsbx8MQwVQcw+Yu
	e8PPPsyviCnjZPDiSaJqqVFN88/XExgnqUMllpKDcKPdJUdJ03zu
X-Gm-Gg: ASbGncuKrZg68kBZ90TeZ4T0RXiAvzozcpyCpNd6INsPgPqwDzcqDWokpxdmhQSmfut
	zRG8OvY+alx3Mh+qTnbhbNkGRktSnx8+Vsq5jyAsoYxQ5qGB7y4hr+LVVHfQYIDhC2rHm90PTNG
	ScAkpUESRgHBMEX+uD9FMmVG0nt2EJ19O7WswD5MMWHQyqCsZhdnm5emrvpKXDZ28ti+jbN9ynH
	kud7LKDz10OfxwUc05KPYN95Cy34VgIMHAa9j1QkTtZSm7d+aywZlwby4lOUXYNuUQlMB1hq33c
	PIHj/wWk7zUevNhT1zU3qZsHOVAFcrW+/1gphHnbBfR471LYyHYwoRIF1uObmUvQ43t1IYRIyag
	Z
X-Google-Smtp-Source: AGHT+IGMCqfgtOksXCU2D5pV4LcZbxKnKSmq361rjbRlUZqwxHJQeerhBdOB3YccYo/fjODMlK3Onw==
X-Received: by 2002:a17:907:26c9:b0:ac2:166f:42fc with SMTP id a640c23a62f3a-ac2530200bdmr963517966b.52.1741503820537;
        Sat, 08 Mar 2025 23:03:40 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac298412a9asm21402166b.156.2025.03.08.23.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 23:03:40 -0800 (PST)
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
 Re: [PATCH v4 14/14] clk: sunxi-ng: add support for the A523/T527 PRCM CCU
Date: Sun, 09 Mar 2025 08:03:38 +0100
Message-ID: <7776158.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20250307002628.10684-15-andre.przywara@arm.com>
References:
 <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-15-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 7. marec 2025 ob 01:26:28 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The A523/T527 SoCs have clock/reset controls in the PRCM part, like many
> previous SoCs. For a change, the whole PRCM is documented in the A523
> manual, including the system bus tree, so we can describe all those
> clocks correctly based on that. There layout seems to be derived from
> the H6 and H616 PRCM CCUs, though there are more clocks, and many clocks
> have subtly changed.
>=20
> Describe all the mod and gate clocks, including the three bus clocks
> (R_AHB, R_APB0, and R_APB1).
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



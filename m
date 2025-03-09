Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825DC146A72
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 07:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741503626; cv=none; b=kqQsKr9Dz8Om0hIU2tqtsYf2l4kG03Q8E0t0CGzLLfr3sp4f/fzVenGPBbtIKN9lUwydzRp/yCDqPKk4BJS5wFaLFmyWB+IGNxGlDT19vOMkiG/Lfa3eaDNN7Zd82Qw9UcWAKTzYxKjYPlT9QOITtXof/tEK0TlQ+sTNi5gZEDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741503626; c=relaxed/simple;
	bh=rOXmjlR5Rk5KRf6rwJVBLM/R3Wk88g6lM6HYMKYo1vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EPaaizeyVXno11gm91jqfF/IQ6oQs00z2Qs+kNAZpah5L8baWW8jJnWWqt9CfwD6aN8yIPv7m8/uvvgXKTtM3U7MIllPF1Gtj5/OtBkEGQhUfrUpntTv25k3as4cF45I9pTHdovOq1iqnnDnjDORCxGXE2nw1yqoPQQjUzkwqvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFYdjNEe; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFYdjNEe"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac289147833so68421866b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 23:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741503623; x=1742108423; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOXmjlR5Rk5KRf6rwJVBLM/R3Wk88g6lM6HYMKYo1vc=;
        b=IFYdjNEe3EK58rWntm5iXHTru7GRmuxLC9uce5YulaW6b/NRHYyNK6lK1rjFYewTbM
         Vx7Ag4Qj+JjNjaD6KtRTj9wITU6B+29kaFvkXZKjW/g93IKiEF5rIl0CAjdEHFzLa+L+
         gRv46HevbPIIdS/Ok/93dPRBS/E6ZLfjZXEtq+Z5L6ZxtepZy+l4A/TGqlm3qsToVEWy
         Bbx73Q7MqotTcEVqZEWYql2SOy/s1ShZzsPd+ya/Qpdd915Eg0J9FUPgbpNvrLatttto
         6Pa1LULq5lTba+mR0dH1KpwWxam/80vfIZB+g04roAy5SYfBImYFr4/XPdxahn39kUxR
         knLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741503623; x=1742108423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOXmjlR5Rk5KRf6rwJVBLM/R3Wk88g6lM6HYMKYo1vc=;
        b=f3/ONfliBX7LZ2WABd2Vq6fxFEbkHr3v6QkIE0h4FH4EzAIQ3oL/9Cipp7PYo3Sa9f
         hzLpiMcNRcI1AZdGQSf/oz/yRBl5SEWXT+ssDNzlOKAjNIdS875el3CSdvqRcRAK8U5Q
         FB1HYdW943jjgjZ6hH2qVB3QxDuil0jd3lzAElOD1HP3x+2KBE9zygSjUNFfKF6RiCxb
         g+7hREGI4Jm1bM0B7UhsTi6gcjVZ/FJ4usLgUAyHKTp/Bu4cpPbMryO8cEfpMgmkBJCA
         BXhRxbkGPBrq0AOqkytawbEGG8rqdUS/a7K7PZnLsXr4cGFYual1gcYY9Dj9NQCWpiMx
         1U0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLAYVRvCgLiBOTaqh2qQNXOggw1Mzh/ZVX/juMH7w37sshxtYKGIcjLuxyA6Bl06N29ZHoZ9BFVGipBw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/M6hppcJLz3be5fDisNg1BZYUGFYP0n88d9EGNHRS07EPew7n
	5oXkd3EI1Thqze/eSf7KKsiu6pWqOxJuEVNHLWwASM1SSIC61R7j
X-Gm-Gg: ASbGnct1ZKC2AD/+lsQ509nug6Zke1ZoonvtUEXJYG5xCbN3QytTiTtvJ46Sj2NzA8F
	OjHwDiM0SQX2gVVFABa0XgMuvsnG1xBUjagE5rNQGplazuxPfEAZ4SEwt5LQ1tl8f53LU7tLBgf
	hgtVFG45mbi39fWCdenpiDDNJQuOUmV2do2lPKajbGNNjqgcESLyQyURQholpadtJhwMCfAkn3A
	5qSj+Ui6IyamuBvSEqqoDtG6Mjt3VkUwsjermwlCLow/UyJVMiP0iF5jGqkeWNTv8V9LW1lVZL7
	bq0kMmnnBEcrPmhcGWBz5aDnlbEhHnx+44GtB8sqlf9tmAi9Xc41UUgVnukL8eQFiw==
X-Google-Smtp-Source: AGHT+IHYSxE3dHIHTEa8uoEGGMpuf/AZ9EL0n7GTLf/jTzfr1egAgB9Y7RFOLIp+NZliiikRziEP0A==
X-Received: by 2002:a17:907:94c8:b0:abf:45d9:2607 with SMTP id a640c23a62f3a-ac252598005mr1084558066b.3.1741503622721;
        Sat, 08 Mar 2025 23:00:22 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac299a025c7sm14713966b.51.2025.03.08.23.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 23:00:22 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/14] clk: sunxi-ng: a523: add reset lines
Date: Sun, 09 Mar 2025 08:00:20 +0100
Message-ID: <1994155.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20250307002628.10684-14-andre.przywara@arm.com>
References:
 <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-14-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 7. marec 2025 ob 01:26:27 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Allwinner SoCs do not contain a separate reset controller, instead the
> reset lines for the various devices are integrated into the "BGR" (Bus
> Gate / Reset) registers, for each device group: one for all UARTs, one
> for all SPI interfaces, and so on.
> The Allwinner CCU driver also doubles as a reset provider, and since the
> reset lines are indeed just single bits in those BGR register, we can
> represent them easily in an array of structs, just containing the
> register offset and the bit number.
>=20
> Add the location of the reset bits for all devices in the A523/T527
> SoCs, using the existing sunxi CCU infrastructure.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



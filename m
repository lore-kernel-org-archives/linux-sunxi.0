Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D1933E7
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 06:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741503055; cv=none; b=l5tPAAVw4aSIGneyEA3jLKwtS++IRK1qMAqzwW1nE07cax0xIotSrd24wi79+KH8bYkEp6x1Ewy0Ohghz9RT0C0ZlQeJ2DVCLgI9WbJprSJWAjuv52ySQq95j09NRoLyjS2SV+G7eeDTz8V8xZBdWLgGKYZ13Ki3nllX654secQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741503055; c=relaxed/simple;
	bh=XXrGeMKEDMltcTZOnuSwc6OZdvzBmHyoGR0fdEWW+BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lo69OpEl0hl8wFJIuXCwc69kg6e1UMwZa4AgcPb31Q2P+rGajScWlX5f09n7nIX98NIVsSx8cXhq7HyuSY8S3vbWQaNRQIij4NtDIEix1j3+Zw+DgSK1vU4c/l3545ovF1j5G6+DR7EPNIc+SapQ+cvElRrCIdziB12yzF8aiqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/8lwx2b; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/8lwx2b"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abec8b750ebso530931866b.0
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 22:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741503052; x=1742107852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXrGeMKEDMltcTZOnuSwc6OZdvzBmHyoGR0fdEWW+BE=;
        b=b/8lwx2bxzL7sxgk2RCAUzMe9Uqo1mIDWrhUniCFC872ueX7DOABa4wUyMI4mb4j1f
         Mg59KDVFthjfyRqzWbvXud5/JtW9/CNDSBkW2oRIPecGfhmKY7UXV6OjkYlG+gxdJWWN
         dgfdMzIVNU4qG99e19fnFRgZYRWXqr+IpNZlzhHMUdUmnunDSwFIJ+bFq4s6r/V8u5T2
         wLJttUoJnHNhLuTIRY35A0ytyeaT510EsdDDtHCqeA5n7p8r2MguhqDdtBEJ3YE+4KWB
         kfs4Wxg76oCZOriLda8W3XLvs0/bK4dasCeNsjnaTGhcgTTm5GwHKZWTJ44hmJ7ul6oZ
         IvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741503052; x=1742107852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXrGeMKEDMltcTZOnuSwc6OZdvzBmHyoGR0fdEWW+BE=;
        b=fLkXu7zpUvHAmMtxXwo+fShccQgv4JLS2Z4KwPfm4CvHMBE4AfhkzcNZmxI/Ngsxuz
         1sjz+nXyxEWYzencjPAUxOMEhVOkiFlmIxAxWCVZXxcDB3RpTQi/6+ihCG3OtIcLDvjZ
         v8cHHWXBT9/a8CgjtGpZoUIVAubW27unw8Z1iOx/wU704DUhgJNDGmPn0DrjH50cc5qj
         WsXFCFdb9yFVsvRZy3ntm/dIkUdz5q/iYs5jKk7xQ2Lk5T5QsgsfKPk4qIsxMradH5ow
         f+qfvHyxlA2Uqs6Wxi2JVYHsUFV2zabjWlsCjSvGQVT3GVVOB7PnBHdzFOqVgTwOMMgz
         TdTA==
X-Forwarded-Encrypted: i=1; AJvYcCXg811dUjENLd32T1GCKPJR8s+uE+aNHM/jOqbQlunoXw288iqk581pnjQzRLu8I5oELW7w8cBZMbrGwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlYCKcZCNvAGgZYA5f+RY9h/86t/6RDHqLcC044p0PDgMW2h8+
	UKPTImUyUp8yLwU0g+OaoDGEYtGqM/bL76qU6RdvUzcfpmoOSx1o
X-Gm-Gg: ASbGncsynGsJgvWMoB57pDDMyXsGjZcIfUNYZq4XVvMsvHEEioqkcHONztExmTbM0NE
	wJsg36bapnrVIxSJksSR/Lw/HX7a5onkTOL7szUYVGkhy2rMkkhHCoZfEUa2OHG4PnoYqnFZg10
	NYDqbSSVOxblC/CmSjGvHHQcPOFanO6mJRZTcBrl3jbBSXAlfaYmslH7IZ/wBr4tq71Bf9RxqR+
	SMazmnIdFM64gUfFVrG4vCnVbJ/7VP94sF30xXWuIOKZXc5nRI0OZq94MDerfq0RgCzu3rhW2Hg
	Vx1DR0wEfvfYbFjn6zKBILw6gzlvcSLLVACZ4va9EyguOlmuhywdAbJNKKcbI2xMXA==
X-Google-Smtp-Source: AGHT+IFXyBjwKS8n+FEnVkJuV0T3jFruhFE2A6vtlJI4jqzFnqL4g16+EpSl4SMNWytxbOSvgcDIjA==
X-Received: by 2002:a17:907:9490:b0:ab7:9df1:e562 with SMTP id a640c23a62f3a-ac252fe7196mr919864166b.48.1741503052319;
        Sat, 08 Mar 2025 22:50:52 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943c476sm544681966b.3.2025.03.08.22.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:50:51 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/14] clk: sunxi-ng: a523: add system mod clocks
Date: Sun, 09 Mar 2025 07:50:50 +0100
Message-ID: <2214425.irdbgypaU6@jernej-laptop>
In-Reply-To: <20250307002628.10684-9-andre.przywara@arm.com>
References:
 <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-9-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 7. marec 2025 ob 01:26:22 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Add the clocks driving some core system related subsystems of the SoC:
> the "CE" crypto engine, the high speed timers, the DRAM and the associated
> MBUS clock, and the PCIe clock.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



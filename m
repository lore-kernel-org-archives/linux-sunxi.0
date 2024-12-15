Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5F4175BF
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Dec 2024 05:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734241019; cv=none; b=pQubzHclrXuto6Lw2KOg5TeVRJmleQC36OyE93UqLfxrIHOkQOfVLkRkfm5rFA7ixoom+GWXD/N92fboh3Hd4xU6GMOsmXQpC+Pszj/PFKGQ4wYTZ2EZ0eJtaREg+BrGdbskVIHYoo0skA2UMzgepUyzWDD43yGNX9vVQ1B5CL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734241019; c=relaxed/simple;
	bh=tm2ZBhzuEFEoW3o28d+5TOHGvceka3GHwCO5JinxcNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=So/E+kZVuQFlhUxQjdy0x7hctnN57WP/nnIStyz10DN3Zqde7RDiFg/fb1O3Q7jyOc9Zfs7+Ngl2mXY+sr/+9FkhJbkT6ErV0UBqzx5fiSqSbzqpL9pWWTG/6bn9axEN4TucUjV7nNxCeu7RYI2yiHeTvuQVF14mWMRYU9/S+KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFJxjxr0; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFJxjxr0"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-725f2f79ed9so2307671b3a.2
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Dec 2024 21:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734241017; x=1734845817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5T7Xps2U+Xbtct6WpNh1Ms/jHQH/Zy0/yiacfJI6eY8=;
        b=lFJxjxr0AlqaV5l5P/iEiUBS/BVDUaAv5+JiYV0WPPVf4XHQuON626JNNqnjzcCsk4
         YQnr18XyNHghf9yngsiOQ1d1f4W6pS5Bfwso/Jz7+C6a5SGb8edgJ0MRC9fy7qgKVAUF
         l/Wth7DoUcPZ0hcGiDarEADV4QNobnHoMPiJesXw4muqji79vGqXdCNIdJcDOR9wIwmp
         1mc6/X7ubJdaLD6rqsvSG6OHzhBj0CTF+lnwRZc4kxkfD2j+CwRxm9qc52LQBMnzfnyk
         mIK8RBg2FXRddAiVfol+X5TCGTzI2RaLT7ovItQ+a232WCyX8h6/KZy6KZcIQt2apxBb
         4qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734241017; x=1734845817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5T7Xps2U+Xbtct6WpNh1Ms/jHQH/Zy0/yiacfJI6eY8=;
        b=bR3AylPKy61CvIqJzYQHZ+rspLcAkpcVQpyRnDvT+40u32cmjMofL1ulYhdni4/G1n
         TUkIW9tx/PdYW4h7sXH1D0/hepu4Ms/oU+sFDStTF7y9YYTfvmb96iAg3dcMeT+41ThO
         ZF6HeM9T++BQJChLXWwT0BSI1gHrkJIv2lYdXc0jjZTCyMFaZtfsExlBfE1qTZWbI94v
         O0C8dd+XsjP4uumsZc/xabQQU2tR2RCAQDd0ILMHFMMeoW3W9PQzyj8k6iOAkcr+33Lt
         JPViLdaImYi5dKyC54IAUNSAMDeOWiyyIpPWq33igwyIyd3/3hQAOYHpekQEox27vKfX
         2Rgg==
X-Forwarded-Encrypted: i=1; AJvYcCXBKfO0laxHToGSLYYY2oQw7be2wGtNNOTGiy3PSh4nux8CO2EjlXoxi7rkHz2nPAHOq2CRa20lVspI4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNvYp/pb5e+njJLTYYx8wVjPFc7qStQfuROF2EHHAYEuVcy6aD
	p1kNf767dFN9vl/RgxEEibKU3zpA1NmqvVxJq9liK6Y1I5Gxa95e
X-Gm-Gg: ASbGncv7o/fkO86Vwoq92j0jHk/2b+Cmqt5afgs87Xl6pQI7CjZJefCSLux42Lf6sX8
	UACK2FsH7mXM9jjGxa7g1IaDPfy2IQlIRI+4FRtgMaa1pG+tOc+0hgL4nBxwBHmwgbCjBjIbeFN
	3eTn7BTPlW5LuAo+kpxEaIHefFXhMuDxJLBcLtfeCmU262HT/zlk5FXERVn2vfP8OqylUISlIte
	Bi8d7fJ6rejc4XlEEKsZdSiwawhodV9qSX7f/q22NGLFY/98g==
X-Google-Smtp-Source: AGHT+IFi1PPQSUOrCioA0Ut+2J5jgMJCNCDNT6STQp0qD6xWCc08BjaoFiUHYwBhtNmNrzFypeNIzA==
X-Received: by 2002:a17:902:e806:b0:20f:aee9:d8b8 with SMTP id d9443c01a7336-218929a248fmr95477575ad.20.1734241016960;
        Sat, 14 Dec 2024 21:36:56 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fa1cf8sm5729803a91.38.2024.12.14.21.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 21:36:56 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 0/3] arm64: allwinner: a64: fix video output on Pinebook
Date: Sat, 14 Dec 2024 21:34:56 -0800
Message-ID: <20241215053639.738890-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux"),
TCON0 clock parent is always set to PLL_MIPI, but unfortunately it breaks
video output on Pinebook.

I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
to the same clock rate and flipped the switch with devmem. Experiment clearly
showed that whenever PLL_MIPI is selected as TCON0 clock parent, the video
output stops working.

To fix the issue, I partially reverted mentioned commit and added explicit
TCON0 clock parent assignment to device tree. By default, it will be
PLL_MIPI, and the only users with RGB output - Pinebook and Teres-I will
override it in their dts.

Vasily Khoruzhick (3):
  dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
  arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
  clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent

 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts |  2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts  |  2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         |  2 ++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c                 | 11 -----------
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h                 |  2 --
 include/dt-bindings/clock/sun50i-a64-ccu.h            |  2 ++
 6 files changed, 8 insertions(+), 13 deletions(-)

-- 
2.47.1


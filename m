Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776D0137776
	for <linux-sunxi@lists.linux.dev>; Wed, 29 May 2024 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716991838; cv=none; b=NLE546ukl+nbubNELWjgF1M75NkPp+lexZ5KDuI0Bc9pnEPvaGsKGLNrKDvw5d0uqVU8uA/gq9GbyqIC7Pn2DmxiJJChuM0+8YPXOX/Jyfnk7mY/zj03Uxr8w9BUlK3VtSq6y/IcnGJqXcElJ0YSIftyIeUOKN/o9FPwu0SmS/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716991838; c=relaxed/simple;
	bh=xGxCwNAa3h6hUSat+wLsUt/LFxDta4PN8t++ItIHRgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=grL2jqmsoBCOIs9RzFWWdCuHUTk9/nsfJl7gwf4UKrRlaEZKIpZOAmnMOo0f5RFWkCO2vlts7oB0KPzeSjXHEBp8UbohWwL5fsn3k9jo8fodQV7yzExVfgLfYMgHFLUDJSOWzYIPeNQCGKv40/BwWuPf26cBkTvnOYnIdI6fYzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZYsk8eg; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZYsk8eg"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a59cc765c29so147759566b.3
        for <linux-sunxi@lists.linux.dev>; Wed, 29 May 2024 07:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716991835; x=1717596635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=seHfK1T0CIDoh74FZ9rFB1MYhs/7Ky7lSWNsiaH4Ato=;
        b=UZYsk8eg9iT46PY0p3U4VpPF4y2nI9mEsJZsn2GAlHg3lMDuuFuUuoyRUoWTijzWuN
         2dIp2TYXaNzBpXI/Jlfs1CBcMhCzgD59p9A9tlo/VERIv24T8h02XcmBe3ATdTfbUHQ1
         q7SChdXgpBv1Wocm1y3nxL/ITbTryl2bV5T9+P/S5ixErsRMcIHgh+3FRI2SBaU4ZnKG
         DiMI3ESn16DEDye/5lTWfh5SQMBjG7ETBLOQD79WopNMZyrNMtpzGh5bEOX2AXuwA+md
         3T74CxgOofwASpHaXfrjB+XiFR0djBFQY90gZv4b9/cTOr7xndDBPBR2HYK2wltCVrBX
         vJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716991835; x=1717596635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seHfK1T0CIDoh74FZ9rFB1MYhs/7Ky7lSWNsiaH4Ato=;
        b=HcFZ2D4sTYllwl8KDrwjRI8zeek7h3wQDdW7l2d1PBTYNNrxMS8ihxKGm0ypXIG5JY
         yzxtdhqoDMccdYfObJG2suk+0QiOAye7PluBLjuQt1ta1jlJl78P3QjEtLLl6IPA4sC2
         ejnSc3HMoaAKPyo2DOGTC2jM1ceIXeJPr/Ot6Tkw8kU8Sr1Sm+bVVoRmND17x7+7rA4h
         H3GD2a5HTpnq1Sqzzi24Vf8xlelomIo8Lw/uBnfhWaHOIQoFhSG8sSwnq+LrMAcJDF8P
         Ib6hU8sKVA09bOk08dlpFqmL10YsihoEpbRAuFT039F9XyMAuL+uD/R8dBOZAV51oRAS
         Amyg==
X-Forwarded-Encrypted: i=1; AJvYcCWmxayUGK225c042UBtAMDP+6ShukYJzj91Nc+Vy9Y2KJtu3LMZNmGb+NKJ4A7NB1jEk+mpYkDySlebJmsgHJD008OuqJFgrR3anPA=
X-Gm-Message-State: AOJu0YwqjXxZFHANvgWkHuoro+TXBiFSEZLuJYN8E7miDZMjI0YB28dX
	7IOnNm2YogqlE3ZSvOeHHAP24QehuejnUprzWdWij4qwZOgubre1
X-Google-Smtp-Source: AGHT+IER8t7cuMdH3WgXBrJavuAe0qg/yrQsSI5WtFPMXA+CURNazRJm23qelZOFl3U7mrYlhQ6UcQ==
X-Received: by 2002:a17:907:6d22:b0:a62:9699:5125 with SMTP id a640c23a62f3a-a6296995222mr1042831266b.14.1716991834383;
        Wed, 29 May 2024 07:10:34 -0700 (PDT)
Received: from localhost (host-95-246-50-43.retail.telecomitalia.it. [95.246.50.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6357bf05f6sm130830066b.206.2024.05.29.07.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:10:34 -0700 (PDT)
From: Matteo Martelli <matteomartelli3@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Marcus Cooper <codekipper@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Cc: Matteo Martelli <matteomartelli3@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] ASoC: sunxi: sun4i-i2s: fix LRCLK polarity in i2s mode
Date: Wed, 29 May 2024 16:00:14 +0200
Message-ID: <20240529140658.180966-2-matteomartelli3@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I found an issue on the sunxi i2s controller driver while doing some
tests with a Pine64 A64 host board and an external codec (ES8311).
The A64 i2s controller is compatible with the sun8i-h3-i2s driver.
The LRCLK was being inverted when the bus was operated in i2s mode:
normally should be left channel on low LRCLK and right channel on high
LRCLK, but it was the opposite instead.
I noticed this issue due to the playback being addressed on the wrong
codec channel, then confirmed by analyzing the clock signal with a logic
analyzer.

Note that this fix applies for all the i2s controllers compatible with
sun8i-h3-i2s and sun50i-h6-i2s, but I could test it only for the A64.

The issue had likely been introduced in commit dd657eae8164 ("ASoC:
sun4i-i2s: Fix the LRCK polarity") due to a misinterpreted bit in the H3
or H6 User Manual. I suppose that the i2s mode had not been tested at
that time. Can this be confirmed? Otherwise there is something else
going on and this patch should not be applied as is.

Matteo Martelli (1):
  ASoC: sunxi: sun4i-i2s: fix LRCLK polarity in i2s mode

 sound/soc/sunxi/sun4i-i2s.c | 143 ++++++++++++++++++------------------
 1 file changed, 73 insertions(+), 70 deletions(-)


base-commit: 47d09270d7776e46858a161f94b735640b2fb056
-- 
2.45.1


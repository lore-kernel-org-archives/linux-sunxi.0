Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD643C3450
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109349; cv=none; b=N3YaqkhomneHCVNVz1JunZtO3MzDrJhccm3v9rRn8Bdxs+gvGhQkDOm1jDKmm2hpd7xrbP+n16XjlId4FMQ1xQk3oxZAfMzRPO8gdDJymJ5t+e5TASQ1Bx6IW5+zvAzodkLdHq/boyEwTqdLc0+Lvw3osscOrH8XES4XD2U5tMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109349; c=relaxed/simple;
	bh=Io36xFabltKlmTksRgpXo1iJElDnjnzy2Dkrbjit5bM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fw2jwdk/s8j7+cV7jZNS5ZCR2DhCkDjQFLlT4gORYDnSB/TGI/FlYk0YykMTlIXFPSIkoQYVFJxXr7LwsmMCNDvEvblTkrFVhm9yKJQAZmTz/dsD2sHt7KfyYb/PPHube56ttueiCv9GdfWY6WUpohcIlJiQTvMx8omtPIrRQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nw7n/4zC; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nw7n/4zC"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8484a0b998fso3084401b3a.2
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 02:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109347; x=1784714147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9OVTt/KuhBx802gK1GpNosauIrh3LIrN95gUsSLZetI=;
        b=Nw7n/4zCatquu1CQ9eTPqCtBca/kgkAWoJwyPBEAl5Y39eo9GnzPkqcAyJEjGyLUsa
         6/PC7zavT57+HhJ1uCnRQHqWirOb6q2r1TeUEOjYw+z71FPVtU5TPnHe0ZvxHsKuRvA0
         7YOynYqNJA5n/GxjXrW/ioRmPMqNd5ogkydQGA8Fy4ghf4CMzs0HoLS7NzpM8zgO5gZc
         r5uXwZWy61CbI/0qrapDjkdiA3VkdP6w738wQ3LrGX6yOJ7Fx/w8Tf1MvPNmBDGEplED
         c72plKaCNOtwIltWoHvHW0Oo/vhVJtMfkxGQproEjPJjbVbDYxwg5/Oo4vt18MkMDVS4
         WU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109347; x=1784714147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9OVTt/KuhBx802gK1GpNosauIrh3LIrN95gUsSLZetI=;
        b=T6gk8GAuP//ljvMIUvMhjcfcXsPRbpjCqMVaY3Rd2XjVANcAW1jL9qAR7jIfuyT06B
         VVAQxE/kZHU390Lkqle/6BRWTCIso7gaAv0c+2zflj3sXrajkOvBvia9FDpyKo9d7RwL
         0IdbNTuxQLgxLE0USvZqDbGsYBerOwcUW9Ly36m54sEZWv34w9CqSllH+pgrjLtQepBb
         8RznZPsn2Hrf8I8SNaCB0Ij8faJTTL5hhaubp4rOVIKHbCKOuc35/JlTlpzPEXhp7O5j
         r2Vc25Be0TrYFww9U4BsZsbEsP1ByErs3vAKilgwaMXcREX4ptFcrin9hP2lE5sQ6Ce+
         nnpg==
X-Forwarded-Encrypted: i=1; AHgh+RoNyndjkp9a++IUSM/rRJ5VlROKVvg+b6AqufeHDsT3k5i1LYRgy0CTsT70yUBMvhvP9ce258BmVFlwhw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw899HA4+bAxHwL+zP6xCqbDhJI7LL3EK0qASafEQOSq9gxytFY
	diF8OWEmt6wRfsmZuCqyC8clkC+rCvrD8T8u/kxjG4/J+toNlkEBmHEB
X-Gm-Gg: AfdE7cnBZcCF/RDWU8BKJayMxRPjAvCJBpmG7iPb+ClR3Nk2njM6ffSX9pa2wXqBLw9
	3LQ1LvcjsYqHOF1zXEdwka++G0e+qlBoHYAV8nw46BOHp4s8vupDD1KCV38W/pPkoMrxC5f41eX
	9CiHXHbbY+Q6yJUmBYB0QRKfNebJTTJzEcW6tHC7fzaX3WX9sST4pTzxmkQBuqHUCmNAqu3Yiq4
	TIPjuaX2ihvojOJdXZ5nTxyEKqrOoVH+XGDCSR8Ga4D0tLGO1XfqcI/+qWkVogMmhZM5IqDkN6g
	/aIwz2WfoYoMhcHCACcdj4Vca7+ohlCy48kLVmycvIjJCifwIHhanJ0BqyrrMhfx7lywkxdt8iu
	L4G2j97quJ+orK9RxEH4JOs1DvdkOtkvyjHNGUJmZApGfNZKEdYGENtajhPCL1rAaZMqoSMxm+j
	/H4zIA4aZCyx11w2oP5hv0U3mN+nahucOGZWwtxL4ZWD26v2E=
X-Received: by 2002:a05:6a00:b50:b0:848:80ec:5d2 with SMTP id d2e1a72fcca58-84889738aa8mr15665520b3a.51.1784109347404;
        Wed, 15 Jul 2026 02:55:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:55:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/6] ASoC: sunxi: Simplify error handling 
Date: Wed, 15 Jul 2026 16:55:19 +0700
Message-ID: <20260715095525.40668-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves probe error handling in the sunxi ASoC drivers.
It replaces suitable probe error paths with dev_err_probe() to
simplify the code and handle deferred probe errors consistently.
It also removes redundant error messages where the called helpers
already report failures, avoiding duplicate log messages.

Build tested only.

Besst regards,
Phuc

bui duc phuc (6):
  ASoC: sunxi: sun4i-codec: Use dev_err_probe() for probe error handling
  ASoC: sunxi: sun4i-codec: Drop redundant error messages
  ASoC: sunxi: sun4i-i2s: Use dev_err_probe() for probe error handling
  ASoC: sunxi: sun4i-spdif: Use dev_err_probe() for probe error handling
  ASoC: sunxi: sun50i-codec-analog: Improve probe error handling
  ASoC: sunxi: sun8i-codec-analog: Improve probe error handling

 sound/soc/sunxi/sun4i-codec.c         | 89 ++++++++++-----------------
 sound/soc/sunxi/sun4i-i2s.c           | 28 ++++-----
 sound/soc/sunxi/sun4i-spdif.c         | 23 +++----
 sound/soc/sunxi/sun50i-codec-analog.c | 11 ++--
 sound/soc/sunxi/sun8i-codec-analog.c  | 11 ++--
 5 files changed, 63 insertions(+), 99 deletions(-)

-- 
2.43.0


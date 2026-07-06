Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A9141D4F9
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 09:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330352; cv=none; b=BrRr6RZIhdnba7NrV9AqkDNaQU9ikUjoqoAT0Hy07/pqU5EtVGjIppTygrkZkOhXvB11a5ha6QH1mFemIzuMGwxOlTZ2aKBm/R3fkzOWSm204+ZVG8T3TMIbZIH/i4uJmrSkGyD4Cfu4L/zCkljH2udwDGxNUoF5uVfFGj2i16Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330352; c=relaxed/simple;
	bh=7r6e0BxSzZOlBZqjxDeJNnpI3oGS8Amus0XcLy8TcCE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FIgQHpTBiCej/+xPnEGEo57GTZ74+07E7lckboor5b5t38HK9vJ6AbeR4uq6Xvg4YKyRWMYqlJtxpOse8X93sKoLFz+AUUf7sQGTmYBdy/yPWvzcBO5Dt/XM4LLtXjsJy77CzYTMV3SHFdM1GmIF8eyQL+2MZ+aqAq/RCCyMUNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=b5+NCWu3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="b5+NCWu3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1676430f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330347; x=1783935147; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CGWHjLvseR49oiYZ4VJv8W2FD9SlQLrFTs2lm2K5pds=;
        b=b5+NCWu3QXsiO9nJeIQEleZ7IsZfaqB23RGXXCzbgMhewTT11Pd3Huqxj0ATIxnw8U
         G+0pwO64vaaJgecFnkwEiNQXjhdsGtinYOjQ640X0KEvJRyEnjXh/P0en4DkIX2g0Hbr
         CpL6WzFnkn19ZKcztQllZlQXbJ5wdmrKyBrK/0zfwi9KLZ+ag28gJRDqviCpplWJ9AxW
         7SJJ/wZnutfFV+mnld+NpQShaBJBfARfqupDYEgFvot7YKVKUwLYIuTfWwljFEJZDw20
         UlCDdrs0v4qEzAbeJadMCF6dWYyOqcKLVmiY7wMbX2bt4QwTJQumgqNNdelCl1+uKP6b
         WOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330347; x=1783935147;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGWHjLvseR49oiYZ4VJv8W2FD9SlQLrFTs2lm2K5pds=;
        b=q95RXqwB+E9V2UZ/5/ryr7cyXGgeKfXgwTN9sGGNmFuZSANGUrLh1tiXNr0oB2bSHo
         uJ8d4/UIxRRlhs+eo/GOre8lUi+1nKD/ncGNPPiRfGnNr2EfqHDi00RxKPzLzWjvqhCq
         L7aTYSSynW/Mh1ERWTOQbGte5ar+iqFORAF5jIJlKiISgdhfLcbk66cbnt6PjYnX2+Vp
         e1ewaOFk4qrJliM1eDV0dSG2euewgMp0eQNj/fsefLztZfvtkZqSc0J84tCoPj5LaPZA
         IluzsiYl+GlxBeHUg7g4YRNI4GqgzngVD5X/Jf6zMnbAOGc2tWt4wMHOBQJFUC6jJ01h
         57YQ==
X-Forwarded-Encrypted: i=1; AHgh+RriKJYNFzwD5pG1ZXm2ZfMANUDP6YNqq8Q+Qyzi9uHGdcAuf5z9znfME6fnZuMDjVdm2rsnKq4ryaxNhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg2h7zZNJB9QGMMhK8e68RoYp4YgqNmvsaNZLDejXvYZ+VzA+6
	mqxRCE1hxiHn5VmqnS4pK8vb8DtAXBUHE6XBbqaTvobWCSVcelYt8M+Obr4t8ze0TSY=
X-Gm-Gg: AfdE7clU6W0VT9fEfrkygBlygMrl83XSF76MHYnFtgm/sN0B+zG3OGcXCOVwHpm8HtQ
	GFqWDHAPfywJZkpYy+lVQpvsPw2q5Xx9//MptXDrzo5fktSOObnbYdr9j22onLfXlnzK97Er9lR
	AOAS0i+R4o9xcY7Gn3LE5fmca2XLDuGFncwomdPqy1+9tMkvFWozm6KMYNcKowKKomwH8lpGk8f
	rGmpPEzAxVD2B1ESiU/UMENmJ3mEcM9CMQVeFliGPyxnPtPuwKklGnLTmsfB37zjCJS4k6JWO99
	xprAAtB1MTunS3WtrqFtMWJgPYySeCZP+k2wJmhJclM54c7ncpD7iemuFFF1is7mh8Xas7r+F7M
	rxQ2yXVrlsfEwb86Y9pBljNyktUm+YbW9mMq5vIy7rZs7dvCSlB1iN5H2B2GlQCvc/rQymHTW4v
	tacaDdT5MSEQU=
X-Received: by 2002:a05:6000:4288:b0:462:6aa1:4393 with SMTP id ffacd0b85a97d-47aaa60fb9emr9104104f8f.4.1783330346835;
        Mon, 06 Jul 2026 02:32:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d91bsm27289985f8f.4.2026.07.06.02.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 0/9] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Mon, 06 Jul 2026 11:32:08 +0200
Message-Id: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABl2S2oC/12MwQ6CMBAFf4X0bE27LS168j+MB1oW2USBtKSRE
 P7dwgXjcV7ezMIiBsLIrsXCAiaKNPQZ9Klgvqv7J3JqMjMQUEoAw2urFA+T576Uxjat1GiQ5fs
 YsKXPnro/MncUpyHMeznBtm4RIwxcjkgCLrh1FqQEW+m2url6fpELePbDm22dpA7XCvhxVXbRQ
 VkJZXWD5s9d1/UL1Jg0Qt8AAAA=
X-Change-ID: 20251226-a733-rtc-c5167df14e6e
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3103; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=7r6e0BxSzZOlBZqjxDeJNnpI3oGS8Amus0XcLy8TcCE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Yc0UHOfsE1Xd7pmqULYPfQpfhgD9Q5xOmEN
 5uHJa5XDD6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2HAAKCRDm/A8cN/La
 hYKDD/43rfDQ7Hhrw7gxzzrVsf1tZVz4a7BRQskWh9hyhtC2hSRxXyIZWkwuVHLY5ADWStB5wqu
 J8ZdQoEyZ3h7XAW1X49mRdaOQNwtXrI7tBgpAE1diKd23we1YKiala5pNFLlz54QG6q/h22M7zh
 tUt0eX+na3K+FvaOQq78QJyoMC3+egZZ+szZdBu5DdbwxoFwM4bw5TgfNQ6pLO5h/sPpDv4nAtS
 /Se293weQK5PdqjxPKtEqThTC5H8G5tLkxNj9cQr9/VT0c1Ix+5H/wyrBWpxrHs5FyO10BKp9Xf
 zogld4MWweZ17X8TsyHqcT/DnUmvgMHze520cGE7pliJYnv9cwlZfMy2hYwFh+a6KSUyYUWB7pH
 +KR4ju6NGz5rrad0bKpFXuc53E1KG34PwP/N4fAjnT6c9vTat4VOrwLZMGACEzCS0bnv1ecEfKw
 PTCfEeJVG7FYr6SXJzdBoEjm5gsy4DYWk2PBq+23Oid71hbBjv2nCnkwLOM2SOPLOuLjvNfx3gd
 71+MnfTMoI8RDBbl487hTBn4i66guUOJ+uOL61VDlcVdtPPzYTIH5rx/GrnNTGL0NxA5+25+uvE
 rVpm4ZQXHLxU3w/IVvdTUaNw/igOiuR1bqg+pmGW5bSQBbNlvghzwsHg1JNwDu5ohWx+c5gvS0G
 RBMfGm+SxJt4caQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for the Allwinner A733 RTC and its internal Clock Control
Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
SoC-specific RTC CCU driver to handle the hardware's evolved clock
structure.

The A733 implementation supports hardware detection of three external
crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
the driver via read-only divider operations. Implement logic to derive a
normalized 32kHz reference from these DCXO sources using fixed
pre-dividers. Additionally, provide several new DCXO gate clocks for
peripherals, including SerDes, HDMI, and UFS.

This was tested on a Raxda Cubie A7A.

Changes in v4:
- Remove unneeded export of mux prediv helpers
- Link to v3: https://patch.msgid.link/20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com

Changes in v3:
- Disallow clock-output-names DT property for h616/r329 chips
- Fix ccu probe helper to properly unregister clocks on error
- Implement .determine_rate for ccu divider RO ops
- Drop unused DCXO_CTRL_REG_EN define
- Link to v2: https://patch.msgid.link/20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com

Changes in v2:
* Changed DT bindings as suggested. Those have changed significantly
  since v1 so I did not pick up Rob's review trailer
* Support added in the existing RTC CCU driver rather than a separate driver
* Added DT parsing clean up of the existing driver
* Xtal detection exposed by RO divider rather than a MUX.
* Dropped conversion to aux device for now. This is not strictly related
  the a733 support and will submitted again later on.
* Link to v1: https://lore.kernel.org/r/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech

---
Jerome Brunet (8):
      dt-bindings: rtc: sun6i: no clock-output-names on h616/r329
      dt-bindings: rtc: sun6i: add sun60i-a733 support
      clk: sunxi-ng: fix ccu probe clock unregister on error
      clk: sunxi-ng: sun6i-rtc: clean up DT usage
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: mux: remove unneeded export
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate.
      clk: sunxi-ng: sun6i-rtc: add a733 support

Junhui Liu (1):
      clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |  13 +++
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               | 123 +++++++++++++++------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h               |   3 +-
 drivers/clk/sunxi-ng/ccu_common.c                  |  12 +-
 drivers/clk/sunxi-ng/ccu_common.h                  |   1 +
 drivers/clk/sunxi-ng/ccu_div.c                     |  42 +++++++
 drivers/clk/sunxi-ng/ccu_div.h                     |   1 +
 drivers/clk/sunxi-ng/ccu_mux.c                     |   3 +-
 drivers/clk/sunxi-ng/ccu_mux.h                     |   4 +
 include/dt-bindings/clock/sun6i-rtc.h              |   4 +
 10 files changed, 162 insertions(+), 44 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome


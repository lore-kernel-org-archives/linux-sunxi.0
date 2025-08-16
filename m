Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5EA156237
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755334046; cv=none; b=op1o1Q8Ll1IdSYRiKXk6RatkFOMQ85JT4pCgwzobEbT8T5Pl/gkEKqGidBYUKhno2poFXW5F5Ptfm5/v5DbxZQAy9RYcpatTXBSErlSkXURu2/N9fhmhwGKVTqLTfl2lDygtmlgEVvPe+JzzNbneENMooi43fbAgkVzr17slKCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755334046; c=relaxed/simple;
	bh=8PCZnzyRTidqnHyCuNwmg93j5EhJWu3LK3bWlpzsKUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dznkfeg+yRg4uXxjXP3ylFxzZPB1SNER2AHmoYQcXQqnfz7rJqbCLUI894QTMG6pBkB+f2U6PdZcj41FsdGSCjV7ub7XOhkzW8mzf+aqxzNNDZ5T86hXPuJtDlbAySNrjXhvRoyiPDyJz8EavsVg5poiiHqTyzQqyXNpmR/oIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNYKF0Vf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNYKF0Vf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24457f581aeso20754545ad.0
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 01:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334044; x=1755938844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n00OWL+w8sWdTdOAmEeus4NBoquiXkV9tCtbNCC3Db4=;
        b=kNYKF0VfGEzKtj2oCu2A6H49RqkEPkU7SXHZF3ZFuWgZdOssepKAzTI213SpPmMAig
         FSbkMCrRu/bgMzp92uyG9QENIQDGTvs1drXBXiHRXUx48dKoatavRUVSTTBV4+iAFWi9
         gPWhHFtm8pR+vRnDT2xik7XYsTV2+fghQqfaYNIY1ULV4jA+vaeYm272of9HQJQnTOqI
         rwQkET8eae7IUHGZ1oOj3tiNbwyFKuzlEft4kyr1HqvYmJCt9jr6voZieCb5R5KUbtxw
         YUNzfDo+VB5ovDd039YAq2fg3aCQXxxEUweo2wFlSpmLvNNgy25xbhCkm9d+kgPf8xzo
         tq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334044; x=1755938844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n00OWL+w8sWdTdOAmEeus4NBoquiXkV9tCtbNCC3Db4=;
        b=UxXy16ZaEb6EE1SwNYjBRNfurESVkjQwDJDupjtGFKh60HLOrrEO5wDEzFGaVv//LE
         /Q25B73GW0hRQ/jFMXmcI3OPMaRnGXItYP6sHsLlthbsN117yHeCI92dqrckwLX3fuQu
         yBxKzORlWq3Dw5AxMhr1HoIxmbStO2F/qn0mGEnELE9tY51S1UO9F2q+X/SNxJ5FwrKO
         PHda39doX/rhNBw3fcE/HRElhhAuHtsAyzfX4BLfOLhx58BZtSEtePNR6YMnK8PXBsce
         cDWm/f83GkJhBWwhBgoBccxqSBilquki3yI8+wWiQHA76coDSSFDCULXqGhx+iWN/30V
         2PAw==
X-Forwarded-Encrypted: i=1; AJvYcCXpX2PQusW2N60lDhuUmA6OVdAq8hUtpOrU5pcdFmpH9DCn77DA694bUAbUcNdcs4V5xQMKpeVq3chq+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIS16pfdOVrHv2FMrLRwreFPFJolQgPL+5+sYitzYLFbzmbTq0
	wWgqy4rVFTHTKZS51NSlBtqezJ3TyMk+h9CrGTgiV1PP3F2Pd7g/atq1
X-Gm-Gg: ASbGncvRTmXHHGlOrB+BwAlwkr4LKBDc8q9hehC4emZIX6jIdCnLXHAOaGQYt8sjc3b
	+++uWMx0iwesdEuzp5k4RKc4MfsEXJ0eFCMcAWIWspLXNiSp3sKwu9cDEWrkUOOhdOAPnPMqXHR
	UULXHX8d4ihLcY5OkXgpx9lB8J3g1SNU0pk5nHPZtGrBijF/WheGYMuOtdjy/t3zQiCcxvFP0DN
	9q4Ey/iYStIxehf3qVOnr9je88QG6t/S/eYQDBdVz5BjprCIHXEQaGZeWg5YR72nqC6rfQYaZ9f
	M/QKXqJlmKvLGqKk+DPTIG2J3xYr5vZrnNLiDoirzAbmaTwiz8B3wJl/wlD2kzR3UyO/8dQ/03e
	gJocWeyYvicc=
X-Google-Smtp-Source: AGHT+IHRLGNB8SYXmPKw81D1VOKbz4q3gvNOhwVUuxSt8mOuivVjupipoQ1fbt8d5uqOtt3TGwriuA==
X-Received: by 2002:a17:903:22c6:b0:242:9bc4:f1c7 with SMTP id d9443c01a7336-2447909bfd5mr31610805ad.54.1755334044121;
        Sat, 16 Aug 2025 01:47:24 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:47:23 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/7] arm64: allwinner: a523: add USB3.0 support
Date: Sat, 16 Aug 2025 16:46:53 +0800
Message-ID: <20250816084700.569524-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

This series is a draft and does not include patches for dt-bindings.
The first series is necessary for testing on other devices and
initiating discussion.

This series of patches adds USB 3.0 functionality for the
A523/A527/H728/T527 processor.Most of the code is derived from the BSP,
 as the datasheet does not fully describe this feature.

I have verified functionality on two of my boards, walnutpi 2b (t527)
and x96qproplus (h728). When testing usb3.0 on x96qproplus, I get
reconnections of my nvme, it looks like the port does not provide enough
 current to work. I have encountered similar complaints from users of the
  device on Android. In the case of walnutpi, there is no such problem.

Based on 6.17-rc1

Mikhail Kalashnikov (7):
  clk: sunxi-ng: a523: add missing usb related clocks
  arm64: dts: allwinner: a523: add third usb2 phy
  phy: sun4i-usb: a523: add support for the USB2 PHY
  phy: allwinner: a523: add USB3/PCIe PHY driver
  arm64: dts: allwinner: a523: add USB3.0 phy node
  arm64: dts: allwinner: a523: add DWC3 USB3.0 node
  arm64: dts: allwinner: a523: activate USB3 for all boards

 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  52 +++-
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   |   8 +
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |   8 +
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |   8 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  32 +++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.h        |   2 +-
 drivers/phy/allwinner/Kconfig                 |   9 +
 drivers/phy/allwinner/Makefile                |   1 +
 drivers/phy/allwinner/phy-sun4i-usb.c         |  10 +
 drivers/phy/allwinner/phy-sun55i-usb3-pcie.c  | 267 ++++++++++++++++++
 include/dt-bindings/clock/sun55i-a523-ccu.h   |   4 +
 11 files changed, 392 insertions(+), 9 deletions(-)
 create mode 100644 drivers/phy/allwinner/phy-sun55i-usb3-pcie.c

-- 
2.50.1


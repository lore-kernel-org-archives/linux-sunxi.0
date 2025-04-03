Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3228735949
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Apr 2025 05:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659535; cv=none; b=jqZ0WAY4yOCXBZcXwDz3M32yGv1Fu8Y7UlMGBI7aHrHoC6bN4b3yBIeKxsACGnLDcLZPHhLaHPD8ajFEMyYPeas4hYF87ePrPgQxNK4/7Rkb04Q0O6bY9uQrYpM5SwLoPdvPk6ZVqj9IZy1DEZ/Wwnli/cRw+7CV6p3Toqgo/Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659535; c=relaxed/simple;
	bh=zDE12dZbPquxzL4QXG7ftTQeZ/a+U3RrlIe4P2CgutM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D6NnZQq/DD3qFQx6K9zMtZWtCZXmpE0n0AWHmU9WpuCn8+sTzkWOe2PTn34Z3JWGovcpu2dJhuYsUlEWIFdpFbocKXSTsC+3AAjIPobN3j7nrOVxpeTOTpLzh18DBrdEOfyxo3vCZSj9GT36jqym6ys9EHKcEj/GM0I/3BFu0qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LatEq2Wu; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LatEq2Wu"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so866443a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Apr 2025 22:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743659532; x=1744264332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17m4YPBaKG8yoX+eqXaayPR/DLuiNsoeilkLB3ayQyY=;
        b=LatEq2WuLUA0M+WhHKXLqNmJcegHghpPCGRc09lbcC2oEdid5OXcSYsJrBLGx7PH8L
         uFaI0keP+A/p8Q5VnhN5eRrhI99Ynm7iBss05FoqVN6sm5QEnARNpBfXXadJlqNZysUX
         18NPmRfH1WAbYo5SxP8cxwfvqjxgL0H8sd1nJBTe3oYPPd5Qv7Xsn/iwL36z+SZBBR7d
         1IQSf5XUzMMDcJDCbYEEYsZSQnQNEMq+DYKgFz0AzjPhVgUBI6QItzriFFvXsngZ3HSW
         1enetXFzpd9tv4r9wxOPizt/AnCl8LYYvYlVsy2SOu79kZ0OL2w2UTkdnMluz1gfX6/y
         PD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743659532; x=1744264332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17m4YPBaKG8yoX+eqXaayPR/DLuiNsoeilkLB3ayQyY=;
        b=cD76ocfVAPP4+qg8BzS1Y41Em81LtOwVD9KDf6NmpErIktPUO/9Qoixjm5ZLdjnmTG
         fn+LooddiUWusN5NRr1pVzc9Roo4mkt0N2PxJUtFxaPNzf6+DyUxj/dOKgXDgN5RzRVc
         luRi7l2lAqMBMyTgXHgi9mBuYrzYJ/RSW/X6K88deYSXHlqbAQwMu3vY4CLvcG61iEIT
         OokgWa/iUo0gjll4/7SA2D5/h3Qsc/aP0wtx0K6JVihmyySwHUwLAmctgzOTPjlpnKnA
         V51BuAqOspeQsxXpZ83IqoSgRVZhG3K3JSrpwxLQAU5usSHK4m52lfPpR73VQTpJFuz8
         DW/A==
X-Forwarded-Encrypted: i=1; AJvYcCXDIQkfSJVwKxTfBJ7WzYjZOtOpeQj08yWsI4iWnUEdOihzjBuKpSH1ScdqCI1826XqAB+dQu+z0UGrGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ+WZhJZoAN/VuYUMAcZp1AKKUKmBOqOv8blZQWdx3qDp1Fqc7
	Oj5RcruZHJJb8ezCvREDROOft3GXL3LaRvjRxf8WHB3vFT+lgemV
X-Gm-Gg: ASbGncvCTMTqeFf3LPjblMeq6avxwuXO7tuPZwL5HAjHAaNud4m+HZzWWpeKAGf/CqZ
	sGjAVBHqEvsvE0T0V8kGzfbCKuplkyjc6vbB2bxusXLBIpLAGDQURdtld6QHx6iubO6K5T8aLMM
	trfUZdAJ/WwLdsfiQekPiRr8e+e46XQNrbRARQokslNDZavkeD6hWeh+rOIqTd8iESm3sNT5rAR
	G6LgdDvdFI0jhizS2I7rSO87IikwocgqI6MuD3w92HioX7V3cchlvJpSs7lxeTJTdPSXl3DRTx1
	iOYk/Nzrs/RWUCaXViPMoVScpOKvcMuPJrpQBbcbhcPKteXYO4OnDE9yFX872kmdXrbsN7KSbYq
	Gpr6Khfnatl5WTjOvOObmFdcKNmllB7M=
X-Google-Smtp-Source: AGHT+IGn7WQedXxz0rx36gPTcBptmyeHmicMz4PPof+Ps0DnBpCvdMJcrUMxhz5G4Sp9jz8Aq1BLxg==
X-Received: by 2002:a05:6402:40c5:b0:5e6:44d8:eced with SMTP id 4fb4d7f45d1cf-5f08716cc7amr836988a12.12.1743659532244;
        Wed, 02 Apr 2025 22:52:12 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087714e11sm417236a12.6.2025.04.02.22.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 22:52:11 -0700 (PDT)
From: Philippe Simons <simons.philippe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	=?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v2 0/3] drm/panfrost: enable G31 on H616
Date: Thu,  3 Apr 2025 07:52:07 +0200
Message-ID: <20250403055210.54486-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner H616 has a dedicated power domain for its Mali G31.

Currently after probe, the GPU is put in runtime suspend which 
disable the power domain.
On first usage of GPU, the power domain enable hangs the system.

This series adds the necessary calls to enable the clocks and
deasserting the reset line after the power domain enabling and
asserting the reset line and disabling the clocks prior to the
power domain disabling.

This allows to use the Mali GPU on all Allwinner H616
boards and devices.

Changelog v1 .. v2:
- merge flags to a single GPU_PM_RT flag
- reorder init/deinit powerup/down sequences according to
  Mali manuals.
Link to v1:
https://lore.kernel.org/linux-sunxi/20250312232319.25712-1-simons.philippe@gmail.com/

Philippe Simons (3):
  drm/panfrost: Add PM runtime flag
  drm/panfrost: add h616 compatible string
  drm/panfrost: reorder pd/clk/rst sequence

 drivers/gpu/drm/panfrost/panfrost_device.c | 71 ++++++++++++++++------
 drivers/gpu/drm/panfrost/panfrost_device.h |  3 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  8 +++
 3 files changed, 63 insertions(+), 19 deletions(-)


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
prerequisite-patch-id: eb8a11e2b24bb282970d8b8528834dea7ee392cc
-- 
2.49.0


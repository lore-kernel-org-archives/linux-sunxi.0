Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D111DA2C
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 20:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mlf3/tnt"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c6e2a47f6so1170625e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 12:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703104570; x=1703709370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gab6lAEWInYI2on8pVOUw7Ug3N1N4atZPO1lxaglfow=;
        b=Mlf3/tntPPpxzkWfHzCIRtD7DwCna+UWgyAumsjcddx7lrSbZFD7pJjbedOh+0oWXR
         MHW7v6Dg25V50oS51f+4RVxa6DgFPWl/yI3TlciNw8BHORMIGDQZH4NKQIUy7lAfNqd6
         w5BKkhQF4X/R7M1waSMhenbytnwonkradumiwFEdYew7BNwKV7rmTkYrM2HwRzDdc04M
         db/Je2tQNUCdwIeUT5H976Xx/P4hEhqJ/BOAuOhHYxrpgm1heU5wAMRivfn3Yh2xF7rE
         OZFUO/Zwk2FwQUNZmmZSdHfX537fC4/9k4OyAyYFw9VS1psEgVi9ISz/xCaCyeFnmAQ6
         oZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703104570; x=1703709370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gab6lAEWInYI2on8pVOUw7Ug3N1N4atZPO1lxaglfow=;
        b=DuRvS15eWyDZV+ZO6VKUPW5WYdrcJhf2uXVbNrfELmBk+EqCpFfeZqL7mwKLJy5xB9
         z+b6zG1yMdiGZAo+OzDp/DjG+FjHLFaNnpRDP+5vyejrO+WaNNU0p3AwDFejRA90dN9u
         RdLCUzcHAiCKA7dTEZE88HkSxG+DvU+UqGxx6a8PzKUNDNZBAxthB/jCTUdUWeaPH+di
         R4lz71eXl134Soug3FsMElxcTjJEy9uzCMfLUQLZdhlW1mdIEkaC7rL1+M0X0TmCNy9g
         IFLcIHRVCZRNzsFlEiMsNf5m13SRqZrUZ2EhayjQxUOifPPpTWaLUKXFGOGjy8NXCKRh
         cz2w==
X-Gm-Message-State: AOJu0YynZVNA2q/4kJvPoTI7KUrAlZBRVroWIlOKcILyQUxknt41kkB4
	gk3kimnqRfZhWg0g9wtPzt8=
X-Google-Smtp-Source: AGHT+IG7/pATF5SbDyVvRmck3xB4G+FEKhoLKpI3NCY4qj24Tl8dGaUxllvbsMityLj5lXSpUtPePA==
X-Received: by 2002:a05:600c:1387:b0:40d:1a5f:8abd with SMTP id u7-20020a05600c138700b0040d1a5f8abdmr64059wmf.291.1703104569941;
        Wed, 20 Dec 2023 12:36:09 -0800 (PST)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id v14-20020a05600c444e00b0040c58e410a3sm8703224wmn.14.2023.12.20.12.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 12:36:09 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	wens@csie.org,
	samuel@sholland.org,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v5 0/3] arm64: add ethernet to orange pi 3 & one plus
Date: Wed, 20 Dec 2023 21:35:34 +0100
Message-ID: <20231220203537.83479-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is continuation of the work done by Corentin:
https://lore.kernel.org/linux-sunxi/20221115073603.3425396-1-clabbe@baylibre.com/

In short, Orange Pi 3 and Orange Pi One Plus boards have ethernet PHYs
which are powered by two voltage regulators. They have to be powered on in
correct order or otherwise they are not functional. Please see link above
for previous discussion on how to achieve that.

Best regards,
Jernej

changes since v1:
- Add regulator_bulk_get_all for ease handling of PHY regulators
- Removed all conversion patches to keep DT compatibility.

Changes since v2:
- removed use of regulator-names and regulators list.

Changes since v3:
- fixes kbuild robot report

Changes since v4:
- dropped merged patches
- reworked PHY powering on/off patch
- added Orange Pi One Plus patch, since it has same issue

Corentin Labbe (1):
  phy: handle optional regulator for PHY

Jernej Skrabec (1):
  arm64: dts: allwinner: orange-pi-one-plus: Fix ethernet

Ondrej Jirman (1):
  arm64: dts: allwinner: orange-pi-3: Enable ethernet

 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 40 ++++++++++++++
 .../allwinner/sun50i-h6-orangepi-one-plus.dts | 29 +++++++---
 drivers/net/mdio/fwnode_mdio.c                | 53 ++++++++++++++++++-
 drivers/net/phy/phy_device.c                  |  6 +++
 include/linux/phy.h                           |  3 ++
 5 files changed, 122 insertions(+), 9 deletions(-)

-- 
2.43.0


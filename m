Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D6E1C26
	for <linux-sunxi@lists.linux.dev>; Sat,  6 May 2023 07:31:53 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f315735514so120034275e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 06 May 2023 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683358312; x=1685950312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=phdCEqZu3n0Q0Wg7bdC8dDiY0m/BBOG9trxmvJBnuV0=;
        b=EmYJDALXFxdDPFsrmRDu+d/XkHAg5PrzsgGsu7gdmUPud/ECs6SeQyohi3vUiNJhf1
         3nRrANbV+2MRtwrT99zmzM17zc7S0pDrMd/MF/XCBu0McLhkDk4GVEdbK5U9Y3UCBqRx
         0DhzxinyLRO5fNf9MxvVHEdTNY3n4yJ0c3nG5+Y3Y2vPZ+ILKiC+1lUIoUQ8ku1v0wz8
         E7U0dVgDtJezUZwtAN6DMU8bONc/GbGyINwsvjCfRGVwHJwN4m3oUWRKqZMxR61D7hXN
         z8uTpjqwgdZ6iTk4hJsD+/UqWUjKHQARk6zAsmcHGN6RGY+rUke8efCi0pSFddgAbdJN
         zkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358312; x=1685950312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phdCEqZu3n0Q0Wg7bdC8dDiY0m/BBOG9trxmvJBnuV0=;
        b=PygGTh2JwmqfgHHRJlgL3XU6PqYvIKeGeqc1aQalOC6rWI+lXjOIoASQ1+EhOHUy43
         0otctFKfVAH9K6895Bt+LjbXl7nfmd6uB6IO/MJGw/WmQZcDw7wNGpTjCYvPXz2av7FA
         XMiI4zeWAWfcOEzf8KX885JW2ZAkBcD3vbL4N+sMoQ0CF1Asdsgfanjw02YYvKP8YAP+
         DJwxk2IuLkkZ+qwHNQUgTOCDj7BiUbG+4N7re/amg4B6GkO8P2rNHLqHAz7tai0KLyte
         83e60UTniCdoANM0VS+k5uZQuld+mgVNVimoZ3w9MpL95sK89+em7yVnHez7mOTZO08K
         eTTw==
X-Gm-Message-State: AC+VfDy18TUVvprDT/1/yP3WR2PyPChon6o96g1XBFplgacI28a7R2Ec
	pafXRmCYNdSG3cXXBBmY6fw=
X-Google-Smtp-Source: ACHHUZ6uYqqHl1zE5ssDd0SB9fMCXSY/0N7JQuBfmBIoG8JTeduQMOsvb99MhYcItZ9oquxrH0l3tA==
X-Received: by 2002:a05:600c:35ce:b0:3f1:96a8:3560 with SMTP id r14-20020a05600c35ce00b003f196a83560mr3424900wmq.10.1683358311473;
        Sat, 06 May 2023 00:31:51 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003f182a10106sm10071944wmj.8.2023.05.06.00.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 00:31:51 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/6] Allwinner R329/D1/R528/T113s SPI support
Date: Sat,  6 May 2023 10:30:08 +0300
Message-Id: <20230506073018.1411583-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is attempt to revive previous work to add support for SPI
controller which is used in newest Allwinner's SOCs R329/D1/R528/T113s
https://lore.kernel.org/lkml/BYAPR20MB2472E8B10BFEF75E7950BBC0BCF79@BYAPR20MB2472.namprd20.prod.outlook.com/

Previous discussion about D1/T113s support
https://lore.kernel.org/linux-arm-kernel/20230505224611.00c281f6@slackpad.lan/T/

v2:
  - added DT bindings and node for D1/T113s

Icenowy Zheng (4):
  dt-bindings: spi: sun6i: add DT bindings for Allwinner R329 SPI
  spi: sun6i: change OF match data to a struct
  spi: sun6i: add quirk for in-controller clock divider
  spi: sun6i: add support for R329 SPI controllers

Maksim Kiselev (2):
  dt-bindings: spi: sun6i: add DT bindings for Allwinner D1/R528/T113s
    SPI
  riscv: dts: allwinner: d1: Add SPI0 controller node

 .../bindings/spi/allwinner,sun6i-a31-spi.yaml |   6 +
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  21 ++++
 drivers/spi/spi-sun6i.c                       | 112 +++++++++++-------
 3 files changed, 99 insertions(+), 40 deletions(-)

-- 
2.39.2


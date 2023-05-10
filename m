Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9BB258D
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 08:11:34 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f435658d23so9695605e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683706293; x=1686298293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kaQpRP2PJulxYaO5bFooRdj1QYIO1irnm40lBiyMQfA=;
        b=sGsXHOCDB1/G09BwgMcl3P9fyGYxgKy3Lg32VYzLCmWTMGjuN0Og+jZ0pYkjWmJ+5g
         Zne7CNel0vAodrw5NQr0bOgH68uTNzlfPNUgOZih9LMJX34lTXhuUPDGfgqtgSPuZorD
         V5zDRnIsfctWawQ3dOXE/g5ejxcI6zl/SJ4lDMuFRKal66KSfKiuSpbsz5O/jm8G2AiT
         W0IKm5IiAosack2KCtEDLu4JqSlUXwA83mrxWFPMLAczYSXHSov4urgeJwcOT57yeSpM
         K1N5nEUZrTC25G/ngzvFsXq5BWuj820aa+EmvpGlp//SWdi2RunF+IErZPV9Y51Z5ml0
         7Ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683706293; x=1686298293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaQpRP2PJulxYaO5bFooRdj1QYIO1irnm40lBiyMQfA=;
        b=iAqw8+Ijgm8GzOIGd0hDq5RCqlBhonEhzPat/yBI1x65bkRLDcByuqKB8J/v7DhfDv
         CxOD8639VbLaoaPDey9vzGhj/ZfPQw0H7PAZzCUtbL6fThOvzQDkD1Dl13shw+r0lRx8
         c8SoUMpN/qYD2vDoIownZeXcrOw5N1M8k82rbzrn8R7VlEMzfL8n518LNmKKK+EowYGM
         ESNqI+mHZqnGtB/Ow6qv9OZgzmZSmqK2vie2jIOVazKP6r+jXjqVrIygKhZNYq0TGHRi
         XFeiVjRCFpvYHADn5vArZXVzHGuKf1mt44JRHSytUt5DWSx87B1ICx5MdzTWLeA89eC0
         OjSg==
X-Gm-Message-State: AC+VfDyUDFit+frSfMwlA0Zm6JBHZ9Tf5GIoSuHw5wS7YkOoMd045Ryq
	f7+A3X5gEYRqDGIl0on5CZU=
X-Google-Smtp-Source: ACHHUZ6nA8An0kWETX3sBghZaBOHEHWZkW9kJemfajv/KifLNkZtMoHeOoheAEpkUZYo+RyRDOmVEQ==
X-Received: by 2002:a7b:c356:0:b0:3f0:3c2:3fa4 with SMTP id l22-20020a7bc356000000b003f003c23fa4mr11776779wmj.12.1683706292779;
        Wed, 10 May 2023 01:11:32 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d4dd0000000b003062ad45243sm16496375wru.14.2023.05.10.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 01:11:32 -0700 (PDT)
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
Subject: [PATCH v5 0/5] Allwinner R329/D1/R528/T113s SPI support
Date: Wed, 10 May 2023 11:11:07 +0300
Message-Id: <20230510081121.3463710-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v5:
  - fixed DT bindings (Allowed three-string compatibility)

v4:
  - fixed SPI sample mode configuration
  - sorted DT bindings list

v3:
  - fixed effective_speed_hz setup and added SPI sample mode configuration
  - merged DT bindings for R329 and D1 SPI controllers
  - added SPI_DBI node to sunxi-d1s-t113.dtsi

v2:
  - added DT bindings and node for D1/T113s

Icenowy Zheng (1):
  spi: sun6i: change OF match data to a struct

Icenowy Zheng (1):
  spi: sun6i: change OF match data to a struct

Maksim Kiselev (4):
  dt-bindings: spi: sun6i: add DT bindings for Allwinner
    R329/D1/R528/T113s SPI
  spi: sun6i: add quirk for in-controller clock divider
  spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
  riscv: dts: allwinner: d1: Add SPI controllers node

 .../bindings/spi/allwinner,sun6i-a31-spi.yaml |  10 ++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  37 +++++
 drivers/spi/spi-sun6i.c                       | 131 ++++++++++++------
 3 files changed, 138 insertions(+), 40 deletions(-)

-- 
2.39.2


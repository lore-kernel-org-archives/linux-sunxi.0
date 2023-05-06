Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932D1C2EB
	for <linux-sunxi@lists.linux.dev>; Sat,  6 May 2023 23:27:02 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f19afc4fbfso31574175e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 06 May 2023 16:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683415621; x=1686007621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2FeWgpYGVgw05x9NXcehpvxe6YOrGKp5PKb2y+cAxE=;
        b=aclnyCppp/OmsCpCe1DSKh3rn0yYLZ2xnsF55M4+R7iOOYjFgjr53u1m2Z9zIrGbzX
         NlAByOYA2QZ9Jmsqw7IgqtddayGPyJCz6vv9QczyU1B/WEl7NJ+VPYK1yV6h5xgq1SCM
         kHozxKV8JynSHihZodBoR5voiy2okjHCZu6s6/H3QSag40kw+gCfD71GUuAr/pusuYtY
         yVJgaKWGyrKKjG7wiSbQr3z6yjvErhE5veGYqSQ8m05r0xpBjBupIIZjPcn/OzF+I1NQ
         iUhN7u+g2qiSZUfRcvzh31anBjVA2xOcsFp3bmJw/OIQ16IBHFZn+z6tTiK/OG0bNKIp
         3Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683415621; x=1686007621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2FeWgpYGVgw05x9NXcehpvxe6YOrGKp5PKb2y+cAxE=;
        b=CO0CZlUP5zO4zyTaUwngKTQTnORa9sbXVBh8wYJ7oDUqBe39frUqHrjI/IcIW8NaMz
         jAxRT+lIlbW3fpEDTqFw4J7wptwa54qN4FeWirfk8g8KpdULI9QZmj92sPBc7G2XvQCe
         Zyt6JCOD5uYdfOj01N1Vl7th5GDvfAJVzV0v81L/h+wR9b+B5AMrDe8EpTVl5zod70aE
         O3asy3q+9r2rN/3DYcGgKHApxb9JgxFq6y+LG4plAWVF1sv+zfssr/Lfv7ZyXaO2I6Mo
         CZYdMMAyYUnJniebixsbSwgedMe8jZKWMYfI1ToQ2M37/7mA6+eDYy7tZ7fjRv30NKQ5
         +DYA==
X-Gm-Message-State: AC+VfDyDRqPkNaE6AMvBWCVL2hQ3HkvcqPOSKq+EG4+/LcXYiHstCRmN
	UVuGH/UikTWOyOcvXv2cO7U=
X-Google-Smtp-Source: ACHHUZ6aXW+eEEp0ETGPH/k3zEH3JlzcT1+1ZrNspVjJp7yeJW1KVWql3w4Lr8zfryZlzHKsOOYuUg==
X-Received: by 2002:adf:fccb:0:b0:306:3899:ccbf with SMTP id f11-20020adffccb000000b003063899ccbfmr4455889wrs.14.1683415620621;
        Sat, 06 May 2023 16:27:00 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003f1739a0116sm12098655wmc.33.2023.05.06.16.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 16:27:00 -0700 (PDT)
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
Subject: [PATCH v3 0/5] Allwinner R329/D1/R528/T113s SPI support
Date: Sun,  7 May 2023 02:26:03 +0300
Message-Id: <20230506232616.1792109-1-bigunclemax@gmail.com>
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

v3:
  - fixed effective_speed_hz setup and added SPI sample mode configuration
  - merged DT bindings for R329 and D1 SPI controllers
  - added SPI_DBI node to sunxi-d1s-t113.dtsi

v2:
  - added DT bindings and node for D1/T113s

Icenowy Zheng (1):
  spi: sun6i: change OF match data to a struct

Maksim Kiselev (4):
  dt-bindings: spi: sun6i: add DT bindings for Allwinner
    R329/D1/R528/T113s SPI
  spi: sun6i: add quirk for in-controller clock divider
  spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
  riscv: dts: allwinner: d1: Add SPI controllers node

 .../bindings/spi/allwinner,sun6i-a31-spi.yaml |   7 +
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  37 +++++
 drivers/spi/spi-sun6i.c                       | 132 ++++++++++++------
 3 files changed, 136 insertions(+), 40 deletions(-)

-- 
2.39.2


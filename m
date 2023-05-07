Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443813D67
	for <linux-sunxi@lists.linux.dev>; Sun,  7 May 2023 15:05:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f182d745deso36563315e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 07 May 2023 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683471922; x=1686063922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u1gOIjKe06QTC2zFJd76oybW6RyS2NvpPacxfKSj0+o=;
        b=qfI8xnweP237OM6kO0nttjGF/sPZ1FyaqS37OyLfJUkMl26Q8P/D7/t3H2ZUcN+3hY
         NkzI4xWQibUtdLJgaN5pg5zu7cRkiZEUvqa0h6FeInj2IY1hyiHec/2nwhEvsHJKdx36
         D7c80OfSJf2jRa5fbHjAA+WpN00egLzqo4IYONlqPEKs+JjBlJeQPQKAS3qInBf0o6N/
         JBCJBkr4ReYTtOXXRHdGdGEpbdENxHw4DDIm6IWg9mPt4uNNtly92dbbrPscfT4rqJar
         +0IJz67j9SsHNBDAa1DxACr0LJUZSSWGtdsEmz8m6xxik9MUl7PC9xZawXL4BN/51PC5
         4/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683471922; x=1686063922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1gOIjKe06QTC2zFJd76oybW6RyS2NvpPacxfKSj0+o=;
        b=X+IP43/dOQghlXcMFBIJSkuGG5uEQZbchJX/Z/7j45wRsiDZrTSIKJ+pWQoP2+F0P1
         1U7whkagLLhpN+8MBEBHhiZKdldFcGMT5nOHVoTU9BYshpyRNIQLwIxHCamwwrou4N6Z
         i3GnsxTC8YPzOEqCKkA9IzB9VermDFIj6dkKgQLifIP7fj0M89IvdgNDm/FgDyFlIIY/
         UZNXTN13z97WerfWzonsONGxUfdcnHibhv78Zgge1ZE221PUrEy4loji7YjX1H2fkFSm
         LivmqpelsJ3H2tVfAmb8fk5L95+BfZwpRAkEifEmV9JAM2/eZ82luMnFSJFAkEaGjOux
         zghw==
X-Gm-Message-State: AC+VfDw/Nxkwd3wZb9kNmCEx+nzN40YoLhH8A1arGARY448wD/YMny2Y
	IsKa6qT285tI6N2fZeQwM7M=
X-Google-Smtp-Source: ACHHUZ49sAKwYQSdkkwmMAeCU56EtVFg4Uecv9K3y8A0Pd7XH4negQYK2N3mKJ+yafcQ5q+Af0p9lw==
X-Received: by 2002:a5d:53c7:0:b0:306:2db9:a33a with SMTP id a7-20020a5d53c7000000b003062db9a33amr5647820wrw.33.1683471922170;
        Sun, 07 May 2023 08:05:22 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b0030771c6e443sm8437998wri.42.2023.05.07.08.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 08:05:21 -0700 (PDT)
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
Subject: [PATCH v4 0/5] Allwinner R329/D1/R528/T113s SPI support
Date: Sun,  7 May 2023 18:03:32 +0300
Message-Id: <20230507150345.1971083-1-bigunclemax@gmail.com>
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

Maksim Kiselev (4):
  dt-bindings: spi: sun6i: add DT bindings for Allwinner
    R329/D1/R528/T113s SPI
  spi: sun6i: add quirk for in-controller clock divider
  spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
  riscv: dts: allwinner: d1: Add SPI controllers node

 .../bindings/spi/allwinner,sun6i-a31-spi.yaml |   7 +
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  37 +++++
 drivers/spi/spi-sun6i.c                       | 131 ++++++++++++------
 3 files changed, 135 insertions(+), 40 deletions(-)

-- 
2.39.2


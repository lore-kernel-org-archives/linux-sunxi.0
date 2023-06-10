Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEFFC8F6
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 20:20:19 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso30589095e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 13:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686428417; x=1689020417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6veMoFRMw+mrtF1yxzC2ify8pEornOAoyuTz8mJA8NA=;
        b=NIwhRaJBODeG4Qvt2HvUBSbczoan8yUd+0/a7dPs36Uzylxst6dy2ceUgNZiez34V4
         n6b1zbsUYxULpcZ+fJN3mzNMZiazljZH9srZ8n63t/4J5xc7scokh2Jl0b+qqZx0M8pB
         kRsVPbMh6IPxsIVV5Jz8CfwFzRgJ08TwjecfcByfFrV/iHUGPJXZ0iUJh2PnLmwzZ0yU
         CS8IhoD/hgJ6qzn65ieuVIal1HmBX7uu3KIJpWGEBVSNnjNHDiJfr9J6Lhq/kvvmIHFS
         GPQSDWN7PdeqOR01L+HExe1TtkBovvlpOFX8Tu0jtHXUYJ4+RsECddaf+eNkYUnM5Owe
         Ndjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686428417; x=1689020417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6veMoFRMw+mrtF1yxzC2ify8pEornOAoyuTz8mJA8NA=;
        b=LxOVwR99EgV/PMkRs2b3yBLZLmybB1AexLaCGVxUrGUlEuZk16XZJvApWkbIcb5g9B
         lMnLSPBMgjcWdbaDhIULJxpjPbDkt9og2NE91UFZRSCFQWqkL7OF/q9UZxFA3fDuARgw
         N2Opy8UHu6xymQ/KhxOzggNAIY88fIfRp3xElGlnux2mGhu9LrXKKUCONQRI0J1Xdglh
         Txa9ea6UQrc5gnN9h2sGaia9alBlHH/VT0k82suJmcLC+BaZriD02kffpGamVEwEroXp
         U1tEbJZITLda/ltU/GiOFQMFRBGPtORol1qMWper7DBfk+XKxCwT5tHSeafpGdgir8O+
         ht6w==
X-Gm-Message-State: AC+VfDyr2Qp6nSPqrVtN7aKfGWF7a6Sayy1wgWGjz03xEBvbTD+Xy9ur
	i0RcsvqmbWL7iBBNKhJPhtk=
X-Google-Smtp-Source: ACHHUZ7jXEwdhD97ji2lStt6LDelNDojinclwgg9J4AiIe9xgEZv7EIwvQ/WmQEeEGdX3M3r6+0gqA==
X-Received: by 2002:adf:ed4f:0:b0:30f:b425:a2d9 with SMTP id u15-20020adfed4f000000b0030fb425a2d9mr1669324wro.27.1686428417234;
        Sat, 10 Jun 2023 13:20:17 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id m11-20020a5d6a0b000000b0030b5d203e7esm7878116wru.97.2023.06.10.13.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:20:16 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/3] Add support for Allwinner GPADC on D1/T113s/R329/T507 SoCs
Date: Sat, 10 Jun 2023 23:19:47 +0300
Message-Id: <20230610202005.1118049-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for general purpose ADC (GPADC) on new
Allwinner's SoCs, such as D1, T113s, T507 and R329. The implemented driver
provides basic functionality for getting ADC channels data.

Change History:
v5:
- Fixed DT bindings properties for child nodes

v4:
- Fixed DT bindings warnings
- Used GENMASK to clear the irq register
- Minor formatting fixes

v3:
- Added DT bindings dual license, fixed property order and example formatting
- Added explanations comments for timeout and mutex
- Dropped unnecessary regmap and used readl/writel instead
- Added error message about getting channel number
- Renamed labels and variables to make them self-explanatory

v2:
- Added lastch flag to avoid addition work for already selected channel
- Added reset assertion on module remove
- Added dynamic channel allocation and dropped iio_chan_spec arrays
- Changed IIO_CHAN_INFO_SCALE type to FRACTIONAL_LOG2
- Dropped separate compatible strings and configs for T113s and R329
- Fixed includes
- Fixed Kconfig description
- Removed duplicate probe error messages
- Used FIELD_PREP for bit setup

v1:
- Initial version

Maxim Kiselev (3):
  iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
  dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
  riscv: dts: allwinner: d1: Add GPADC node

 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    |  91 ++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  10 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/sun20i-gpadc-iio.c            | 281 ++++++++++++++++++
 5 files changed, 393 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
 create mode 100644 drivers/iio/adc/sun20i-gpadc-iio.c

-- 
2.39.2


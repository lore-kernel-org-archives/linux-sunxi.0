Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C385E6FBB
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 13:27:44 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30e412a852dso4756448f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686749263; x=1689341263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0JybOUC/usbiCh45KPFPiAH4HAFzWlMk/CzyDoXTHvw=;
        b=CG5wzZzFulGLaWBywnh8vLcrY5OVo7hkm5vSWNCEWtnOD85u9HtIENjHgSX00MLAsH
         qa1qB3iNLBrezxUoLMEdmxxjmvmTlHXnEeQfYsfR83kLYB2+oCUgJg2Z2BIgmtCG0h7S
         1M0jGBwIjGFly8IEGPyYxAdpHVZKtKkZToP1z1C7o/2wJsWtA+elysJk6qCbeFMDGq4X
         +XNPjuFC4FIKWTLS3ssWD0VM+EX5hsnxHB2aMBTPgXZkFccBUFr6hQqEIoXgmqDIHQC/
         LPrDBYesH7bx47sKqMk6NTLxytV0TYoMEi36NLiH4w+xUkQewjU/2VuXYRo2vaEdmPXh
         x1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686749263; x=1689341263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JybOUC/usbiCh45KPFPiAH4HAFzWlMk/CzyDoXTHvw=;
        b=TwMkUTNa7pcf/Up0W6ePDONtZMsScxa0CNAHpCwo/2wEX7aRyR62VWqOoo+kiZ3Dji
         vawuTLtmyQLXYTTfJglVL/qPZTdCti5tGTVTamMQ4B+oRsqlHXqqMzv0oa4lR7DKFQ7H
         +vYWOSKhh9+sY7kApS+dowOktYoVVOi28xUqORFut4he0Z5kV9kCdPfioR8FyuwGUkrh
         mTeeIyTFSULYgbQREs/4ljss5HzpEmyioc+ypLqDPvmDAtLRxLH3FW9RE/eKqrZD+Jji
         ec5RMCfb67qlT5V1sxy1nMXeO4OpwxUpcODxBWVlA/meiWf+miENWaLC0eDfbqy4bw9Y
         TeRQ==
X-Gm-Message-State: AC+VfDw1FkjmW8d1ILUKgvwpwunxqg/Y/PNopjaP6AHnrwfgy3v1IWoA
	xNN/kHb31Lvm6hdeH4mC1ok=
X-Google-Smtp-Source: ACHHUZ6B95mYcyIWglkX2AJPo2Edd/kEP1c2r0xHxgEWg3TfS9jBQwDsg+SwBmR7NaedLam4ntbNUw==
X-Received: by 2002:a05:6000:51:b0:30a:f3ca:17bb with SMTP id k17-20020a056000005100b0030af3ca17bbmr7486540wrx.35.1686749262663;
        Wed, 14 Jun 2023 06:27:42 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4bc6000000b003047ae72b14sm18295017wrt.82.2023.06.14.06.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:27:42 -0700 (PDT)
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
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	William Breathitt Gray <william.gray@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 0/3] Add support for Allwinner GPADC on D1/T113s/R329/T507 SoCs
Date: Wed, 14 Jun 2023 16:26:24 +0300
Message-Id: <20230614132644.699425-1-bigunclemax@gmail.com>
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
v6:
- Fixed DT bindings regexp for channel properties
- Dropped checking the max number of channels from the drivers code
  (This is redundant as we raly on DT bindings check)

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


Maksim Kiselev (3):
  iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
  dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
  riscv: dts: allwinner: d1: Add GPADC node

 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    |  91 ++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  10 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/sun20i-gpadc-iio.c            | 276 ++++++++++++++++++
 5 files changed, 388 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
 create mode 100644 drivers/iio/adc/sun20i-gpadc-iio.c

-- 
2.39.2


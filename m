Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C6751806
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jun 2023 22:31:32 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f6e1393f13so13912425e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Jun 2023 15:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685658691; x=1688250691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=osoH9NCUgVkUT2GWNEII1U4b/cNjTB8p6KRKoRqNDT8=;
        b=naj2UO5gI1HpInnq8r9brslsJi6aK6GHpQ+JlqqQEu8p5t/EllUoZ9IIo+UBfEVF2W
         tdBt9KF7gLnRoKqjeKOf272ogLec2lO9xM+U1BLL8Bv/8rDKrVUCLYz8GZVgmi3tWRjO
         vmDqslEbw6nIqWRTObo4r6hIabmWrkBhvA4+sLaE9y0rpwPqTLIapgQhwpMaMEyGFxxh
         t40jUKAuLCSIu8szr30DhvYUJVMKl2P26TP8NgE2uyybCroHZr2YkUcz45aZhRzkURD9
         7LCRmm9IYb17YxdsCzs9EcSwzns8mxTK5etW+friu5lsxH1+9QCgnvJw6sM5ldfk0koe
         gQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685658691; x=1688250691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=osoH9NCUgVkUT2GWNEII1U4b/cNjTB8p6KRKoRqNDT8=;
        b=hvPacvwT2t3MB0D9iptCOp4fr7aFSfgbIgfOgb6MHGps1Ncmw/sooCeSeS0hcTcCri
         +W+iCEkrnygR7VydqIbueXJlsgv18mJBPVzTREqOh8o7SzlsbiKLu+Yz8LfcNJzDSZWY
         ijxAW4W5qeiY0mX+LdoOrXoi7QfRr5bwpJwXYJHbJIzXwn2GdNH58tbVJ0fiVP7+hXdL
         FYRz5mBRxAGRyIku8YhqjuZi3YihXrAP3yD5Bt0/EWUivMY/xI5J+CaLaE7q5vMEdlco
         qkKHwYlJWhlrhixPWh3MIiB0Csp6R+e+7XnEx3kvOAPl/qWcosy5KDUaSYqTMjqZZU1e
         rEkg==
X-Gm-Message-State: AC+VfDxROjAGCxxtfeDGeOypTcU4HSR9AFWKRqR+f2fFzKdWqVo8gqmK
	0HfpiICGLvMvTK0mH6lKd/A=
X-Google-Smtp-Source: ACHHUZ4ORFM0ZTf9TzhKeprt3bYgADAf/+yqvqGV4ek3VhH5dOxGcnauozS9O5zvjkrLTY1DpL0VFA==
X-Received: by 2002:adf:e810:0:b0:306:31e0:958 with SMTP id o16-20020adfe810000000b0030631e00958mr2445035wrm.15.1685658690884;
        Thu, 01 Jun 2023 15:31:30 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d4d87000000b0030af8da022dsm8619149wru.44.2023.06.01.15.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 15:31:30 -0700 (PDT)
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
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] Add support for Allwinner GPADC on D1/T113s/R329/T507 SoCs
Date: Fri,  2 Jun 2023 01:30:38 +0300
Message-Id: <20230601223104.1243871-1-bigunclemax@gmail.com>
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

 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    |  79 +++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  10 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/sun20i-gpadc-iio.c            | 296 ++++++++++++++++++
 5 files changed, 396 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
 create mode 100644 drivers/iio/adc/sun20i-gpadc-iio.c

-- 
2.39.2


Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4361C23AD
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Jun 2023 18:54:18 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-30af159b433so4052906f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 04 Jun 2023 11:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685904856; x=1688496856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJAnB3wQ7FughqK6LyFwMtJAGYslbkQgDXV0PukOLCU=;
        b=EgzyQTrWj7L7nc4HbbBrWc0/LVWQucNLLiAwomp7bWUNMM+oS/yk4bE6+Avc9WS49x
         aGbNZrxVxFL7aKpwZetTHFXq/R7q/UQa7rkfgDG09UNazrXKBxx7BMZ6tm0FrIS0fSWh
         mDQfKtmojwJmsXEK1EZRrWtDlgadDkEIrxcZMNdlb/U3WAKEKf5U9ugU1bvppA+Okso+
         lHKbigH4XJTo2CoRkaloxmCMqVUx5CEIYysWejnUaNc7kM73PEDqGDyey61jQHHknFN2
         Co2YxtihUNmTVuAkjCuAMQwNFDW1oH2aXjZue9P2n6aNmpe1nbIbZwspYdss3RhPJYLN
         hZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685904856; x=1688496856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJAnB3wQ7FughqK6LyFwMtJAGYslbkQgDXV0PukOLCU=;
        b=XrKjUOn1ZUAt0tyf2PA239cwBVP1wXrWqHmvlvf1B8F7uZfxz9vIsw8RJhRapq3Vds
         HTA7UCGTjAznb9Xp5/nOa9GKEOv85rOHl4hY7jfzLbyiiLwVzJffmwKC3ni9oelxBJEY
         VT1wgJL25bFHOJSfxnBdAa1tVyYAe6GvxUE8JMPSKbsZ8Ch055hamte4+eaFAk+2uEmH
         94vTPOik88RyCYuBJLrjyjiMKmrkMxAuM9Dmmnx106A0A5tN4+aaY9Q0Rv3Ew3kuP9BB
         Ziy7rgloCe1al1Bmq+8qbeelnRty5oKH6Ozc6y9qyQznMWzY5x2LC8XQGrRNLWr+bos5
         idUw==
X-Gm-Message-State: AC+VfDzaValzL1Lddz5F8+PskBYJaZkirMtw5FvoZ2DyIFuwX8RB1uU/
	3qcsNh1nw4K+/0p2TpcYj/Y=
X-Google-Smtp-Source: ACHHUZ4sY3o9cbVrBFJd6vd/C/mZ9S9DqzSPS+JpMykxOlZJwiAp6wAppUkUK6bHzzhccyQC4qDjwA==
X-Received: by 2002:a5d:468d:0:b0:307:9194:9a94 with SMTP id u13-20020a5d468d000000b0030791949a94mr4923534wrq.17.1685904855997;
        Sun, 04 Jun 2023 11:54:15 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4108000000b00304adbeeabbsm7636433wrp.99.2023.06.04.11.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 11:54:15 -0700 (PDT)
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/3] Add support for Allwinner GPADC on D1/T113s/R329/T507 SoCs
Date: Sun,  4 Jun 2023 21:53:13 +0300
Message-Id: <20230604185336.1943889-1-bigunclemax@gmail.com>
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

 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    |  90 ++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  10 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/sun20i-gpadc-iio.c            | 296 ++++++++++++++++++
 5 files changed, 407 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
 create mode 100644 drivers/iio/adc/sun20i-gpadc-iio.c

-- 
2.39.2


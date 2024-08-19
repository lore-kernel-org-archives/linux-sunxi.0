Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8353917557E
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 16:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086124; cv=none; b=rjCqTxz90IX2plNtW4yOjaAdCMWcc2dPvSyxGiXOc35+ch+GAUiA+UtV6lfr3rfmqwggvIo8n4G4v0rEbM08Lrcqw2yEQTmedt1aufdR89NguT077qlBM2yuUidEJc2X9tpZ9iOkZDAH+JP6o42+346+57z9RGcH3CSTzRrXNqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086124; c=relaxed/simple;
	bh=MBQcwzxFBPjk9Fm00UF7+n+iTFUcUyUcheP/DBInH68=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MGzLRU45dvqmXjMu6Oj1Ov69HLjn+LdgAlNZGk7lcmKohRn59L731r/Wnoe79QOiaZoALW8IWYoBeoGkaDh1wLWFT620bk8u39DlDewaBiQOCjK0JBOIq4CgroUR6QbYfMDQDAnHj/PpJhAGMeuAoYhXl7ECyKaDo7eFR2UUs0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCSBeroK; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCSBeroK"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-709485aca4bso2233094a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724086122; x=1724690922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/e5lsHcVaB+uAytpXe/h2T5BUGUbMv4au3JS+eKlceA=;
        b=BCSBeroKdbfJJ5nuc1rfKToyTA1yUsdgMh7NUCD42tlG1llUGPAmTfEw4jrxB8QqYl
         WpErrSQHL9r11kHCT54CkAFOOL5Zk+9X2q4xBiZxNKhDX94Yv72efKw+hZhFGZKVGyml
         dAIIJDA9ZrIVGE+qylb9CBD3qoB15SZRczUSpWxkjmW533Jy/S1DR11lxS1gi5Jt6EzS
         tFcgKAp+1LJe0pbMXffwPRyuzPlZgiA7qv87XP+9wOU/OqnpEH8M92t0eYslDovweAaQ
         +aXPvUkF8EvoxfNfa6AfqDteyGmEoaAOkhEy2IPgH6/IzmWsUpokQY7Zph8y09dKmMqt
         U14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086122; x=1724690922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/e5lsHcVaB+uAytpXe/h2T5BUGUbMv4au3JS+eKlceA=;
        b=GRN3OtfGgDwJVNvYbgs7eOArFQO6rKxXDGLcyEX6I5+/SCmK/Vc1Oh7y7mfpGtSTkj
         IPO8DBRfqnh0/bQiFIwbRRwBBo5DjJ49UONUKlcFdPD6RK3pOR3CkpkvgWPkGN0UmT8+
         /HzRaHhAvoJxghmLk9Tj9hSELOVfXVsIoN3avbhXOG1hGz523e/PdN0iPPPY9AtugjpR
         Ji6WXD1MzlrDz4h0pdHTfuwZs8XZdsad9eOu0RY+FIo3OTcbxajrTu9wuZtOLngQfHAV
         lmPu1QuRL3VRuYd52Atwsf8CpYXJrI43pf6PAcAUWApGjKhpzHC/ShQmm9oq1o1D+9L6
         kaHw==
X-Gm-Message-State: AOJu0YyqdcFNvmjadVP/IXug7E0ppHcttuHY3V/y59kTxiutgbYg8k6O
	NG0V6SrOi6gitzDecxhli3ZyGo/jT80OB/KD3fQQzUviUqlF4pgdL3qDHA==
X-Google-Smtp-Source: AGHT+IHUayXAxzAfw8JT4WbVwDnTS2IAPvqLrAz9kWPM8obo31aP1Msh/iEPvQgqi656nkRvCtLl4g==
X-Received: by 2002:a05:6830:6602:b0:708:d84d:f62a with SMTP id 46e09a7af769-70cac89c004mr15724939a34.22.1724086122192;
        Mon, 19 Aug 2024 09:48:42 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70ca649c61csm2332428a34.26.2024.08.19.09.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:48:42 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	quentin.schulz@free-electrons.com,
	mripard@kernel.org,
	tgamblin@baylibre.com,
	aidanmacdonald.0x0@gmail.com,
	u.kleine-koenig@pengutronix.de,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	jic23@kernel.org,
	jonathan.cameron@huawei.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 00/15] Add Battery and USB Supply for AXP717
Date: Mon, 19 Aug 2024 11:46:04 -0500
Message-Id: <20240819164619.556309-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for monitoring the USB charger and battery charger on the
AXP717 PMIC. This required some driver refactoring of the axp20x USB
and battery charger as the AXP717 is somewhat different but can still
benefit from some common elements.

Note that as of now the charging current now value may be incorrect as
the scale and offsets were not documented in the datasheet. I suspect
the scale is 1 and the offset is somewhere around 450mA though.

Changes from V2:
 - Added constraints for input-current-limit-microamp constraints for
   x-powers,axp20x-usb-power-supply.yaml.
 - Used FIELD_GET() and removed unnecessary -EINVAL per comments from
   Jonathan Cameron.

Changes from V1:
 - Refactored against mainline to remove BOOST pre-requisite.
 - Corrected commit subjects for DT bindings.
 - Split refactoring and AXP717 support into different patches.
 - Added IRQ for VBUS over voltage. There appears to be a bug
   with the VBUS fault IRQ because it is assigned IRQ num 0.
 - Corrected battery driver to report POWER_SUPPLY_PROP_VOLTAGE_MIN
   and POWER_SUPPLY_PROP_VOLTAGE_MAX instead of *_DESIGN.

Chris Morgan (15):
  iio: adc: axp20x_adc: Add adc_en1 and adc_en1 to axp_data
  power: supply: axp20x_battery: Remove design from min and max voltage
  power: supply: axp20x_battery: Make iio and battery config per device
  power: supply: axp20x_usb_power: Make VBUS and IIO config per device
  dt-bindings: power: supply: axp20x: Add input-current-limit-microamp
  power: supply: axp20x_usb_power: add input-current-limit-microamp
  dt-bindings: power: supply: axp20x-battery: Add monitored-battery
  dt-bindings: iio: adc: Add AXP717 compatible
  dt-bindings: power: supply: axp20x: Add AXP717 compatible
  dt-bindings: power: supply: axp20x: Add AXP717 compatible
  mfd: axp20x: Add ADC, BAT, and USB cells for AXP717
  iio: adc: axp20x_adc: add support for AXP717 ADC
  power: supply: axp20x_usb_power: Add support for AXP717
  power: supply: axp20x_battery: add support for AXP717
  arm64: dts: allwinner: h700: Add charger for Anbernic RG35XX

 .../bindings/iio/adc/x-powers,axp209-adc.yaml |  12 +
 .../x-powers,axp20x-battery-power-supply.yaml |   7 +
 .../x-powers,axp20x-usb-power-supply.yaml     |  70 ++-
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  21 +
 drivers/iio/adc/axp20x_adc.c                  | 182 +++++-
 drivers/mfd/axp20x.c                          |  25 +-
 drivers/power/supply/axp20x_battery.c         | 590 ++++++++++++++++--
 drivers/power/supply/axp20x_usb_power.c       | 353 ++++++++++-
 include/linux/mfd/axp20x.h                    |  27 +
 9 files changed, 1186 insertions(+), 101 deletions(-)

-- 
2.34.1


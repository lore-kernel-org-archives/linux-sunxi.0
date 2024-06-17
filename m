Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E26190664
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jun 2024 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718661963; cv=none; b=iTFT/aO3+6y66CU0ylRnrOZAzv2tE5M3LYaKvQY7XdJKkWw9V5jATqljD9e8iuAwubF+QFRt05AcRkrzgojx+dSV4uRyAUMxWd3cizSqbaOzINH1lw69PyQDX5A56KyZNWH7x/dg0zTGMLNVaykavMgCABLt1UlhDL909Kl67t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718661963; c=relaxed/simple;
	bh=/hWPDOnmI2yUJYDl5gQyCSpT+WA3huxuW9NK3NL7qIU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G07agkY9YrrqI9s5jVayZZkH7t4qNy7Vd8+X69QoV8Vxw34aTIZ4E2Gonk/nlQK68vYDvSfg9IrPBWMJAYpW5Giwevh8H2u/gPQjthgZGDAOq95NkLo4YkZzLMJlubjS8K2eOZJ3fgyWeg4lMVilXw8WBc69KP4dxtnmUIPqcfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jal7vUFs; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jal7vUFs"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-24c9f628e71so2528699fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Jun 2024 15:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718661961; x=1719266761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/Su6zOhJKHHuZVcMf95zxNGwUW/D3aqWfw+kVjdFyg=;
        b=Jal7vUFs1bx4T6ygb13orA5Pq7S8dfp/pRSrPqgmaoRSxVIQTZwSTSoa14la8vGgnh
         8fuZYc/6nzbnXotSjHhydgsqrc+nA6THu0I9Z52UKaIK8WFw6ZKxm5HU4rOiu6EmlUXG
         gRCGZn6smbj7mt1omOwWm3mzJvYbD5BqT8auT2zrXkOuBq8aYaiCQSyWmhWIzlW3tJMI
         r/cI4Doo1urzSYNzC+cqQRVMWdTVIBpXT3bpjqczot1/RuYXOcoBrLVEdv7clHEMwgnL
         9+xYGPc9bRWv/Gt8R/LOwrEBN+jlxyqHD2bAYTLW254q8EmzZFKW1xC+1LvwwU3/3ZjI
         SK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718661961; x=1719266761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/Su6zOhJKHHuZVcMf95zxNGwUW/D3aqWfw+kVjdFyg=;
        b=WY8auVBTuX8pHYssN7rSE4fBgHRngj9KCyv5N9LFE7PDRNqbTNouOZcErijhs5QQWh
         aYlwmL/xJLRlCpNk7Aj6D9E6h1skKtXsT/IwZb1J4NBnah+FmAPQrKw5Mhd0XbD93kGG
         Ik4NrRBTWzcfTbrxV2GRZCE+yFpSTHKpWB7Ylje5IIPLb2DzIwtWBCGleHMTB+zw27bV
         r1/BzlYbvsQ81pMrZXM0Zt8NvhBLYEw1OJ7gO4AFrDbUFmL/dbNAf//rTeO1MROO4nYz
         AX9HUeFD2r/0uS4DIiJaVpszMJJ1Vkf/MHzgzWg8LmPcBcHeE+r7IjZvVzTFCXu4eKai
         0a7A==
X-Gm-Message-State: AOJu0Yx1WXAG/TqmjWatfCm3XOa1yl1z4ILkJBhOGlQeSGNtgMeHxmwd
	81nLQsSwoWxQKPztLBx+6hxXCiZwEU9Ctnzpigtmgzy193z34AbUB/6H2w==
X-Google-Smtp-Source: AGHT+IGTkEJLjAQsBDyPVepbzS96rgjLZUNQCfs/a/TVEyMYrXfJ/EQuJc6ranGmaMtM25H5ZoBEcw==
X-Received: by 2002:a05:6871:5c9:b0:24f:ee90:4556 with SMTP id 586e51a60fabf-25842552a80mr12620848fac.0.1718661960812;
        Mon, 17 Jun 2024 15:06:00 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b1b0fa8sm1664232a34.28.2024.06.17.15.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:06:00 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/8] Add Battery and USB Supply for AXP717
Date: Mon, 17 Jun 2024 17:05:27 -0500
Message-Id: <20240617220535.359021-1-macroalpha82@gmail.com>
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

Please note that this patch series relies on the following series being
applied first [1].

[1]: https://lore.kernel.org/linux-sunxi/20240418000736.24338-1-andre.przywara@arm.com/

Chris Morgan (8):
  dt-bindings: iio: adc: Add AXP717 compatible
  power: supply: axp20x_usb_power: Add support for AXP717
  power: supply: axp20x_battery: add support for AXP717
  mfd: axp20x: Add ADC, BAT, and USB cells for AXP717
  iio: adc: axp20x_adc: add support for AXP717 ADC
  power: supply: axp20x_usb_power: Add support for AXP717
  power: supply: axp20x_battery: add support for AXP717
  arm64: dts: allwinner: h700: Add charger for Anbernic RG35XX

 .../bindings/iio/adc/x-powers,axp209-adc.yaml |  10 +
 .../x-powers,axp20x-battery-power-supply.yaml |   7 +
 .../x-powers,axp20x-usb-power-supply.yaml     |   6 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  21 +
 drivers/iio/adc/axp20x_adc.c                  | 167 ++++-
 drivers/mfd/axp20x.c                          |  30 +-
 drivers/power/supply/axp20x_battery.c         | 580 ++++++++++++++++--
 drivers/power/supply/axp20x_usb_power.c       | 350 +++++++++--
 drivers/regulator/axp20x-regulator.c          |   2 +-
 include/linux/mfd/axp20x.h                    |  26 +-
 10 files changed, 1102 insertions(+), 97 deletions(-)

-- 
2.34.1


Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBCA20C496
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Oct 2024 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642516; cv=none; b=On5s1qmKls6FhqMcUIvLgUnRQhWRYTv6p+EdRO2AjAeL9Xrb0Lj1pvuF2MPlXpzS/gxumkX8TBVUeHraW9hZ8N7L00wJaWbME/4gJzSl2L9Ce92ObQ60frPAYAp5iH83Axn9n9g+9enktsbf1VblYA55F6CkQy1272a64Y2G5LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642516; c=relaxed/simple;
	bh=W41jAi4j+/qIb+rCeD0NIp6ajJ8cer8Du5AZb5Vv+P8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cjrhT2I6GHq+w68qNY1dMAI5F2uZJmWJL6nOmfAGQSOqTWvzGbL76onOBmpsTOigtqumjQh4RCtPJ+BemsHTkdhLDhhCKVrCmfKCNT4MnrxVMSrzy+t0Ow3TwPfoh9IYFeyygy9hdNikR7kmyjt2D4V4sBrrkcq1xenkwqZZKLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHcA65yW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHcA65yW"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5398e3f43f3so2131979e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Oct 2024 03:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728642513; x=1729247313; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xyNP1UPTt08MhflMIcOH9cW9Wb20NwuSNmK2SuTswyY=;
        b=YHcA65yWXGL5iK6cRt6N4AMjypZOqOYZ5SKS/4Ikxk1Pn2E7n9T2V3bOXAv3cYtnil
         dxyDZFZMQY5c+BQmmGRwV5yFw33kSIG+DkJDq761pbollOta3TTlMNOD5pedI2kmPCti
         we7laDH3EBLslXayRryYYgRYq5Xo1eBLl3IvkUcRbCE56tYJq1ZTiUrlgD/YN6E4xc5C
         nWg3fdUALRmh3FRknBZ1LMX/AsN5EgrBMwbSachbY1fXBoaHwH0zH1gXJp4qMY3C6w4E
         HqLnpHUK0C70ENJ26P/79+pS9JO3BUZ/A1tzeH5QSdTuHS0HA5BEPcIyV15XYgznAWB/
         vt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728642513; x=1729247313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyNP1UPTt08MhflMIcOH9cW9Wb20NwuSNmK2SuTswyY=;
        b=t87qSdoBousPMwmvZrYfTjZsqgsYsz0zvR0XIOfc8NKio69yEj/onOPct7gGKFDTwr
         C6z/YTiJRJ+SK3oAptV5OGvJpyjMH+UzLfKthKpDj0F/DuPRQdS6Kbz7PWq1YppSPRHH
         vklIqvY4Cq8A7rML1w4c0B1Bik9mCzA4zvTfAz+/OIajM4T3i45eJv3//jfWDMkipzGn
         /H+KxPC/DxqgJYnv++IBHt36hahIlhHhahlem6Bq82ya17gvKe16xslEXhfu2P0uql2Q
         BnMm0rs0qhCsVowK4KHgPDH73HhkGG8V2262tULGEbm9ssdfIvFiVqjcpadAd8Msqc8s
         Fyhg==
X-Forwarded-Encrypted: i=1; AJvYcCVzn4wdACSsbPYv4ZDaiP4ExbOig6xaMHephtItHGUSu1r+s6SFIqId0+atBSPje4daPcmiYaTin2tdmw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yydxv9lcm3IMNlxCEeguCFIoo5ehxyEMbbsFz7T8TNfmJn29sgP
	ENn6foAkaYlvaMh0Ym46lh79AUt1PhZk4VWX+B6nQCbRHiLnnfg=
X-Google-Smtp-Source: AGHT+IEj7jxxNUdcfFsGQxfN+JScaynbmfxoEPbLymkkExP6c7pgjdIctqnlqyXUbcu8dqFC0K1sLA==
X-Received: by 2002:a05:6512:2204:b0:539:d428:fbdc with SMTP id 2adb3069b0e04-539da599f64mr944067e87.55.1728642513016;
        Fri, 11 Oct 2024 03:28:33 -0700 (PDT)
Received: from localhost.localdomain ([188.162.200.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8f1003sm552534e87.233.2024.10.11.03.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 03:28:32 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v10 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Fri, 11 Oct 2024 13:27:31 +0300
Message-Id: <20241011102751.153248-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
 - fix dt-bindings
 - fix a remark in the driver

v3:
 - fix dt-bindings
 - fix sunxi-d1s-t113.dtsi

v4:
 - fix a remark in the driver

v5:
 - dropped unused varibale in the driver
 - fix dt-bindings

v6:
 - add apb0 clock

v7:
 - fix a remark in the driver
 - add maintainer

v8:
 - fix compile driver for 6.8-rc

v9:
 - fix a remark in the driver
 - fix dt-bindings
 - rename apb0 -> apb

v10:
 - fix a remark in the driver
 - fix compile driver for 6.12-rc2

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 379 ++++++++++++++++++
 5 files changed, 486 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


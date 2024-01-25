Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65BB1C3D
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Jan 2024 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706167279; cv=none; b=f0UZWE9lBCtJ9Bc+/CthW3Dgoljn1+wv7uw6OMDaGYKra/S6rn7uR2q4kIZ354gLGxhoFTvjnt9lPNfvFm0HGNhOe96p+cyXcoOM47mH2b9vq2h8mcmRXjpxY2rmS9HiYOB965M/Dwfyx5x6F/aY4cNuFmAZJNmQn0aZMAmpIo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706167279; c=relaxed/simple;
	bh=VPh9d6Pxp5XZeNDZKQSreVmnAMlM8+t2+Jf9vaXc4/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KITNM5VW2bJbcS2F3i0xcf7Y6Dsnv9xmW+NnEW9Xb6ueZFj3sxl0HNfkgozTzvr1wXS9XpPbgHabLI4//mpYK/VaFPHcYpx8vQPXqQRdX6WhoaqX6AJCYUjnU6DH52zlnQVBTfmWp5yvd6FsMwK2QTdhhV4bMkNR5qmj/DFMMb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+jx1l0w; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+jx1l0w"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2cf3a04ea1cso1795421fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jan 2024 23:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706167276; x=1706772076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rfbdi06WEg6XPP7HBGTF5pjBeEWo6KdfcLseKD4sHZk=;
        b=L+jx1l0wNuwp7a7sDRCC2mAgkkW4IAl02/zt1qG1LheifQMXmfqXmYKFPi0RmIssX1
         ewMplBIDlNNc9x4l+X2zuf2ZgbadWJ20pYrDrc8A6jfqBjjs6LE+Cx2wet7cFYj6AidW
         oXynVN/N+II+7kX74GNL8t5BxFtVeGdoJSpO0mezRjdrJFmE5PdyCvYSRAjwWDq9N1qx
         EWXsaeglHmXfdFG5MdkeVXnmExktA7dKWMm7gGq2M9i1WqLz6y/WZPJrHOGw1WmeBO2i
         TxoHLJlV/r2OcyWQWmWfbPDrBZe6SOpt8NdEH7oDHRKOSyarR4W69U/ku6bMZI95mQ+u
         WTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706167276; x=1706772076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfbdi06WEg6XPP7HBGTF5pjBeEWo6KdfcLseKD4sHZk=;
        b=Je5Bl56Y/ptpEPA89GNLQwBLzogAc6nKL0yx7CNZcmlNJhjyi/QzAIH8Ced/2gQN3f
         9oiLmFvUewktVgs+sQX4nLEMgQyVECEt0e0QDiOObfM1DqnWN9y+lw5NBQI1O2M10fhw
         3HKx69s4R9YPUEiOvSrsnWof78noPVx3qo0sBhIFYfwuBW/7OJ0X0EnSPvC/IPLqVQpW
         OUfM/OBdNoNCZbwKHhvRSEgUtktMQJ0PvLBSKbady2lmwRi58TGz5GpEW/an/9f+v/tG
         m6H/Id1LpJd8JIQLNQaphGKbOvymLaXIlAmWttRL8q65RSXMrH80UNBDvuM42LeZYEkY
         yD7Q==
X-Gm-Message-State: AOJu0YwSWEH7q07KtYNviaa+IbSAUTR1LrlRdsg1ItZE/VsytELDlfeC
	AWAVPQH9aozvvlrQ/UysNKzejauV+1NJb2kp57fPyQFtaeRsynE=
X-Google-Smtp-Source: AGHT+IHuzdCwXXJzzYZ0ZphpiXZChO5Xnkj9g1TvGPwPEf24LwgoMu6D+BEIIOzw2PpSJNXyoPZbwA==
X-Received: by 2002:ac2:54a7:0:b0:50e:7c70:f8da with SMTP id w7-20020ac254a7000000b0050e7c70f8damr216409lfk.16.1706167275400;
        Wed, 24 Jan 2024 23:21:15 -0800 (PST)
Received: from localhost.localdomain ([188.162.200.139])
        by smtp.gmail.com with ESMTPSA id x37-20020a056512132500b0050e75f9e8c8sm2780070lfu.98.2024.01.24.23.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 23:21:15 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
	Andre Przywara <andre.przywara@arm.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	John Watts <contact@jookia.org>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v7 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Thu, 25 Jan 2024 10:19:40 +0300
Message-Id: <20240125072032.1151383-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds support for PWM controller on new
Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
provides basic functionality for control PWM channels.

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

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  88 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 380 ++++++++++++++++++
 5 files changed, 491 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


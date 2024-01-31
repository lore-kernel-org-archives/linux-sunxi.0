Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E737AE60
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Jan 2024 12:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706705977; cv=none; b=klJ15uY2oYCEwTDqMTrwhsYkt6hZe1jPtNoFSuOXadY569Q7U4SmXIrX7mhFfz3md1Fgo+z+T8rN1p9kGosI7xHtgm67pH29HWFQ/BksJj1EoKTNywWqBQWHz0Yvo1MPGC+fRBP84jx75QVH7kZUyWqOofZAPYW3G0I4biqs6gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706705977; c=relaxed/simple;
	bh=5qWwM4rybSn3sQwL/T5QTpDSTH0pGNitJxfA4afPac0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L2CWUFY2xeQznh7snXA/dFwq7hZM9I98RBM2O/iSZJEba5sn5qkhiMD7oEwJznuGbEg6+DVsNWki51CxZJ7xob2dC3zDXSTDntFTn5dw+d4nMVPv+kVu5v17iUn+B/YP/FIkxYvfh13Mjwz1P2lQIa1QixjPl3C6fGw4L+7amFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfakalPe; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfakalPe"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51124d86022so1077489e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Jan 2024 04:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706705974; x=1707310774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qiLW6Y7RRXrik6dDAtU4CB215hHq9HP/DTZOIjF86/s=;
        b=cfakalPetlYTXO79cvqoMCf+3UQf4vV+lurGIc8cDWBN1EnvLw2CHsFkSKFekbx9Vb
         +verC7eZWdgFxyb/c7kd2yp7x99sjoP5cnFM9L86bWBQTGwM9+RZ2hTAQ9LPF5tvKGcg
         UJJBbKQCWhZlxw6CNqajGVFRQ7d2+y3AuqGtsTHtiQqFUOaRrjKolETr+6IMNmK3/ssY
         MDBCyz6iGjK06jNUzdOpWJIEeGeWYM0ojQN1GCMN/xTuA0mTwMGNQsp5yiLBdWXKkGYa
         MOsUm6vHhgKzqsOrExO++L/HzLGUrY1sjPueHuDxef3Sh83y7AbLW0HvGLhgwbtKxIlq
         QAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706705974; x=1707310774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiLW6Y7RRXrik6dDAtU4CB215hHq9HP/DTZOIjF86/s=;
        b=HG/HuR+MawJDNwujPzM+RpwfJw+Zrx9S92kYw0je5OwCvy7aFRW45HkUNlNTZakjbz
         ffBxhZ/Zefnv/omaMavy2k1TldW+4di1mXCYC2q73K7QN/WDPSQohAr7Frh6K8mZIExq
         pbBk9ZOQtK9j9FEfHYl39Wb9NcTNin/5X+MY9ujIxElqjsI3/xkjKBELVyhg1EtwtCCK
         ky1djw3z8AW2UvBIp8hIjrqjoK47QU303sp0cKx/6sUCRIdPzUgBXV8/8R/5ZsSFOcOW
         RnqE2EBZADF13jsulQ/ZFmbje8/KJ9XCF6Rjoti3LU3rVZnOVbma5f9OCibcLMxcx68k
         VRaA==
X-Gm-Message-State: AOJu0Yz7ADVNyzb0Ey7ucK0/NP+5ykXrwcD0+ARdA7L0AcCMLdU9yRbj
	RYcS9CqTrwDp7JuW3RaILgOJufechIrC71H9DRnictxT4PGFAtM=
X-Google-Smtp-Source: AGHT+IEZD1EYbijfOfTXbD+S2VDVznBXDRi9jVFPUhgu9Z0dahqmdHXj7u5Cz0Un4MBqxKqBijOh6w==
X-Received: by 2002:a05:6512:282a:b0:511:863:4a0b with SMTP id cf42-20020a056512282a00b0051108634a0bmr1358837lfb.60.1706705973568;
        Wed, 31 Jan 2024 04:59:33 -0800 (PST)
Received: from localhost.localdomain ([188.162.49.60])
        by smtp.gmail.com with ESMTPSA id h25-20020a19ca59000000b00510faaa62cfsm1361135lfj.222.2024.01.31.04.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:59:32 -0800 (PST)
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
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	John Watts <contact@jookia.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Wed, 31 Jan 2024 15:59:13 +0300
Message-Id: <20240131125920.2879433-1-privatesub2@gmail.com>
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


Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25B42066D4
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Feb 2025 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739439653; cv=none; b=JfhGqPp1rP2jgyJukiHEahTQ67BexTprsdgn7h67WpCnBsl/3h4WwxwwQke4WGs51IP1HZWQNOygxxRqwvqT/YHDuhG18++dEJxpo5yZY1S9LKdnA1aYbij4qYpB7ZgC67Mo+ZmoAC86rpUI2ihG7fpdgaDBEzC3fdmOayREDTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739439653; c=relaxed/simple;
	bh=3Ty3TZPngzI8ImKj+JMeHI8wX24fjwqqQ9y/aUKCUXk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LgPa0qzWAfwdLGwn5CCpQmJTxk6Dkech04cu/jzsF7v94ENerCwGEiT7Te1T1vQ8JTGhYWwRKzFfuynygy8F9kVqDm/wL27oCpI3I0UqQH2lvNaHccJOeCv935AsmVJqa96z4Nx+BllkLIrauRjJISshpAdi5Dvf7Yzri5Y7Msc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzdhuabQ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzdhuabQ"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3072f8dc069so7595721fa.3
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Feb 2025 01:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739439650; x=1740044450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mjlSL/XILbi3kwKJAgYk9svt+oaypPyLoMPUzXAfvac=;
        b=SzdhuabQ27uQP4aaOh0vyDOR3gYeZwbj1mHZkNxegQNi3kIK8W0/hnvzcR6rD3eC81
         W1yab8/yBidcxzUYQdnGxAo8yYxr8UF6F0jX7c4TW5eqsGfSikvy0aBGWJ9m6MwKir2Y
         ximruna+uFs2Wkc0yv+PjPGeFSi4F+JGt16E1t6SGHyHqwvgBjiH3jpWRKb5M87e+/Wb
         UXvclx75erhTK+n2zvH9k/MKX2G0ieILQfD2BL0ETa8Bo3A3N9b9rMRw0JohgQZcDRKF
         39TaTSUe/zweaoOlO27e1ua6wy5EVS3DSXkTRy3BkSlSxFHlInDOH5/xgU2hrPf6rq+y
         yqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739439650; x=1740044450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjlSL/XILbi3kwKJAgYk9svt+oaypPyLoMPUzXAfvac=;
        b=eZMkZ4P7C4CSDtYb8exwrCX2WxLVkm0vjgLMf+bDGY319os8rp5Y7ffNPJFnuL+r2B
         vXiMB0ntfgMwoOrMuek13Vs5lJKgia0N0aupOqvompjd3eO2UA/qO5yd01WpkUKh3nx4
         AdwBaBlqlzCzs3a2rKMbBv4qmt8Mo74akTS7DBcKkV5dQPfZGk+38AiLEwCR1lwPenon
         xETQJ5naPLD/pWPIXVuvF0Sx9wBo1zKh9QqlarWRYis2swqh5kxa0eIvQmqj5qRlSJnR
         l0+IVKaxacOKd1WB1SyBCNDsaRDMZn5jf/zKE0bGfTw5OAOT/JO2IElFCLn8DwgblZHS
         QTlw==
X-Forwarded-Encrypted: i=1; AJvYcCUEZwu7ilvAnWZZfkjIZvQlm+HrRcfik5cuNNuZWam/hGzFQaA7XDZcHT6i7T7p9XJnqTPsiXOAL0q7cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDtjXAL3jC2tUthj8wIe41hojjG5vw7iA4OcSB2nOwr73ni2eu
	x4LR6TaGWKI+doerns5BZzq2Nrf8vAtDBBZZ1L0SOa+jkIhBdQY=
X-Gm-Gg: ASbGncvxoQhrGy+94m63rLhcmC5czYdRv/ix8nh2+ucYvMLeReQ5E8nOXaXwZcJ5MoE
	uU/L7pqpwdcZoio95imp5J/X7vd+YKjXMKm+INOxDCUDI+X0m4z4toMtbMmDd+vcIuJVcu0VmTQ
	2UDiN3O8OwBcSyRb0G44OjOPiy7/o+hTtvwXnX7+UNdyfLrLPxDGNn2ZhzMTZZIPukmi+JDmdWi
	nloAwnzMX03w0M7BZTxUkocjv1dEgEIZi85eqnX0kf5Nr8np3BBRP1c7UvTQ0Da2cy+mhdhie9u
	UWNx8IQb17iBbDiARWi8EQHfE0t7z30=
X-Google-Smtp-Source: AGHT+IHvr3T6WF3qrEPOE/ncpkXsxhpveENebSm/95rH45l46XCcOYPEGrJRKlNkH6Z2V9/FiQs2Ew==
X-Received: by 2002:a05:6512:3e14:b0:544:1093:ee3a with SMTP id 2adb3069b0e04-545181165a8mr2484582e87.24.1739439649595;
        Thu, 13 Feb 2025 01:40:49 -0800 (PST)
Received: from localhost.localdomain ([178.176.176.188])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f10cae7sm119518e87.183.2025.02.13.01.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:40:49 -0800 (PST)
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
Subject: [PATCH v11 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Thu, 13 Feb 2025 12:40:11 +0300
Message-Id: <20250213094018.134081-1-privatesub2@gmail.com>
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

v11:
 - fix a remark in the driver
 - fix compile driver for 6.14.0-rc2

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 370 ++++++++++++++++++
 5 files changed, 477 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


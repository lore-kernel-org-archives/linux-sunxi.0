Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F60F199237
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745763915; cv=none; b=njbWPRN64zaRgL/pxFOxyRonMEUdavfw+h81G7iE5/25uaoKqCDM47n//zd0Spz16A/nC0HWfe7Od3x94QSY7KXv2DX44rFNB9uymOe8idw1Nb6zU7OaB9j3JBFkNiBAlQ+NWGNdUoru+WpxN4P44YECGw+aOTKXgLuMihqDsXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745763915; c=relaxed/simple;
	bh=4RuQwRBAdLPTYq/a4FeieIjOWizMZ9M2PNfdmCov5UQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sGn+1XBwOacFhhqDv6UTgcg88xr19YQiKGxOkthpKagIXY8Y1VV75GuBo4YESvGbRKkyH+a3ePakKiJ170fYQqfrgQO9l+xLvZ9GoH905PeBFm2apO+z7P82dUsA8Jm3ihuFCxsuL9cAFN9vSSs4UpMF+f23k1jO1LGL6qmp3sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsAq4jYm; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsAq4jYm"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfed67e08so41393881fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745763912; x=1746368712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+/h+HUw5Fa9i+auYLXdmFTVTqLMJ8IF6VQixN6G/8c=;
        b=lsAq4jYmL/NKjbtQRthbaaEP2zaeC/k0Aiz/BjYRbpfpsAlULUoWs7/HBtaRclOqTI
         BDoCu55G3ANJxmYzaZSpwP0l7F5y83piPp0R0MWTHAzwXUK2fiOKZY2C+0eOYAkEfdMi
         j9ce47VYIP0B74NNReuVLKkDUzq/5nsGJReH7qCQQZ89T0mLGrdIfowoMzBEtGv4rUeE
         5YdwWQxzvoLwOU/WhaWJxohBKU+q8BKvNpRTUuWvj0XRW/GjaWlltWmYkxt07gyPSaTL
         TnCxDqgY22jvTlqBBbXO6m1Pu8cSJ9ZFIfzh6QIb6st7WwiT0es59QWT1Q6qtBjJA4Vg
         vPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745763912; x=1746368712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+/h+HUw5Fa9i+auYLXdmFTVTqLMJ8IF6VQixN6G/8c=;
        b=Wzsw8pb7k3ESATEmS5nOzsdixv5btBHpBBNY4bWdiQ/+2e7C+d5CzFm0vYUQRwPcGc
         ocu14F8uUEFiBalREr9TGkndmJX7YDQdDUNXlE9rt5qeKN2EMRevAf9i1nIRLvQSrzUQ
         0BdNot8lyfvJlInkujUqGkHot2l0WA40ZtIQbS+OnDmeEf7/5ZQ3299QUnLZrBxss+Kj
         aciRc3WDqYLlI5eTxhSew+rcW7A+8u5PIARwcZqO7PzKaRkeiLIm8YekkMD1IAm5ANc+
         cJn0r5HMeeGmF3XdMMw5gZNyzqbWmSNu/b6bEuoC2kM5+dB9N1jdKiajgLl/b9qHKmSp
         pelw==
X-Forwarded-Encrypted: i=1; AJvYcCXwoOP1QCoq5XbSfo2uN9Kt31RROwvNs3mJ+fBKyrskee9ASJZchQLJAt0kql7W5pi0X+3SacI0PifZpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhMeVDtgDwOrqZT3GtwO00EhSzpn+VhFVL4nMuEqks6aI3mwaO
	hGmIKipNTbfmgz3UpDehb6F7RfaHHME0otz+wI2+6oPJs3kPFus=
X-Gm-Gg: ASbGncsgN0aiSLduJJibEaEmVxt/lkc+AFYIWM7o79Jg38cqIfCaR6s+bKON+xw/U4p
	mjHvL8Em7B3J6naxerabJI5JHw/n8PiuPxbAERyC5k8lJ+8j+6F0vmxMO4jOQ5cDyp2H4scx4up
	cPeWM2kq7IwQY43Tto8YcJVrYMklYYRygBvMyR6r3tui9xc1FzlW35/RsjKhPcmN515kxnNTn3L
	u6vptU3E5D29KaDBq3EoNPh0nkVVUBnrbeAKVi5nxzV827NO2eXQf0yIQZopAloFAgOoW3L0x3W
	v18ZYtR7mkfAjcDmazLqMWLh5V/P1EycxCMbf080rj/wcF8DFV+lRUXq
X-Google-Smtp-Source: AGHT+IEZEKc9Vnf/efSmBJgLhw4tTfU2F09GmxdHClCejQ/XhLFf9brnK906waqbWQ74zPb6LP0ysg==
X-Received: by 2002:a05:651c:158c:b0:30b:cd68:b68d with SMTP id 38308e7fff4ca-319dc02035cmr14537211fa.10.1745763911951;
        Sun, 27 Apr 2025 07:25:11 -0700 (PDT)
Received: from localhost.localdomain ([178.176.177.108])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb482b1sm17659191fa.29.2025.04.27.07.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:25:11 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Sun, 27 Apr 2025 17:24:52 +0300
Message-Id: <20250427142500.151925-1-privatesub2@gmail.com>
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

v12:
 - fix a remark in the driver
 - fix a remark in the dt-bindings
 - check driver build on 6.15.0-rc3

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


Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5099C279DA6
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 18:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771698998; cv=none; b=qEpqScDyC6Xfrpfht9jeqBk11vZqRGHdekQj/V3cbhgC9h/3hvcH/YZT8QlU7qUlQIcH4PEwhDZf0D8iqVs+xARjUR1a/YmkIQ8AwI7bRkOZkI537BOI04Vh7hqNqArsLzi9OHCQRNLtTQS9AxUmz4C3XJgMmF0T+VLeYOw/EyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771698998; c=relaxed/simple;
	bh=Bp88nInx/+y1nve3gCqs9RuKa1fpBoEP3C+mMJqdiTE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D7tTVgoFDNFSQIWHIKz3DCEUi7EajbHpTwhKcmmqqbxW/JdlWRf2u8JpUV5pA+6TI38OkZdX8FGkv8F/KJL2tyPb7TPuPM3DRKtkuVSyijuc904t+1iPcyYb4azZUjFwcBdDGGFiJCvudiy8UhqwoQki+wWvcpn7Z5BVtb9ejh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFmcHn0K; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFmcHn0K"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3870dec27f4so36793071fa.1
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 10:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771698994; x=1772303794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ4mlxz9+qmH9SFVDphbLCUFby68qXbPqoJ0t+cVd+E=;
        b=BFmcHn0Kc7Y0c3E8npJuT9jBnnptPR6NPz2svrQG6AQGMoVsFgzUsl1Ixn2ZyII5Q0
         eaUP6g34OQjvZyvc5iU1eTjIjsVft6nImM7Be1g0CKGxcRiVZHRnKoU52kuWeLXounw8
         4ySK0NehSND37zfIEOaN41jRWvk0aZQDoT5wPjAeDlNpYleuHZ+73ZS4gFB9fJt9sl7Q
         GSQbiQHH3/jVomH6E0qWyGDJUdLHBTykUqdkMsOwYF+E70N6CnBVvaXcFuMh3Zwi65Rb
         5mwpgkf7MtKaDuWYgzPveoqh1h/vsHc0sYzKIoMEY30oXEpYSWcfCzTmakEmCo860flP
         3qlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771698994; x=1772303794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJ4mlxz9+qmH9SFVDphbLCUFby68qXbPqoJ0t+cVd+E=;
        b=vQm4cmhQsqSveCOn2VxDa4hAlxSVMSBp9rzcvjAmpCtAoFRuXVdM86JuhAqo/Iq1jC
         p5Pa2B9K6dMZYE/m3vDdY7tZFaYDWiGmGe4UrhNxs373c+uuxqifl26TWYgg7QLTpxzu
         yPP0Awi7PGVQyxzmTyrj14hIrBtBphIK93NI6hWIRDwepNuL8xJ1MCmDHbP1P/98a2Ni
         aslfSeUEVe2ppVWVlf03ecQNuyxM0ZRjs4+Wabj772mZQ/Dvz7lw5ApQNBOIhilXWTbf
         SKay2QScZ3cbFca9cUUJ/26Yaj3qMH07szkfBHXm5tyXQHla1xf4cK5lKfMsEozQGnr+
         pn+g==
X-Forwarded-Encrypted: i=1; AJvYcCV8yahwX3ZCDku6sc5pTIvb8HFjRr8o0XDGR4p7FSMNglYC0yeovJAAlIiMrp9Mj2iUkLBnJ4w2dhqTWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJhAmdhiWYQ0XpqdacIyrunTNzLhiWlNXLbTX1Be4421+ziA9q
	zbQujM8bm9Cr7PgC3jUARuspVgnqO031vXxplXOcEZj2fXNgKBxrHx0=
X-Gm-Gg: AZuq6aJ7f3U9Xm18vzDlLgrAG307VpqK8dW3eF4I9osXbJHh3GcFiLCj8hZkdufNLud
	cfI4AAptbZHwVjy6NoOlancoHnfNor6kBH5ScQQPD3pxW9LLoL8l8JT1aymXHzva/iNgtzRhotn
	ikyhPHkQjNLgo6Nz6uzTCGuALgg/FTRQ25J3F3xXo7aWy6sKt42JTsaM5hjvDWBp9JM/O8031n0
	1XMcsK4a02qEKOnmEWuBjo4+dVUF/App+j2nNnRzYPdO7FLyq349nmBd80EpGDWW3pJhiNaBpXY
	zzlFyf63aoMPb/crNWymaP56J8fOM+QoLufoQn/ObUPVhQ892jmibTTnr3kIolqrHc1rRTqIgcA
	JmHkgo60ypjHPR3XgiUSIjUA6qoTCD7gM/gNDSS1udlTQmu3ROjdvHbQ+i9XJdkjXIV7i0T2yQB
	8AQJSvqQqx4l68aI7w6NwM5BG8LcprrXNqzDHze+OCbvhOm7E=
X-Received: by 2002:a2e:868a:0:b0:387:e03:147c with SMTP id 38308e7fff4ca-388536cef04mr25730261fa.1.1771698994175;
        Sat, 21 Feb 2026 10:36:34 -0800 (PST)
Received: from localhost.localdomain ([178.176.177.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7af19d4sm5006841fa.42.2026.02.21.10.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 10:36:32 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 0/3]  Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Sat, 21 Feb 2026 21:35:50 +0300
Message-Id: <20260221183609.95403-1-privatesub2@gmail.com>
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

 v13:
 - rename driver sun20i -> sun8i to reflect wider SoC coverage
 - drop the misleading APB > HOSC dev_info() warning
 - require allwinner,npwms and validate it as 1..16
   (remove default 8 and silent clamp)
 - adjust clock-source selection comment/logic:
   when sibling is disabled, pick the faster parent (APB vs HOSC);
   when sibling is enabled, keep existing shared settings

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-d1-pwm.yaml |  74 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  13 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun8i.c                       | 393 ++++++++++++++++++
 5 files changed, 491 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun8i.c

-- 
2.25.1


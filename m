Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6DD5381A
	for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 23:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716418900; cv=none; b=rSrklKUssaIG7TErKAH6m+esw5Udid9J2GZVfko8DdHUAnoz7oqKurWoTkMNFAwrhu4q4i+B/DTVAYnMWGe+95P5k7zXvHGr+0QGBVRmDLkqrJbGnFZGIx5lndoFWbfNX8GkXnLVCtt8TA72tSZv6N2OvhzX8ULJFbWTw5vsVzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716418900; c=relaxed/simple;
	bh=ZI8SE+5RcL5NzI8JtaeoVv2eUoKGGwt83fNG7B44Wns=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dwbsFbZ5pIINsfxENjB/onnvFCVbSjkHxUIt+mYhe2TWhpK4u+CkTqSyHbFf2R7+P0SasbBjTstCqj3I1A/ALCK68Y0sq49PlRx6Yl2O8SxIHq5BPHVuij3rxP0tZREbsOJbdCgavMyqVoRCfPpq4VlRjGy/uB/gAC/fB5D9UyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtbkN1aL; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtbkN1aL"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6f12ed79fdfso2679811a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 16:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716418898; x=1717023698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0DCCVIVKZCZnK5pAwPpme5XVnB4z9KDueXfUHNAsHuI=;
        b=BtbkN1aLimN+kjQJqtjkZDkY8qUZZ8oko/n1TujK7qv4MHbHKFR4CSJBm7YM6sBhCa
         BNbEPDierROUFor+ivtY+11TugyjfwBG8BwQETolON/R12nX8QPxBXYBv9LEQxK6p4il
         I3fIGG7S/0whuYFZaC1Wng01FPz9EZ1jDVTM5d9R3krr7kr12/SYruLlL3iwYjYyJ3Xn
         KjesdGeE6R/RBrXkApfbgmD/agRH1IpGMA8AW2PJO7SUrhFIJC0NXpRayMbBNui/2MFC
         /wsnRqhFD4ftjGkTkn8UojDUno6X1U8q05cFV7MhwPRyARGLPvAOiLptLFvgI5CX5PBe
         jXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716418898; x=1717023698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DCCVIVKZCZnK5pAwPpme5XVnB4z9KDueXfUHNAsHuI=;
        b=hpZYods2XcTX7/eoMc7l8zOK4BdU23BWxu5VIdN4nQvjwef91y9ppQlHT2hO8QaSL/
         j7mR6Z99P26DzDoOabd9Rt0pmydKry9+U/dk9ToVAGjAnkyEbHyh51lM0w4CZQKaWmSQ
         q+W0dk4pQI9zjwalACHZZr7EQYg5Uqj+2i96aZb4DZvwLSGPlMUfPzRqV62RnqSZ1ZDF
         5nc6qEAI2Ir2mtqkAXih81Kc9gPPXlwXEKQiaS6ihPuXdHn/C4nQXW6W8xHJlivzzXut
         DibniUdfTSHlJT62/+fC12nk9ekYwV+faFVgV7IbdhD1twfsnBCK+ycYXTsI5HE9zwWd
         rebg==
X-Gm-Message-State: AOJu0Yyhx9KOA3V1kTRe/dtAoFo31XeLcWcH+KjNpnB58ofuPlYdnVRU
	CHkYIHx/hh+nGtawQ9P539g61faFU0/z3tsaYRa9qoo5PDoRtmU0UbPD6A==
X-Google-Smtp-Source: AGHT+IHE8GNAndI69E9kReGSefDiGX4ZLLqWsmj4GbxgZPksd1egdS0/t9n5NmQ12/Prm5QDgXbBaA==
X-Received: by 2002:a9d:6a48:0:b0:6f1:2341:348b with SMTP id 46e09a7af769-6f665c26a0fmr3996465a34.3.1716418897805;
        Wed, 22 May 2024 16:01:37 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0ff995ccdsm4155936a34.34.2024.05.22.16.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 16:01:37 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/4] AXP717: Add USB Power Supply
Date: Wed, 22 May 2024 18:01:28 -0500
Message-Id: <20240522230132.364915-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

This series adds support for the AXP717 USB power supply. I will be
adding support for the battery in a future patch series.

Note this series depends on the "regulator: Fix AXP717 PMIC support"
series which is still pending [1].

[1] https://lore.kernel.org/linux-sunxi/20240418000736.24338-1-andre.przywara@arm.com/

Chris Morgan (4):
  mfd: axp20x: AXP717: Correct MODULE_ENABLE_CONTROL register name
  dt-bindings: mfd: x-powers,axp20x-usb-power-supply: add AXP717
  power: supply: axp20x_usb_power: Add support for AXP717
  arm64: dts: allwinner: Anbernic RG35XX: add AXP717 USB power

 .../x-powers,axp20x-usb-power-supply.yaml     |   1 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |   5 +
 drivers/mfd/axp20x.c                          |  19 +-
 drivers/power/supply/axp20x_usb_power.c       | 216 +++++++++++++++++-
 drivers/regulator/axp20x-regulator.c          |   2 +-
 include/linux/mfd/axp20x.h                    |  20 +-
 6 files changed, 256 insertions(+), 7 deletions(-)

-- 
2.34.1


Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5930E25778
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Mar 2024 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710870629; cv=none; b=mROUG+QYNRw08QvHNftd/RFkDVtNXUqMV52fkpWBfuhwy54BTvjzczcxtW5/ALBo5CfoA/0JD5Lj1pqcFdq7kcFNA2UdO7EiEfSTvU/C2apJyQOG9+aYrhswCzjzNAXoiBV1m6vuX+KZeLWNfvI/i++5/B3XFax85RH/esjud68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710870629; c=relaxed/simple;
	bh=FC9qHgACVBuEChJbgc+E+ma8kD4QWpYsJ/CWRaVS0Pc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dM5yXR+O2PKxYlS+nHfDG3/0FO8Lm8FUyVhi9Mer4ZZIi7SiLFtVNuefoOcyfzEedTjqRu1CXt5o4kVkYXJqdhl+AQLmgi7RlBKx6hz0DSI/ZAaiE0DOQ0FHFlvKlBCLMv3C79lrazYpRIyFhOQZVpPdZ1DB1lsZStWTnDewH2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMv4LUK8; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMv4LUK8"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso6715587a12.3
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Mar 2024 10:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710870625; x=1711475425; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=90Uve//wIswBhTh9MRoH8u7ai/wsqyznS8g3f0fG1ps=;
        b=mMv4LUK8FF34KNPO0FuB3bEP/wMHiHdkUPCh28+ApZTLz+MzYMhZ50VcvKeQR/wqZj
         0QcjdWM88NfKFJv4ChYLNoOpl7OQsvYcHEuXIq34NCH0+51wWfNSSJDA0IQSE6V/Dz7U
         5z9aT3bdNNjTethBfUTm1F0WQ1X7pJvEbTaQ8+u3Y+QWKts6Adim/BVM3PsKQCRjEAbR
         HVhoGHQtOIfWcwMtLIhrPDP+t8fxmhqO4zEOWV98sKMQvdDtTFrTLm69DhQo1h5FuDan
         xyLOiFCdAy8/lS9SrbIJ9d1DWZQ25vopcwaUQIlzayEKDnbcOKjGQ4pEp7EiwMyIxRFP
         rl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710870625; x=1711475425;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90Uve//wIswBhTh9MRoH8u7ai/wsqyznS8g3f0fG1ps=;
        b=YsrNeoECoHmm2wu8XbXHA1Hk0xrxH+DDRhvXbxSf6LIGJdhEj6iy6h8i+QMNRYjj5T
         5MAK/Y5f90GYuWwAg14xS80j04q6nm2QSTOGic25e68NMx15BTr+0Wyu4MMcsI1OxoKg
         kPNHR/KrLdAZWT/8sPTxu9vlN8K1Zut2SVRB1/78pyVMtE7An2Hkqo9EQpSDXPxjVqwx
         QrdbfbshjGHbzFDqM8akVOSaBddlYcFydO0dVvRfUCURPs5uNOJq4fxq60OOt5JNbkfJ
         57pttC/hI5a/cUOW6hc5tOfovs2w05NQ2SX3D1JKT/8X3dsoSiUI0bkzwLscsu1HrwFA
         bpJA==
X-Forwarded-Encrypted: i=1; AJvYcCVDGRWaA7jZ7f2rDvbjT8rKDvcokSGBTgENAETsDwRLVBUUtk1sLRjpwis5dyFwyt931mu38BIxccOO1IaG3zpVXx9Snl+/qQE0PqM=
X-Gm-Message-State: AOJu0YxpL8h0PsBi5Gw+du4EF6fpstX1jWmb3OwnoV0V4batFWMGR2ET
	rCkV9b3OU7wIniMRfiBxMs863IlaMuNpvqH6GEuCheAVP76fIyb4
X-Google-Smtp-Source: AGHT+IF7vuhT7/C4Fxt4OmDcbKvKSoBM91Kwo4Ruhq+2j1nPzidv7MHrmILAqwkpq6LYy5E38Gxm7w==
X-Received: by 2002:a05:6402:500e:b0:567:9fef:f7ee with SMTP id p14-20020a056402500e00b005679feff7eemr3011457eda.16.1710870625386;
        Tue, 19 Mar 2024 10:50:25 -0700 (PDT)
Received: from ALDERLEJK. (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id et5-20020a056402378500b0056ba8b68505sm84329edb.92.2024.03.19.10.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 10:50:25 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
Subject: [PATCH v4 0/3] Add initial support for T95 TV boxes
Date: Tue, 19 Mar 2024 18:50:21 +0100
Message-Id: <20240319-add-t95-axp313-support-v4-0-6204b6d23229@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3Q+WUC/43NwQqDMAyA4VeRntfRNmrrTnuPsUMxVQvTltYVh
 /juq8Jgl8FO4Q/ky0qiCdZEcilWEkyy0bopR3kqSDvoqTfUYm4imCgZ8IpqRDo3eS4eOND49N6
 FmVYdoFZNUxtEko99MJ1dDvh2zz3YOLvwOv4ksW8/pPxFJkEZNaAYCMW5rNS1H7V9nFs3kp1M8
 B8DmWFYQydbAQjym9m27Q2ElnE6AwEAAA==
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Kamil Kasperski <ressetkk@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0

Changes in v4:
- change wifi pwrseq node name to 'pwrseq' in sun50i-h616-t95.dtsi
- replace vcc-pg-supply value to reg_aldo1 in &pio

- Link to v3: https://lore.kernel.org/r/20240317-add-t95-axp313-support-v3-0-0d63f7c23d37@gmail.com

Changes in v3:
- remove underscore from wifi_pwrseq node name in sun50i-h616-t95.dtsi
- fix line wrap in commit message
- Link to v2: https://lore.kernel.org/r/20240317-add-t95-axp313-support-v2-0-e38032811758@gmail.com

T95 is a most commonly known for being a box with a pre-installed 
malware. It uses Allwinner H616 and comes with NAND, and DDR3 
memory.

Those TV boxes usually come with common hardware:
- Allwinner H616 SoC
- 2/4 GB DDR3 SDRAM (Hynix H5TQ2G43BFR)
- 16/32/64 GB NAND flash
- microSD slot
- AXP305 or AXP313 PMIC depending on board revision
- 3.5mm A/V output
- HDMI port
- 2x USB 2.0 ports
- 100M ETH using Internal PHY
- LG642 Wi-Fi and BT chip (rebranded BCM43342)
- 7-segment display
- DC 5V barrel jack port

The board contains holes hor UART header wired to &uart0.
&uart1 is used by bluetooth module

From the DRAM specification its operation voltage is 1.5V.

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev

Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
---
Kamil Kasperski (3):
      dt-bindings: vendor-prefixes: add t95 string
      dt-bindings: arm: sunxi: add T95 AXP313
      arm64: dts: allwinner: h616: add support for T95 tv boxes

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi | 109 +++++++++++++++++++++
 .../dts/allwinner/sun50i-h616-t95max-axp313.dts    |  84 ++++++++++++++++
 5 files changed, 201 insertions(+)
---
base-commit: 4138f02288333cb596885e9af03dd3ea2de845cb
change-id: 20240315-add-t95-axp313-support-5f3da8996edd

Best regards,
-- 
Kamil Kasperski <ressetkk@gmail.com>


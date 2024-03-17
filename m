Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17EC1CD1F
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 19:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710704876; cv=none; b=PZJBVoY6MeoF1B05y8erCdI4dh5EwyYIB9M8Zgj1uPdH5q/znkKjq14wL23Rb5ogvu8qZ/az4YeSnWEhg+6MQgGtoqLCTIatf6mNiLpyF+fIWyNEd4ws5PJaCUSuTQzZ6QKfm/EID+4Nq9nGDakH+E1wSmZpN6aFFWAa48IzzJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710704876; c=relaxed/simple;
	bh=EOE2bo0zJ9hf89Q0Q5I8PD2WdBZOnIxrXxn41GaOEo0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MfXE6m+2tAud5DHyZIm9+dJAZ7Nn3w2tNXrd+djVFMb2Av5joygaTCiZiGDYQ0UdXF21QDtMLLO7ykHiSZ5WPgPabdFh8Ptr3G66JhhwIB8QZldNvj6gPbcGpQvjratq+yEZfEV0TD5JQ6/BSebmGJSEXgiol0ZGOQXYz1JqgdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCnu3zRP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCnu3zRP"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a46ae12e3f3so40857666b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710704873; x=1711309673; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HxxAZWybaK0nfNhYMPJ2x8WOCyodnruQ7jiYPVCHHZo=;
        b=XCnu3zRPURzv/DU11J0K4WCl6GkdMTiZunBpRtk6M464+49PxNIl8cpLT5TCSJ6SJz
         5pto3h0lVurK0B4T1xnuQeRT57+KzVRQNnZELrdeRduRMCw/1Zr6smvAk4FxoUYjI1Qr
         B9evMwa7vLcUa2D1pkF+qZmij9/p/EDimL/eb4z7L3sTuwgbgGRCz1Ill5UGXwtEQVqW
         HNxvkL8mJrYAN22h53BHq9BlBuumUR8+U4Hgz1SjBU7V7gDq41ytsC04B53R2w9iPcqo
         OmAh5vfcVzywTUJtpyb4R4oB1FUbqKsvmx3bFc4w4I3RuQEMDQfrBZ+jCvPiNcHZWrNX
         qMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710704873; x=1711309673;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxxAZWybaK0nfNhYMPJ2x8WOCyodnruQ7jiYPVCHHZo=;
        b=daiu1S2kWcqsKMy4vvft4c1cT5alrWd5ZZKYxf5fRnWh6bOb+RXvAsPu9S+mpOyu6h
         R1sx1fL2LKgWCS9RUugKloPlL6nh47uSFZ18XhcLssf5dHdW71iK4W8O1tIYj3XKgivl
         qsus9nwVRDUlpCcHpEg1RSesQsN1LrwvSpnYCTUwJ5+tWvMZefYB8kQ3yhWu6wdFpGvn
         ycVloXnUAYG1Lo2UPDn5FfK9CcNre4V0+9O4Igu5To7SNQGqLxpxRGm3rzqbt79U87NN
         5wbtjFi5ruTfv7Z6KFktSp3PIVSZ1lBbRkoBOKmy+r17ICOsGyxHI7vu+c+DmNfZGj0W
         yADQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDJi99G4qOzZwzjylhDjnhgg7N+RMzn6TXrl6+cFgHFBDxL+NBE1/idxKf/BWs7Jp/eKgq18LBTIrLe7RGGbfKHKBqQj4ZA6xh5WM=
X-Gm-Message-State: AOJu0Yyv6jSQ1YqDuItClesKSTu3xrOmq3XPTbhYGy+arHUot64+rvKz
	UjG5w6sPmszz/DAp5YGl3tHYtOck+tTmXF6DwUzrNShZg7n8AFY3
X-Google-Smtp-Source: AGHT+IHjw5wdNqqRL84aIea6Y6j91etevio8AN75lq5QpKtW8Dns821V1ojkFQvjPK+sDFAgkX8Ikg==
X-Received: by 2002:a05:6402:2079:b0:567:6bf:e92d with SMTP id bd25-20020a056402207900b0056706bfe92dmr3367835edb.29.1710704873001;
        Sun, 17 Mar 2024 12:47:53 -0700 (PDT)
Received: from ALDERLEJK. (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id i24-20020aa7dd18000000b0056ac092a7fasm8234edv.87.2024.03.17.12.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:47:52 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
Subject: [PATCH v3 0/3] Add initial support for T95 TV boxes
Date: Sun, 17 Mar 2024 20:44:48 +0100
Message-Id: <20240317-add-t95-axp313-support-v3-0-0d63f7c23d37@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBI92UC/3WNwQqDMBBEf0X23C1JttbYU/+jeAgm6kI1IbFiE
 f+9qdBjT8MbmDcbJBfZJbgVG0S3cGI/ZaBTAe1gpt4h28yghLoIkiUaa3Guc66BJGF6heDjjGV
 H1ui6vjprIY9DdB2vh/jRZB44zT6+j59FfdufsvqnXBQKdKQFKS1lVep7Pxp+nls/QrPv+wfWR
 6vCvAAAAA==
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
 .../dts/allwinner/sun50i-h616-t95max-axp313.dts    |  85 ++++++++++++++++
 5 files changed, 202 insertions(+)
---
base-commit: 4138f02288333cb596885e9af03dd3ea2de845cb
change-id: 20240315-add-t95-axp313-support-5f3da8996edd

Best regards,
-- 
Kamil Kasperski <ressetkk@gmail.com>


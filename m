Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35791A08DC
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 16:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731342330; cv=none; b=QyErnjDMeZlXQjHlQ1j4iTbXD4cCaqJ0GKVGiAWcd0E+5naiJLLI66UNwYxDhu4yEchiYjHOj4J+JiOKZRoe535yEkaMIc3nG+cTDZ5dz3tS892RbADSEPk0+5e5V7wY2zHbXWxMz+/FcGnUFVrMbpgYdCOlDIggyCd3alh7xFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731342330; c=relaxed/simple;
	bh=CbXbbC4z+ofdaBIwJk70SKQ1fdSjyYqQJZfqnVZbHW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=coV3hvFb79tdRwmgr7TrJVp3HJC1Yl64o+fhMZ4Psb9mGlHPhnsNw6V04++p2TdGf/UwtGZSRLXPnVmP3dsxEM43HwCVvq733iwYQ93KOHU4O2XXLtowYZlU1I9GUhk36rOXlb8cJW5oZiRrUkUES/IALsA20YbFLgUpbCtAMIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvSQqzGv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvSQqzGv"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53a007743e7so5595339e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 08:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731342327; x=1731947127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u7uGQSXY7j8g596c+PHmEhLMGV2dxdcfbU5o0lzJ1EA=;
        b=mvSQqzGvJpomkx4JcaY2i59EqrrONtbaKKGtGhY2J0X6f+fKBj9o49jfYrKcYSdQDf
         NgLfz64iPyfauP6AK/93h5l36ii41n+DrTuLRH0rwOXBxrcIBZAC2M3PFVGtac4rvO3M
         PgmmLwnxEOmaXrvPCBlSYXuu3wcax8j3q4XdbnaNtY7kb42qZecLMucbLavp3pDg3RP1
         V/KMt3cACBoTojQKFB6czRGRpY+KTo1HRI3fJZznjmXYH1l9D5pWMFhTyaAmp7lN/9rp
         YTI6pRvFz6+SsPzBoivzl+SFI/5m9+zu5qllXF4wbsJwbji8Dz4LISg10l3C0/viIyGj
         qbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731342327; x=1731947127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7uGQSXY7j8g596c+PHmEhLMGV2dxdcfbU5o0lzJ1EA=;
        b=ceeLJlfNm/dq5ujwPJN04TTuJUV1K+iURIoQ6aEO9QASAL7NvL2PKvumIqwzNK1XfC
         EOy3JD7Pu3DPEOHSD1v47ExLLP/vnFw4d+7YS9jQ14ba9B+9jN7uhLL9IUMH8o6We3J5
         byy5li+C3IgqTE/xfhvsekiQ0QDy/+Lw8qMvhNaaNVQP8lSBMmD/p8Ik8Ftzn/Qx1U9M
         KYrU6cswKFCX1NSfrUxkmRsG6I4ikeh8cxFIU/cBX6QQe2eiuWEhsfyFCRH+KqyYprq3
         Zg/UpfzUoUuziB7OPO1MF5nuF5hESHF/MASE68SZ3aRBebsGmyqwf7lKogm/j5UB0PQ8
         AwQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYwIAkbtTCfIPrajstX5zlTUcgxk6TaStqTOesFjWe2jkQI1GcFSwoaV0dMeYtYprVCrjQPYCOLDDsRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjLhimN3O6N7jgka2+RhpzvttH6CqO3heC2bTXeeGDOzG+Xgv3
	3k7KmQQoH1I6hU4fa5xY2EzPOLJA0M84CwSwDc8EaS4yvXDsj7Ry
X-Google-Smtp-Source: AGHT+IEwJZXunlyKUejm4iWMJ0VGAjHoH3Rb8MSXFF/rOZ2Yc5x8WVvvL3bT+8Zu01TGRZ1b6kh3yw==
X-Received: by 2002:a05:6512:159e:b0:533:4689:973c with SMTP id 2adb3069b0e04-53d862324c4mr5685506e87.23.1731342326593;
        Mon, 11 Nov 2024 08:25:26 -0800 (PST)
Received: from localhost.localdomain (c90-142-33-119.bredband.tele2.se. [90.142.33.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826786acsm1622926e87.30.2024.11.11.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 08:25:25 -0800 (PST)
From: codekipper@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	wens@csie.org,
	macromorgan@hotmail.com,
	jszhang@kernel.org,
	uwu@icenowy.me,
	ryan@testtoast.com,
	dsimic@manjaro.org,
	mripard@kernel.org,
	Marcus Cooper <codekipper@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: Add X96Q Pro support
Date: Mon, 11 Nov 2024 17:25:04 +0100
Message-ID: <20241111162524.46812-1-codekipper@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marcus Cooper <codekipper@gmail.com>

Hi All,
The X96Q-Pro is an STB based on the Allwinner H313 SoC with a SD
slot, 2 USB-2 ports, a 10/100M ethernet port using the SoC's
integrated PHY, Wifi via an sdio wifi chip, HDMI, an IR receiver,
a blue LED display, an audio video connector and an digital S/PDIF
connector.
Further information can be found on the sunxi wiki
https://linux-sunxi.org/X96QPro and the vendors site
https://x96mini.com/products/android-10-x96q-pro-smart-tv-box

Thanks in advance for the reviews,
CK

Marcus Cooper (2):
  dt-bindings: arm: sunxi: Add the X96Q Pro board name
  arm64: dts: allwinner: Add initial support for the X96Q-Pro STB

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h313-x96q-pro.dts    | 176 ++++++++++++++++++
 3 files changed, 182 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts

-- 
2.47.0


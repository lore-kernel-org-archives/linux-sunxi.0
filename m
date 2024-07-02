Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EDA1CD5C3
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jul 2024 19:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719949001; cv=none; b=bF6gM1BUuIbyzi7r9qor1RBCHgTuE0MLxQtiK8qihj8quCeKNp4HvZcbPKnjeEr5El7i68/SfrkKDEDpJnWsOUIPEeERTL1Mwcr0SPshFL+7QlAeht93et+4x6HcukrZKCtBIVTgulleIUhB8NSeyOxexvh0ZMVgozqVNeyh8Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719949001; c=relaxed/simple;
	bh=6F/yYAXpim102SmVbMot8UkS6QxBBy7dCwzI1lmzSBA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H4iBw1coQHeaBi+ucv1a1Vr7QF62I8rTUpaJVKl6T8WG4z+zpvYAmxPNGHytWwCn0i453WKwiSwk5/Yod6H53AdTGe2ELT3XDH6sRCcicAfyySXd7ovN6S3rtgE+KyTjGns938KhKkNGHcJPWUMuVAwQXU5/0lr2VzOG9KxXkVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YO9LuOfg; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YO9LuOfg"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d55e2e032dso2720950b6e.3
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jul 2024 12:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719948999; x=1720553799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fUg/GMMTHwTbyX+1UW0yeugszpa82EFk6gc82tEdMkc=;
        b=YO9LuOfgW/1U8BiMCQoZ5lNd0+Mu6xcJlKs++lnRuOkaBK52FQZCZxeCSpSrkPmcqj
         rmuLR5epczFOnp0/g2g36QbfLNP8z3d9nUO4Gq71GTtrVMyM9te42YPhwkTOO9qo8LZu
         j1MjJbdUS4SP6pHZVLGQ2UyEtcHLsn1NZANUXGxG07eW8bpKL7/yMurBWLU2dS1Zkcnj
         1kessOXShKyv0X4G7h3tlFfBDyHQivO1/eQhO+wRuKNv6xk1G/PxGkbk2MEniFSPpb4y
         oP50o0RLsWgwjK3g6y4JYFYYdtAR5soIjN6cSOE+VHQcyiOGq/ytSPequCS+BZuLQWHL
         6DLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719948999; x=1720553799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUg/GMMTHwTbyX+1UW0yeugszpa82EFk6gc82tEdMkc=;
        b=aPmTabaXoibosQgNEsE3jiLwo4f+puG1L8m8rAEpLsBWd+q9MF227vgCGCLCNZvIrF
         U3Mz/3c/VBvwos0mb+9K+gxJrTNWDW+fbuq7thdu+pVSOdFUL7tu2iCW+ycDpwVqhpdm
         7p7oPkaF7FkkGT0wal9z5kxQ76/6CK8oeItOS11tO/9tF97aCx3CxnvdaNM80sdbqruY
         O1lW4nrDdLhQRATNZjEW4tGXVkt1ZSd+r567hjmYLkGyuVqtmOeJcYLSizcj3CS1ljjs
         rCKvAHUHAJnVIGKeFubromU48X+NEWIT+bMDLJswuw7Uu0aGCLHpV4tbtHNk76ietqDv
         /pog==
X-Gm-Message-State: AOJu0YzzAPuzRwwrsdg7qLlh77Yd0RAz56v8s0QiwLPForJvUYKufG7F
	8dZoqg4U16+fiJ8BE4qXhs5UpVfc50uxsf/Z22TBzJSCAPlk3n8MfC68/g==
X-Google-Smtp-Source: AGHT+IFegFBCrzeJS5wdY4aeYQ5mes3mmw95KRr8F2nl55Zcguhyb6AqDWyzYWZlN0FAyX5b8UWWtw==
X-Received: by 2002:a05:6808:1814:b0:3d5:55a8:3637 with SMTP id 5614622812f47-3d6b55908f0mr11048391b6e.55.1719948997350;
        Tue, 02 Jul 2024 12:36:37 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62f83c92dsm1831335b6e.0.2024.07.02.12.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 12:36:37 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	ryan@testtoast.com,
	andre.przywara@arm.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 0/4] Add Anbernic RG35XX-SP
Date: Tue,  2 Jul 2024 14:34:10 -0500
Message-Id: <20240702193414.57461-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG35XX-SP handheld gaming device. The
Anbernic RG35XX-SP is a clamshell device, but hardware wise is very
similar to the RG35XX-Plus. The RG35XX-SP has a lid-switch and an
external RTC that necessitate a distinct device tree.

Changes from V1:
 - Switched all RG35XX devices from the r_rsb bus to the r_i2c bus for
   the PMIC to keep it consistent.
 - Added missing pinctrl nodes in sun50i-h616.dtsi file for the r_i2c
   bus.
 - Modified devicetree documentation to keep definition of the RG35XX
   series consistent with other Allwinner devices.

Chris Morgan (4):
  dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
  arm64: dts: allwinner: h616: Add r_i2c pinctrl nodes
  arm64: dts: allwinner: h616: Change RG35XX Series from r_rsb to r_i2c
  arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP

 .../devicetree/bindings/arm/sunxi.yaml        |  9 +++--
 arch/arm64/boot/dts/allwinner/Makefile        |  3 +-
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  2 ++
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  6 ++--
 .../sun50i-h700-anbernic-rg35xx-sp.dts        | 34 +++++++++++++++++++
 5 files changed, 48 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts

-- 
2.34.1


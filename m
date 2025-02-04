Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C259214A60
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Feb 2025 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684862; cv=none; b=HJIYijF6HxJwFEPulPc3r57g8p5/m7ooD03LHG3QMOjEnmwSENQq18/WzCTlly6xn0u3XpvYTwBj7af5Hs7WGODauNOylSWdH0iw9hI2T7g/Ngtwo1mjr8CJn0wyowMzQMCM8/1RWl+uMK+d5REST9zb1fxzy2ybPCc9PLTPugI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684862; c=relaxed/simple;
	bh=Furu2lt9uFeqrf8T3sXnWVfXz+v3n5LkreeZicTFjBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IMfbPn0DlICNyZrYyQVw3ON0b8/YxuZLg4omUPqHm2fONUsdXPZSU2CzXvXLlRatv2RNahRFMUgPkZQ5tJZMvh3nGuOfv/A4ja/gCCd6AjHW0FowIiEvroTOIaD43chtsu/CjauarK5x3WOf6DzOIEmvIYjiMfqQ31++E7LafiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMiyFa4N; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMiyFa4N"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3eb8bdcac2eso1301074b6e.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Feb 2025 08:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738684859; x=1739289659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fwB+TD2uoxXsGIRkk3c+g+PhyM3yitZRLB/BrmohF00=;
        b=iMiyFa4Nc3gdohJRHFzZR6nQsDSzYTSo/RKLBYkEpFsyw2mhtpwJNKXdqXb1MAP0L3
         NOQSe/Hoh/Y4QTGNv/Zke0MKPZibVvJbQGAzs+HKxqG6oyB0j9LCD3uMjBowBnUDFEDp
         AiS/MQg1tGWo5por0PUGVlZyrGdgIws+lN2agA22RqaqLrqGhvO7WkaK5SBGtsegJB4E
         yxcFA2IT7KhIvsTRXTVL3tsL3ds+0Cr35WWG+e/WMUs7Lhn5pwMrgWjoihvrvMAqMnb+
         iNxTC+clkH2Q10pfW7kRoDb697zwBv5fFe+yyhbeUPTfradV0jTbG+NMuItZXLeCXYrQ
         Bkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738684859; x=1739289659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwB+TD2uoxXsGIRkk3c+g+PhyM3yitZRLB/BrmohF00=;
        b=dbsV+fcadeslYqiAX2CpTXA8lsVD64gGD/rM8QAJ5hJBq5mzhRykeAup5ABPkHjBoG
         mppQpisow2uoZDducLuyaa4bVWDzK3MP0Z54UmbcTBPKoii19xJB9ROp2wTPWZ1ZUuXZ
         IVonxD1SAhAkAcO0txbu/AMAjU9ToW5MQBYG9ESqufVe8w465usKevOxxLtYAcTA9ZJO
         WFglRneogTZrH6U/QpYJMNh+79r2d/hCna573y0xjYI2KJ2tSr87+satwOaJJ/j3N7rT
         wQ0CQUbrVXE6LgRktk4IMZuXYhoTgcidDIdu8TAWM/O2iE66aMdqfhbnZZM0sx46S+fg
         fI9g==
X-Gm-Message-State: AOJu0YzdES6E3DmiOsvpFD1hoHbsQiN1z8sAu0XU01aEvP+udfm9z2jG
	AC5ZW+xbETfXU/PSWhdBhxZ4tk9m279J99bd/95Pw0dbYPBdanKVWfQGUg==
X-Gm-Gg: ASbGncvcR0WXaQ6+6sO1/t2t8S2xq4aKpgTZiKoUMmOo0jAYbQj2bbEhvgXljCHhF5R
	YuLz467ST4cK43u6G9Jgc1In85KbjUAdcnEq0Dl8JbN0+mKWqIB4jEeyTkaPUvHUBGw9yHYkVHp
	vJox54nfezRDoADKYKwO9jJcL9MZUHk79JzfU4/hPuy4zQMcqcnIzbsWu3hTsJVTArou7kPC9m6
	qAT4uqM/+Wn0xUplh8ZSr6/XRrScQzQX+Q5lkhTUPFjFBc0mqq67LkN2YtpwxsBXOUKGQbqfMGW
	Q0KcTyk+E64u1tuyf0paVZVMTH5RoTPe6us=
X-Google-Smtp-Source: AGHT+IG4mgrK9AYF301+xT8ZzvYHAcpmGDbS9oWwv8egYLx1PyvAQb7rPP28umrB/ztOhC7oqyDOkA==
X-Received: by 2002:a05:6808:1b99:b0:3eb:6044:5a85 with SMTP id 5614622812f47-3f323a76658mr18318485b6e.20.1738684859129;
        Tue, 04 Feb 2025 08:00:59 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:f8ca:b029:fcc5:5836])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33365be86sm3039570b6e.31.2025.02.04.08.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:00:58 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 0/4] Fix RG35XX Battery Charging Issues
Date: Tue,  4 Feb 2025 09:58:30 -0600
Message-ID: <20250204155835.161973-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG35XX devices sometimes fail to charge when the register
for the battery temperature sensor is set to the incorrect value either
by user error or an incorrectly programmed efuse. Allow users to
hard-code if a temperature sensor is not present (which is the case for
all Anbernic RGxx series devices) to prevent this issue from causing
problems. Additionally, a bug was identified with the handling of PMU
faults while this fix was being tested.

Note that the MFD updates to the writeable regs are required build
dependencies of the battery fix, as it defines a register that was
previously not defined or writeable.

Changes from V1:
 - Updated cover letter to note that the MFD updates are build
   dependencies.
 - Removed patch for "power: supply: axp20x_battery: Fix fault handling
   for AXP717" as it has already been accepted upstream.
 - Simplified binding documentation with a "not" statement.
 - Corrected writeable regs in MFD driver.
 - Updated comment in driver to note a correctly defined device tree
   with a simple-battery node is required to apply the thermistor fix.

Chris Morgan (4):
  dt-bindings: power: supply: axp20x-battery: Add 
    x-powers,no-thermistor
  mfd: axp20x: AXP717: Add AXP717_TS_PIN_CFG to writeable  regs
  power: supply: axp20x_battery: Update temp sensor for  AXP717 from
    device tree
  arm64: dts: allwinner: rg35xx: Add no-thermistor property  for battery

 .../x-powers,axp20x-battery-power-supply.yaml | 20 +++++++++++++++---
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  1 +
 drivers/mfd/axp20x.c                          |  1 +
 drivers/power/supply/axp20x_battery.c         | 21 +++++++++++++++++++
 include/linux/mfd/axp20x.h                    |  1 +
 5 files changed, 41 insertions(+), 3 deletions(-)

-- 
2.43.0


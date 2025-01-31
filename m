Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488DF1AF0DB
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jan 2025 23:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738365443; cv=none; b=qYwLxnFj8sDspJ4vsgvRb7hbizE0L+L2Sb3XTyMqa2wW4nUo5lZJ26IjqTj0Srj9W1Fre+DhbrvnDu3+v3Kw55YxL+o4lBj+Y/R8rAQ9EKFbWlHMKPBMqQOdyH6tCBKNZI8UTf58wnVdlsGRlCHZu4/3UBlzFA5X6uBr1qqVHgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738365443; c=relaxed/simple;
	bh=YapN2yvZIwdswNXYbi1VrbhQHoJ9NYwGj54en8q3GcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aCbO1UCEhlknchWSOt3wXnbzW/+oNCXzxVeBguzPu2w0xHbL+Khic1f6Sh5s43VN19JJwrxG8WERCNE7Mh5R7nYYudRn46SuF0B00nC5iz+wJfOG9d6ENyxbEMFZHq3BmTJyYYplRLosQdg0DOVfeZAbwcCWDYfiRnuuX6bOr6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtMxsIF6; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtMxsIF6"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3eba0f09c3aso738352b6e.1
        for <linux-sunxi@lists.linux.dev>; Fri, 31 Jan 2025 15:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738365441; x=1738970241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yA0ZMs3D/azII+yrcqeVKwM8wsWt4qgAa1Wy8fUSpJ8=;
        b=WtMxsIF6LZCHbNR2acVL16vmn55RG+xBdZP36H4voFe9iNs5ol5W3Rl/S5RElufO3g
         x1K7Ni5Lzzs3pZ3DGW/6f3axl2GYp7tNo8//XbJW7yPJpaAgxhr41d1Y5o6oGJF2mHgU
         8F9co3cPx+IChn/lq7IGZchPDuIrpKBYrIJLHbn4b+KlEJTwWsWyS/AW31SZc/dBGeC3
         2+XHDG5Lr/eLxDl4QtkB1gNB63DVoz3RtR9wkPLikZyM9qucnDfuJlkoMDQBkS+C5Soy
         BNtnmw3DF1MIfI8nHBzQnJwB0uolE0pDS1m1UsLV0QY9VIlVuByZi1rOmXQctEeCGOEI
         fhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738365441; x=1738970241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yA0ZMs3D/azII+yrcqeVKwM8wsWt4qgAa1Wy8fUSpJ8=;
        b=QDgBA34XmTzJG2qiKs0TBvmty6tgDJR+40qoExLyxHWU+dZpBBSBt+AJSCXbu4o+gT
         RAaTMmj38gGENbGmg6PagxjlnBa4JZmDW/6PKhG+nzyd6r+P5fY/jI1nlQI2j7zkcMHU
         /b9OrHLbMuJhhZQ6yniHF1ksGwGCwHb+1J6EfBEue1tKTt7KiUwV4DZ1fUOTCB313ZqD
         Ip9Hqoyn6mXytwyjzpe5S4AOdWDcSey0Uj0By/5HGF8Cr9HXQoMflW4Hu0nGqZ+xfbLN
         Vuff0qmXYnL2wn5FVEMD0KVpy/rrFnkb2vNG0kmAo7UZgd9wrmzml3kMTX/0+ji8gKDE
         Ihjw==
X-Gm-Message-State: AOJu0Yy4qppqMB8dm6iBbG4pjduZt/D4KE9ZW5VqCcU4OLxaSRG+FKez
	/p0hJFWqfbRR5uaLP/rOuWsWJ97HLiJeLZ8yDuM7LVeelSCFhDUha/p1TA==
X-Gm-Gg: ASbGncti8P+WnW5JgceMgcewUCQ1Nzc47nG2QHsNoqtbgDs0k2wq62S6ZyZjC2Az2GR
	CPZFd6quk4aCnN2Qz6Pl+rlgbfBK662+GyuKbjBzM0NtQFtCYYeoAnXwWOfL6IIMClrQikzcROd
	0oxGM++Frj37qLpJEcKYNCoX1WUIJ9AI5ThBD1IxwsnZryPP5iJP8XdMlSAMjcCwZ1YxTUoE4nj
	aXHZy+gNP+3maq+gc3t+gRMkNRgx9qvG3MYR18tyrQhRV3Drs39VaNp0+8HCSYUIKaKmpPq7S55
	GYXoJIVK+v8UwUEEJZh842pBnb1y1TeWoMs=
X-Google-Smtp-Source: AGHT+IF5zsoG/jawq548wfM27QRPX4FYVr58VStU1xLHndeakk40y9CTMujkL8ITr+DZKnbHxokUnA==
X-Received: by 2002:a05:6808:3197:b0:3e6:3867:d107 with SMTP id 5614622812f47-3f323a158e3mr10821535b6e.7.1738365440973;
        Fri, 31 Jan 2025 15:17:20 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:d061:e6e5:c6da:b514])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33365bf31sm1099128b6e.34.2025.01.31.15.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 15:17:20 -0800 (PST)
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
Subject: [PATCH 0/5] Fix RG35XX Battery Charging Issues
Date: Fri, 31 Jan 2025 17:14:50 -0600
Message-ID: <20250131231455.153447-1-macroalpha82@gmail.com>
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

Chris Morgan (5):
  power: supply: axp20x_battery: Fix fault handling for AXP717
  dt-bindings: power: supply: axp20x-battery: Add x-powers,no-thermistor
  mfd: axp20x: AXP717: Add AXP717_TS_PIN_CFG to writeable regs
  power: supply: axp20x_battery: Update temp sensor for AXP717 from
    device tree
  arm64: dts: allwinner: rg35xx: Add no-thermistor property for battery

 .../x-powers,axp20x-battery-power-supply.yaml | 22 ++++++--
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  1 +
 drivers/mfd/axp20x.c                          |  2 +-
 drivers/power/supply/axp20x_battery.c         | 50 +++++++++++++------
 include/linux/mfd/axp20x.h                    |  1 +
 5 files changed, 56 insertions(+), 20 deletions(-)

-- 
2.43.0


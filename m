Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4673218E032
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267724; cv=none; b=W9Rj1OfUBlW/hTVhCjJga4Y3RuQziTbdNltBCfmDa7BuboPv5ddYQfsf8W7XRpfdRruO/6K+AF4YNMKjwSrIL64r62cMccCH8nMuJrWVG8DUNu95cX9LRQRUGD9VHRj0odZETRQsUDg8UhpmwJzkR8fH++qIFQK8TJMgrpWTxt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267724; c=relaxed/simple;
	bh=OHeEhM5FF2CEYtTUx36s40wdUZnti4MNvfIZl+giNlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IN+YBXrKIFyjFgwuxBcN5ngoPAbRndGjmc8Lml9GNI98fb0ewRi0XGlF7an9IRZyaPYzVea076sCk10HO5+tx5G/Ad4E41nS0X0IppDw/OYquHK/GXixTs0n5sR1xFF9Hzc11/XZ5u1/twkRVpINDXUVdM3S0rxZcOGdATqs8OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoRLOKH1; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoRLOKH1"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-288661760d3so1227652fac.3
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729267721; x=1729872521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8y6se+EJ6mvSxRBi5tp2Aqfl4AEwYhM+2/IievvAH3g=;
        b=NoRLOKH1fi4+QIhSsdHITarCn148NOdAls3YAzRMN59OkpsCMc1YGsAViX8aXoEfm+
         fKcyvhJK/Grbkt3yopzaofUuNe57RszDfJzohl+q5nXc4g4gEmqpaUYsT+d1BJMpCeO8
         Ky++76tRaTdMekwMSkYdA928lrGYfUK3jtMw5hwIowsCGZ6QPzBHTPg50AZLTyCt8dOp
         pF6W0jdHGhmawPkDCtgYV+3JeEtgHhl+K/yzs1jo//zBCRWbWR06qy+Sqxxk2zGoMjuL
         mvz4mxeAWjDv3nXB/279hznMtGm8OZO6oPEnigd3QRTocRGyY5n+LAABpNNlPySaAFy7
         Tm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267721; x=1729872521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8y6se+EJ6mvSxRBi5tp2Aqfl4AEwYhM+2/IievvAH3g=;
        b=rC3yvmXDO1vNWTj8vaPzlBEwKqdOFDep02+74aNfmgmUNTw21FNyU0biOnDxitx9HM
         DnHVdOP7gdq9X+uYd2A4Dp/oXaO6WHCFg32uqrbHu4mL0dH8t+YMLxXtuM7ec8B8I/1+
         F/sQlaEG4i9wKv7wAWzMGfCbUeMQavVSSPngh/V+sDEkPh72kFITgCojKNT/hYowfka+
         DjaoubsQ/hyNlKYkFpL7eaCwYWe0tza4M70131KSXbkIWziguilhxmnl3W4FxphS/0KV
         NHsJG9+GaWU45QpZfxFbDlwXHatxR7e2Qo8rQR9pHOV6+ssaBygivXr3SpqU+6Sf729H
         kznA==
X-Gm-Message-State: AOJu0Yynb9arRRdTPCTMV5C1sZ0Fo8QEF0pRSAaHXio0PYtxRKXxrxDf
	c6m17+rF/AbDOLy1VbG7GGbD8I4fTQxsU26pXIhVV9TdwVZNcRvway7Pbg==
X-Google-Smtp-Source: AGHT+IG8JAdwTWiLrp0I2huJpsSFVUIkNRbYeYMXbCsedwLYlQs98Qp961iMWG/wQdyPOxCxEcNOKg==
X-Received: by 2002:a05:6871:581e:b0:287:b4c7:b6dc with SMTP id 586e51a60fabf-2892c375bdamr2433536fac.22.1729267721015;
        Fri, 18 Oct 2024 09:08:41 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2892afb01ebsm507350fac.50.2024.10.18.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:08:40 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/4] RG35XX Add Additional Hardware Support
Date: Fri, 18 Oct 2024 11:06:13 -0500
Message-ID: <20241018160617.157083-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for MMC2 and the second LED on the RG35XX series.
Additionally, enable the CPUSLDO regulator to be "always on" to resolve
bootloader issues during reboot, and add support for the USB host port
on the RG35XX-H.

Chris Morgan (4):
  arm64: dts: allwinner: h700: Add MMC2 for Anbernic RG35XX
  arm64: dts: allwinner: h700: Set cpusldo to always-on for RG35XX
  arm64: dts: allwinner: h700: Add LED1 for Anbernic RG35XX
  arm64: dts: allwinner: h700: Add USB Host for RG35XX-H

 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 44 +++++++++++++++++--
 .../sun50i-h700-anbernic-rg35xx-h.dts         | 23 ++++++++++
 2 files changed, 64 insertions(+), 3 deletions(-)

-- 
2.43.0


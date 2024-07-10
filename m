Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E125D14B082
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 23:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720653584; cv=none; b=rMsXqO8UGxliT8j6mooGjQ7BoGSHiveLJD0BXY01yUvVd030Q69YdV8AsuYW28TW7b6AXJCEIeMYqNaz8AxGkkyBddTcR5X+UQuuCOS0AP/TK84nQ6cNMVIgAV24L05yzW+EphI1LHMEvJEpgXrjDceXufW8+1HGqCIsbX1kYpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720653584; c=relaxed/simple;
	bh=5bpQrJvDGsMPCOmxrKisalj5eOajyo+yLXkqjtJzzS8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RaRXR9aKdDRq8t/nBPY0bPd6vXsPImutJJRJpezYexsGKygYVIie3ZtL5D0l56Yo2P5zw6szLYtbH6NTF8D6q/XLJoRYDDmR4KasPV5BwGlLjeBYtMPz25MkD9eiZtPEbvP019kGT1QlaxaQpuPW2nfb5EdBqbnM8TxTUShXtmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emM2b5jO; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emM2b5jO"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-704156d0e0dso116663a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 16:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720653582; x=1721258382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xlOEZ8CFlw0gunjkYZmLs6B2Z818aJ4MtPJBO+SZ+So=;
        b=emM2b5jO1NKiBFn/yOCgDlTDDiNWQBGBFTQxmff6cAp8A6YDk3mfoszX0xI46rtxnl
         /C4UOJiZeArdNkvrgsMUcyRgAi4TEDVtxCsBFFZqrXLgoTciUjIKYxra50yIKCZ1f03V
         uOpyWm/9wM17nHAE2GdF4Hqmj7UZydPqGrjlckrUUKRCVinZVrvbcHKVmymbtFBGUQmx
         tEOy95911NejCyzWfbMAmrBPxQe3/GZ4QpYadcDyjk/wV7kf5Qh/Xc+g+8BhspxhMV1L
         QCwXimrstCGh5nuOOty/oXgzQ6uYKOeVy3L7tvwYCU5ZR8CWp8mJ+LXlcvhBXMSPJvhe
         Kpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720653582; x=1721258382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlOEZ8CFlw0gunjkYZmLs6B2Z818aJ4MtPJBO+SZ+So=;
        b=Sp9/v2Y8OYXw6qdVkCXZ0L+FCvQPiZ8lk3yuuJH93MLlzVgazT4sdMUcWe/2/6TEBZ
         k1En/xZEIXm2o7zuK08+AQBLbbFTCUugFnnvm5Q7NMHJN30ngJ7ntoZSt4217RcHyV3e
         rAkGdhRG0ylEWeSN65HSmqibEvg23e2gfoKSYOoG/Yv/z8BoHb01UN1x/JdqJzrp06VL
         vBGNOf8rVNZJ/d6ODHB50nHg8muTXowFnFC1PkHLWwY6oYHSCZudkplNm7//2rHkUoxF
         6bbaa0yYcWOvPQQKWBmRaqHk362MXP4DTulEKDTrpBO26IZCo1xVgtPkv+JwEHXtwRuf
         tO8A==
X-Gm-Message-State: AOJu0Yz+45p43zKXdrarIk9FvRcX3MwrNgRcnZn/Pc42Uul1WGzDz6Sk
	SXFEJKY3HOJYEfp/1xpjYOmkH8+PxRJ3/x6yHJaccxthuGHMOhHyN4MYAw==
X-Google-Smtp-Source: AGHT+IFU3C9ovCWsqfqnNPU4K7hGjY1M8EhaH+KFXmRlWq7LNfARDmp/J83qRPTPELlNG7FIXsDaLA==
X-Received: by 2002:a9d:6c07:0:b0:703:6aa3:d091 with SMTP id 46e09a7af769-703759faa83mr7202389a34.2.1720653581819;
        Wed, 10 Jul 2024 16:19:41 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374fcbf30sm1040207a34.65.2024.07.10.16.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 16:19:41 -0700 (PDT)
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
Subject: [PATCH V3 0/4] Add Anbernic RG35XX-SP
Date: Wed, 10 Jul 2024 18:17:14 -0500
Message-Id: <20240710231718.106894-1-macroalpha82@gmail.com>
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

Please note that this series may have a soft pre-requisite on the patch
series here [1].

[1] https://lore.kernel.org/linux-sunxi/20240418000736.24338-1-andre.przywara@arm.com/

Changes from V2:
 - Corrected commit message for device tree bindings.
 - Added a fixes tag to i2c pinmux additions in sun50i-h616.dtsi file
   based on recommendation from Andre Przywara.

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


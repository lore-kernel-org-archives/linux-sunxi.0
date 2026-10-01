Received: from mail-pj2-f37.google.com (mail-pj2-f37.google.com [74.125.227.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896D82D47E9
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Oct 2026 02:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821471; cv=none; b=fQYD/H8ZBF47zWzcNQ/Bx1tBXc6yYX08sNvGclvgsDG728RRS1tm1u+nkYsAdw7Q7E8BjlnuL5QP2lALYRHeHA3GUEgR8WZ2oLTAEUa5zS+csMiCGGQqrVEdsvqxVCgUlZsXAhovCZqDFmuT1JHiDESmvLL2fL4BWP4CKCMOSG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821471; c=relaxed/simple;
	bh=/6YE8tCBr0BJ9oADX1bZOmyuq86t5AUN3+v6O1cc6Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jDqUVwFoREojjB6D5bPh08tiWyH8OCCnSNnD7xcpmyvC0OZLWn6zD/DEdwSczj5r9PgOSfB5/wdwBgZhHqZjGUOGjZPKzVUq5T1froWLrU2sSIJV4fwpIDYEYZ0Lhr2C88YzUWkzoI5ThIfRPyjbF8bNW2GVGUIC+X/nsP3PKYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ig8KU45V; arc=none smtp.client-ip=74.125.227.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ig8KU45V"
Received: by mail-pj2-f37.google.com with SMTP id d9443c01a7336-2e300fa47a5so1891125ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 19:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821470; x=1791426270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBj760CSPEhTHdB5J8bb+wCBarK2SuYvXC2QB16HtCA=;
        b=ig8KU45VBvu0oS1c6Ob4ggB2A2ODbszW3ky+SQRuF3gip9S+c9xP8oIFRoHHHHCNjF
         MGBVF/ROMz3x/+4NEKumFeamAH/danb6WkDWLegJegB/47LTViU4PT31y2XHMTNVCfXK
         NuT3EiDbMslv4kZmEl3AHTe1IVsFwR0sD7Aczemcuu9bvIIYwz3RbvwzchOUcRnRmiol
         XpmqS1tZkhCDidW5qzv4qLKhijMjwhzxOhvqP7IC7LtTw2xL6J+nHDEi75Zq+mxmByGJ
         4D2XpXf1p1iwhhAF0/61CDkVYuUq1dFqsH2uQWgdOyfmpkcBWZ6gexfvGThjEJzdVR+o
         gevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821470; x=1791426270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBj760CSPEhTHdB5J8bb+wCBarK2SuYvXC2QB16HtCA=;
        b=j72NtiQY3iyyMURG7dEvNG3dCX17x1U1DP96ORqX3wup6uA3fONmosI+kR9tecsYsr
         /PkWyNzpv4VgxMqSDyZrfVHdC2ondgmNTBYqQ0WcpJmw+ZbSez2LZNG40NRCXlI2el2e
         75JZeXzcbooUl1uc22+H+R9pR3tyz2WLcG3ppGENBUDCWqQVygD5DXstwUdUxGGyrOJj
         L8L8voxs2DugLGoJepFzBpkADcR+QOSco3WriHuYfLw9fMV10iAc+lWuCFc9yswsa2ww
         X1YwxruL1g5F8YTtY+PgfbMpIKT0CSI4Jx9OM/UGqGKP5Xc1UTTNmJoIl3WDnMQpRVvG
         1V1g==
X-Forwarded-Encrypted: i=1; AKwUvBwq0pAKSsBT5+Dx9iU4y/8F/2V2/tLlOq5PV124YQ/g8jue2F6ILRDP26PdXkb5CT8ZE5/E5LoGsAJY6g==@lists.linux.dev
X-Gm-Message-State: AFq9FYLQFa4cUuQSF8AG8p/ow44Vh3Dplh3mWEEsuPhxMu+w5JPpp6t3
	9l+JdipsjbA27Jq8JxCKm4qk+Qx0vOhzsLSDySAL5iIN2NXQ0ocg4NYT
X-Gm-Gg: AYBFou0ZPLSbdCoU2lyhDgTgBN5/MShUF1MCz8Uc57oqRemWGR48r0ADNbWme+B/Fp4
	50u6vGZ893UiT3bb3WW9enLHRQvPuPIhDExkYy19D4o9ncvmXC6eBTk5TYoim7ovRjDEEMqgZ57
	LjvmGB9ytak+bsphkRbwM13JADuwSYRVfBcLTFZF5gHeg7z70sGUjzqkJ4ivS//Cg2cJRQ18xR/
	PUldS8oCOp+AfKJHbxMvEovbmks4mreO4dNu216UKCv7L2ESMuokfc9GsQML3yqMSiqf371WQoi
	qV9vtBghiEmbAoh0lMbiOfs7894+usFKlJJDn8hdGcBWr0pFBGFNA+TYWsBBDiVC9XejiMZcl3W
	MMyQlB1nioS2MKgEak/sGOp4Q/KOjI3wYksi4ZBlgrxdNMj1KdmvgxLjfwlFU8Ijq4FrMQjlxmD
	XzrtvUFV3CBsF1QDS35M0zg27FR8vresveADACzzN9evVYyZxaLMydSCfhutPrHQ==
X-Received: by 2002:a17:90b:28c4:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3a4d18bde23mr2612397a91.46.1790821469669;
        Wed, 30 Sep 2026 19:24:29 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:29 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 0/4] arm64: dts: allwinner: add Teclast P85T (A523) support
Date: Thu,  1 Oct 2026 10:24:11 +0800
Message-ID: <20261001022415.913959-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Teclast P85T, an 8-inch tablet
based on the Allwinner A523 (sun55i) SoC.

This initial submission enables only what has a binding today.
Display (DE/TCON/DSI), PWM backlight, audio codec, camera (CSI/VIN)
and LRADC keys are deliberately left out, as those blocks is not ready
yet. They will be sent separately.

Patches 1 and 2 overlap with Andre's series
https://lore.kernel.org/linux-sunxi/20260914210115.28151-1-andre.przywara@arm.com/T/#ma8a2554315eccbccdb15ee7ac212a4d0afb45a5c
They are included for compatibility and differ only in the full company
name in the description.

Touchscreen operation requires firmware extracted from the Android
firmware; the file will be added to a public repository later.

The touchscreen values below were obtained experimentally via evtest
and may be inaccurate:
  touchscreen-size-x = <1786>;
  touchscreen-size-y = <1128>;

With the values below the touchscreen and display coordinates match:
  touchscreen-inverted-y;
  touchscreen-swapped-x-y;

The battery values are taken from the battery label
(5000 mAh, 4.4 V max charge) and the Android DTB
(pmu_runtime_chgcur = <0x320>, i.e. 800 mA safe charge current).

U-Boot support requires an LPDDR3 driver for the A523, which will be
sent a bit later.

A ready-to-use image with working display, audio and touchscreen can be
found on the Manjaro forum. Patches will be added as other contributors
add their parts.

Changes since v1 [1]:
  - Added Reviewed-by from Andre Przywara for patch 3;
  - Replaced the dummy 1.8V pio-18 regulator with the real PMIC rails;
  - Dropped reg_dcdc4: no consumers, the kernel would turn it off;
  - Dropped AXP323 aldo1/dldo1: no consumers - the board is verified
    to work with both rails disabled;
  - Renamed bldo2 to "vcc-dram-1v8" (needs to be kept always-on).
  - Renamed cldo1 from "vcc-codec-sd" to "vcc-codec-mmc";
  - Described AXP323 dcdc3 as the RISC-V management core supply, like
    on the other A523 boards;
  - USB: removed the inbound 5V rail from usb0_vbus-supply and dropped
    ehci0/ohci0; the port is works like peripheral-only, using
    usb0_vbus_det-gpios for VBUS sensing;
  - Dropped the iio-hwmon node due to invalid values;
  - Commit message wording: those blocks "don't have a binding yet".

[1] https://lore.kernel.org/linux-sunxi/20260918165414.1129076-1-iuncuim@gmail.com/

Based on 7.3-rc3.

Mikhail Kalashnikov (4):
  dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
  dt-bindings: arm: sunxi: Add Teclast P85T tablet
  arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
  arm64: dts: allwinner: add Teclast P85T tablet

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun55i-a523-teclast-p85t.dts    | 386 ++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 +
 5 files changed, 412 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts

-- 
2.55.0

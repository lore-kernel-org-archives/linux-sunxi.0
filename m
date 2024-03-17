Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA463139F
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 01:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710639369; cv=none; b=CHVaYET1T6DnwTpKAcFqAyD+OhKXYhQGSfc8SR8FlN6SV4gJ9p903Y6QTos9SrzLxyuTVqClVCO8305BhZjHZe/qc+myFM+2mKMliqBA/ZeUVIPsG180KzxnOi14ib8hMnrsUYiNz8tFVqy2S8X0htHL6i1f68Lkc+siMAyrm6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710639369; c=relaxed/simple;
	bh=wT90xc5MN9pWYiCuET6gJiyUQOhBicpNzpjQPVvsBE0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=klfrk4Amvxr/TiAi7MfplYNwkXrMVXcsPIoPZONCVYZppS2hcQdHWSeH3QWFeEdVQzAovZ1E/dmDJ3YEHRWF+2F3Q0xGoUIqm5W8ZOD90tpkY1UTN4AymlaiilDyDOJS8VURcAva1atjPx1W7i9nndsLgyAj6PVpatv2snGZ7/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EupRw5cP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EupRw5cP"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a46966e9d30so201104066b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Mar 2024 18:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710639365; x=1711244165; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJOPQTPZIdoYGlOmY3Fy/8dzV0uwF8EKc4H6FIgjX5I=;
        b=EupRw5cP55Ymw2uk9uuu1updZfQ4upLOKfGzxijPwtx+NjtzOCr7D1kt21JfQc3+oe
         UZt40qYsbx36YwJk9ecmwi3btnBSLT1NjeuuurmR4BIwHM4+nhzRUc21tx73V+aYHU9j
         QUKeanamDclbzUL9D8xxw8vjoFkrAglgp6mLwJWjimRvIzY9XseBLrPX6qgenke9DGUg
         qCm0ClFP7Ry9/NApl7pAEtQKZxqhbwocX1ksJ8MgahgJuscT1DHZrCxoLcxRb/2wiFZc
         NLO/3zjsqjtB8WXVMQCP5brfGOGXyBahKG3z2F22ZPUzzBIObyZK/JDzCX861s1b8Sx1
         +l6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710639365; x=1711244165;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJOPQTPZIdoYGlOmY3Fy/8dzV0uwF8EKc4H6FIgjX5I=;
        b=nqTU+EKKYOzQol4E1lHUasud/ZJv+eGqZQlJH7F7ADO9Jlbc6BYQ75YT+bXrnycCcy
         KV99z7VyqQNh1kqRzjiIgQvUIzAIkOqVDkQ+yuEdaWYmG1PqKV9lcpBurwNcKfFTMPv3
         r7/InMuKDvZNy1kXjXzZ0N0AHgD+WvL1bixYYhFQVmBhRrQSt0BwgBuazHbeWO2jyn0b
         lyHD5pyJ4/z/pYajZ+XqshPmuduTRAkdxylYXIRp2JHV6px9JyouV4400y6swzhWJuC3
         zDOb+aAXc3eBuRWCniwLkREOA0xhRA56E/uNdue74ZoaCXm4tvkSqR+t3MyLSZFsTW5D
         8oHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVs/KLeOfw3q0xt4QVhpaqJS0bMy2TrLHqg9XmvrFaM9qooRS3JPed6p+NEs9AINGGfZbZTuZ0BBTHDSWPIiaunM+q74sMAL2bW+U=
X-Gm-Message-State: AOJu0YxsRj06gx9vHrgrNLbewWlJ2y2pBrwmZWLguaraq/ko+XRsvbBG
	eARoh7kvIq6mh5NMDBt9eDc0ArQBJYuDBnUQTL0muSQX7oujdyru
X-Google-Smtp-Source: AGHT+IFoKk63r+2w89jQKSp8O06gxrMvN6aVFZ3hTGDXG5DWJLum92uJwZd39+ipO+It2noY/ika0g==
X-Received: by 2002:a17:907:77da:b0:a46:5de0:6efa with SMTP id kz26-20020a17090777da00b00a465de06efamr5369324ejc.66.1710639364819;
        Sat, 16 Mar 2024 18:36:04 -0700 (PDT)
Received: from ALDERLEJK. (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id p7-20020a17090635c700b00a465b6c9a67sm3273109ejb.6.2024.03.16.18.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 18:36:04 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
Subject: [PATCH v2 0/3] Add initial support for T95 TV boxes
Date: Sun, 17 Mar 2024 02:33:58 +0100
Message-Id: <20240317-add-t95-axp313-support-v2-0-e38032811758@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIZI9mUC/x2MQQqAIBAAvxJ7bqE0I/tKdJB2rb2UaIUQ/T3pN
 Mxh5oHEUTjBWD0Q+ZYkx15E1RUsm9tXRqHioBrVNbo16IjwtIU56FZjukI44onGa3KDtT0TQYl
 DZC/5H0/z+34i/XIUaAAAAA==
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Kamil Kasperski <ressetkk@gmail.com>
X-Mailer: b4 0.13.0

changes since v1:
- introduce sun50i-h616-t95.dtsi for common nodes in t95 boxes
- validate and add cd-gpios for microsd card detect
- add wi-fi node
- remove mmc2 node - it's not used
- add uart1 for bluetooth device
- update copyright

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


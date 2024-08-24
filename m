Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCB98494
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Aug 2024 07:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724483374; cv=none; b=TU5yY7X1ftO7i4W6HZYfWzAFPYgrwRaaq14TjON0MHeP79OvlqfHmY2GwLY/XvlHsXIKPrayLJaawb6ugllnkaDi+yfm3GrpkUlc/n3bpQTXZOrNgVIdFEPSs9K2MBRM/NEsfUvvb3xKk9sLSP6PbjuFK9awQHo7sma5k8kcETo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724483374; c=relaxed/simple;
	bh=oW829Qj1Acj1xLhwGdFiHwNZ5GC5viGfHLykdWuf2UY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A3DNwhoEJYAbRXxa5DrFox3A+1gdJDd3i2e5MdKOdpf1SgeKJBU8f4l+eiQmGT7TUmIRn0JnK7u1TRoJ0DFYkQxuij9eV3RGM0fFeJ7FYOQiS4PxuaBEgQW/m89DPYvfFksXj6AgKuYHupjOSdsOrqpM5zIeCfNDJ6wgy6GrV6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvKnlvlP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvKnlvlP"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8692bbec79so349376466b.3
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Aug 2024 00:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724483371; x=1725088171; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kfjDR/1rSB9keE+iHqPgfwEHIVsDSqAHRyufwZuzetI=;
        b=PvKnlvlPTYdR8Z+sVxf3o3RPtVc3VimIL6DD7fySzS2u38DCCHMEkgZqsmhlC7BDSu
         2vY63+650Tw4SmTD/k9Opeg+ryyrPsB4UKZFSSNdeUJSP4VbhXz+kSMBNPKkAmr3BP7E
         XmTYCqfVcKjfDsp6tKgp/sUNkiISi/wr/IXlONZ/YoNkPacM4O5MK6W4GQ/57bWY6Yej
         EtbQ2hoVAUD6yqYAIko9YrEjrcnfP/zmZLhEdK+tSgXckbqNCaUzndt3VDLNw5KFeu3+
         HYhCcypVLmsstbWaDLmzZFphBxpD2E8m/Zel3+tyWVJt2meOUtU7MyhufrKlfgTpArSH
         zaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724483371; x=1725088171;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfjDR/1rSB9keE+iHqPgfwEHIVsDSqAHRyufwZuzetI=;
        b=xEGGmSpZT4S12yVHedSCA9RPw1iJmFMcrlEVy54Xkkh4BbjiLF8skQEfkatHSFIpEX
         mLgRAB211ARU/j1luXk/I6MBR7rYCq5fPOGOh1LAPIfpwUWi3WxS1lgDsqWkdECGsL3y
         Gr8Co0XNWb0XE+cKGqYEwUkWsNVEwGTFfMaZqhyUxwS5TGvwW7B8Hs1DMgHxiDtMr5eM
         REmyDQdbWpkYAAI+gEO4pWPiwl7OFDOerjDhPPPBv3UobG3tyhLPyGUcavLwfMTQLXoz
         pEuPQj9a6Vq5rs2DrUYQNCrKZ4IOYHQAs3hzU2IqUokILGewzeFgt/jwIJxxAtsmU16O
         pK7g==
X-Forwarded-Encrypted: i=1; AJvYcCXgVV8DYS/O3th1bAeUWFTOO1OIDbVIugaB/xT88Kb/Y/qxeFa9OGYLN7EI1kG+DtNY+LFOiMHiraBTvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGQiXZ386w38b/Wqj3aOLQ54eEzW5uwWh41LaLTeFRpWpGR4tI
	CPS2ldagPBxuBti7HKBrPnSUFWsy9qkfaXy32gEZ1RG8rIGqkfuu
X-Google-Smtp-Source: AGHT+IGXpjiUM9XnUIP8+efruOHQLPcgeCdaJd02WdJcnnVH0P5w/ib5uHRsIa/UiP82Qoz8QJxsKw==
X-Received: by 2002:a17:907:e249:b0:a86:9487:f1d2 with SMTP id a640c23a62f3a-a86a52c65d0mr278144766b.40.1724483370607;
        Sat, 24 Aug 2024 00:09:30 -0700 (PDT)
Received: from cleve-worktop. (85-193-33-51.rib.o2.cz. [85.193.33.51])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a868f437997sm360192266b.106.2024.08.24.00.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 00:09:30 -0700 (PDT)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Date: Sat, 24 Aug 2024 09:09:05 +0200
Subject: [PATCH PATCH] arm64: dts: sunxi: nanopi-neo-plus2: Add pio
 regulators
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240824-b4-fix-nanopineoplus2-pio-regs-v1-1-7c5f7da445af@gmail.com>
X-B4-Tracking: v=1; b=H4sIABCHyWYC/x2N0QqDMAwAf0XybMC1Kbj9yvCh2qiBkZaGyUD89
 xUfD467E4yrsMGrO6HyISZZGzz6DpY96sYoqTG4wdEwOsKZcJUfatRcRDmXz9ccFslYeTOcA3k
 f0hifTNAipXLT78F7uq4/Hv8LZnAAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724483370; l=1230;
 i=cleverline1mc@gmail.com; s=20240824; h=from:subject:message-id;
 bh=oW829Qj1Acj1xLhwGdFiHwNZ5GC5viGfHLykdWuf2UY=;
 b=r2KcuKbi/bWODmEtaXS/TN+uKOeiAFQiRRt1HI6i/CAL58u7++m/huOwFodBeYWEiRXZvC8aJ
 5D0VzG/NMN5ArYwQRD/EiRm+7Za/J4Iyylpj3wh80rOACXGT1d6kcdn
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=CQifx5FUgTQKAoj5VCYrwYHi235AkXQ5yT1P6gkaBxM=

The board does not have a dedicated regulator for pio and r_pio,
but this fixes the kernel warning about dummy regulators being used.
Tested on the actual board.

Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
index b69032c44557..2841c9a8aa50 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
@@ -146,6 +146,18 @@ &ohci3 {
 	status = "okay";
 };
 
+&pio {
+	vcc-pa-supply = <&reg_vcc3v3>;
+	vcc-pc-supply = <&reg_vcc3v3>;
+	vcc-pd-supply = <&reg_vcc3v3>;
+	vcc-pf-supply = <&reg_vcc3v3>;
+	vcc-pg-supply = <&reg_vcc3v3>;
+};
+
+&r_pio {
+	vcc-pl-supply = <&reg_vcc3v3>;
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pa_pins>;

---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240824-b4-fix-nanopineoplus2-pio-regs-b54335d8a9e4

Best regards,
-- 
Kryštof Černý <cleverline1mc@gmail.com>


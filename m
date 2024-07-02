Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C921CE08D
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jul 2024 19:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719949002; cv=none; b=ouB85EM8EWrDI+kXznku4agYtiy68flOG373lFje0VFHdKqRsUzIYpgxCtquNy7X5bND4AgLTCqFeuDSKGtNzZQBx1pQUqwxQ1qWQ/DHLRVCGfydIIcgN3K4EKDRWzbVVLFrLVWbJXRa3ymkF+9aaiaiHMDdT+XUaA8BV8GILVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719949002; c=relaxed/simple;
	bh=Xyb2fLgPsza2K7BMn+tG+wn/o9+i8Vr40jgbJbktye0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tUm6iRyWombS51byRCQG6kOJrDM6cpjImCb5DJfwMgYLBtDeChGSuGdQFg7oGQdiqiKkTM3X0lyxkHFsUVOrfks3YXbuqbnb2oUwYaHhZoT03OlY6uXJO7sZ90I2I8lnCijbUxubE7D9RKbssIMvjpBFBY6p1teAUNt1Tp5Jrlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKu1TW6G; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKu1TW6G"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d56285aa18so1932150b6e.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jul 2024 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719949000; x=1720553800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neIlzvRvkxSKYB/J8QToRUr0yEHjCHDcQDRoSdkPwWU=;
        b=NKu1TW6GR4GMsCLxWIdRTizPlZbhsxnDQhn/MSnhMrBmwzp6iki3+6RyCAhc2ItORn
         rtQK2+8nC+nk1tmiY+CuR99FGXh9UDpnWpzr4fWWu48J0lJdl1PDVohX5/Tj6IauPLc0
         Xdx/Zk2lm9q+nW3VNn0TGGAqiiky6X27UGE3w3lL/EmNWyBmc10Oh5TQYCL4JMs08Y6+
         rtiUlSVNrbJ7qtZIWL0rPKUMcsCuoWVFKLYLA09LR0cATVP+FulXlJdaFAgQq1Nzbynl
         dRxXh1CkTWiWpIkYLE3QhxjF5QyuELMl1F1q2sV2Pu/w8M8YbHfp5eI8gpteCdOmRe2W
         O/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719949000; x=1720553800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neIlzvRvkxSKYB/J8QToRUr0yEHjCHDcQDRoSdkPwWU=;
        b=DQphl60O16P3ouAizLHZtlPo6FULK8rZRRBTxordQFTzc+oChJ0m7lPmmp3qW998WJ
         DFuVdWfIxmbiApI/dDSw0S7YKoRDThFNB4nTsSV75Zlzsxa25FnCWZlEX3GftpQv0DDC
         mrLmKNUBg8A586OtD6fU77vNIyaSXBAXxhQZ6Ad5zvZRgMdogLud3Yw56oSmIwO9cpqK
         fOjZj/sG7UwASVW2pQFkmdRjWkqGGs883OlZ+jblGy38Y86vJf+c2C7AyVInmhazp/Qz
         v3beTs4QJXxO3TthMCuERs7Zl+qD5lse7rdrYXwrg1DeC7pnkCO28lnETrE6S53imPid
         LOsQ==
X-Gm-Message-State: AOJu0YxaON1EeWlB4+iWNh0Ye/yvwN2FT2K0QttPMwh4y3Gta+J5vPrF
	cRZ0WZJA2j6a9cypjuEDiqowYntH5vlmrARr8sRMSfuE+/kxuatNzPjlUQ==
X-Google-Smtp-Source: AGHT+IG/XWpcyxijEAflhpO8sCqvA5qvxs/E7B4kFOZsE6+IGb5Cyo7xwhiF07DabC/QOSxKD1Xe0w==
X-Received: by 2002:a05:6808:13c8:b0:3d6:332a:df9 with SMTP id 5614622812f47-3d6b30f4bdamr14246442b6e.15.1719948999929;
        Tue, 02 Jul 2024 12:36:39 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62f83c92dsm1831335b6e.0.2024.07.02.12.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 12:36:39 -0700 (PDT)
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
Subject: [PATCH V2 3/4] arm64: dts: allwinner: h616: Change RG35XX Series from r_rsb to r_i2c
Date: Tue,  2 Jul 2024 14:34:13 -0500
Message-Id: <20240702193414.57461-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702193414.57461-1-macroalpha82@gmail.com>
References: <20240702193414.57461-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Change the Anbernic RG35XX series to use the r_i2c bus for the PMIC
instead of the r_rsb bus. This is to keep the device tree consistent
as there are at least 2 devices (the RG35XX-SP and RG28XX) that have
an external RTC on the r_i2c bus.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index ee30584b6ad7..e2bbd22bd80a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -201,12 +201,12 @@ &pio {
 	vcc-pi-supply = <&reg_cldo3>;
 };
 
-&r_rsb {
+&r_i2c {
 	status = "okay";
 
-	axp717: pmic@3a3 {
+	axp717: pmic@34 {
 		compatible = "x-powers,axp717";
-		reg = <0x3a3>;
+		reg = <0x34>;
 		interrupt-controller;
 		#interrupt-cells = <1>;
 		interrupt-parent = <&nmi_intc>;
-- 
2.34.1


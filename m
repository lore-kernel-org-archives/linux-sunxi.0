Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E29E14B082
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 23:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720653585; cv=none; b=PF/yEf+M4Qo16cvhLSLGRTIVbsla5h4bLnyP2SnDnzHhHyxKGzsUjbWz2tWKAhLK3twXw6HOJfHPcjP9New4EQekO824+gM424T0/PfaHNz04JZoVVUJHu30mGcGPv7mmxOZbxVYeBCC0XeVfp43j621aTor/L21V2X+cQCp4JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720653585; c=relaxed/simple;
	bh=+FKjWDiNgaHy9fLfBfpcBC74w8PhHDcYW+XBxh8Jnr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bijCy7xatE4kaBHdJ5ScCh4TN/TzU9jqwyMAHzlN/HVBu39TUbB6Hyu4gNOZ3zEX6HOORNX5IRaxaDYIle+lQZt34CAO4sJwlmy17Cil8HTda1pdY6txTGhyOwMxzQKF3+Ubj9bN2JwZjwpjqzEjxldVZQsQ3atHmaKUXd6xf/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mB9H2+dc; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mB9H2+dc"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7036ab4a2acso131902a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 16:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720653583; x=1721258383; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y314Z7Vzvt8PrAmNPY31holwonLU7pTRRaXSZDySjFQ=;
        b=mB9H2+dcns73T06rOAq78rZPZPWlcAlxd4aT20kjVWc8fgtiB2xwX3aPDiMCiM5Ape
         ppE8FkeRXtDKNg9X40gRlFZXyWsuwgZOhyXeJZTz4nAFDTB57uAzVjKds9IEf2kiUY4T
         l1fion1mfU9Fc/Hwx5Ne/oKQ8kZFiLW9z5mIQGiWe3eLskRU1njxneTZy6eVNOe/E3Kn
         Wt8uG55nH/18gxga2WUjnDRl1RtyLVLMYN9lnpGujaBSYc+oS2XqJVOGTOQfYOvP4CNy
         Di/XSwsBDVnxRziSGktFDSe/fRXJ1ZXLqC29GlqOWmgZDye45cQngpMWzSvHPSEs3y/q
         +SgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720653583; x=1721258383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y314Z7Vzvt8PrAmNPY31holwonLU7pTRRaXSZDySjFQ=;
        b=LW/umnww042DuV//73tnZ+Oijzv26tMgdNSnSQ4dIs05zrKxjaYOzxOoBS8jfl5hNq
         hQABFsL34i2wHw8nWiuzfWK4MiyzFHkLRNHRVS8smc36whB/rlXlJXgM4w9Era+DNc4O
         mjBa3gmJRsuUbWh47zCl9m/wk38gTmkDFyDkgNXEqMpaJq5FnR5+l/y5gadmG7+YoVhn
         u5GIxmlrBLbI3Jmk6hIM765Ypwg0uLKOvF5lq5ISRzt9hmE7r5ZYXsmu+asPUtZZmcnz
         zERpNrOSUTlAJnwiMdHylDIip1NEV5/Rr5Pedzh6Lo3JsvPq3qspzktE2Lr486X8Rse1
         Whpw==
X-Gm-Message-State: AOJu0YzxxqWB4LDMT1m8VPJYRuADuAoFzgSHjLlmeIvK46meGrSVpM24
	t3t+mrXZOzC29Hqk0xix+kntCxCTo3LoSIPqwfUsQFazWE0pSOThHvT6+g==
X-Google-Smtp-Source: AGHT+IHmwSe4bdJhOWOP8J3PkJwQwzoYrf/O01qICcc9ry8ninlp/ZHO8F74Aifbtz1WcR6j80hBoA==
X-Received: by 2002:a9d:62cf:0:b0:703:7978:3cac with SMTP id 46e09a7af769-70379783efcmr6305329a34.3.1720653583299;
        Wed, 10 Jul 2024 16:19:43 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374fcbf30sm1040207a34.65.2024.07.10.16.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 16:19:42 -0700 (PDT)
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
Subject: [PATCH V3 2/4] arm64: dts: allwinner: h616: Add r_i2c pinctrl nodes
Date: Wed, 10 Jul 2024 18:17:16 -0500
Message-Id: <20240710231718.106894-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710231718.106894-1-macroalpha82@gmail.com>
References: <20240710231718.106894-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add pinctrl nodes for the r_i2c node. Without the pinmux defined the
r_i2c bus may fail to work, possibly if the bootloader uses rsb mode
for the PMIC.

Fixes: 0d17c8651188 ("arm64: dts: allwinner: Add Allwinner H616 .dtsi file")

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 921d5f61d8d6..e31945c3895e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -837,6 +837,8 @@ r_i2c: i2c@7081400 {
 			dmas = <&dma 48>, <&dma 48>;
 			dma-names = "rx", "tx";
 			resets = <&r_ccu RST_R_APB2_I2C>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&r_i2c_pins>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.34.1


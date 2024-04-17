Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BE4172773
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 17:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713373473; cv=none; b=MsDWN8QcOGbjrzdlGRq4tEv+RIP7YlwA9naXYNJSpVwzRhH9Lw43i4/Fb6XOOuUX28B76OsgJSFMOSzlHDCwOf8wURjVfeqEstro0piop1aSU28JeiwljibUVpy1gFdcRrvbr5i+sdESNTA8uq39Wm0hHOCA5V2R3P6FUzqKNU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713373473; c=relaxed/simple;
	bh=a5yNIb3DWETpDcHe/Vm3HaAy/ZuOIsSOSp2yUIilK2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rsj8Ar9RXN/+KsOmAoPVPN28nIHbAtHL5vvJOvXeYRX5LwoL/iR00XMlFBa1LH5MQJrdkItxaMnjgBMU71UioInuU31uvANmWtz92vDDbkU3Mi8QKKXaz20NpTym43NB5BiSSyUWoxkmIFqBDEwMvA7E99osa9rw3UtpIe35Qo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8Xa1pqr; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8Xa1pqr"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6eb848b5a2eso1840418a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713373471; x=1713978271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prMdfKdVjihJkVjtxII37s/3IfYAkYUes4DRF7hF/AA=;
        b=W8Xa1pqr7UaBI1opjqVlxzoPS0t0gUNl2oUn5x0hsWKATnWkjgEUGBTEBGEgujZwql
         2GK46rjzdXQoFSZEWjqJk/E7zYZpmG+DP5GdZx35LMYBQq2LYWYodIYBzXU1TtCZ/Ibv
         yyLNP9Oei55rZGAWUxPgt5iI618B/oetEM3WFSb27F5YHExq4wFTgRLz3nbATvSoGLGK
         GVvftbGDI+ehEbntZ2AzA5buTeSDqtqn/uNfG3vMUSFf5Lzk0yMZ5l7ccfPaCGC+hKZ7
         CC3lZqk8Ip+4IPuUertmv6dz3Wv4CHu4JIJ4NY7PAvi4Mog3C3p9rnKJnz0Hx2mGtzck
         JHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713373471; x=1713978271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prMdfKdVjihJkVjtxII37s/3IfYAkYUes4DRF7hF/AA=;
        b=UGjE6iBw6soqsRUsSLpCk4xtDtzh5eLUF1TefYQsR9QAjBZ7qG+z1oqlrmE42exIE7
         TlUTRIO8+xqfbWTAIu/62PHQyP6IVxV8eb9zTpOioZUjBJKX3zpP7bFIqCLqDcAKrvt5
         pJ+WDkr9jG9p+nk/XukYE6lUPE4B48kmpXInNCIKwmaMvgx1XiftvnQENT4TbiPgxABG
         uOC0z5GLtCW+lq2tRr2Arf9eyBxO9C2EUYZqEYkANPLJ1i8a5G4Wsw/9YRwNP55nhpqW
         KU1bdKm9Ap850IjB4dJlrwKtQixnGcVX1HvJDhWVv8yX9OcsPfAirfjtNj06dRHSQjPN
         SZhw==
X-Gm-Message-State: AOJu0Yw057iXrhlJ037hcxKxOYmEzyFD4+RvW7cV4KXR5kTd+bNcZYpe
	1Aiv+OPTmgPWgTHjC20ytPGMIMqDRHbsX1bVI8DK9C10HGkBoQQHhZv3WQ==
X-Google-Smtp-Source: AGHT+IF8Esnmptd+mkJwzWr0neEUR60f7GHzPM5hDrXG022mYRdPS3fkX8aR4HdDgDvlX+/YdQQOKg==
X-Received: by 2002:a05:6830:1197:b0:6eb:7963:160b with SMTP id u23-20020a056830119700b006eb7963160bmr49471otq.11.1713373471034;
        Wed, 17 Apr 2024 10:04:31 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id k20-20020a056830151400b006eb77e42ff5sm1721615otp.26.2024.04.17.10.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 10:04:30 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	p.zabel@pengutronix.de,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/3] arm64: dts: allwinner: h616: Add GPADC device node
Date: Wed, 17 Apr 2024 12:04:23 -0500
Message-Id: <20240417170423.20640-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417170423.20640-1-macroalpha82@gmail.com>
References: <20240417170423.20640-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The H616 has a GPADC controller which is identical to the one found on
the D1/T113s/R329/T507 SoCs.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index b2e85e52d1a1..3da37948b89f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -581,6 +581,17 @@ spdif: spdif@5093000 {
 			status = "disabled";
 		};
 
+		gpadc: adc@5070000 {
+			compatible = "allwinner,sun50i-h616-gpadc",
+				     "allwinner,sun20i-d1-gpadc";
+			reg = <0x05070000 0x400>;
+			clocks = <&ccu CLK_BUS_GPADC>;
+			resets = <&ccu RST_BUS_GPADC>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#io-channel-cells = <1>;
+		};
+
 		ths: thermal-sensor@5070400 {
 			compatible = "allwinner,sun50i-h616-ths";
 			reg = <0x05070400 0x400>;
-- 
2.34.1


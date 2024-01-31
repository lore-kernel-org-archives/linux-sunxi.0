Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D00F7AE7F
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Jan 2024 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706706004; cv=none; b=Y1I+eQnt+7uKHoNhSB6FCN+ICuSg5rMkxMfOHAvB6Rdy/hZGVKDpXBvmza+MyfSNgsV4XNmhNVKHJQMllpRDlTMNb82tWJSnI1uyI38Z7IFlGXjvkUmRZ3/R9/w3s7Fyz/Z6aOtYuMgIMwvYmWnJsTPqiP1QmJC9kVPZEwjxMn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706706004; c=relaxed/simple;
	bh=o9E9ecVEg59roajJUTj0tBIXTNYmbmyw1ntarzjaXAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WLdX7pzu8TR9h+3iUuq0yM3mjDRSjUMXTnDDjp+nweKOIsIObJ8sTcE/InS6R1Dws3SbkzqHnkdGKIN9XzKDJ+Q8RsKR/eWjWKcP39f6WpJvQ1XddccJBovgsiu07RXj4IB4N8xvuvtRj5hZe/T49XBPxhg7CuJuAWzjbtLIdcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZj9asCo; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZj9asCo"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5111c7d40deso2646627e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Jan 2024 05:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706706000; x=1707310800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qk5axihAKFS9+0dIUTMZ/jrL2YTkFropx3eyJ2mG6qU=;
        b=MZj9asCoYBUChApK70LhjCT0bCBFvCSvoyd0K8K5fzMKDdzYlyZ6NGLolF4lW1jlE1
         4Ehw8joGRvghs8bqJeIlq7TnM/D1cbjBqDcumA3G2ZAKRJCHxxJr4F0HavvGp4gakflI
         X63ndk/vnuFkRMnAuu+rvge+CxD7E2jZjYqL75snhnLBP+FKmtLYIQ7n49HElCTV9xGG
         oEA9ywZQe9YVmPxR+ozzIO1DZwvUba4VFUF7ruEPRKHZ57CgXA2NqNTccjhELyfB/JaX
         gvkXVu3Gqupqk6xEkiHyrhuxYHoxtdiWeNeVdv/HiiB5fbcISmUN/DRU9PA4jPOAHp1M
         p8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706706000; x=1707310800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qk5axihAKFS9+0dIUTMZ/jrL2YTkFropx3eyJ2mG6qU=;
        b=FyYQ61T2mZuTHrP8kzclTx7UDI58+avRbizZOOLk14I+LM9V1JxtlPC+7EcmA3XtSv
         38e+2NkDQHK8NWtynck6+XePJ2g4qD5xgf9arxUWldVEEcMOhn/p/JlBR4pHbqEatsl0
         P4geofpkBCbl05YB3qpJgPZKT0okUr/TY5jds1CQNnYa1Nv/N1puyIA8PNC5c4yEEpEY
         IsQn2TPruOJtWuXW6cz47Kep7jCQOmB4fdQd6XxJfPw6rKxT3oO4jrXBuK74OTLOWmyS
         jktQdQoaySeljaQTNzO9VUwsIy4/9rFHVBLubrIbUdgseNi/HLkjqgkmPksNboAjXjDt
         0dBw==
X-Gm-Message-State: AOJu0YxWk3mS/4A6mWpgdLC6NT+HQcyeJejMP5MyGVJk4Ld5U0Okp5tl
	SHEiCc1AXucXnDmtAEX25+NxkJpoDbI5ZpqLydlWbY+PiRZ3nNQ=
X-Google-Smtp-Source: AGHT+IFlj/2UQlXVTsP85U+sX9Z4Xg+m+7M8urgFGxXNNIrMtV2ixCb6BE8A2Y9DZeChVhyFjSIIgA==
X-Received: by 2002:a05:6512:3b93:b0:511:1ed7:61bd with SMTP id g19-20020a0565123b9300b005111ed761bdmr1608967lfv.54.1706706000644;
        Wed, 31 Jan 2024 05:00:00 -0800 (PST)
Received: from localhost.localdomain ([188.162.49.60])
        by smtp.gmail.com with ESMTPSA id h25-20020a19ca59000000b00510faaa62cfsm1361135lfj.222.2024.01.31.04.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:59:59 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	John Watts <contact@jookia.org>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Wed, 31 Jan 2024 15:59:16 +0300
Message-Id: <20240131125920.2879433-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131125920.2879433-1-privatesub2@gmail.com>
References: <20240131125920.2879433-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 5a9d7f5a75b4..435a1e66aa6a 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -145,6 +145,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&ccu CLK_BUS_PWM>,
+				 <&dcxo>,
+				 <&ccu CLK_APB0>;
+			clock-names = "bus", "hosc", "apb0";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1


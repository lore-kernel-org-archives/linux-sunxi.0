Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707D412B60
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Jan 2024 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706167319; cv=none; b=mgApYiac4LRZhuyzHTJzoZSLwMnEIm+NNb9MUbJKEEBKb5lGesq6n76sUAE/dL9jpPU5wHsmlQjwGNmWYUD5DVYhcRK1v2UgIcAmRVLFRHKhBzNJJNLYBNWTEJWbnmFI/9A+ah5VsBfUc/sdM3CJw9TMcTEEzGA7YzVaTy+SUkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706167319; c=relaxed/simple;
	bh=o9E9ecVEg59roajJUTj0tBIXTNYmbmyw1ntarzjaXAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yx55hq76ynC80P7givKCvQJtKvRBVE2oankMnNMwsX5GKt4fIClC34HONDiFdgb6/uwL5vdfZybJdx5Bo2TjpwNoAd+9bFWcn4erTrbLFLFIONWmvXNm/aKJwE7OX7/BP9emliiE29fFhzEtg/ze7jrvQULEzjFlk4zhNbezAPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcs23ouS; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcs23ouS"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e7ddd999bso7205626e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jan 2024 23:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706167315; x=1706772115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qk5axihAKFS9+0dIUTMZ/jrL2YTkFropx3eyJ2mG6qU=;
        b=kcs23ouSMsA6DpbsVM3LIeRFPuOO8HP0R+dvxn56B58OL4C20m6JEHVd8rsBGBE/7I
         26Y3eDIR+7mn/21es/xarMw4OzmHSh6ji8ws/WNyQ12z+OOVYg56C5K5WZFwRkVROPTP
         hD1knHKjUAEljVyQfDs02Cc8QuX3u4K0UgPHUemAiRQsmD8JH8NbLfVU2c4rOgj4alko
         AkkAWz1BB5sYc7WuBQi10lyR0kvtUcxuxoKEJoJXol12G19waLCjvEm7WwWxv7liIU0m
         yWATkxTKZ8H0e/Ec8dp04hX6mZJUnbyUQisWpJacs8cuB6uAg0leX5cFP6RD9UC8ZtX1
         jvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706167315; x=1706772115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qk5axihAKFS9+0dIUTMZ/jrL2YTkFropx3eyJ2mG6qU=;
        b=bSepgpR/NUuoEYF8L9yMh2GTuCjJdt+vard4V5tPYhKRunPL9aOHz9r4c5hECNuwps
         CFWKbB2+qcxQ9oJOX6MwJL2QldfLjHLzfxiM+QnJ/1VMptV0+BY9EPZZmoritAohw8v5
         gtuwmS19a1p4PoNe/2fJJrlaMKQdlQAgropacB4B2eeLTItCGdh1dkrRA5lsBbNUL4x0
         /InmoaeVogeQmCYuhQ5lqq5orvO2YXI/gHt97etI7SufGXo1gFlgvyE2FzXbo2G9u+zk
         fVSsuquLrYeJ6AhLdKf09oGB8cVJNHKtcjdMdmSRRD9f250UIwuLlT8wV9rxyEOYL2NO
         9B3g==
X-Gm-Message-State: AOJu0YxVU3GI597cikChOxPA30U8H2GCXCsxbm1ZDa50mXC4DmIbu5og
	TO5+bTrG9yOuVv4Z42g79cqlk5IcYp6XvG+iKMqWH/W5HJcC6ho=
X-Google-Smtp-Source: AGHT+IFTxwPgOv3/EtmvxxaaVICzQhm+m2RVQrsyK4AF0mtOzgJAMENWDpCC6bgpZ+U8d52vHyPnhw==
X-Received: by 2002:a05:6512:3687:b0:50e:8ead:3889 with SMTP id d7-20020a056512368700b0050e8ead3889mr182905lfs.75.1706167315214;
        Wed, 24 Jan 2024 23:21:55 -0800 (PST)
Received: from localhost.localdomain ([188.162.200.139])
        by smtp.gmail.com with ESMTPSA id x37-20020a056512132500b0050e75f9e8c8sm2780070lfu.98.2024.01.24.23.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 23:21:54 -0800 (PST)
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
	John Watts <contact@jookia.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v7 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Thu, 25 Jan 2024 10:19:43 +0300
Message-Id: <20240125072032.1151383-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125072032.1151383-1-privatesub2@gmail.com>
References: <20240125072032.1151383-1-privatesub2@gmail.com>
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


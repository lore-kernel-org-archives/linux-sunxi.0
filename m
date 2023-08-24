Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1230324550
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Aug 2023 11:41:23 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so109344961fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Aug 2023 04:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692877282; x=1693482082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYEBuXLu4uE2kJ2ozzMWwnVNoOekh2iwP5U6RNf7wSQ=;
        b=IKtvF8nmYy3jZ7/tJ1ocNP83YPhmUOfU1ukKLrZoQ6NlIktkzevrCQrmnmiW4x0qzW
         HBI4kVl2oTb/QFXqzblfGXbqZ9nkrWF3UbKlS7ie5LUa3Ewrwlmib/AGoAa+uXp/sq9L
         zpWyllOijHQbzEjlhrDvRBGgNtKdereRvqMDxclED6/MvyPD+YZX6RGlcnALjWO44THx
         1DjSTu8htrFdTfgfjsHEpiwzll6TF1HKu5m6j7ZbCYBz3WXvGtXvNWf1g2FVfPbFoazR
         WGvenfJw+bnejp3NWw5nt6qPME6QQLaj0sszl3S1ryTnnViYmWGUSB3OK2e3HnZ62lFg
         056g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692877282; x=1693482082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYEBuXLu4uE2kJ2ozzMWwnVNoOekh2iwP5U6RNf7wSQ=;
        b=dq47lCyntx1cf2nEXD+OEoFnH3lnpCz8OlXIfnPZMzl8xTZtCnGpAvZaT/BQiw5mqS
         7z3W/N3JKWBncdPf5/9r0058iSvxFGGQ3eUqOHlW1pc3tytcTMVsmkYvIMCOWKRzgISk
         aHYNg5Z1LQZE1ilHw50FD30Jd7+6h8L3NxcO6Nv99zbBRzgXTmtgPB/W1Nu0ogQWTD3W
         uqW5Pk35taT6l6tZJAGp/g2rKpBslTgdS0phKInlLqoh8d5UacMwiIvmR8wVWz9FtBwp
         iBh5cAtdhm4PmBgwSV8qB8eapGNs64BtUJuq9DwDxU9HgiS9FYkkwOd3x5hazKaOfVZA
         uN5g==
X-Gm-Message-State: AOJu0Yw3CNPYTJYZh5a00lSuSXqIN4Diuh+pHKszohqHfiwBdarzPjX+
	iI7BcgLn7c7hM3f3m1rtOA==
X-Google-Smtp-Source: AGHT+IGosD9atNDiPZaywzwFkj+U9Wv2BBqLfQ1/+Gnx3OMtc/Isue8TDcEuNM0sXvJzNSBzWrxEzA==
X-Received: by 2002:a2e:9e09:0:b0:2b6:dac0:affe with SMTP id e9-20020a2e9e09000000b002b6dac0affemr11525371ljk.31.1692877281745;
        Thu, 24 Aug 2023 04:41:21 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id o17-20020a2e0c51000000b002ba053e1f9bsm534568ljd.35.2023.08.24.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 04:41:21 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
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
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Thu, 24 Aug 2023 14:40:27 +0300
Message-Id: <20230824114038.891493-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230824114038.891493-1-privatesub2@gmail.com>
References: <20230824114038.891493-1-privatesub2@gmail.com>
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
index 922e8e0e2c09..c4ce13ab9512 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -127,6 +127,18 @@ uart3_pb_pins: uart3-pb-pins {
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


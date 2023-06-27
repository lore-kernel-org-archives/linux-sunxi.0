Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD1C15AF5
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Jun 2023 08:24:26 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso2680930e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Jun 2023 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687854265; x=1690446265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pjgEmaLZWbZLKm+zTsTjeEOP7/LCJvRIUhdiZyAT1I=;
        b=TE7f+u5TbI/yG0U+0SyVxyNL4Hk/MPzSwlErkUfNEC8YTRK3M1Vh7mPhmv0rZ7kfQU
         eRR7Ws9gTUZrwfagnu/E8dW7m7MXunWK65JTfquV2cc9qrwQW9GAqTjFQ/sBJX/ptFFK
         p9Awmdhm1YRA+PHkhZwDZI2+y9MP6ZXjxD5pgJe/MN5RqTZsvtkZufqCVro47pOi1WjH
         t6wKmtgRLmGI322xF27HOIye6IcvL+bV0LnBKHknVOKOxDAC+tLsgqxWFGRXVehVaDvD
         RWxTDMdvb8628zNsTAS7lxudN343CwebXvd50Aox32mctKzNVLexHf6BPNPJ39cBB48T
         vc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687854265; x=1690446265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pjgEmaLZWbZLKm+zTsTjeEOP7/LCJvRIUhdiZyAT1I=;
        b=mBpzBppCZ3Po9jCGAB4vGkVQD7h0+zZa+6LBhBfSFjauFh+BcC67qQc6yuPgUVbfn5
         MMS+6o1JPnn0n/huUbSU+fAGI45UUnS5LYi6hhfPx7tiXAVxpxBeqrXRS13nKn6vPqyY
         FYAjHiyr4ONAutDYyDerM7mw7moz42YCo1YbEmUeHAyOiaySCQO7gc5AFIaV/m4l1aJb
         ZImvoWmm5rkM08PD7N/Xzd57JkvQtqOgGrTpaZr5Tbh1GZq93j0OvfVlyWaDspEm/M60
         uxDx4HP75U5G3REFu3MpGqd5h83TS86La5i0fwl8qOX4H63IimPXaW5HOp5/8J8oqj7n
         TAbg==
X-Gm-Message-State: AC+VfDw2w9UZVHFZr7VsqWkUhG9v9zFSTsiLKFf0UPoh/iKnSq8Kc8aV
	V0o3cdTD2R0qJRyo1yWp+g==
X-Google-Smtp-Source: ACHHUZ4vz531eTh8MoQqbWPlqMxY7J/X7ms73AZisnK4IJIfmP73nvAIsdUP/6rmmWoOTpA9+n88FQ==
X-Received: by 2002:a19:434a:0:b0:4f8:6e1d:cf98 with SMTP id m10-20020a19434a000000b004f86e1dcf98mr13755647lfj.66.1687854264719;
        Tue, 27 Jun 2023 01:24:24 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id i12-20020a056512006c00b004eb12329053sm1420673lfo.256.2023.06.27.01.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 01:24:24 -0700 (PDT)
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
	Andre Przywara <andre.przywara@arm.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Tue, 27 Jun 2023 11:23:26 +0300
Message-Id: <20230627082334.1253020-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627082334.1253020-1-privatesub2@gmail.com>
References: <20230627082334.1253020-1-privatesub2@gmail.com>
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
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..e24543b6aff7 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -127,6 +127,17 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&dcxo>,
+				 <&ccu CLK_BUS_PWM>;
+			clock-names = "hosc", "bus";
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


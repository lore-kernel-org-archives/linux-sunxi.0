Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D18BE5F
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 13:34:02 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fe0c566788so6706670e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692020041; x=1692624841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pjgEmaLZWbZLKm+zTsTjeEOP7/LCJvRIUhdiZyAT1I=;
        b=pV6MQqG9bmj4rwGryQS8sAmZjLuAEtSu2dmeIlWYgBxThrRxinf668n5kQZgcLQe+i
         i448GWBiO5Nh2UwtmtPjStdHCiCzrawPvCVIyL/YGG/WASGtq7/C8Im9vbevT8U3KWqa
         du1F8VjlH+cOyuOz39iOTtoNx6Fs5S8z39f4uj89GlCt6hSmmgrn0ARt2eql+Wqw1tJ8
         ooNRhDaSZs6VvyB5fSVmaiQGtx27RPbmvR61AWxd7RwfnDcx921uAfUSFCmZm4p0viur
         wc9wOksQN1ckXqCXRNaeNSplgsqW81NSpJ1vmkyVn4eqrTuUQF//oax4Iw+/DtzTXxap
         wG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692020041; x=1692624841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pjgEmaLZWbZLKm+zTsTjeEOP7/LCJvRIUhdiZyAT1I=;
        b=brBGmV5ZN1rfaWW2bmNQlySckBXBHG5dUDpZO57iteXLg2SMgadPkgiX4RKH/l+Uqg
         qznLkoXDvqVilfjqBrEBEPmJT4M/wsjRzYPHpylGvQ2LAfZ2kC2QRMZmT6hHmYK9DqBY
         7Pqkh0YtPDeUgDzMHHXGwaRifWwNA9Z0872HAjO3BG5rH9rznOtKVKPRQKbRTC8apdB9
         jFm5ECvFgfplw5af6SHVHEldR5NvoDV0IZxBOWT+Hu67ObQ3o+3Tq9JjeGLG2yzHbJNh
         jkdU5POiewYD/vGqd8JKdK2RZsm2xjHv6vhYILQbUc6YpLwp2pcb4Wv7LLrQYp14BVDb
         tbWQ==
X-Gm-Message-State: AOJu0YwNRjXfqsL7VVvdtCRazr1rHWJQYNkqBV6sWAoQglaTKEvrvfrw
	wfW1TXJQKtcO1Yn2yDLlgKKgqi6LUVgbJXs=
X-Google-Smtp-Source: AGHT+IE04Os9pVpiMT8/NqYeoJXgPVFzpHjwQ1FtN9jAFrhs3SAvVlW6EoYVd4gdqzVWytycaa700A==
X-Received: by 2002:a05:6512:3984:b0:4ff:7e80:4f1d with SMTP id j4-20020a056512398400b004ff7e804f1dmr271490lfu.57.1692020040730;
        Mon, 14 Aug 2023 06:34:00 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id eo12-20020a056512480c00b004f858249932sm1990566lfb.90.2023.08.14.06.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 06:34:00 -0700 (PDT)
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
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Mon, 14 Aug 2023 16:32:18 +0300
Message-Id: <20230814133238.741950-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814133238.741950-1-privatesub2@gmail.com>
References: <20230814133238.741950-1-privatesub2@gmail.com>
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


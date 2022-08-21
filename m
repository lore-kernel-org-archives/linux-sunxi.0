Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715293220
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Aug 2022 17:31:09 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id u5so2834820wrt.11
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Aug 2022 10:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xXtd3T1/ZmQUyro/3HUWSi05URHaw6Uj3JAxrNnokZQ=;
        b=WrCaNmPmrBGJvcCKPkD/xrN9evhffeqMgS/b4hmh1mBEAG1Ow5N7Zlj9BKGmeGuRTS
         afuBjwzks5LCQ3PW0m6IJJLbkIGaOzMU61twhKeaK+a3jSc+HVE/e9OwQF5pGnG0TXTd
         XHJfJh5GchRTl5S7oIvp9AT1+WvBSk/Y2iAdc2kV9tDYRm69BZKtf1t4v/LkukH/OD0j
         9pdGK/Nb9rZFvsTDw2Z6SQdxGe1KsQ/RvNxSnw64Ems1gjopQnrZ3AN9oI6V5eXvqt4X
         0fCk39/so6YeaVn06GZkQgl84qmoxDZ29mwKlXyUnYzJTpCxDOmlkU55l8lPiNhuph6X
         olBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xXtd3T1/ZmQUyro/3HUWSi05URHaw6Uj3JAxrNnokZQ=;
        b=aUr9WJtOKWNIxJHJJxPpA63ormXUQ0rCXOdA7In5KGZJNzbBRW5SJFV7BavQkTkyxv
         FwnntQBA/ShBypZsyZsTyR7+HYxVVg7ERvkP3LtSBGtRxKNlWRlImzTVguwhX6XBKDDV
         +DpTMbC/4/AduUP+nVFi+8V+CnZfw3xRSyepOHyRnYxCR5PBKIv3DxQ3NvCioDBH4ZXX
         zhuhXsVqZ8DTVKJJqyr3+CSYehYNM5QsM2JmBNBaV3Fil2mXf0tLM/rVkg52zO/OZ3CA
         /Un52gUL7g46c9xZn8qgNn5JKtRl7qidN5TE0JvAns5EYjZpmOGA4tyqJfq/JlMM9ssL
         /xog==
X-Gm-Message-State: ACgBeo2LWnd3k02EgG7EZiNJjSVapnUe93oaOkgjyeeMQG9iOrEEf7bs
	8TIWVELZhAxCqry1eJCkSGs=
X-Google-Smtp-Source: AA6agR4viVgw7SRXAAacJiqkBrwpN7r4KswavSgQ6UWx06oXqqUMu6VnRmfkNRqzLYnrE+PRPvYBUQ==
X-Received: by 2002:a5d:43d1:0:b0:225:2707:dee with SMTP id v17-20020a5d43d1000000b0022527070deemr8873986wrr.25.1661103067713;
        Sun, 21 Aug 2022 10:31:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:a77:3d70:9d84:ec8d:98d9:c29a])
        by smtp.gmail.com with ESMTPSA id b18-20020adff912000000b00224f7c1328dsm9387205wrr.67.2022.08.21.10.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 10:31:07 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 2/4] arm64: dts: allwinner: h6: Add cooling map for GPU
Date: Sun, 21 Aug 2022 19:30:49 +0200
Message-Id: <20220821173051.155038-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220821173051.155038-1-peron.clem@gmail.com>
References: <20220821173051.155038-1-peron.clem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a simple cooling map for the GPU.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 5a28303d3d4c..943ae5374dd6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -186,6 +186,7 @@ gpu: gpu@1800000 {
 			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
 			clock-names = "core", "bus";
 			resets = <&ccu RST_BUS_GPU>;
+			#cooling-cells = <2>;
 			status = "disabled";
 		};
 
@@ -1075,6 +1076,27 @@ gpu-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 1>;
+
+			trips {
+				gpu_alert: gpu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 };
-- 
2.34.1


Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCC1468E
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Sep 2022 17:16:10 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id az27so12152202wrb.6
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Sep 2022 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WUkQWFeaJEpRmCMCeC5H0e01SJTSdoAluI/3ZHffQec=;
        b=KRzIb9xvRSM6Mplxtn5bTHZHQZGfAhcrIjCCKHU2e93WHngHSu8VlsSJFaGWIyucby
         bDXFaZKqWnTJc23XyqWhnlPUTrkYR0RoPyG3u/1/pQC27tnQ0Y0gtd5ae0q+sebK3VWY
         4vwoHXYDBoq1bEv89Hb/MbDeiaOHeMFPcIqoCEQZRjlEAcqRpbS5MA1YON2IUTbIcAZK
         lLjsoObOKljR4tvcj/WXqCV2dnmbawFPubd3YPN6N9sa4bBJxSw0bCW9v498ExGdwg6Y
         NXqLF+7IbA9lxxxkbqamA0IA3PNcBn5yJMSImqP6hFrapcGoFTBuZVOCZKA3TjvPeL18
         gY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WUkQWFeaJEpRmCMCeC5H0e01SJTSdoAluI/3ZHffQec=;
        b=jRQsxm8fgYri179o43CZUrdOmna9nFIzJkdh2Z4QpAYICsDO4b+RqhAIWdGTdSdwSf
         poVDmtbqJGtZmnL8xsLdsZcIJ5JNJabq7OncpBQr4Dgv220e3Bo6iSTu1FialVSG8Jfv
         YAp4h2NsHqYoYHOEedUrHnrs0ldc5zxqAMae8/cor992yGxyLJ0NyVzN/iYE9tyTVQCE
         LkgErI0k4Y3XZeha+5Z3/qjUKMA3Oo3V5khXJoHI9St8BQaQnp05xdVNs5bE0amynD/s
         3VwnxmKHc92ZOw6E28xdh7KdPFrDRFJ0xESbWA7PzAjGJmYsSym5YtYM+UfvCJlhwdan
         7TcA==
X-Gm-Message-State: ACgBeo1fB947cc11PSMTxgi1Uplxfn4TENPVC7VP66vZG9IBZ5sKymV4
	blDmzhqWTkerHKAH6cNKUAw=
X-Google-Smtp-Source: AA6agR5Nxeu56Er6g5rkDeoSz+06KNQ9pCwbj2Yh5prPUnqlQfoaZny43onJt5aJLXnFQEywU5iB8A==
X-Received: by 2002:adf:f642:0:b0:226:d4b1:8502 with SMTP id x2-20020adff642000000b00226d4b18502mr23772737wrp.553.1662398168829;
        Mon, 05 Sep 2022 10:16:08 -0700 (PDT)
Received: from Clement-Blade14.home (2a01cb000c0d3d00995730c36491d21b.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:9957:30c3:6491:d21b])
        by smtp.gmail.com with ESMTPSA id v22-20020a7bcb56000000b003a5ad7f6de2sm11437072wmj.15.2022.09.05.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 10:16:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 2/5] arm64: dts: allwinner: h6: Add cooling map for GPU
Date: Mon,  5 Sep 2022 19:15:58 +0200
Message-Id: <20220905171601.79284-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905171601.79284-1-peron.clem@gmail.com>
References: <20220905171601.79284-1-peron.clem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a simple cooling map for the GPU.

This cooling map come from the vendor kernel 4.9 with a
2°C hysteresis added.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 51 +++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 5a28303d3d4c..1259ab0c3956 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -186,6 +186,7 @@ gpu: gpu@1800000 {
 			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
 			clock-names = "core", "bus";
 			resets = <&ccu RST_BUS_GPU>;
+			#cooling-cells = <2>;
 			status = "disabled";
 		};
 
@@ -1072,9 +1073,55 @@ map0 {
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
+			polling-delay-passive = <1000>;
+			polling-delay = <2000>;
 			thermal-sensors = <&ths 1>;
+
+			trips {
+				gpu_alert0: gpu-alert-0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu_alert1: gpu-alert-1 {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu_alert2: gpu-alert-2 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				// Fordid the GPU to go over 756MHz
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu 1 THERMAL_NO_LIMIT>;
+				};
+
+				// Fordid the GPU to go over 624MHz
+				map1 {
+					trip = <&gpu_alert1>;
+					cooling-device = <&gpu 2 THERMAL_NO_LIMIT>;
+				};
+
+				// Fordid the GPU to go over 576MHz
+				map2 {
+					trip = <&gpu_alert2>;
+					cooling-device = <&gpu 3 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 };
-- 
2.34.1


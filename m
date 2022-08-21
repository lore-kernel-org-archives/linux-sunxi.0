Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169BF3233
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Aug 2022 17:31:11 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r16so10654057wrm.6
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Aug 2022 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Hlj56Jwh1i0Eee3H3mGRhZzTcxVry+oPiQLbuChwm1g=;
        b=dOnoJjs0KM9cLcfIRQsOUTFnxnDhcY5whzv3e0hOWpyPfCkLaiYsvBAGm/9xyThEWE
         ELt/NEgjZIDAtxWw6nCqdEZIsNuvjHL+wyx6qpdA1KDS6qx5St7v6yR+OybTySVkCptR
         XKYg0eG12RW85QgVFwk6DjVNsmyvGDS2Su6ZF/nq26lZ1+rnDPWn92y+//rMuTWPxkQd
         VTipjcaMuk1V3FUqI5DdqFuQ45CZjG+m3LZJduFBI2LrSJP2Kv7LMDLFiSG/OFEQQhS6
         RRp91ScPYolCvwAlMbqCBhJ1oe3q+c2huwjzalvtxSwN7bPNz8FSUfE/xx7KzPCXyZ1I
         +v9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Hlj56Jwh1i0Eee3H3mGRhZzTcxVry+oPiQLbuChwm1g=;
        b=qYS+4sl/D3c7jcS24SFMgSP2d8repUTBcKj7e1jnwxzd1gsAvVVFOlWa/alNgbd/wE
         6uxVWgy78LNCnR0Cvdh9p3tb2s50+1pJdIML2yOKMJn3/V3/VIy/svnjeJRRCeA5uesr
         83vAxiGzfrAwMDotn+OG8rVRgiStoIeyyFWhAosMLGffUD9vVXRNcwQx51Wv/RFWyjn3
         1ta2xkiT8SW6G40Q4g64XhtZj/qErsPJI/yDiYudtnpIhm4Pr+ju+WT8eDdppx4sUzsH
         VyljzjegMkkYTbqJJGQhDtyedq7V23gy94y+mgS6LpBZmI7pixgDu8AIVMsxWlwuOuun
         gWvw==
X-Gm-Message-State: ACgBeo3SpAHaX4Y3Cw0HtaPtzd6aXdPmIx9wieo3yA4ZddHF/4hfsoDp
	oZX5nUHLVjtLpRZybXtFeJx81WcRE5oDcA==
X-Google-Smtp-Source: AA6agR7bLyuK/H9MZotXuyq6EIiqzmQenCzhYTSPqQs16biWFiQheDSr5OFXBKStzbIG5tV5qV5L1Q==
X-Received: by 2002:adf:d4c6:0:b0:225:2eeb:fe8e with SMTP id w6-20020adfd4c6000000b002252eebfe8emr8770137wrk.429.1661103070449;
        Sun, 21 Aug 2022 10:31:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:a77:3d70:9d84:ec8d:98d9:c29a])
        by smtp.gmail.com with ESMTPSA id b18-20020adff912000000b00224f7c1328dsm9387205wrr.67.2022.08.21.10.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 10:31:09 -0700 (PDT)
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
Subject: [PATCH v2 4/4] arm64: dts: allwinner: beelink-gs1: Enable GPU OPP
Date: Sun, 21 Aug 2022 19:30:51 +0200
Message-Id: <20220821173051.155038-5-peron.clem@gmail.com>
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

Enable GPU OPP table for Beelink GS1

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 6249e9e02928..20fc0584d1c6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -261,6 +262,7 @@ reg_dcdca: dcdca {
 			};
 
 			reg_dcdcc: dcdcc {
+				regulator-always-on;
 				regulator-enable-ramp-delay = <32000>;
 				regulator-min-microvolt = <810000>;
 				regulator-max-microvolt = <1080000>;
-- 
2.34.1


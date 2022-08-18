Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EAF4A04
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Aug 2022 20:39:42 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id k17so1400324wmr.2
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Aug 2022 13:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Xx725Ih3hQX23yTN0zWfPqhputIO84/6U9GSIQz+QYk=;
        b=hrEeTkCQQk/UH9/U16GGJjblGquX9MVzdldEUMGPhv97AYIZY0ccqUA8FcN2iYxE5f
         ZccvDq1LtrAoxevGXhsXUXdnp6JFRQAiFRScn6ncaGOLlHo/G/mxfkjUZJvdqX+kI7y0
         0rtE+l2j3V4i6nuFwwdLHq1N/1aSvP3mYZMvlAmxCxXLK3ANVkBordhTDagsxC0Kvfia
         hYmh8qTCNpY17OkUQnD4scznGx134L3J1B3IjUjWYcvXLyJLa93eNr+EMwBUHJeMp2nT
         3C+YFlyVVRySMnB7Y/e24JPLRkHssL1v+GE+Q0jk2nzqh4VJVtFkDFeE5nMu2vB8iojP
         HMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Xx725Ih3hQX23yTN0zWfPqhputIO84/6U9GSIQz+QYk=;
        b=4LHFkaR7irUtnz+E3wyFyQEoUwwlsloVjdzB/CIBkoxNjmb1sRh1QJXDJVHTEJlnB1
         pMsWp8gym6qEPLFYMl2pqhBzIRWrTXUHoDkId0XnPA+R2nCWN3wnilnpaGuTuetds7OT
         lsvOruXce+bVO82pocgK3PfWr7xTmtz2fqBh9ePKjOu4AchxsFh64qut3Q7gH24fh3YQ
         5QgUEUNETdw0QAOw2eidchrL87qN2wQTACl6Q3BNRzC0fCVpmx8CL+wh7SrZ7tLhz5Az
         4i0GnfP28qM0wQkrZTycc34hw1Gnh+brDQHhmr3SRv+tVvXJR3mPSk50BLF6SCZ2sm9w
         EcLw==
X-Gm-Message-State: ACgBeo01XtTNnczg8nhMUV/mVhCJqRvHXbKXIXPa/mrLjE9VYVDc2fsb
	bBftA0g194Q6ok+bm1QTGE8=
X-Google-Smtp-Source: AA6agR6hNAol/gvhMbvlpUqAQvXx/9eFxWuE62Dl+HHsGZ8P+cdHzNc+ydHfjKh23rN1R0gGz8FE+w==
X-Received: by 2002:a7b:cc85:0:b0:3a5:50b2:f9be with SMTP id p5-20020a7bcc85000000b003a550b2f9bemr2834206wma.18.1660855181167;
        Thu, 18 Aug 2022 13:39:41 -0700 (PDT)
Received: from localhost.localdomain (2a01cb000c0d3d00cc34c67bc193cac8.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:cc34:c67b:c193:cac8])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b003a54d610e5fsm1571648wmq.26.2022.08.18.13.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 13:39:40 -0700 (PDT)
From: "=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?=" <peron.clem@gmail.com>
X-Google-Original-From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <cpe@outsight.tech>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <cpe@outsight.tech>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: allwinner: beelink-gs1: Enable GPU OPP
Date: Thu, 18 Aug 2022 22:39:28 +0200
Message-Id: <20220818203928.131059-5-cpe@outsight.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818203928.131059-1-cpe@outsight.tech>
References: <20220818203928.131059-1-cpe@outsight.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable GPU OPP table for Beelink GS1

Signed-off-by: Clément Péron <cpe@outsight.tech>
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


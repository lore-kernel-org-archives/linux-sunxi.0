Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7AE2C82
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Jan 2022 15:42:45 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c23so16691765wrb.5
        for <linux-sunxi@lists.linux.dev>; Sat, 29 Jan 2022 07:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xDfBcCV+jqICJ+umnEPyh0zc5fKOvTpA/0JLXbxrvaw=;
        b=YRADI/76mabaLf4IRcW+iUVwM4d5XalrfrM65rAgmDHXMgw/pREmSDXS1OlC0Bn00W
         BYD58D2rRkOkUXyYsmqT6UsbbLZOE49yI72y1wbyFYP0oh3pTbKX+whITxjx54FwHT54
         rcY0tfctVsXgFc046Jyzq7yoGgtWwTbIU696dGNvIju/PnrS7YBdaqlqkoPYwHqtF81b
         R1iPZVhdmnGJQ7jdzQtZ5/9vx/0mE9TN8rOW1bl1XyoPbB8TDqjnTKzxLbU4X7u477iX
         vPMAuxN69n3L4m0hkvoTRM62uivp3iH4vnoWcwG0fD8h4qMX1f3LOxV2lbFv7d4OCDJz
         deTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xDfBcCV+jqICJ+umnEPyh0zc5fKOvTpA/0JLXbxrvaw=;
        b=m2Ff/YQLceYZw3bYOhk4fgu+vyhpvLv9W7dqIEqQc+QrcPwThew3EM976yoV1Z4mRe
         OQ4F3juDnJwxIBw7hE3Ty5z0/oUlGCcvmjc7cHp61slnPJ4fJVr6AHJjoDLyoI8WXsJp
         ukoUbW67vgeRAqQFLOEyvdpdg2+KxYy5fiOBWeB/3vS2aCwZGY0PNOvoQ5Iish5rnW6K
         KHOP2CyzA5msZoe389RXj7Gjhb4w6mfIXgl/HHOh+kCLV1IwL44o7+7J56QwgSH6qdcW
         Kt8xpsBpiWtJFQT2rLdj9sn7Nf9v/180YB0E78lHzRap7lGMfbNG9jV3CsfnQXO3XWnX
         hYBA==
X-Gm-Message-State: AOAM5309SPc/JcNUwRRNN0Q0TUKbFjL+2TuZ/O8oXjZNS1JuK66sbW4W
	+ItZGz636sAWxB+d5RfWVdc=
X-Google-Smtp-Source: ABdhPJzuryF9xXT+zqclTdu3vlK9c6QeyBNyyqPs6N9Gl6EC9RT7kbjuBw1I6Pf7pwGVHC/qP48VuA==
X-Received: by 2002:adf:ff83:: with SMTP id j3mr11159990wrr.618.1643470963900;
        Sat, 29 Jan 2022 07:42:43 -0800 (PST)
Received: from pluto.desnull.home (84-236-21-114.pool.digikabel.hu. [84.236.21.114])
        by smtp.gmail.com with ESMTPSA id b11sm4478557wmq.46.2022.01.29.07.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 07:42:43 -0800 (PST)
From: =?UTF-8?q?Baltaz=C3=A1r=20Radics?= <baltazar.radics@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Baltaz=C3=A1r=20Radics?= <baltazar.radics@gmail.com>
Subject: [PATCH] Add ethernet0 alias in Nanopi NEO's device tree
Date: Sat, 29 Jan 2022 16:42:14 +0100
Message-Id: <20220129154214.45629-1-baltazar.radics@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is required for U-Boot to generate a MAC address for it
automatically.
(Without this, the MAC address will be random on each boot.)

Signed-off-by: Baltazár Radics <baltazar.radics@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
index 9f33f6fae5..df71fab3cf 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
@@ -45,6 +45,10 @@
 / {
 	model = "FriendlyARM NanoPi NEO";
 	compatible = "friendlyarm,nanopi-neo", "allwinner,sun8i-h3";
+
+	aliases {
+		ethernet0 = &emac;
+	};
 };
 
 &ehci0 {
-- 
2.35.1


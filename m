Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4278272
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Nov 2021 10:20:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n29so22553300wra.11
        for <linux-sunxi@lists.linux.dev>; Sat, 20 Nov 2021 02:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LEaW6sQllQeiUAlR7VXlAWH45Q9pIWU2d/TfbfgcPXY=;
        b=i6Z4Z1lM7/46HyWl8T7vlO0nFHyyAHpd9jl5OpLIUO8B01KVgIXrLeSUA7wQm4Hbem
         ebKHl/xU8pj1ugoTomhhh+DBk4oU1ID1iU0JrSdgJj1/vOMRseOy+CVHAt2WUr3g376C
         wo34jNKOwtwGnIp7hLW5Z+0Cw9KCE4M8/u0Q/LpNlc9TJsNSjCi3O66qdqqBd6sdlRF6
         Xxekc+NhqT7xzJdnSVKKcfLOrYVPzJ1awBDHNAA/5KHdZlZAFs3lIPpeK5oMUN2cs8cD
         A457k7+6fXv1W61dffoQ4PjWTV3Ab7j21BeYUtb512FqrK/F0ekK+A/tVdi/dZ6i+V5J
         ks6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LEaW6sQllQeiUAlR7VXlAWH45Q9pIWU2d/TfbfgcPXY=;
        b=4aWEwB2DHptSHitExBcPfZP4V+Igdx13nKR+xf3puvFx3u6T3znykp0wkNm6VlJvU5
         C+wjL95LwqomQPOnE8075qjccsJ2hLrAtYqO2kfDECyV1j8PPTVapkJT0D6z5NVf5jEo
         KF4ihCbXbiHrb2KajKju8ulnffiWnJ8YZil4BeGLMYNIZJzfrR++DcKmRGRrDIoIcog7
         S2G1pCUu95azXgRbPNuXRP4yLf9XVRrClqGnBnPnElZ6ZJHO1QUdXrrSYElbmNWmAU05
         g8D4pqwf9mT4BmTPgcYtTqj9GbOHgsliiS34cZKPxa+/uP27lasGRWOJLt4UWdLDrane
         D7+g==
X-Gm-Message-State: AOAM53232UGFl0BfuA/nJOPUvx00lDRYh32zuSbFKKvZ+ocjJWAZFBcl
	YRFUhotD8bxfdIVB3d3ulas=
X-Google-Smtp-Source: ABdhPJwHPV8MS0HMq4lqynVHggq/3i0b79h2bOQmtKTpYRNvjsHuJcaimdZUtJQCO2MEHdWtpPSMDw==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr16656879wru.182.1637403629609;
        Sat, 20 Nov 2021 02:20:29 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id j134sm2543534wmj.3.2021.11.20.02.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 02:20:29 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] ARM: dts: sun8i: h3: beelink-x2: Add GPIO CEC node
Date: Sat, 20 Nov 2021 11:20:24 +0100
Message-Id: <20211120102024.439456-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Beelink X2 doesn't use HW CEC controller found in DW HDMI core. It has
dedicated GPIO pin for that purpose.

Add a node for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
index f0e591e1c771..4ab4bbf001ba 100644
--- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
@@ -57,6 +57,12 @@ aliases {
 		ethernet1 = &sdiowifi;
 	};
 
+	cec-gpio {
+		compatible = "cec-gpio";
+		cec-gpios = <&pio 0 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; /* PA14 */
+		hdmi-phandle = <&hdmi>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-- 
2.34.0


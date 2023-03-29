Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA75187C
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 13:18:39 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so18512020pjb.4
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680095919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nd2Hzi5pbnX457/tZ1SGDUudK/Mgpe+Ly4/pUeQ6HnM=;
        b=BxNdyUGAorjHPinmo8knKGhWp8mcw/YgRk4iYNWDGp+87Odbgo0V0ajx8K99ZvbH3m
         uK1o/myHvEIucTiBG5DYCQ2UcxcizWIeVayEhlo/8lScUog6XsvXM6+6OOEyJd/pLOs2
         /RttKWJwSMHDK2hDoJcL5A8izTKP8wEnKCyoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680095919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nd2Hzi5pbnX457/tZ1SGDUudK/Mgpe+Ly4/pUeQ6HnM=;
        b=hewkuKAKCPwc0reRmLVpF8Hkoj7IXcQvj1LMb0YP+mVSBS/svu8wEfPfNOkjy1qSTR
         KnlWda5AaOBJDEodHdoOT2Cda/bcKIOSfXgYAUg2Cv1lx0AgacKBfL5lXDruQkfgZi1Z
         xGIwJuF7lQ/N8n3hnRqPhoL2vYDygkLUvl4yTNUDKG5Z5vcBIFEB5ivwdK3xyUl4LOoS
         sGoNiXXlMQpebZyM2y1upeT5ZcoVF4IArLjUA4KgQ6psfwra0VbDi322RIqd3GHLQ5qD
         yYIOjiSFbm2bR+T/yc/hrkKquIkbs9sjNHhT9KY2hMe6CM/uk20unJpvQYeybUJKArhT
         1ouA==
X-Gm-Message-State: AAQBX9fEguc6F32E6V71sQMSn9EPj1/mfGZWA7ThDJzKvRctHUBLa0lu
	iFa08M81TSLxZirQ8kBQI8oLQQ==
X-Google-Smtp-Source: AKy350bk2/fzr+dtM9w5K/plrUVW+fEKnyzucVJ/a5hXz7GHf87bUlhqvKmrLM/SThMMOW9uCmEMAA==
X-Received: by 2002:a17:90b:1d8e:b0:23f:37b6:48f4 with SMTP id pf14-20020a17090b1d8e00b0023f37b648f4mr20675024pjb.43.1680095918961;
        Wed, 29 Mar 2023 06:18:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
        by smtp.gmail.com with ESMTPSA id s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:18:38 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>,
	linux-amarula <linux-amarula@amarulasolutions.com>,
	Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v7 08/12] ARM: dts: sun8i: a33: Add endpoint@0 to dsi_in_tcon0
Date: Wed, 29 Mar 2023 18:46:14 +0530
Message-Id: <20230329131615.1328366-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329131615.1328366-1-jagan@amarulasolutions.com>
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DSI downstream devices are likely to be Panel, Bridge and
I2C-Configured Bridge.

It is possible to connect all three devices using upstream OF-graph port
or ports node however only Panel and Bridge are possible to connect via
child node but not possible to connect I2C-Configured Bridge via child
node since I2C-Configure bridges are child of I2C not upstream DSI hosts
and it must represent them via port or ports with endpoint linking.

Allwinner R33 DSI node already has a port so add endpoint 0 for input
tcon so that the downstream DSI devices can use endpoint 1 to connect
Panel or Bridge or I2C-Configured Bridge.

An example of the I2C-Configured downstream bridge representation is,

i2c1 {
       bridge@1b {
	     compatible = "ti,dlpc3433";

             ports {
                  port@0 {
                         reg = <0>;

                         bridge_in_dsi: endpoint {
                                remote-endpoint = <&dsi_out_bridge>;
                                data-lanes = <1 2 3 4>;
                         };
                  };

	          port@2 {
	                 reg = <2>;

                         bridge_out_dmd: endpoint {
                                remote-endpoint = <&dmd_out_bridge>;
                         };
                  };
             };
       };
};

dsi {
       compatible = "allwinner,sun6i-a31-mipi-dsi";

       port {
             dsi_in_tcon0: endpoint@0 {
	          reg = <0>;
		  remote-endpoint = <tcon0_out_dsi>;
	     };

	     dsi_out_bridge: endpoint@1 {
	   	  reg = <1>;
		  remote-endpoint = <&bridge_in_dsi>;
	     };
	};
};

Note that existing device bindings are untouched and still represent
the downstream devices via child nodes since the sun6i-mipi-dsi host
will migrate to a standardized single helper to lookup for a
downstream device via child or OF-graph port or port node.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 arch/arm/boot/dts/sun8i-a33.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index b3d1bdfb5118..50c2424ec31e 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -269,7 +269,11 @@ dsi: dsi@1ca0000 {
 			#size-cells = <0>;
 
 			port {
-				dsi_in_tcon0: endpoint {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dsi_in_tcon0: endpoint@0 {
+					reg = <0>;
 					remote-endpoint = <&tcon0_out_dsi>;
 				};
 			};
-- 
2.25.1


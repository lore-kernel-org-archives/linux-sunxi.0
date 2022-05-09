Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883091858
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 07:49:10 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id n6-20020a05600c3b8600b0039492b44ce7so763858wms.5
        for <linux-sunxi@lists.linux.dev>; Mon, 09 May 2022 00:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qMrSL3AMHGC+RTK3h8kNDAa260PauJUqXlYjnxZrCPw=;
        b=j8P/nWstf2G5gLaKTxZaAiqLCVOFotDTnu2DFmPNl9kH9oH5DoETD+nmuufHH5yH/V
         MC+xp3DhGDu9f5UrP8EFmn74sOiYY1T7vcCv4vYfDQWbMgAmftI6FWb5fOsi88qZu6/b
         3oTkMitgehUqVRveNC7/2GmBk26P7cOxsFmePBDbL3QdMvKA8dfoEHcjYCzjUVeXVZAR
         DXNSbu/WBCnAIdw7L4+TTJR6C9W+hQ+Uzz/HjZPGhF4nRLpxYtUe3Cp/yAHLTZWJ990K
         FJlFuUkfsYpaOKpdlmX2Llth5Zk1NsSF/pMzV8UlhdJTkwZ7h9eZ7vFSqxxXIL5O29iD
         KA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qMrSL3AMHGC+RTK3h8kNDAa260PauJUqXlYjnxZrCPw=;
        b=ftiibYSt0OtmuLInYaSDYjdNiVV3oaDU56jAiOPF9lxCsX3uNBNirx1RzRH1V/BRli
         kH6y4x+CIKUnPKdhIHCoJ+fPB8H0BWAbV+Qm7LjGDEskk9ajbbFi4X4FzsrPUCLCkT6Z
         qPQEohI6Oah3uM+Dp6toQDEFYgvgKPnB4D7EkKVWp0dr1tYs3TNtA33URj1EZrdTa+Y5
         nJ1fTOS3n90+UNi+VvOtIz4XV3m8qpGvRYxeiqWxC3XGC3kRB2DZttOwi6ykbGBw1b7z
         xcDOIsko8RvTZIARKF83SCMf4vz69BU372Dk1ILtm5KiX1mnXRTV5f+unv3sVnLL7J4R
         Mrnw==
X-Gm-Message-State: AOAM530Na/VGI7YKq8Wv5BZvfVe700SoiU6fiyfYFtdZh4AP7KnV/8zD
	P+yDJ9UizF/4JuShri8BJFgduQ==
X-Google-Smtp-Source: ABdhPJyH3fd92bgA2uhnaxAe8vtAphLXWX8wAKMdKQ1ZnKM4LCqbUKVDjIMxph/XhaUGywElhXsEBQ==
X-Received: by 2002:a05:600c:20e:b0:394:2985:6d0c with SMTP id 14-20020a05600c020e00b0039429856d0cmr21057310wmi.106.1652082548836;
        Mon, 09 May 2022 00:49:08 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id bw22-20020a0560001f9600b0020c5253d8d8sm11784768wrb.36.2022.05.09.00.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 00:49:08 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: alexandre.torgue@foss.st.com,
	andrew@lunn.ch,
	broonie@kernel.org,
	calvin.johnson@oss.nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	jernej.skrabec@gmail.com,
	joabreu@synopsys.com,
	krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linux@armlinux.org.uk,
	pabeni@redhat.com,
	peppe.cavallaro@st.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	wens@csie.org
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 3/6] dt-bindings: net: Add documentation for phy-supply
Date: Mon,  9 May 2022 07:48:54 +0000
Message-Id: <20220509074857.195302-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509074857.195302-1-clabbe@baylibre.com>
References: <20220509074857.195302-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entries for the 2 new phy-supply and phy-io-supply.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../devicetree/bindings/net/ethernet-phy.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index ed1415a4381f..2a6b45ddf010 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -153,6 +153,16 @@ properties:
       used. The absence of this property indicates the muxers
       should be configured so that the external PHY is used.
 
+  phy-supply:
+    description:
+      Phandle to a regulator that provides power to the PHY. This
+      regulator will be managed during the PHY power on/off sequence.
+
+  phy-io-supply:
+    description:
+      Phandle to a regulator that provides power to the PHY. This
+      regulator will be managed during the PHY power on/off sequence.
+
   resets:
     maxItems: 1
 
-- 
2.35.1


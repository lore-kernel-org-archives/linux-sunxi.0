Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DD9187C
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 13:17:59 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso18571249pjb.0
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 06:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680095879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wNTb2LrxaKFlmHgalrnrr3A4EG008KaVwysZvYEb6Q=;
        b=cqidfaD69QRlixQGDaMVrdpnuW4E/ueB+ta+aoaLu75jvjPTb6X8dXWmHB4iaw1Puf
         sA0xW5rf44dDAy0wFnUg6Z94f+i5ihDnYHtGWrSMB79e2IKvSUSnAty8f9XTn8263x+E
         rjUs3uFYzgM1UOkgvbYUPtQBmF6OKzdBEe78o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680095879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wNTb2LrxaKFlmHgalrnrr3A4EG008KaVwysZvYEb6Q=;
        b=Qjy0565g15Qo38E2nPEvh5yZgrQXe1IfzPyENVVDIHoMsSdJolDJe3PEKPqYiK28Re
         sF0cCmpPtJaI/E8GtleGiFHtPAjDWHpFovljAPVy4hHE9rkc9x9Dgmy3AqhbOP604h/+
         EiygKE6i0dD2+F7pDJ/1NRYoVvvUftIwzSVn0kKiwPT0UgMe6URnvkxBDPvVeorOaXwp
         A5O7o6KtNKcT7WammlDZnyzEBC1MVZr8Xi/v9ILrQ+wDo2nPQv7syHLf9DJRDcUtvOSj
         /IHv9MKtLb319nus0yAeMoiHzbpkNaxvA7Q1OODxfDyQU2iqmtrzU3R7wrAadYRUaXda
         fTqQ==
X-Gm-Message-State: AAQBX9dlXW2a4mX0Axkbl/RsbDAd6S14j5ADRGF9xFBml3KCmjbaZhYY
	uFUnl09divKTt1GCkohMNnSdq0SQ8enb7056o7XFXw==
X-Google-Smtp-Source: AKy350Z0nRebQpUhm57vPD2Fu3xEl648nRwouk5XbwzGKAmjhBeobsc7CNU/OD8nrZMuYEE8Qi5lQA==
X-Received: by 2002:a17:90b:3511:b0:23f:a4da:1208 with SMTP id ls17-20020a17090b351100b0023fa4da1208mr21913619pjb.39.1680095879378;
        Wed, 29 Mar 2023 06:17:59 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
        by smtp.gmail.com with ESMTPSA id s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:17:58 -0700 (PDT)
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
Subject: [PATCH v7 02/12] drm: bridge: panel: Implement drmm_of_dsi_get_bridge helper
Date: Wed, 29 Mar 2023 18:46:08 +0530
Message-Id: <20230329131615.1328366-3-jagan@amarulasolutions.com>
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

Implement a DRM-managed action helper that returns the next DSI bridge
in the chain.

Unlike general bridge return helper drmm_of_get_bridge, this helper
uses the dsi specific panel_or_bridge helper to find the next DSI
device in the pipeline.

Helper lookup a given downstream DSI device that has been added via
child or OF-graph port or ports node.

Upstream DSI looks for downstream devices using drm pointer, port and
endpoint number. Downstream devices added via child node don't affect
the port and endpoint number arguments.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 drivers/gpu/drm/bridge/panel.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h       | 10 ++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index d4b112911a99..d047c7d9551d 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -501,4 +501,38 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 EXPORT_SYMBOL(drmm_of_get_bridge);
 
+/**
+ * drmm_of_dsi_get_bridge - Return next DSI bridge in the chain
+ * @drm: device to tie the bridge lifetime to
+ * @np: device tree node containing DSI output ports
+ * @port: port in the device tree node
+ * @endpoint: endpoint in the device tree node
+ *
+ * Given a DT node's port and endpoint number, finds the connected node
+ * and returns the associated DSI bridge if any, or creates and returns
+ * a DSI panel bridge instance if a panel is connected.
+ *
+ * Returns a drmm managed pointer to the DSI bridge if successful, or
+ * an error pointer otherwise.
+ */
+struct drm_bridge *drmm_of_dsi_get_bridge(struct drm_device *drm,
+					  struct device_node *np,
+					  u32 port, u32 endpoint)
+{
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	int ret;
+
+	ret = drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
+					      &panel, &bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (panel)
+		bridge = drmm_panel_bridge_add(drm, panel);
+
+	return bridge;
+}
+EXPORT_SYMBOL(drmm_of_dsi_get_bridge);
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 42f86327b40a..a1a31704b917 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -931,6 +931,9 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node
 					  u32 port, u32 endpoint);
 struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm, struct device_node *node,
 					  u32 port, u32 endpoint);
+struct drm_bridge *drmm_of_dsi_get_bridge(struct drm_device *drm,
+					  struct device_node *node,
+					  u32 port, u32 endpoint);
 #else
 static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 							struct device_node *node,
@@ -947,6 +950,13 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct drm_bridge *drmm_of_dsi_get_bridge(struct drm_device *drm,
+							struct device_node *node,
+							u32 port, u32 endpoint)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 #endif
-- 
2.25.1


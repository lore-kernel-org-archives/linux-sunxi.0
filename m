Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B56137C
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Apr 2023 10:47:07 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id dm2so51975839ejc.8
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Apr 2023 03:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681555625; x=1684147625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O04Ye2MzXp7QKEfSemVWElXkh5JGH4p8WqqP9d/MZSE=;
        b=QZ2NGevF4bpWez9gHLYQPb3kG98YPHW3Dxiczr4FnG7PJcfpWiPdmDcQOHTbP37dbF
         groLwOQ9YguDs/v1WdalPZoJz2XFoeEgSuj19V1VKwKqZE5EhYXEWh/zfw1v+9GRAPdj
         k+AevlVI1t361tdpOE77dqxw2u85ij0tefIDjWbrQimHCWj+Gavslz+V+A+2ZrO2X8Wt
         G1lY0wYGd8RYOIrCNRim9Ed4DFIVQ0u700KG/MF3AWBQjHH4nhE3GunEcp6emqfckeTy
         V8aRYSincLppnfKgTfGsBca13Kc07lCZR8nAI/dCyx/zlHxtGjd9iB3X7Foj2yi0sQru
         kxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555625; x=1684147625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O04Ye2MzXp7QKEfSemVWElXkh5JGH4p8WqqP9d/MZSE=;
        b=JJ6/q2daYgjfsYoyq1u4US8ZxG9A1k1itg/OIDQ2FRCUGKsw9ELfHYsJErNKKnxRnS
         z7ZQICFUHwY0Ggm7I9jjmLxon6G/h8mVYWuOkNvoOQ0bqwl4WmYDVToH8wQXWGPUI1IN
         Hhs869CAjtm4jAyqLkTV2A4Aq4zgkFCx7Wu2AdtijcM/7uJOZIuGD5kxQdNohnOc4dJE
         kGei+WB5AsDyb3mN6a6hWK5is/fZojioxdcdb5i8Z+y/T/IP7jr24crVdY4iroX+0tZV
         cTJqeESOwnboPG6rIGg4/y+SO4gdXNPhj0Qz0OGS3HIfQvPQtXqHj+VUC/0mO5Z1oGKk
         lUIw==
X-Gm-Message-State: AAQBX9eEuJXdGdyvZynunSk9ObZqXeYmCLm6yrzhZTI+u3Ji03ZcPHI9
	Wtt744DGVdjr2HB5cQ9zp2Q=
X-Google-Smtp-Source: AKy350bwZkPIK+M4puxUx9p8YTSxs9X8ypJVNYd5v62q6WmJKob3N+gncOYlcJY70GiMJz9RM8YuZw==
X-Received: by 2002:a17:906:ad87:b0:94a:4b7a:9886 with SMTP id la7-20020a170906ad8700b0094a4b7a9886mr1727708ejb.12.1681555625592;
        Sat, 15 Apr 2023 03:47:05 -0700 (PDT)
Received: from localhost.localdomain (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id m15-20020a170906720f00b00947ab65d932sm3607034ejk.83.2023.04.15.03.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:47:05 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	samuel@sholland.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	airlied@gmail.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-media@vger.kernel.org,
	hverkuil-cisco@xs4all.nl,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/3] drm/bridge: dw_hdmi: Handle snps,disable-cec property
Date: Sat, 15 Apr 2023 12:46:12 +0200
Message-Id: <20230415104613.61224-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415104613.61224-1-jernej.skrabec@gmail.com>
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New DT property allows to skip CEC initialization.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 603bb3c51027..e7e8199d2fb1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3615,7 +3615,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->audio = platform_device_register_full(&pdevinfo);
 	}
 
-	if (!plat_data->disable_cec && (config0 & HDMI_CONFIG0_CEC)) {
+	if (!plat_data->disable_cec &&
+	    !of_property_read_bool(np, "snps,disable-cec") &&
+	    (config0 & HDMI_CONFIG0_CEC)) {
 		cec.hdmi = hdmi;
 		cec.ops = &dw_hdmi_cec_ops;
 		cec.irq = irq;
-- 
2.40.0


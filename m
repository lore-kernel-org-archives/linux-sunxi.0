Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A5329CA
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Jan 2022 08:36:38 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id ie13so4653450pjb.1
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Jan 2022 00:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=0usgNPuxO2Xbite7dIWl/eUqLBFFjy4eURRS5eQlexE=;
        b=db7Z0ELzm+ApbLFsM9kaoTKg5fw9dbZ6VA0Cr13+Zl2LzqmSGdSDtLVH3KTB09Ekyt
         vrM918SYbXswzfnRiP5IYevCGXXj8avAtt+q3iS7l5RkQENFvOasfI7JrKDDq+52i2lA
         4/PRS5KtpQhEPAzQXVlK52YmyDsiLxO/efb28hj+KW2B2QSeeLPQRq5hqwtspAwXBa6n
         ffEvYvumpV4JDPyMZYpcmSjlXIvQ2WE4GBdQ8N/f1266lHwBiuFcbj1Jzg5Ls7Nb0ziz
         lBQER0SA3Y8NYj/gpmtbHgZwwWnsPtsTBEddeX0KqPgbMxdq4qQ2NjmriVUNhx66YbTr
         zDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0usgNPuxO2Xbite7dIWl/eUqLBFFjy4eURRS5eQlexE=;
        b=Cf9WmmqiCOsr7SKsqDnFF/K5qf+V0u02gsW8smwVCSa+35jrOJ2Qj0qtNirSN+GuAv
         CNbJSRo+yM+aL/HDAyCu+ddUmlUJ8IpKm+6YDCbhXwRCHxlvpiFLYWdCe3tMBpNvZY4Y
         84/kadBBAqITzGL3h718qyUeKWnAkqXM0iXXNGjsKcnrgY5E8FsE1u6rRVSmnuT9zQnK
         mzzBT6fhiZPZvgLvG/0JDRx+NifGH/er00CuUlfFE+c4hI8VC2DvMMwGHDiHZjIBq2co
         EBKGalYaKIMLX4DFXE52excVm48CNarZkRNx0LZdoZVr8hWPVao10x/iAr/rw50ZgdsY
         NBnQ==
X-Gm-Message-State: AOAM5314eRPBqNIbafGNOcvNApwIB5b+9wiD/IfZF9ux5/B4LjBsyDpq
	/LY+V01iMARy61Qu8wOXmlg=
X-Google-Smtp-Source: ABdhPJwFX+BUrAd7opzOCSQBmNe+AAAzzMRjvfY3Q5YfyjPq15ioRx70dDlJsKdD6o6knFYNsznE3g==
X-Received: by 2002:a17:90b:1986:: with SMTP id mv6mr14795706pjb.37.1641544598539;
        Fri, 07 Jan 2022 00:36:38 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
        by smtp.googlemail.com with ESMTPSA id l1sm3909919pgn.35.2022.01.07.00.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 00:36:38 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Cc: linmq006@gmail.com,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Saravana Kannan <saravanak@google.com>,
	Ondrej Jirman <megous@megous.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sun4i: dw-hdmi: Fix missing put_device() call in sun8i_hdmi_phy_get
Date: Fri,  7 Jan 2022 08:36:32 +0000
Message-Id: <20220107083633.20843-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The reference taken by 'of_find_device_by_node()' must be released when
not needed anymore.
Add the corresponding 'put_device()' in the error handling path.

Fixes: 9bf3797796f5 ("drm/sun4i: dw-hdmi: Make HDMI PHY into a platform device")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index b64d93da651d..5e2b0175df36 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -658,8 +658,10 @@ int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
 		return -EPROBE_DEFER;
 
 	phy = platform_get_drvdata(pdev);
-	if (!phy)
+	if (!phy) {
+		put_device(&pdev->dev);
 		return -EPROBE_DEFER;
+	}
 
 	hdmi->phy = phy;
 
-- 
2.17.1


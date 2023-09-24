Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C43BDF40
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:26:18 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9ad8bba8125so670693166b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695583576; x=1696188376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P67yQ9/R8vP33MNrFu8s/BR4RgUF4Oo7AxmSI7wtbGo=;
        b=RxgROEB6tk+6i71wkiiQNg27YV95j6++5GwG6nrlBWPRumN9d7bVqhI7qRJfSG5k77
         Yaaf/72BCiysMYOwUmxVDH+ptUgV+mE2eSEooMvR5b+zK8kx9ofEXitB9MiSiz6krvEs
         fP/qryY9fvv+mQ2rRgIBw4PAGVbasoD6S1XXW9ftHdr/3V1CHnaLbxdtqFhvaxN3PMF/
         XhX868rsbEnIBJxKMejNliq5xHlS34IyIrkogoLoIpPpWeBd/K4tJTYxJDKZSzQHUVpg
         gC5PKRdMJbIb9UA2eCXJ5qYuny2fIvGKJbdJWqzYLvMSmAULr7k33gQV8POkxaVooSiq
         CAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695583576; x=1696188376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P67yQ9/R8vP33MNrFu8s/BR4RgUF4Oo7AxmSI7wtbGo=;
        b=AfUbT9hMYPG3tcR5tIEg/gDklZc9ikzxPfA3oOzTI2xVmMgouXNmII3F+bXMdEFVqE
         PU6wH7PPX27bTC2iydNWIoBS2SAySxKmyxPYOqUo7PSwBSWnau3weJQ2fdyTEAQJHkvq
         Djt6Wz3zE//Ww2Ayb0S5kvCbxIYg9v5TWHrTeYUvxfRN9S0BXWmm8GEh9x3G/u7RZ7ok
         caqZYk0td4Hb8XoKv6/pf1XPglfNNYYkplSPltWyy7wXTvlwrIG9D0INxx7iqG2RyMS/
         MZ6WFnyaB/YmETXPl+QmUnXaSxEafNbrO3yNkgCiT6vurbuMx+6DNRNpwF53g+yQWT71
         z0kw==
X-Gm-Message-State: AOJu0YwgcsE7IrtdDjZ8jpaH/Txn2BxPbjGEMpVi0blD7PMW6RitfV+c
	l3Ph0NESTNyg3s+PyOHttik=
X-Google-Smtp-Source: AGHT+IGYcIjckD309lYilHv1Z7GzrnSkK3WVyjDqrq0qtPDgxT6RI3OTizpfVXr1WSEMocNk7yTMyQ==
X-Received: by 2002:a17:907:775a:b0:9b0:169b:eee2 with SMTP id kx26-20020a170907775a00b009b0169beee2mr4068950ejc.10.1695583576620;
        Sun, 24 Sep 2023 12:26:16 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:26:16 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: airlied@gmail.com,
	daniel@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 4/7] drm/sun4i: Don't show error for deferred probes.
Date: Sun, 24 Sep 2023 21:26:01 +0200
Message-ID: <20230924192604.3262187-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers probing in display pipeline can be deferred for many reasons.
Don't print error for such cases.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 6a8dfc022d3c..b4816a1b0be3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -88,7 +88,8 @@ static int sun4i_drv_bind(struct device *dev)
 
 	ret = component_bind_all(drm->dev, drm);
 	if (ret) {
-		dev_err(drm->dev, "Couldn't bind all pipelines components\n");
+		dev_err_probe(drm->dev, ret,
+			      "Couldn't bind all pipelines components\n");
 		goto cleanup_mode_config;
 	}
 
-- 
2.42.0


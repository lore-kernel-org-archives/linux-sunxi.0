Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036945393
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 15:30:44 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id k9so16061343wri.0
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 08:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=deNM8qIhqEaf1BX3jHfJgbq+ntr7dEybvk2vQtWGvA8=;
        b=hQ2ek4yNVW7yd3MqyzdOpp9dpyjXZQcaP3Ka31WgTs7bJBdonNXKn9nFKFVfCZxIkP
         qwaxe2flVffWR6WHNb5hREtROfAUl2UX9FdyCHFuwXGCrxlBJJYGDIa1zulG11zNHl+w
         JliIq5ET9TIyvOpGqpx51TD0uG7Ib21wVAdwhYCZmCy5Iqp/aCVgvVZrMmX6OM0pukAU
         hSKJTFfk8Gka5a2gWpHQa1AzFjYNuSWBgImwH/LyzOrPDOWiEG9hdheSOGjurtS7/HdI
         5ENk2RmhTXaaL954QfXE/uc/tR9z4iHn4T0c+Qhgio3RCAWy1hvmzL9S821lInjlwyux
         /9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=deNM8qIhqEaf1BX3jHfJgbq+ntr7dEybvk2vQtWGvA8=;
        b=frIrsW8ubYAQYD/Em2QlsGy9nUDmKz73ZzwxvtR0BvY3XWtWyG1SaYLcTsh09qrclq
         +sgOQhbyQQx5KycoXuiYN96JqowemFgdQMSlP0Qil74pjyOPBgJtlyW7r0weAY1xLYob
         q8tyw8kp0/ML1qFmH68+Kx9QUgH/h2uQyqPZNH+R4sq5WvWeJ+k/ISdfgcMlE/hOjuth
         +FO/C9CXTVWXg8YR92h//LvoSHjdvjKUqLq8wLnc+4loa7r1pF799v4662chEcnItCt8
         MsJvifX+QUhXAbwSzoVnJrezom8obRy97fG6pIlJDl8UcyHO7tiGTB0XH5z05bHpL1Vq
         qkQQ==
X-Gm-Message-State: ACgBeo2GLrj9/pTX+5HDOm1dfh4V3+BY+xpx3J+AQanaFQtHy9ot2ppR
	F0JGfz2AyA9EaUckGxEMH0g=
X-Google-Smtp-Source: AA6agR7XgMMod/UzqnVyMp/Du84+AgxUL59KAC6k2gnekD3iXBLrlQFzXfkAgYjmWGxaKnWPSA2U5A==
X-Received: by 2002:a5d:6e8e:0:b0:220:5fa1:d508 with SMTP id k14-20020a5d6e8e000000b002205fa1d508mr29501866wrz.337.1662478243202;
        Tue, 06 Sep 2022 08:30:43 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c22d800b003a6125562e1sm14922731wmg.46.2022.09.06.08.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 08:30:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v4 4/5] drm/panfrost: devfreq: set opp to the recommended one to configure regulator
Date: Tue,  6 Sep 2022 17:30:33 +0200
Message-Id: <20220906153034.153321-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906153034.153321-1-peron.clem@gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enabling panfrost GPU OPP with dynamic regulator will make OPP
responsible to enable and configure it.

Unfortunatly OPP configure and enable the regulator when an OPP
is asked to be set, which is not the case during
panfrost_devfreq_init().

This leave the regulator unconfigured and if no GPU load is
triggered, no OPP is asked to be set which make the regulator framework
switching it off during regulator_late_cleanup() without
noticing and therefore make the board hang as any access to GPU
memory space make bus locks up.

Call dev_pm_opp_set_opp() with the recommend OPP in
panfrost_devfreq_init() to enable the regulator, this will properly
configure and enable the regulator and will avoid any switch off
by regulator_late_cleanup().

Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 5110cd9b2425..fe5f12f16a63 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -131,6 +131,17 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		return PTR_ERR(opp);
 
 	panfrost_devfreq_profile.initial_freq = cur_freq;
+
+	/*
+	 * Set the recommend OPP this will enable and configure the regulator
+	 * if any and will avoid a switch off by regulator_late_cleanup()
+	 */
+	ret = dev_pm_opp_set_opp(dev, opp);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
+		return ret;
+	}
+
 	dev_pm_opp_put(opp);
 
 	/*
-- 
2.34.1


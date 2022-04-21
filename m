Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E911FCD
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Apr 2022 17:07:33 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v12so791565wrv.10
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Apr 2022 10:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mOsXpLWi9QLA5ykkzo2aKVd+yr4+GMP+CHJv0QHqFPU=;
        b=PhOXgh0Q5LE7m9gF9czIrKZRq55dBYQfo6JFtQeE9ijzQGIxBM1V5QZtkJjgUAPcva
         mijV+yVjCD1Y5vzy+S/9QeUO9MiLfeuJRoGQ20nYs5NNhxoMqORFTDdKMo8HmDzrMzo9
         q8voQxoIddhVNAF6gBbxgGFWo3cmsBYPJCeEq5oSHPHkD51e69O6TQt3OmbCXV13dl3x
         1nmhxU/KIU992jK2iLSLd01VSlI71j+KQOLtbEiSIGTgDUEOSG4tqwDOFLyrLtkcvG5s
         D3ssv0r5pDlrF6bXeXPICXsORkR4XZl7J1mLagy+RZiY5nXL4U+gkRy6RvMQllEHIZV5
         tHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mOsXpLWi9QLA5ykkzo2aKVd+yr4+GMP+CHJv0QHqFPU=;
        b=x1XmmPAIgefNG+hVTCBFOCitM4S17NIxL7y72FIlbd1irVJVThKNmdGKjxAeQI7m4C
         ow1HemK7Kc2D0zp26xslSvOrWdoDbrmUJsqn3jovF9M8QOAMJskSIq20Dd07rtTlP8DI
         /vYSYbSl0lHYVfUeTKEGojCcvuL2mpjUCIgDHIpfZPJHCzEjN5LW4izQ1gnaa6ChIA2+
         XY/sZHOC6IuIEWL0Q/Z6RHqrE222s6j8AQnX0n9XRjxkoTqBmC1dwDQZVQ27SvM38Son
         yIPOGr2dWjyJhQOIBEIwhTSXNCow4sIp2RkEkQXT6NZsnHN7fcxFhhf51aGaNIhT5G9+
         Ldnw==
X-Gm-Message-State: AOAM53172DARMOy8AR9M2O2nDmU8Vc4acww3KL7G2LZA7mR0jDL82SUX
	wisxBgVV/zcOgXDck15j6wE=
X-Google-Smtp-Source: ABdhPJwmkd8rSG5wIeasQSmzXw1Hxgzf6My3j9pRLVWS50GQVQrvimreO3rNSOKpZuUsPU9r5kjkvw==
X-Received: by 2002:a5d:45c5:0:b0:20a:be8f:aca6 with SMTP id b5-20020a5d45c5000000b0020abe8faca6mr513028wrs.493.1650560852175;
        Thu, 21 Apr 2022 10:07:32 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
        by smtp.gmail.com with ESMTPSA id i11-20020a5d584b000000b0020a8d859e5fsm2963849wrf.10.2022.04.21.10.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 10:07:31 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: inki.dae@samsung.com
Cc: jy0922.shim@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hjc@rock-chips.com,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	alain.volmat@foss.st.com,
	p.zabel@pengutronix.de,
	mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 0/5] Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date: Thu, 21 Apr 2022 19:07:20 +0200
Message-Id: <20220421170725.903361-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everyone,

After implementing a similar change in the VC4 driver [1], as suggested
by Laurent in the ToDo list [2], I noticed that a similar pattern is
used in the Exynos, Rockchip, STI and sun4i drivers.

This patchset replaces drm_detect_hdmi_monitor() with is_hdmi in the
mentioned drivers.

Best wishes,
José Expósito

[1] https://lore.kernel.org/dri-devel/20220420114500.187664-1-jose.exposito89@gmail.com/T/
[2] https://docs.kernel.org/gpu/todo.html#replace-drm-detect-hdmi-monitor-with-drm-display-info-is-hdmi

José Expósito (5):
  drm/exynos: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
  drm/rockchip: inno_hdmi: Replace drm_detect_hdmi_monitor() with
    is_hdmi
  drm/rockchip: rk3066_hdmi: Replace drm_detect_hdmi_monitor() with
    is_hdmi
  drm/sti/sti_hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
  drm/sun4i: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi

 drivers/gpu/drm/exynos/exynos_hdmi.c   | 15 +++++++++------
 drivers/gpu/drm/rockchip/inno_hdmi.c   |  8 ++++----
 drivers/gpu/drm/rockchip/rk3066_hdmi.c |  6 +++---
 drivers/gpu/drm/sti/sti_hdmi.c         |  7 ++++---
 drivers/gpu/drm/sti/sti_hdmi.h         |  2 --
 drivers/gpu/drm/sun4i/sun4i_hdmi.h     |  1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c |  6 +++---
 7 files changed, 23 insertions(+), 22 deletions(-)

-- 
2.25.1


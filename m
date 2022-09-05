Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57289468E
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Sep 2022 17:16:13 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id bp20so11676339wrb.9
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Sep 2022 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=NET4x4RxN//LkpTQU1F+09NLgubloV7JTbO9k0HaAgY=;
        b=dPN1jPhO3Ox1DPE1QeeWh7fFaJiVMYKpZrIWkTLDULG8JKbE0BG12yAZD7LUspmR4c
         5L82zH3hO5Cg2erfw//Iou0IjhGaXHrFIgoC9/Bd7LO4sWlc6besZC8bfzIYaxVYMyvX
         sl4uEY+E81PXs4qkPVQTl9qNHHS68+Qj8PQYP01hmd4MPqOguVyRpNAMjRJ/iedES2uf
         NONZestwjbNy5HZxctzLKRgZWmkSDKtqdTAJA/2amlzQZaqnvrlOCT4LBPnGYJ2tg27B
         8mzBO+i1r7IiZ3NhusdNrP/Fzb0xEKXp/ExoQYRhpQTsRSff+MLQhH13Bo7MZySuc/B9
         6MbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=NET4x4RxN//LkpTQU1F+09NLgubloV7JTbO9k0HaAgY=;
        b=Tv2zALUGJvaHD2069MDuzUXUl7Cjc5BaHQVncw5bheYe5cQHNzyww/zuiJ2E+Z7o5N
         NbW+K5bhmUe9fkEWR6ZrPBk9w0DAhGOrexgP0sXK1OA/6nDl7gf26qpRcrF4hBx/dk31
         yqo+/DKGKU0Fnbt2rK7Lf3y+V9OQ6ZagzQ02FemqPUJtWW+ut31a5L+VlfTcP3CPEp1X
         AGKRDyPEPeox+xok25Qc6TVRKrRo+V/7H9dYcWvrKYOg0awIRjCHbQpr53wm3goIoN/g
         EJusCPwQ+gWKsmkzEAA0iMfPxyu3eoW3ljvrwpnyU7nKBLzQPQr3Enn/3ZQLhAG0RV59
         cQWQ==
X-Gm-Message-State: ACgBeo0PWJc+suCSShun6fAt8lm/hpmQMdBtQ3ZhyRy0/S4LJHdL42So
	y6vD+6/1LFSH8hY4DteaF4s=
X-Google-Smtp-Source: AA6agR58EyV1FL2fPMl6goDeHTg46yXYvXzdF0Scctk5jBM1pIRE9np9mQxUokCZZNVmHaVghq1qfw==
X-Received: by 2002:a05:6000:184e:b0:228:bb9d:f98a with SMTP id c14-20020a056000184e00b00228bb9df98amr1987643wri.479.1662398171522;
        Mon, 05 Sep 2022 10:16:11 -0700 (PDT)
Received: from Clement-Blade14.home (2a01cb000c0d3d00995730c36491d21b.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:9957:30c3:6491:d21b])
        by smtp.gmail.com with ESMTPSA id v22-20020a7bcb56000000b003a5ad7f6de2sm11437072wmj.15.2022.09.05.10.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 10:16:11 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended one to configure and enable regulator
Date: Mon,  5 Sep 2022 19:16:00 +0200
Message-Id: <20220905171601.79284-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905171601.79284-1-peron.clem@gmail.com>
References: <20220905171601.79284-1-peron.clem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

devm_pm_opp_set_regulators() doesn't enable regulator, which make
regulator framework switching it off during regulator_late_cleanup().

Call dev_pm_opp_set_opp() with the recommend OPP in
panfrost_devfreq_init() to enable the regulator and avoid any switch off
by regulator_late_cleanup().

Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 5110cd9b2425..67b242407156 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -131,6 +131,14 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		return PTR_ERR(opp);
 
 	panfrost_devfreq_profile.initial_freq = cur_freq;
+
+	/* Setup and enable regulator */
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


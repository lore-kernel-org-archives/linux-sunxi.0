Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2B27C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 May 2022 11:43:59 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id z11so1521033pjc.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 May 2022 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6s0x8dJmuy2Ybw2lPLVZk+KMGhxE6UiFXXt2n7Y53xs=;
        b=U7t6fFDjDa0Ctor2pMs5mB+RkfuEaQPk9jAll6z0ozbTwHH7hCCOV39QhC1AudH7B7
         mQNpvXHdoHtmlP/l8G9ftM8cnpNgbGwwGz9I+OmYGanwKqbuDAFiLpXAxWh8NKaVHaAA
         aBOK8br6uQdtX1bFAvIQ7JvqoxwHiCHDyyeEoXHWCbLWoVvk7zriP5dvMGGKYIuZyP3N
         Ec0tGGa/3p+cdA3hyyIF0IaJc8Wg1rXpfwN5vn1/9ccbu8Tx6TT0v0YsqfAustZYcUM+
         AEv36mJY1RccxXovNcGZX5iR8HI63Dc4GaojNxWzAlkrNrcHbTysqe9W1RvbTeEt6NOm
         3OfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6s0x8dJmuy2Ybw2lPLVZk+KMGhxE6UiFXXt2n7Y53xs=;
        b=GxPwZDQL3hbONIdfgenVVjY7dyRJZlIh7xrED4XOjPbrN7MSptKrMHoOmLuWEjELWi
         IEfA2syfQcm+GT4cNfJ5/NeAOhZe6RGaJ69EU+cY9wojw+JEFHPd83fbHetV6oCswsT1
         vMcM7Gq27KNgZCQn4KD0/UwSM7GZH3AJIzu6X8ugtsIh1VJ3shiDQCRgynatRW/xqsR5
         ML3oiZoGN2XbVMyIIYt46JU4HjG6FrV5Kn06PE1sIcp3azKDYQpe5SzeNDQBt+7gcSNa
         a8t1AIYs0K8KDYydEo8g0UpxRzUaMnUn+zaXIuhhMHsjLZ9YE+mK9Wq7cLxGntPHELj8
         Qa6w==
X-Gm-Message-State: AOAM531uVMXTAh67QC7dcjb2WUrptXW02hvG6CxFhLZO79oV+8sxSCff
	rY35O8YZTuS15ohu7dt50LCBvg==
X-Google-Smtp-Source: ABdhPJxbhS8femEgYxRhuPmf1pbTSv1ParpKVoHJCFN/pCA01ph85V+OU8iJG6Dir5uT/slHjL/sTg==
X-Received: by 2002:a17:90a:4cc2:b0:1dd:1010:d10d with SMTP id k60-20020a17090a4cc200b001dd1010d10dmr2174506pjh.205.1653565439389;
        Thu, 26 May 2022 04:43:59 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id v5-20020a62a505000000b005183434ec86sm1261317pfm.135.2022.05.26.04.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 04:43:59 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Rafael Wysocki <rjw@rjwysocki.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/31] devfreq: sun8i: Migrate to dev_pm_opp_set_config()
Date: Thu, 26 May 2022 17:12:10 +0530
Message-Id: <276f3e9b7d9b696cbfa1e5546f79db7029510fb4.1653564321.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1653564321.git.viresh.kumar@linaro.org>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/devfreq/sun8i-a33-mbus.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33-mbus.c
index 13d32213139f..125b479c9d6d 100644
--- a/drivers/devfreq/sun8i-a33-mbus.c
+++ b/drivers/devfreq/sun8i-a33-mbus.c
@@ -337,6 +337,9 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 	unsigned int max_state;
 	const char *err;
 	int i, ret;
+	struct dev_pm_opp_config config = {
+		.clk_name = "dram",
+	};
 
 	variant = device_get_match_data(dev);
 	if (!variant)
@@ -404,9 +407,9 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 	priv->profile.freq_table	= priv->freq_table;
 	priv->profile.max_state		= max_state;
 
-	ret = devm_pm_opp_set_clkname(dev, "dram");
+	ret = devm_pm_opp_set_config(dev, &config);
 	if (ret) {
-		err = "failed to add OPP table\n";
+		err = "failed to set OPP config\n";
 		goto err_unlock_mbus;
 	}
 
-- 
2.31.1.272.g89b43f80a514


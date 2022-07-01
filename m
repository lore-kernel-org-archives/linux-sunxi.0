Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FD110E9
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Jul 2022 08:21:15 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id h9-20020a17090a648900b001ecb8596e43so1955951pjj.5
        for <linux-sunxi@lists.linux.dev>; Fri, 01 Jul 2022 01:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aJVM4zFbFbhC4PcmmIcXH43PSItTV2w1+waf0FbvJO8=;
        b=ac3+8dQHtEe1GOgSD/+czOHQobsLexnh9mWvBEggRIwxaSkJBUDtOkg+DdQaX5UU4E
         /gF3RRVm1g4RdX3XjTJQAcgHRHoZT54dk8B20CgpadbZbkeIczX08V0uSVwJZ/2fHpOc
         BrxDO5WkUpbdEm5ZsGV4KXnf8tLMdR9fC5obVM1zvtSDdtsWzQqeuANKELx6Z0FiWqeh
         Xpy4r/vAGHlZOBjNPfjrlhLmEIdrQaRr2fS57CCpFMYLsBczqnDWqCURvTumj1Y6c1Mb
         sac7u8Q5HUOdteP+2VnJmr6qovBq50d5MAhM1sgP+0JN/+NPK4UjkYBMtVaMxEyWS+KA
         FaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aJVM4zFbFbhC4PcmmIcXH43PSItTV2w1+waf0FbvJO8=;
        b=vSAV9VjVY9g1VpURTvGrxkXGcbg3qS+KIEv25A0HMR1rC+mx+Voap9SbQzGRyLmDrA
         RmTpgqMLoEEKeDl40c/sa2+SrS6f2+BO4DpQevqhoLbbhZ63RS3ahcq0ZGFUTkEPRmV0
         kcLjjx8gAg42ltc09wVV1v7oQwMoUJqwhzBH29AxeYKQLYEdw/gMcrfUSsmwIO7rtcqC
         iFqcp2BFpRYFRuYyZtAkcHvQOgzgCJVUcdylGLjLYyIWDFBWA0jAzkn9SnRqVFdhqMoP
         VqqBtRNnwoAMRkNgbZyfy0E9R8jgTLrAYY8i9OWdin88hrhokNgXJKNIP7v2tCTV2qfl
         T4Eg==
X-Gm-Message-State: AJIora+9TwWn3ZMFxpwMUf7rpNV7KHC94hdCEwCfw4FG15iT7/HVnGNi
	8mzzLs/C8OYZ80K/Dx9RzCAF+Q==
X-Google-Smtp-Source: AGRyM1vu5xQ/FaApTDjk/0jnEWXTkKjAl95QQ8Gbqhs9UyvgMPjWnaNlxNRSi4k/foLg6slD829VNA==
X-Received: by 2002:a17:902:f650:b0:15f:3a10:a020 with SMTP id m16-20020a170902f65000b0015f3a10a020mr18701639plg.61.1656663675180;
        Fri, 01 Jul 2022 01:21:15 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id n17-20020a056a0007d100b0051bada81bc7sm14907263pfu.161.2022.07.01.01.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 01:21:14 -0700 (PDT)
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
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 11/30] devfreq: sun8i: Migrate to dev_pm_opp_set_config()
Date: Fri,  1 Jul 2022 13:50:06 +0530
Message-Id: <cb05495f1f2af5a40767bb67211d69fbaf626298.1656660185.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1656660185.git.viresh.kumar@linaro.org>
References: <cover.1656660185.git.viresh.kumar@linaro.org>
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
 drivers/devfreq/sun8i-a33-mbus.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33-mbus.c
index 13d32213139f..0dcc13cae7d7 100644
--- a/drivers/devfreq/sun8i-a33-mbus.c
+++ b/drivers/devfreq/sun8i-a33-mbus.c
@@ -337,6 +337,10 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 	unsigned int max_state;
 	const char *err;
 	int i, ret;
+	struct dev_pm_opp_config config = {
+		.clk_names = (const char *[]){ "dram" },
+		.clk_count = 1,
+	};
 
 	variant = device_get_match_data(dev);
 	if (!variant)
@@ -404,9 +408,9 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
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


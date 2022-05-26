Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628E07C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 May 2022 11:43:47 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id w2-20020a17090ac98200b001e0519fe5a8so1496294pjt.4
        for <linux-sunxi@lists.linux.dev>; Thu, 26 May 2022 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tnA5+J+gH2mj2CPHfO10MW0xEpoxi+NxT/Ss2uVLmF8=;
        b=AVIp74S5w8hFRIvL44O8yvtl+fDjhV4Adadv/8mJ+X8nnqJGEThB9Kugaum863mxh2
         h9QuOLBSkznxR24EctnKbI9qmhWgcU3DWDFidsDc2fYwO+1F5dcjE8DMFq69+MK23MOE
         A2D664nA5pvQdof/UuQ5L/JNBfmbziqu3a1t3Q+WBqadmHvmtFBW863HQtRfsx3o9iFv
         U7RJQyWAEnlH/UAcghhdjnUwN0vjoTwksBEp3VT3kxKIAylChAm5SfCvCCHZ/8+uj6fT
         3Pn2GlOIIiC/KHtC45LCPo2xysWCycP3oSH7Wy3Yo7Bn2z3W9qoyVg93iL+7FRzxvTiw
         fyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tnA5+J+gH2mj2CPHfO10MW0xEpoxi+NxT/Ss2uVLmF8=;
        b=uI5jGVkX0lkDQRJH8FM3gn1JNTsRI9VM/MOrNSVmABAKqHnYOwrWgGkQCvqFGKPSoh
         qd4V1ik0rzXDSwyAi+e4da5lgUx8H5j2JFvNReTcwjMNDen3VvjVq2xCVI4AxG7Q0FKT
         AIdQUdRAk+zqgb3mQm2sNBtFEhOcUpc4wjCY0yx2+v8EfZsF5j7T+ZibqL8zAoTs1HIQ
         igDKvdza5g4x0VdnNrWl2knx8dVlhzpbnV5QxpAcVRGV58oclAvFloBvKukVqHbrbkBf
         uv0N/DQGF2jQ9mayO2oDq/r6OAsiFifnxJIF/ySSO6uEo/3PqwtvX8ULk7nJFs3yVeF5
         le8Q==
X-Gm-Message-State: AOAM531ciKfvyg10Bdx2GMNhzgqsC0xy751oRYXBWpvzzHDZ+W+n7btG
	cEWiiftzib20spOIDvStHCiU37pnKibdjg==
X-Google-Smtp-Source: ABdhPJzRIDXg5OmHJJdS+VFy81IjKYyN226dUfeZcatLo6D42DjmKKzBNFVKfJNIlfgyTjHRouDHZw==
X-Received: by 2002:a17:90b:2c43:b0:1e1:9ff4:fd12 with SMTP id rw3-20020a17090b2c4300b001e19ff4fd12mr1736285pjb.107.1653565426930;
        Thu, 26 May 2022 04:43:46 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902f68c00b0016198062800sm1374400plg.161.2022.05.26.04.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 04:43:46 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Rafael Wysocki <rjw@rjwysocki.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/31] cpufreq: sun50i: Migrate to dev_pm_opp_set_config()
Date: Thu, 26 May 2022 17:12:06 +0530
Message-Id: <32db8386ad53c0d0b71c5afba18273e90072c081.1653564321.git.viresh.kumar@linaro.org>
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
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 2deed8d8773f..c1bee39758e2 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -104,6 +104,9 @@ static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
 	snprintf(name, MAX_NAME_LEN, "speed%d", speed);
 
 	for_each_possible_cpu(cpu) {
+		struct dev_pm_opp_config config = {
+			.prop_name = name,
+		};
 		struct device *cpu_dev = get_cpu_device(cpu);
 
 		if (!cpu_dev) {
@@ -111,10 +114,10 @@ static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
 			goto free_opp;
 		}
 
-		opp_tables[cpu] = dev_pm_opp_set_prop_name(cpu_dev, name);
+		opp_tables[cpu] = dev_pm_opp_set_config(cpu_dev, &config);
 		if (IS_ERR(opp_tables[cpu])) {
 			ret = PTR_ERR(opp_tables[cpu]);
-			pr_err("Failed to set prop name\n");
+			pr_err("Failed to set OPP config\n");
 			goto free_opp;
 		}
 	}
@@ -133,7 +136,7 @@ static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
 	for_each_possible_cpu(cpu) {
 		if (IS_ERR_OR_NULL(opp_tables[cpu]))
 			break;
-		dev_pm_opp_put_prop_name(opp_tables[cpu]);
+		dev_pm_opp_clear_config(opp_tables[cpu]);
 	}
 	kfree(opp_tables);
 
@@ -148,7 +151,7 @@ static int sun50i_cpufreq_nvmem_remove(struct platform_device *pdev)
 	platform_device_unregister(cpufreq_dt_pdev);
 
 	for_each_possible_cpu(cpu)
-		dev_pm_opp_put_prop_name(opp_tables[cpu]);
+		dev_pm_opp_clear_config(opp_tables[cpu]);
 
 	kfree(opp_tables);
 
-- 
2.31.1.272.g89b43f80a514


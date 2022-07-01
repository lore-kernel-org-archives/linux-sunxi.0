Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A756310E9
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Jul 2022 08:21:04 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d5so1683053plo.12
        for <linux-sunxi@lists.linux.dev>; Fri, 01 Jul 2022 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UP0yoNhFLIHXiHpKMoJOvGvXM3qtPgVsBeDYDxFaexg=;
        b=qqFUbB4lPwvbdMFxiQhId3PlyWslWgqsVhgJF1Bry2po60wBJ5SBPQVqo0Efv5yhwX
         EouPmk6sI8onPh1qSQa0sspYochs4rfrmIwTSZfgcS/kud3GriovNPYKQ4kxBGLzPqkY
         0mgFYO8PU8nd0RfJTa4Yyhd/lMBpJswGvBwoqT0LZbZmi2Mx8KyBw94j3834LusE68UQ
         lHNHmyn3ROVMfXLfS1VUiN5GkyacbAifavQnqeCnYU6FFrgyUiL+ObpmOlzPPvlk00Ub
         ixm3g8LFPtUiOah0AW2j4fkTGCApWETRqm4Y2SyKR0PvBIJlrh7C7BpT4jM2dgsq+h0D
         nt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UP0yoNhFLIHXiHpKMoJOvGvXM3qtPgVsBeDYDxFaexg=;
        b=zIiV8clnsCwwpA0aUtlEdWpXuSkY3M4NX4rvQtlBC96f9p4PSUqYITTJZ+3tuWia5W
         LyXxyduye+uj90Y4qbKXpaKUvfb7PqeRYulQ5+KcJsktVeqHOpnGnbGJh/m7fA2cBUmo
         MS9Q8tPm8x68Rykey4SJ1lSKEmHSb+t0QGcQ/XK0HzS3ZdWgRdGBkGhtNbPfCsjxqoNX
         XKUFnIF7Y/8vdmKnmqijamBUK1zMKu+Cz0xnXK1ToPLijXfhFE0tDR7MVXlTpII30nBj
         0MbS9nkV5TN7Ar4YHiyzOkwQPzKzg7G6xgFp1EHS7uYSh0lhZvTKLBPBIhviNACfFPb8
         MiOQ==
X-Gm-Message-State: AJIora8JR34tuGHWBND7ZU+CuQagwpXXjIL5sZ6NKOfL77E16nK0cAcX
	PhZHEtzNnQGSzWfcuxnOi6dbgw==
X-Google-Smtp-Source: AGRyM1td7OiTDDJKC5UOCJKA2KSSdhXte5R0MVbBPWtzUOmmETfHP5pTi96toOOFE2DuqbeHR+O24A==
X-Received: by 2002:a17:90b:1e47:b0:1ed:2723:981a with SMTP id pi7-20020a17090b1e4700b001ed2723981amr17170127pjb.144.1656663664161;
        Fri, 01 Jul 2022 01:21:04 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001624cd63bbbsm14841818plw.133.2022.07.01.01.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 01:21:03 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 07/30] cpufreq: sun50i: Migrate to dev_pm_opp_set_config()
Date: Fri,  1 Jul 2022 13:50:02 +0530
Message-Id: <195383ea6386102e430140f14d349769f6893fd6.1656660185.git.viresh.kumar@linaro.org>
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
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 36 +++++++++++++-------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 75e1bf3a08f7..afb1a11f781c 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -86,26 +86,29 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
 
 static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
 {
-	struct opp_table **opp_tables;
+	int *opp_tokens;
 	char name[MAX_NAME_LEN];
 	unsigned int cpu;
 	u32 speed = 0;
 	int ret;
 
-	opp_tables = kcalloc(num_possible_cpus(), sizeof(*opp_tables),
+	opp_tokens = kcalloc(num_possible_cpus(), sizeof(*opp_tokens),
 			     GFP_KERNEL);
-	if (!opp_tables)
+	if (!opp_tokens)
 		return -ENOMEM;
 
 	ret = sun50i_cpufreq_get_efuse(&speed);
 	if (ret) {
-		kfree(opp_tables);
+		kfree(opp_tokens);
 		return ret;
 	}
 
 	snprintf(name, MAX_NAME_LEN, "speed%d", speed);
 
 	for_each_possible_cpu(cpu) {
+		struct dev_pm_opp_config config = {
+			.prop_name = name,
+		};
 		struct device *cpu_dev = get_cpu_device(cpu);
 
 		if (!cpu_dev) {
@@ -113,10 +116,10 @@ static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
 			goto free_opp;
 		}
 
-		opp_tables[cpu] = dev_pm_opp_set_prop_name(cpu_dev, name);
-		if (IS_ERR(opp_tables[cpu])) {
-			ret = PTR_ERR(opp_tables[cpu]);
-			pr_err("Failed to set prop name\n");
+		opp_tokens[cpu] = dev_pm_opp_set_config(cpu_dev, &config);
+		if (opp_tokens[cpu] < 0) {
+			ret = opp_tokens[cpu];
+			pr_err("Failed to set OPP config\n");
 			goto free_opp;
 		}
 	}
@@ -124,7 +127,7 @@ static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
 	cpufreq_dt_pdev = platform_device_register_simple("cpufreq-dt", -1,
 							  NULL, 0);
 	if (!IS_ERR(cpufreq_dt_pdev)) {
-		platform_set_drvdata(pdev, opp_tables);
+		platform_set_drvdata(pdev, opp_tokens);
 		return 0;
 	}
 
@@ -132,27 +135,24 @@ static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
 	pr_err("Failed to register platform device\n");
 
 free_opp:
-	for_each_possible_cpu(cpu) {
-		if (IS_ERR_OR_NULL(opp_tables[cpu]))
-			break;
-		dev_pm_opp_put_prop_name(opp_tables[cpu]);
-	}
-	kfree(opp_tables);
+	for_each_possible_cpu(cpu)
+		dev_pm_opp_clear_config(opp_tokens[cpu]);
+	kfree(opp_tokens);
 
 	return ret;
 }
 
 static int sun50i_cpufreq_nvmem_remove(struct platform_device *pdev)
 {
-	struct opp_table **opp_tables = platform_get_drvdata(pdev);
+	int *opp_tokens = platform_get_drvdata(pdev);
 	unsigned int cpu;
 
 	platform_device_unregister(cpufreq_dt_pdev);
 
 	for_each_possible_cpu(cpu)
-		dev_pm_opp_put_prop_name(opp_tables[cpu]);
+		dev_pm_opp_clear_config(opp_tokens[cpu]);
 
-	kfree(opp_tables);
+	kfree(opp_tokens);
 
 	return 0;
 }
-- 
2.31.1.272.g89b43f80a514


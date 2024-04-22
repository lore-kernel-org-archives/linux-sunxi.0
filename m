Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634D2F37
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 03:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713756684; cv=none; b=j6CGIKitnhgWrkLgnoTaW8A51Ds8pvAhRmF1kbv4zG6m0YWpLdTloPsCq13/iWw69Ql8F8M43VVUROtLig90TwMSD56tiNZenJp+l6Jgf87N6qOn1XzxO4n6ynckZ0epAxU8OaB7TY8YP61lpjtkCtPYAli245/Hyiu78oPLJBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713756684; c=relaxed/simple;
	bh=WgJQBh8J1Waa7dt3AUnqHF0bETc6Ofj/zz3UpXYRizY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZAFBrIvAeF9ATegh9wHApCz0OvTaicx32oSmSwlQXjSNLzPcJ3swwEz1ty9mi3L7igjPflIGsOcxKjXskRBUWLp1XVLWY3zZS4lBOvtsG30X7Q22oY+vHNk/m7p/OwH2gw8OjIuhw5f/JbYq4CHH4slrJNGvMWpNYVzLIqhgkUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQImkkAH; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQImkkAH"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e86d56b3bcso20771865ad.1
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 20:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713756681; x=1714361481; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Li3+1Ghj2slvXiv+/E7e/F9kDJtZLuXuC3BIKi+jfUc=;
        b=RQImkkAHcv97qbxbyxy6qPqsmjd7xU/XGRrqcgYhqQvmlxbcQdKqWPzSQt7i8sLyB9
         fgm6+U4EEBZBWX5oyp0kzkmkGyWx10C/0Q3lEwMHXqUMOIDfI7nKA3adGq7a1lqe2jAa
         97uwXHBpdTKvVRJadPapTrdrPzCP+rrHMkf4ErVHoZ30qjHsxeAS7yOYLNT4vL3939Wy
         NAOzdCv07wii9U6hZpfLx1zVcH8h3b33Qk5cU4o1kjGxl2cFr08RxgqKrX9p1jJ6zUKE
         hU/19BalXnO0zsCEagGjvvq5PmpCLMxY2zdWn8GCGiWvx/cwx32hyOD/bJQQsV6QITZG
         IrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713756681; x=1714361481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Li3+1Ghj2slvXiv+/E7e/F9kDJtZLuXuC3BIKi+jfUc=;
        b=SAzKg1VLcYO7eskb1iD5ie72o1GiOaxYKQQT7vBmrvzY4neY9qUbZKt97eq9l56iRM
         z8oyl8MjrJj3Yn5AEpFwdzKXe818CPivvETJD+YOFCHd9A5MffN8zJAfM+ALTzzuVXVi
         4qqL3UJqI9Ygdlp4asP+q/5IAB3ZIdeHIgcf/j1myIHzlDA5neJg85QUwA09PEaNwU/o
         jAdlQ0Cz7OVfEelSLg35p9eIOGr6TKbuESRhgJJwIM4i8UNWxHtaY61xKO9rfkT2mH18
         ggvVYAAGZiy9ZtiQrM2clo++RIoFJGrNReLymgZEcLjPfGy8jj+/3SaDLMgI41tu08t4
         JEng==
X-Forwarded-Encrypted: i=1; AJvYcCX2h3wRU9V0UKbhfh7+cXfq4298JxQmx3wsBwQ1otCbODFrPKyihD9Tkl+4ngxWy4AHrjDbXH1/sK6cOtdx1+9XPEygsAVKAJsTrVI=
X-Gm-Message-State: AOJu0YxQbVu57NbBwFbwIu5sYh4Dsm9q8jzp/ifofImRGTeYl4cYHEWM
	LlyqB/erk9rsBaeAdp5LJ9F09kaJ8DYWAZSjExL9c6KLBIkHNN39KctgyXmhXhg=
X-Google-Smtp-Source: AGHT+IEGPELzo18c9HmsXyfk6vYoiNKnZbbOrQi5Dlekvq6DhkR5uumMN7p3RYSBJx4+oqieaxGcdQ==
X-Received: by 2002:a17:903:244b:b0:1e5:5041:b18a with SMTP id l11-20020a170903244b00b001e55041b18amr11845236pls.40.1713756680930;
        Sun, 21 Apr 2024 20:31:20 -0700 (PDT)
Received: from localhost ([122.172.87.52])
        by smtp.gmail.com with ESMTPSA id w5-20020a1709029a8500b001e435350a7bsm6981020plp.259.2024.04.21.20.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 20:31:20 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: sun50i: Fix build warning around snprint()
Date: Mon, 22 Apr 2024 09:01:09 +0530
Message-Id: <285de20a187f3e4baeb28f639b5bf55e914a3821.1713756666.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sun50i driver generates a warning with W=1:

warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]

Fix it by allocating a big enough array to print an integer.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404191715.LDwMm2gP-lkp@intel.com/
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 30e5c337611c..cd50cea16a87 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -19,8 +19,6 @@
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 
-#define MAX_NAME_LEN	7
-
 #define NVMEM_MASK	0x7
 #define NVMEM_SHIFT	5
 
@@ -208,7 +206,7 @@ static int sun50i_cpufreq_get_efuse(void)
 static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
 {
 	int *opp_tokens;
-	char name[MAX_NAME_LEN];
+	char name[] = "speedXXXXXXXXXXX"; /* Integers can take 11 chars max */
 	unsigned int cpu, supported_hw;
 	struct dev_pm_opp_config config = {};
 	int speed;
@@ -235,7 +233,7 @@ static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
 		config.supported_hw_count = 1;
 	}
 
-	snprintf(name, MAX_NAME_LEN, "speed%d", speed);
+	snprintf(name, sizeof(name), "speed%d", speed);
 	config.prop_name = name;
 
 	for_each_possible_cpu(cpu) {
-- 
2.31.1.272.g89b43f80a514


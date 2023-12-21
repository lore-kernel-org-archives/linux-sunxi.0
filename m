Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FCC51039
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Dec 2023 10:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzY7hTBZ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a23566e91d5so71893766b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Dec 2023 02:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703153442; x=1703758242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QMQp28PVkuOsPBKyVgYS5Ymf4YAkrOuT5kryWvtFrk=;
        b=BzY7hTBZ7lHJx1ByRkVCUIF0rAB44U1HHeujUAAGNEPbQchcrNdUf4B8vAFvpz1IbT
         LUGcmDsHbid8kk3NPHWAnK5NrQ3L+jAyHachb2hFOZokM3VZo3Aeuhf3zdDsL6W0ZwS3
         sdd/prNKjfKTngGNzeZzGqiokiDcwKxWMzRAUp2Ppqe1YcpmZ0Vn5rAHrcX606T3mGwC
         /RWms7vcDjImE35A7BWzI3ubEHealXOlafLQSfZGvJQ3DpJGe7BnBFvAsZ+GM3vySKUm
         JBpOLAp98Y7j8CtCXu+OQyz76X38eMEY7COpACNIDPc9Se5yMP8dHbuahzBMrGVAThuy
         59ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153442; x=1703758242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QMQp28PVkuOsPBKyVgYS5Ymf4YAkrOuT5kryWvtFrk=;
        b=Ifk/uSJYVQG3rbpE6oCmBDbfhBSmmNq23zt++Cug9RhHqljasALxTnjqb0h+qD/TvH
         3lcW+vsI0zUC15dEWGZAzUfJsF0e2MS5rlD/DdOcv7kLn13SGcD62LvkJE4QuVEdQiFG
         IvwNIOwTVEoBrVck4rOMf4o1sw12y1PRLfSA6qtcLmHS/skRnxclwZkfSJFxSzy6aw4Z
         xffefOA8a/9l+/+zZF4IDqxbEEPBL22XfQi8Z6GvNRKjiyfRmsYFcmD+0arnu1p5XNNE
         GUL5gyAt61IF0pQHaX9tNHfYAqLvCoCUmhQIQxBLd55wT9zL9v6NR+1fxP4udxEpnLSh
         v+Fw==
X-Gm-Message-State: AOJu0YyRSp5rSAeh/13GBJrjsm6upF92vnYsrref3swhtEyCRBquptEi
	fF2yMk7PbrsIIFJ7TsOURtE=
X-Google-Smtp-Source: AGHT+IGXjrE90/2KzHJgTFiU2ndSeAIZdngOEf0GUcN28R/bVeQcO0PAgHNRNaNMWci22btJbMGnsQ==
X-Received: by 2002:a17:906:5306:b0:a26:9fa0:5b4b with SMTP id h6-20020a170906530600b00a269fa05b4bmr363273ejo.226.1703153442340;
        Thu, 21 Dec 2023 02:10:42 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.204])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906b08700b00a25f5dba09dsm784928ejy.145.2023.12.21.02.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 02:10:41 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH v2 1/3] cpufreq: sun50i: Refactor speed bin decoding
Date: Thu, 21 Dec 2023 11:10:11 +0100
Message-Id: <20231221101013.67204-2-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231221101013.67204-1-fusibrandon13@gmail.com>
References: <20231221101013.67204-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make converting the speed bin value into a speed grade generic
and determined by a platform specific callback.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 55 ++++++++++++++++++--------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 32a9c88f8..fc509fc49 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -25,6 +25,38 @@
 
 static struct platform_device *cpufreq_dt_pdev, *sun50i_cpufreq_pdev;
 
+struct sunxi_cpufreq_data {
+	u32 (*efuse_xlate)(u32 *speedbin, size_t len);
+};
+
+static u32 sun50i_efuse_xlate(u32 *speedbin, size_t len)
+{
+	u32 efuse_value = 0;
+
+	efuse_value = (*speedbin >> NVMEM_SHIFT) & NVMEM_MASK;
+
+	/*
+	* We treat unexpected efuse values as if the SoC was from
+	* the slowest bin. Expected efuse values are 1-3, slowest
+	* to fastest.
+	*/
+	if (efuse_value >= 1 && efuse_value <= 3)
+		return efuse_value - 1;
+	else
+		return 0;
+}
+
+struct sunxi_cpufreq_data sun50i_cpufreq_data = {
+	.efuse_xlate = sun50i_efuse_xlate,
+};
+
+static const struct of_device_id cpu_opp_match_list[] = {
+	{ .compatible = "allwinner,sun50i-h6-operating-points",
+	  .data = &sun50i_cpufreq_data,
+	},
+	{}
+};
+
 /**
  * sun50i_cpufreq_get_efuse() - Determine speed grade from efuse value
  * @versions: Set to the value parsed from efuse
@@ -36,9 +68,10 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
 	struct nvmem_cell *speedbin_nvmem;
 	struct device_node *np;
 	struct device *cpu_dev;
-	u32 *speedbin, efuse_value;
+	const struct of_device_id *match;
+	const struct sunxi_cpufreq_data *opp_data;
+	u32 *speedbin;
 	size_t len;
-	int ret;
 
 	cpu_dev = get_cpu_device(0);
 	if (!cpu_dev)
@@ -48,12 +81,12 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
 	if (!np)
 		return -ENOENT;
 
-	ret = of_device_is_compatible(np,
-				      "allwinner,sun50i-h6-operating-points");
-	if (!ret) {
+	match = of_match_node(cpu_opp_match_list, np);
+	if (!match) {
 		of_node_put(np);
 		return -ENOENT;
 	}
+	opp_data = match->data;
 
 	speedbin_nvmem = of_nvmem_cell_get(np, NULL);
 	of_node_put(np);
@@ -66,17 +99,7 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
 	if (IS_ERR(speedbin))
 		return PTR_ERR(speedbin);
 
-	efuse_value = (*speedbin >> NVMEM_SHIFT) & NVMEM_MASK;
-
-	/*
-	 * We treat unexpected efuse values as if the SoC was from
-	 * the slowest bin. Expected efuse values are 1-3, slowest
-	 * to fastest.
-	 */
-	if (efuse_value >= 1 && efuse_value <= 3)
-		*versions = efuse_value - 1;
-	else
-		*versions = 0;
+	*versions = opp_data->efuse_xlate(speedbin, len);
 
 	kfree(speedbin);
 	return 0;
-- 
2.30.2


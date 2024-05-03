Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8110915821F
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 17:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714758763; cv=none; b=tYfrcGDlmdfTRR7SX+xmP1JmkfCv9RAlhA3WUg11Zd9cWZ4FwLPmxMCorv8MICFn5Qjl6w31ygL2Ic/oKz/YjbPZPJuTrE7tPrDLi3hMhRbCUOK9E0neRfRBh9Asc1qVR0KBSuwU9fduDkSMopFg5zfMXTbDVCJ4h/kACA3Bklw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714758763; c=relaxed/simple;
	bh=lzVnrSjci3YdZbJDcigjVDnutqYD0vEbfrujcq5AHHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kx6rgwmJDiz1z7RcsAdiTZLNOOY2vlw52ChjQ1R64gapawoNZS9Cctckp0WGy6RGtbDzpp119WXmcqEl7LNFjK8y+R0ld03VVkcBYjSp5LzZrZVN14jIzkZ8ml5c37wUL2S91/uI4te3xzENHr4o+Y6CMNyiW9JX5C/o9bRRwG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDVKb8D8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDVKb8D8"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a597c192246so182776366b.0
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714758760; x=1715363560; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDa0e4iujX0ACKE4cFSjYtiiXZ+21EvsOzvNajBTvcI=;
        b=gDVKb8D8u7QA/Cg5f6Z0nBIRjLFPlODKbFk+VehBaKoxc87ix+Ac3E8KLHlXk1zq8P
         JyObncmbggsMRBQYZWyU+c2CZeggY9OCWo4ZkZqN0UqDR9J1rmvAypGdb6AnA765UYXb
         HQ7RKdEmOvv/vbc79SA/JofnXTwtKvfSXqAbn70JbBusrKbO1GXkW5qHPjwsEN2imIeh
         ceAiwu9t+RXtJLDsTe1W4Q6wXEa/4LATfhGZ5X7k4hiH+HLCmySC6sSvjHahJf4ja9d0
         3Zo90rkFD/UxQWqdZGZIdFB7d4fQ9qY6DGHLvgLtPl+s2ewA362/e3fIFLU/oklQc376
         +AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714758760; x=1715363560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDa0e4iujX0ACKE4cFSjYtiiXZ+21EvsOzvNajBTvcI=;
        b=vjYOS4XlfhGc0wJsCRk1m9otNrHqoEommypVikxf8NHAmnawX2oR0YJGzpCfzEiLS9
         q0wHWj+5Eka27MDMLCgvy7wtVEPA7S0GhELcc3Vfe0A9Oxci7PpDTCDlHcv2nk7ae1xM
         a55uwE5whXM4lRqn6sDF+Z2FnPFO+og0rZ1GJCuMsIPAQAH1ArDFpiC+/h3Is+5c2lEp
         9BhCXGfpPNiNCYRWlN9CyrnU5WVQ5u7XYbIgQQTRIQN04h6Zahy2sY5U1ub4ucIUHwxW
         nZRg+5hOAligP8NH0z8cRqdkzVaIQhGeI/OekrvG2mWmJF2wY1MvhlUl7IesW1UQ0784
         cRRw==
X-Forwarded-Encrypted: i=1; AJvYcCWJo3hVsljwlBDpkf8FiW0HubBLc4YGp8G+qYdnv6JyEBx12AvnJfYx8C0voY+C2UPa6BFsLi4BhVk5O97UD5OY0y6y/pqr4goakNY=
X-Gm-Message-State: AOJu0Ywl18A/ZIQ7Fx6D8olcX36mcRuENIc/CYAqhH2XStqHwRHbkZDe
	w4SiOAe+BqQnAM2xX8pL2Gh9BT0FvqFU66YISNEYy9Wpnbl5vn0Z
X-Google-Smtp-Source: AGHT+IFONK2j7f1Ty9XVR60wDESk+CJEsa1zFEF6TM1ALYU3+/t6lQ5A3HkIW/azPODD5tAnbepFfw==
X-Received: by 2002:a50:9549:0:b0:572:3483:8a27 with SMTP id v9-20020a509549000000b0057234838a27mr2688603eda.33.1714758759958;
        Fri, 03 May 2024 10:52:39 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-47.cable.dynamic.surfer.at. [84.115.213.47])
        by smtp.gmail.com with ESMTPSA id q28-20020a50aa9c000000b00572469a7948sm1968368edc.45.2024.05.03.10.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 10:52:39 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 03 May 2024 19:52:33 +0200
Subject: [PATCH 2/2] cpufreq: sun50i: replace of_node_put() with automatic
 cleanup handler
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-sun50i-cpufreq-nvmem-cleanup-v1-2-0a2352cac46b@gmail.com>
References: <20240503-sun50i-cpufreq-nvmem-cleanup-v1-0-0a2352cac46b@gmail.com>
In-Reply-To: <20240503-sun50i-cpufreq-nvmem-cleanup-v1-0-0a2352cac46b@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714758755; l=2545;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=lzVnrSjci3YdZbJDcigjVDnutqYD0vEbfrujcq5AHHs=;
 b=EOd+5S8zrky1F+pf72NRCJOPHcqlppmlIu7H4SxMTuZa8DO0mns86VbChhQoq1UQhqm1esOuH
 iDf9qDV2t7qDx8DC46feRuLOrY1zGZIHAzv0ufxTYPAlC0XNm2P0FzB
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Make use of the __free() cleanup handler to automatically free nodes
when they get out of scope.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index ef83e4bf2639..eb47c193269c 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -131,14 +131,14 @@ static const struct of_device_id cpu_opp_match_list[] = {
 static bool dt_has_supported_hw(void)
 {
 	bool has_opp_supported_hw = false;
-	struct device_node *np;
 	struct device *cpu_dev;
 
 	cpu_dev = get_cpu_device(0);
 	if (!cpu_dev)
 		return false;
 
-	np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
+	struct device_node *np __free(device_node) =
+		dev_pm_opp_of_get_opp_desc_node(cpu_dev);
 	if (!np)
 		return false;
 
@@ -149,8 +149,6 @@ static bool dt_has_supported_hw(void)
 		}
 	}
 
-	of_node_put(np);
-
 	return has_opp_supported_hw;
 }
 
@@ -165,7 +163,6 @@ static int sun50i_cpufreq_get_efuse(void)
 	const struct sunxi_cpufreq_data *opp_data;
 	struct nvmem_cell *speedbin_nvmem;
 	const struct of_device_id *match;
-	struct device_node *np;
 	struct device *cpu_dev;
 	u32 *speedbin;
 	int ret;
@@ -174,19 +171,18 @@ static int sun50i_cpufreq_get_efuse(void)
 	if (!cpu_dev)
 		return -ENODEV;
 
-	np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
+	struct device_node *np __free(device_node) =
+		dev_pm_opp_of_get_opp_desc_node(cpu_dev);
 	if (!np)
 		return -ENOENT;
 
 	match = of_match_node(cpu_opp_match_list, np);
-	if (!match) {
-		of_node_put(np);
+	if (!match)
 		return -ENOENT;
-	}
+
 	opp_data = match->data;
 
 	speedbin_nvmem = of_nvmem_cell_get(np, NULL);
-	of_node_put(np);
 	if (IS_ERR(speedbin_nvmem))
 		return dev_err_probe(cpu_dev, PTR_ERR(speedbin_nvmem),
 				     "Could not get nvmem cell\n");
@@ -301,14 +297,9 @@ MODULE_DEVICE_TABLE(of, sun50i_cpufreq_match_list);
 
 static const struct of_device_id *sun50i_cpufreq_match_node(void)
 {
-	const struct of_device_id *match;
-	struct device_node *np;
-
-	np = of_find_node_by_path("/");
-	match = of_match_node(sun50i_cpufreq_match_list, np);
-	of_node_put(np);
+	struct device_node *np __free(device_node) = of_find_node_by_path("/");
 
-	return match;
+	return of_match_node(sun50i_cpufreq_match_list, np);
 }
 
 /*

-- 
2.40.1


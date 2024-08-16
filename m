Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4959E149E1B
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794057; cv=none; b=AFM1MT275INmpTOOTxHDIEh69/jNrnJWdi2UiWjS00uhRaeRyzOxIEs96msjMJVnV4vmrGRqdKcN+g94vPDstCVOEIX23beL8nL2G/8yU2A1bIkMwjGWnx9hgVpGpsFF1bdfYtYgWvuY0jENrnPI8N+l0uE6D8FCmLUhlj8nkoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794057; c=relaxed/simple;
	bh=PbJeEGZU3UpmozZSCe3r0DvMlYlbAp7Fh7CGsGwwTnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxLw8MeyVfwAj3Th8/akwpOkqigRdFwEia1GxyAxEBoUyi75ZICBkjT5LtxSlLCcfsDJtHm61COBe1M7NUR/XO65lsdttwG2rZupVDhdmJ4L4/SiVrKCKtw3BFNfO7uNqInIbCn+nTsxy0Wqjeb2LBgda7bf2QvW+Hhr0p82E+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oYw4O1IK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oYw4O1IK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-428101fa30aso12022805e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 00:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723794053; x=1724398853; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wMpDkMtET/7aAM65Zz2/Kcs6PKgOPihE5IRKM0OVVc=;
        b=oYw4O1IKagkdaTKkS5RCbI/SicHa2SZGjzHc/o5NUJRYMe8KuZWZ0YCcUBpx2rxYJJ
         Z44PXtXxOQYf/A/OTWURy2NQ8wJYrOSw3UMhgvldMyqYDrdCkkCotHTWWG7xI8Ykz2H0
         7pQKXeYzOz3N505wtHqUh5EBtNAwSPYsm2DLA6PInyS5ESqa1cL2K/v8gZvaT7VUJrtl
         3V3EKxtM5MoOU2RjuDNEk2Oc4+eYaebSSK7Znkzu/lhBjQzH3EDCYiPSeqqA7LSOp06v
         cZDGIpH5zu+Ic/iOgeWZkTJ0nPLGj1d+OLcVDnGMqPRaydsGidfTegrGTflTGi8uyLjZ
         tZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794053; x=1724398853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wMpDkMtET/7aAM65Zz2/Kcs6PKgOPihE5IRKM0OVVc=;
        b=tyz/PdLLSDGzIbObl6OArqIc8mxb1Msj51ug2ibhrqrzpE6rXnfiL1+FWC6RvUr2Jv
         PKqak9rgVOyirtcS7Bq0+hypFa+hqVXIwA4JRlLyScdIHKWLU78E+CrgCv/aHrY5YrZd
         3sPk27P6BGp9E83ZldD+SCj/WFWGLFFB/MOK7DNiDAzU86x0eXQlZ/ahHLlzjItHLTgA
         lE/ti+Slk05xcAf3KJUxTDCpI0zsj8r/dmib/P0tLcSiWL24TpE6SbSWbc5lqzPXbRtW
         7dhgvGLOM58W1g36Szz+fdoDsWBIBHAKuQkNAg59K9ddSbwgsgS6JJ+zmDKRSL/hB7XV
         k2cA==
X-Forwarded-Encrypted: i=1; AJvYcCV+XmoJm2Tf3lTtJtevGDX8EvzWKeqc2ntOoNUkj31/lUkBts2aMGloVPZhqyI3nUkx7lMrs/86hLqmBahbbTVNYziZ0liL3aa2yVA=
X-Gm-Message-State: AOJu0Yx3dowVHKrOOqqKp5bzCmAbiUizzk7faXN69K6NkuqEbNVam/7L
	66i6DtNgnd3hXYRSvY6d6YToTba0mU57CtJ+jyaY0wv05xUGRgQg4Xl6keq8zwo=
X-Google-Smtp-Source: AGHT+IEnXbQO9mmtyvuxjzYjdXQUi2maQz0qIi0DaT7l9WqGJwLWdeuDft0i/qsT1e/F2DXQfswARQ==
X-Received: by 2002:a05:600c:4f48:b0:426:5b84:86d2 with SMTP id 5b1f17b1804b1-429ed7b9391mr16384705e9.20.1723794053471;
        Fri, 16 Aug 2024 00:40:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3596esm68549625e9.22.2024.08.16.00.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:40:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 09:40:35 +0200
Subject: [PATCH v2 5/7] thermal: qcom-spmi-adc-tm5: Simplify with scoped
 for each OF child loop
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-b4-cleanup-h-of-node-put-thermal-v2-5-cee9fc490478@linaro.org>
References: <20240816-b4-cleanup-h-of-node-put-thermal-v2-0-cee9fc490478@linaro.org>
In-Reply-To: <20240816-b4-cleanup-h-of-node-put-thermal-v2-0-cee9fc490478@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PbJeEGZU3UpmozZSCe3r0DvMlYlbAp7Fh7CGsGwwTnk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvwJ4R960iiX78E9nbSk6rU3XcRyumrrr+WNwm
 b9uWv5JL4uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8CeAAKCRDBN2bmhouD
 117ID/9EACqKFcFO6/LOiwiOQBgFhDpNJAh5abY1rYNUwH6civPjvKo7M1pZANYtvFOAb1NcY+K
 L0XUBZ1qUwcnHA4TEelwGC0qKPEU2delRJzqiitq/NS84JtEIZN3EXedyZAEvaGMr8kY5sAQ2Lj
 ezGPzEZRdSmWeBFbR3R6HgVKuZTmLfXO8g3yCatnh1PQyomIywfLrFk60IFFqiIS2cafdrsv8Wm
 qSUw2PK2e0cM/4dc4HptXcs+fr/zCC+sSICFfCKZ5LWia8XVwXxopYBK3NHbpD2ndfaFJRamXhA
 cLqeLQXVXxmTSt4sy2bEMQb/SJRE8Adi6sNdoxQoB2xxCWpRTYRgQmkHmu4qZvfsy5b2DoUg4WA
 qiWVWtqt8Cfn8i/UHVqlJ7+idqLMCACVEw/6v3LxwJQ0nrQ93wmRHqwiR5QmK/8ndrgBnNPjb5b
 3JsQaU8mlC1O/ZHGA34DuII/fv+D8b4cHHSP0IMAR6m6JqIMCmnlNWNWSrxgF31Lgk+D5z8rpYM
 auRMmfihug05VxVXVoYJ27RBVuRpmN+Rkrp2rvAXYHuddV0DmEL06/ZlF0psI/X7TgNCjWbjPeX
 bBpNobaS18uO01FwmZbRdjVzYV6G40GYDQT1rbs32LG/aL36N8DPRrkSTdgySwNFEsu5VprtL7J
 +fC+fPiASEAIR0g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index 7c9f4023babc..19cdb98c310e 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -938,7 +938,6 @@ static const struct adc_tm5_data adc_tm5_gen2_data_pmic = {
 static int adc_tm5_get_dt_data(struct adc_tm5_chip *adc_tm, struct device_node *node)
 {
 	struct adc_tm5_channel *channels;
-	struct device_node *child;
 	u32 value;
 	int ret;
 	struct device *dev = adc_tm->dev;
@@ -982,12 +981,10 @@ static int adc_tm5_get_dt_data(struct adc_tm5_chip *adc_tm, struct device_node *
 		adc_tm->avg_samples = VADC_DEF_AVG_SAMPLES;
 	}
 
-	for_each_available_child_of_node(node, child) {
+	for_each_available_child_of_node_scoped(node, child) {
 		ret = adc_tm5_get_dt_channel_data(adc_tm, channels, child);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 
 		channels++;
 	}

-- 
2.43.0


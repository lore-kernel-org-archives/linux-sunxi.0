Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CFA3587D3
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Nov 2025 19:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456117; cv=none; b=WWfV4SznRpnfQHKWrV44NDtBE7p4Pjr2dD7uxW5MOijNzDe/DeMjJSJ+hVDzMkaFym1Z188DS+4MSJbOR1YMFanxOpuVIvj2/E/BmG8vN/o1O89i266SqXjOZbubjtMjQyclOXUxGs+rZu7wzbuoONox7xTWp0DB+2WVEoQ46oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456117; c=relaxed/simple;
	bh=/yzRWwVIXgMTXi61dZTgBV9kK1Wc2gDXywBs5UcM6J8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSKxID37jm4lgrrcrFSCwFnRhaX3NorwBH9Ys7TlYXnBB8il9o4+q8Oa/Rie0LjC7G7XuSDnTORSKd8dF5LDapXaI/YBfJU2lLTQgJFEz5nBhdniWlBft5dqQwg6khNTkVNfF7cnTCUliYgF36QIL2aosJZZYEX6Kake/ZqArtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gk6PwGhM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gk6PwGhM"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b70b40e0284so15708166b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Nov 2025 11:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456114; x=1763060914; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muHNa/g+OI3fM/6qd0mUiU8Bz7ahY8JnmPu7Z+aL7Rc=;
        b=gk6PwGhMCzLFlDYQq2IobJm8PuE1SH1qVwNSs+aR1Gw2ipVxjq2oZow2VqmHSp5Yek
         cU5QXrBkQ7B5Tr7C6I06ytWENjljrlA243/BgyKmu+64dYw5605pFkE7RSgTIT173vM+
         /NZgalOsBXl10Sg1Ms/qnn3LBjMnIM4wVuHJvvHU9obAS6qvXXsJOqMzVPr6G9S+tCdZ
         Rt5zzPfZpr13+HcVLJCm7GZUQo+eeLuNm6TnqtLXUwJNsKwxKiPsE0d0hFuMliPdsH0L
         b45sKHWyzdNAagSu1rj40a5V9yAL/gACvK9ZOrg40qqHficIWf8GLA8Zl3/E3W73O2h8
         QDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456114; x=1763060914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=muHNa/g+OI3fM/6qd0mUiU8Bz7ahY8JnmPu7Z+aL7Rc=;
        b=CkrD5Hcwk1X0sD38Qh3VHCCdDsdCAkUPugGEoTYXqJDsuYzuHlxB8NnBbpCnbBPGb+
         CvhtkBw76X+s/HPgHy7xRFXxdfK0rSdyIG6GmhvXoHzT2TrBSTiKfZUFAh0rso8mJ8K3
         fMb3iDK/uMoFpc45Dp9Q+1bI/kEPf+YHNwREE/QNervx97WUeFAu3X8mZC/QAuMOIjjs
         JtDt8c4YyFNElcnPHTE9DKkrWsPC8zCUnLS9mwojfomsdMrzEMxpGcDhJV5TkhSO/0TG
         5HnyShca/xQvHm+GC7xeX9SPa7mmiQq2SrN0wWQEFmMQBf+MWrwjlT/dDrjET4wGo2Ya
         wSxw==
X-Forwarded-Encrypted: i=1; AJvYcCU9SezJ/mlYphYFz51+7HMp1MzqjpKk6EXLJRmugSe4T2zURA/dsEVP/xdpD21N1hzTaSzVXfhfB904jA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yze2IL8C4NeqlHOWgzhWuo9tRdGey1pmh9dlG9beeQXgVBZptUT
	/U+UnjqIBWei0bG779kEdVeO8KE+wL8yXF22hwn0yZayEhU3IwV7sec2UpOM49wzVLU=
X-Gm-Gg: ASbGncuiX23RFDPRw+L45ue+gIneW9tOjhBRW6SyiBVOLbcB17e/tjUHzKrMHV3ULfX
	iuVci1PEPYLPabS2XpcxqhIeIPt0BUzPvqvZtVWGqQ5zBW3zuhvqPF31hmkSuq2kc38R0+GTz9U
	hY48JfsStNBt0Y2iQN1AQpHDp7KEVZk6YWvCWvHG/7IYIeQfYuJQmB0ZL44/Gkv4zKP3Ca/zUaC
	0VFBnGPEbiH5arE8pqvnY2vmVTlGinGKunR5S6YXNKAL4B+OyWUv6v5bVt9PO1lK46/RijzImox
	H8Za29lEX9kZPNwlzQffsLHPzbn9au2L9unZVp74nDxg4yPpMnFqEAnZOPPKwUOEVG+cildea2k
	sI3SmU7qlpHrUrPgDJoLUyoF+Wwm4Cnk6j+xXk7lJQXWkIGOmf1QAcBRLPs3HTkKhrJLuFnifcj
	U5nidvHgufEiDosdpB
X-Google-Smtp-Source: AGHT+IE8YuEiK+Zfb/KePNrKoWBUDj6LEo4NOy/SwvD7jjkTn21cZNP/+8sVmFG2eqOfE4KV5Ochsw==
X-Received: by 2002:a17:907:9614:b0:b72:5375:12a1 with SMTP id a640c23a62f3a-b72c096b055mr19793166b.2.1762456113840;
        Thu, 06 Nov 2025 11:08:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:18 +0100
Subject: [PATCH 11/13] soc: qcom: Simplify with of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1467;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/yzRWwVIXgMTXi61dZTgBV9kK1Wc2gDXywBs5UcM6J8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPISQ5D0Sf9n1OrwLQgvE3GYjGuU2ct+njIDv
 jBQi2g+WJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEgAKCRDBN2bmhouD
 10suD/0Sda8mQq3Am4mP8/8RROtOsjW4BdT3uUIH6bBRs5zGPcOfOfa01RIWooqINqRTgM3kRP+
 GEfgH5VZhTAbhgaiMzxUTrbCR/3HjSKTBMCVQZzAVOqh6UN/p5eokZpmHXvtyEBU/MJqGzRlP+a
 6l+T2RkycuvLcNCNLtLgin+NLEeps3cQaf1kM3AuCl/cu0PqGRNRiKAIIb4HwqAI6M0YkSLYCy3
 E94u97SOssK1qs0tTOA2J5zNSWBhIp5u4CuuXLsPW4M2L5f4+jvVCexNmPlyoKvLjeKAmHwkaQa
 HP1E5+Ql7DAyDSKNKTkkRYybpAECIIOII6ib1t9BLrwGY2CyPBt8XiHkunFH1fm0aJx+pZaeNXR
 fpp1P67ni3gW5pIgRQh6ofX/QSEL/XnFNj7QD+I/DT8RtEHPUjuZBEsbk7YZYPDdvFfzWQGzSgN
 OOss/zZpWF8EUDYqKpYA+Cu0INYZbZzBGgSLOIBxGy3XBAQEQIQLgAOiysuOeojC7kyGsc/8TU+
 lzEcJiiv5X59CjJhJViLN2t1jZX4wryPr5HXwc0L7ZALSkxyV2kATV/hpoySJzLe10JBt8qHjU0
 eZx6SaG+f/clYYpS6dI1TegdwRpBvqsFfFFv9cmj5EJUuCUHDSqgehR6GEPctAsJowIa0LQBOns
 gTL09ogpzJ56Omg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 1bcbe69688d2..07198d44b559 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
 static struct qcom_pdm_data *qcom_pdm_start(void)
 {
 	const struct qcom_pdm_domain_data * const *domains;
-	const struct of_device_id *match;
 	struct qcom_pdm_data *data;
-	struct device_node *root;
 	int ret, i;
 
-	root = of_find_node_by_path("/");
-	if (!root)
-		return ERR_PTR(-ENODEV);
-
-	match = of_match_node(qcom_pdm_domains, root);
-	of_node_put(root);
-	if (!match) {
-		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	domains = match->data;
+	domains = of_machine_get_match_data(qcom_pdm_domains);
 	if (!domains) {
-		pr_debug("PDM: no domains\n");
+		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
 		return ERR_PTR(-ENODEV);
 	}
 

-- 
2.48.1


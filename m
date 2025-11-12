Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899253054F0
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Nov 2025 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943353; cv=none; b=anusyBSpKwLEa3acwCg/7N7RIqc/oxU85M1joLOfMSLavqOtNyElyyk7+r6oO5MSzs52MBpDqobwBgC75YIGhNmqh9CZyZFmvEPfnJmPUKrKEd9trwIyAiW5iEkCuTasUDOX9vmGg3Q/VzD4WQcEkGRYaaC8ukquEHR2V0OK1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943353; c=relaxed/simple;
	bh=oH6NNnU6YnXoMLAuucc3pTLRVuvHWITrx+nY03hzLxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHIIdHNLRe29jwo9O2hAeeaiCVpsqem6tl6h3nlxKmKeI8UvIQxaw7wPJgnihYV1VzOC27BIXnP4BXVQ3GK4JAdd3RN3NU3mOGmqGhB3Xl+LQJ4vNRyO6VeIsqc8+H2/McHa5c0v5MJbZQuRBj7FewOCrOVNn8TPSRwmvteziBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DywCFdO3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DywCFdO3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b30bf0feaso75656f8f.1
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Nov 2025 02:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943349; x=1763548149; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w45OgRvMf8Q8Havr8iuy1kijs8a2N48hste9FDQZ8ZI=;
        b=DywCFdO3AqLXTYtlL06Qmrkh79YqrGzxJSoaydw3kogJ1Ygqr7yFNgy87eZQT0UdLl
         Yripyeq1LYvCRnD1B3cQvz9i23wUGr2Q5q+l9zQ8pIp9ig5prdX/to1nrW5I1kScZM8N
         F7hBJ/Mlb7hVd/rmXdsET6P6X1BRRKQbwKiC6c4AkGQk4aUy9vtMOXdz80T0aeAN0fFi
         NmwA9KPr4miaKfnkdkrMHAvI5ncaTBN6iTjmcT6yUHP2NfH8FjkHJtk5bc87mCi6J8NZ
         OZ+U+Ozh6WF8FFOG0n0ibixO0KV51go/BeXSXKxxO31wfJODZ2zO5hAOKN+PG79ulYl2
         lTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943349; x=1763548149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w45OgRvMf8Q8Havr8iuy1kijs8a2N48hste9FDQZ8ZI=;
        b=aMxH9VyRuEsVBP9KupkbyNYQBujlBozCk64Bkpsg9NdgcsGps9gMpBaaJbyxFtGfxy
         zDPKaQZVLZ+dLN3XuSttWoPhfIM9eYlq8YSOKhoCGtzvpH6axKFx05wBGx42xbI2MizQ
         wEG2ygR0u5qGvAnnHpo66NUt+jGY0k1qkwUq07go4AD6yhsO0TGnCOO+hd9V5/r7Pkms
         +fMGA17tuydxMQc06kZnTYRrFjus25WP4YIfdB9VOENw/L5GCyoiD1E99eqeIv1xRwMI
         9/fPb4U5gLWl2fO467LC6KQSFk+QyMw763S/w1tURQ2h+gc1NqBVsQQtCeRW1MaciSOw
         0bhw==
X-Forwarded-Encrypted: i=1; AJvYcCWQi61ZC5xmA6lPMQuHP+c9eN4lD5tbOuaj6mQtevStjJnYoG1Yp8x8DsRvfdJHw8rA0/G5sQTrm3rWrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLCsacL9caEZvGS3Ot1hGBpWfHyRdnYTFD1skiDEg4O5/Wq+ZD
	4BcfjSdpneL210wkGQeYJGq/6DJzR0gym/u9K9HGwo9SVhA9vsNwNKAvCM6PDOiNiEM=
X-Gm-Gg: ASbGnctsyO5naiU0R1GreADhd8yq7uRGaqXqcV1JHtcRf35ZZu71K2KsSsuRsPiFu2C
	24wh6u0T7bAipTP+0r5XROhLiQtYsZc/JRHxMIagAKlLpfiVUMoHj0VHNngkAnHG0KVNW65asPG
	lCQ+llfAgqSCwLyGiPZ7CiaqQ6Q2Vgks0F02kxiSmA/U7Xzc+PZqIAAafsJxbYYq5bCFbHqLtVi
	3IBqTwYdFEJQCwHUmX0Uk4wsh8zDL0gQgsvZwOwlp/OSfI3M4xxGB6bRseZwDAv9x+sYWZGUA7h
	3v5RaZVmWpfF1qitWxjhWPkqfW39bWroq4w9F3O+3fCDx5nXqIBham0UPubM5zN+DLG4B2N6aBo
	jrppAmIWXJPEUpyjwdEBB5Q27uS9oShKlCLP55/IUuuWSnPWE2CaLuK0zaELvibYgdMEVyppBwf
	/FteL2YRJvnpZ7M0qx
X-Google-Smtp-Source: AGHT+IEBjmd4u1QNttKmz7L0aw18Am5hrtzSeYwW7S0ncXT+W3NewsEFilmNZtDfK1rOFBgpa6PWwQ==
X-Received: by 2002:a05:6000:230e:b0:42b:3746:3b83 with SMTP id ffacd0b85a97d-42b4bdb73bbmr1049815f8f.8.1762943348777;
        Wed, 12 Nov 2025 02:29:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:47 +0100
Subject: [PATCH v2 02/11] cpufreq: dt-platdev: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oH6NNnU6YnXoMLAuucc3pTLRVuvHWITrx+nY03hzLxM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFlkwl8YTtZY7iax+Pe/MvWCZAulDzXGghXx
 4BV76H7fmiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZQAKCRDBN2bmhouD
 1xlWD/9VRaAIX3FFAH/ubXfeuDcoGvwYZtXIVY1BLh4qOi4HRkmmln3Jfimzlkz5D5X3+i6NtqQ
 0f1HovNsLqCXe4SoP+d84VxH3XJu+thultJiBSzY5REZBzuYUgw1LNScrMkHOmmQahZUam9U8m2
 tCyfi56sN7E2oJhj58rR3eoCg74pzQq8+1SM45wM2bRKF+JbQA+8ihs1lJ9Dzczj+LWRa5CDrRa
 wVUXEGrbnOAGvs3H2excUOVIcfy1UbP0Q0cvYYj0mlnE//XJc0pocM+tmvS6/NzKmLY1J4cBK14
 1goulVQRxW2dKVVJY9uBnXHXdvRnIPxq/r69ExWCTNuDFZPNWMTTuiQieXZUyWzKobS/U6OP02Q
 /sgBkG6T1lP3+yOyJv4SQXw01BgisEb7o7hi1mJuUSCyfiv0qmTRJU2Iw0WsFReZuPkGbGJzyc0
 BU6tmYiAOsQCNkVb6tap5NvJpjR1Dlptumq88tHldU8JnTQaFLT7aa+GSFDDT6qgVc9z0TONc5n
 CmJnG0Dv6DUot/Tn+V8AMRr74MafVQRL0blRhvffhK2OKLVbekFSoqqV7WcDld8CYYvJcHQjs+Q
 xl7FL0e5VPU/BwYuJhfWXZWQMHkPp3koK8X4Tet2TtzqdIge9u2pMqOsi+SuEoCkUJUMQL/aFoV
 nfJyjKI/mqIUeyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with two new helpers: of_machine_get_match_data() and
of_machine_device_match().

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index dc11b62399ad..a1d11ecd1ac8 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -219,20 +219,13 @@ static bool __init cpu0_node_has_opp_v2_prop(void)
 
 static int __init cpufreq_dt_platdev_init(void)
 {
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-	const struct of_device_id *match;
-	const void *data = NULL;
+	const void *data;
 
-	if (!np)
-		return -ENODEV;
-
-	match = of_match_node(allowlist, np);
-	if (match) {
-		data = match->data;
+	data = of_machine_get_match_data(allowlist);
+	if (data)
 		goto create_pdev;
-	}
 
-	if (cpu0_node_has_opp_v2_prop() && !of_match_node(blocklist, np))
+	if (cpu0_node_has_opp_v2_prop() && !of_machine_device_match(blocklist))
 		goto create_pdev;
 
 	return -ENODEV;

-- 
2.48.1


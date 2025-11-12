Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A558C3101D4
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Nov 2025 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943368; cv=none; b=Hr933Cnrj85kDR1W2bPWRUHOganQr7Tnn5boZuRo8fLn42c96bef/nlvk5eJQuvB2TrnuoBXfdDt/23hRNBRzILd71sppNII8xGyyKIIBf4iX4Zq8h7yx28L8cZT3pCFmBLE1wbi2iDeHFTR0jF9T2JKdLULY/Hr9tYpcH2fdVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943368; c=relaxed/simple;
	bh=+aH+JurCwg0QlJViwe8zNd/4id1AZbIUdYoRKokeM0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y3wdTrCQs41yC0w3mFfmnyy2zZea/mjc5+TgwQ1ozm2wj2Las1AYromlfcfP3QNRMguVGJdlLpmFSlgv9QawnZr16o+MrgZGGVPFlmaP6Yw1wKUu6KPrapIO0ZO7sP8pS4K+JM9Sj6VecUcUqVKaHtXGa5/1aWhgRxUoxHYley8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EyXXBiFB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EyXXBiFB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b32c5f285so82470f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Nov 2025 02:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943365; x=1763548165; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voGjtCLXJQ103IvcxJUtlMcY692E9mTOAHZOEmcxLCA=;
        b=EyXXBiFBlIsHcnPB9fqTnFeo+7XL7cOkHJDTKxZXFFWiTKg3S0MIUt8r+v5QO8xdmx
         LC/4bINLsKMQtNK3VGHcjn9OLXIJ1MwM4C81FcHzFI3PG1pMS5UzraTzXYAi3FUb88ZJ
         ns2M9NUqxoNEYvFDBQbT1+wVVreEw810W5SYhzHfODhhxEMd+vAYlynY/ZuaLFLwuPwt
         h+KRa2Yz0pANoQnapM2C3duysap/iFO6QO+q1XKXZpPaMhDU3yQHWJc3yfbkx0JqjcT/
         A5uMHqRpK186x4Yr//L2ATcfnNRDoQ2GShtZsZByX1D8X7WvxfRPHH1Xzf/8sd8ECYU8
         i7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943365; x=1763548165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=voGjtCLXJQ103IvcxJUtlMcY692E9mTOAHZOEmcxLCA=;
        b=hpe/TBgvVA8CNljOZbAM5FV4sd/I1p8PaK4O6ZKkS/UCYyiur5DECUfOuuSRyLDN1/
         EScSuITB6oUMXF7PW+sD8KehD2C5VL1Vh85XfV7ABOF2toImIgpxcDIS/vPFgIVyOjMd
         srHuHRay9N75VP8V9IjUV163RRkr4T2s3WGzBeHY0ztGXPGhy8/X+F9rzQ8y7J61MtSw
         HP620rzzZBmwxY6o7InoA9GfelRA3XIlYOSUhuLpbZ79uqty1E/kXFFYCR+tklB4EeOH
         JG4eAsEDyqteeteYQdbMdrR6Av6JvGfnM5eydILKn1vo1Xp1c8jEZ8+5LxNhow3nagRT
         CQXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyAsmc1jgCY1krLi75cihdlkuppSoY5oZ+6KfCofBZCBMfjGVqxPwCtTGvJIsKJOtqJcOgvWRN1fj4Zw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/u5plO2BQ/QcsTYfnWC6hIsF+Z1GlSh5JyantJpR70ezt9YG/
	Y1a2Nfbi8ojdOXE/u5v0ZbChVb5rLdkVu/ZIiiPgBvCA1wsKItQaB0fu938iuf+BGkM=
X-Gm-Gg: ASbGncs1c4Uc6HnRhbNPkKH4VCkqHOvGL6rGjliAcgrmtKzsKzt0q7SGZnEOAqXSTho
	zf+gAyRrZv2s1YfxPaDYPQMaBWIFrf/uBa53By1K9g3Ae/xGl/rEibkNZD1HQTHgOR8n5bNxpjx
	q1LtwiaXYPSGend1dmFewvYZeYuEDd669r3zf6yFlvN/5d3YYVmVI7mG7YncExJQyfBsIs1NSXp
	peI6ZFnU59kPjRv+BHe7U+wDyOK5RkhGGjW/RamFB3K+MuXyWUH/WL6exqax6edjNftUqxW2HBp
	J4CohrXdbudaQYgnLi7cuBz/k8onHCQZxB0Tx4StvPx5uFXzcXeavAM1ybRIH5Ouuamt9kQltwT
	22tZyNvPA88P6rm7A5f8ZAmIuOnn1uwED3pB+MHdvnIwAbdsleZg/E7gep43y4KOq75blxYbIwY
	ETEhwvzoTZPZ2/3vQ3
X-Google-Smtp-Source: AGHT+IGdm5CgPHDdcAc01ZcCVfqMCxIri45JYHWGmyw1iVsO8bQLTxdHdmxO4vG4a/Zk9xWBzcJSig==
X-Received: by 2002:a05:6000:420b:b0:42b:2c53:3ab9 with SMTP id ffacd0b85a97d-42b4bb89ce1mr1221439f8f.1.1762943364882;
        Wed, 12 Nov 2025 02:29:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:55 +0100
Subject: [PATCH v2 10/11] soc: qcom: ubwc: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-10-d46b72003fd6@linaro.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+aH+JurCwg0QlJViwe8zNd/4id1AZbIUdYoRKokeM0w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFs5hxrLTLU2yKQNGY4c8zsgmqPTtepwFjYk
 DaDIUKpHwWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhbAAKCRDBN2bmhouD
 1wCUD/4lLlPUHzwHx+sGWsRshk6kAv1NQf0XHRhnBKVMQaVXbw8aURXRR5kkE+7+piRRXT/q8An
 wsfuNNAfLqFXoJP3e5gtl7+ArLGrCnVXIPqRYedNyt74/hPMEIzY/sjsGIQfVI7BuN7oUWrev/J
 pk7i/cSVy1Jlp0za6XuyxoENwsBLMVKaRCvzkIcJh3q7QFCqCVMruU/9l0YzfNhJZOsJI2/Dzgc
 6m7bF4aFG0x2brLPOVhCQl6DXf1GAxawfT41GlR6qbainZiyh+sLWTkzPRMupMeo6P2Nqo5eQlB
 Kbd8hcPYnB/UExqQHa+a7X3yJDerdWlO6OKrD/unm7/tDtcuOVGuUEbQYYemwI5WIjTx7Y9Xl9m
 4y6iEFYcQ73bh6B8AlwB66Svt7++YvJoZRHeocf4hDFh6Q51mlJgkQ+OuCCYWjXCyPV/uzTGOa7
 Cr071sdb4yOaS1C/Kyotz0wi/1XMyolAx1A7SY2rQ4On2JCL29izxAJTWbp1q0ma8BGOTIU2SkG
 EUdWLUq6kY6JFNBNTHNAfsxtnvGaU9VzubyzUIlLAhUo4sqlqfeDegWPNaHSHKyb4c3Wn3a7pqR
 Jzp/MnBwhbOZcNRVcDcpZmtwe6Q72j5G/UHpzADGZogyXJ7EfofT9FLwxzGInOO/vrPacyh3Row
 dmk/KsH4kqnWzJA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/soc/qcom/ubwc_config.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c09796163b0..1c25aaf55e52 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -301,21 +301,15 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 {
-	const struct of_device_id *match;
-	struct device_node *root;
+	const struct qcom_ubwc_cfg_data *data;
 
-	root = of_find_node_by_path("/");
-	if (!root)
-		return ERR_PTR(-ENODEV);
-
-	match = of_match_node(qcom_ubwc_configs, root);
-	of_node_put(root);
-	if (!match) {
+	data = of_machine_get_match_data(qcom_ubwc_configs);
+	if (!data) {
 		pr_err("Couldn't find UBWC config data for this platform!\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	return match->data;
+	return data;
 }
 EXPORT_SYMBOL_GPL(qcom_ubwc_config_get_data);
 

-- 
2.48.1


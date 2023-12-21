Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9654D5A8
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Dec 2023 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRahGzyP"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55435a07fd6so165231a12.2
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Dec 2023 02:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703153450; x=1703758250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GF5s6M+Wn1BIKkAOEW/8xBSTlKtmOm9F7gA3mT6ZChs=;
        b=KRahGzyPh8YPqWjKbaD8cBMdZ1Fjq+GISHfMNSBh1/tPcZOZ2FUHGff5Tt6y16rcFl
         LKYfGAbnuYnHLLo1iOFzNBP0kR77ntHbqa4MA6ORU4qTTtse1w1WKlbGAlyzwuGwgDor
         GYBecWoufE8IqzptdG6iiJGV54q5UfpYIQsKlZ4pLBBt93/8AEC8RYSEvD5izwCjVjlR
         e4Dd3q3wz8fyj/amo7RQBSQaQZTY7CHm+l6ZHrptlVvcEomsI0i//GA8Q1snjmkGb0vy
         KAqcNyVsjYagSuqbRZvOmXPjQg9Kdcu5zxOU64XjAXVrthvWqeugc4DK9nEMW2SVSBiM
         Lwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153450; x=1703758250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GF5s6M+Wn1BIKkAOEW/8xBSTlKtmOm9F7gA3mT6ZChs=;
        b=rLRYeRRW1m0g/Z+/o1KCNrHIrELdhB6U5m+4pgwU2S/t2TvFhRBsIXePsSxNJVcSxV
         lAkgJNYlUhR7Ez1Q9bcvZCm5mNLr0kTlHh9SDjyxbVbehGs+Ev6m5XROWxKocOVybcpa
         bMYZSgcwCU45wHlOdKLSovPiE7/dl6PqonifFhKDMmIVuH5P7AUkYAR4umpIP0WeHw25
         7GFrReME5JOWhHxwrII009MZl/jHHB10whli8UCn3FoaRzGsFiTcYfoGoWF5j76oJvka
         ncSg+3k6hlwn4ElMwUjheQ2oKMR89T+88B6Ys/xyI4rFXw7TKYxLMcT9bXXrUmNPnajC
         qInQ==
X-Gm-Message-State: AOJu0YyPB0pzX/o3qltkunueZXRlXgN8+XJATlBYXkkvnGrsrSYe4Wna
	dKrDlW/6dN+QAgpOduBbCNM=
X-Google-Smtp-Source: AGHT+IHL1Ma08mPb9cC1GlQdvGSlGcloQ/GpQp0NxOsffwhypNZRsAeFEGADJz/75DK6viyXViInjg==
X-Received: by 2002:a17:907:3f9f:b0:a26:a1a7:a67d with SMTP id hr31-20020a1709073f9f00b00a26a1a7a67dmr675031ejc.46.1703153450118;
        Thu, 21 Dec 2023 02:10:50 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.204])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906b08700b00a25f5dba09dsm784928ejy.145.2023.12.21.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 02:10:49 -0800 (PST)
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
Subject: [RFC PATCH v2 2/3] cpufreq: sun50i: Add support for D1's speed bin decoding
Date: Thu, 21 Dec 2023 11:10:12 +0100
Message-Id: <20231221101013.67204-3-fusibrandon13@gmail.com>
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

Adds support for decoding the efuse value read from D1 efuse speed
bins, and factors out equivalent code for sun50i.

The algorithm is gotten from

https://github.com/Tina-Linux/linux-5.4/blob/master/drivers/cpufreq/sun50i-cpufreq-nvmem.c#L293-L338

and maps an efuse value to either 0 or 1, with 1 meaning stable at
a lower supply voltage for the same clock frequency.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index fc509fc49..b1cb95308 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -29,6 +29,33 @@ struct sunxi_cpufreq_data {
 	u32 (*efuse_xlate)(u32 *speedbin, size_t len);
 };
 
+static u32 sun20i_efuse_xlate(u32 *speedbin, size_t len)
+{
+	u32 ret, efuse_value = 0;
+	int i;
+
+	for (i = 0; i < len; i++)
+		efuse_value |= ((u32)speedbin[i] << (i * 8));
+
+	switch (efuse_value) {
+	case 0x5e00:
+		/* QFN package */
+		ret = 0;
+		break;
+	case 0x5c00:
+	case 0x7400:
+		/* QFN package */
+		ret = 1;
+		break;
+	case 0x5000:
+	default:
+		/* BGA package */
+		ret = 0;
+	}
+
+	return ret;
+}
+
 static u32 sun50i_efuse_xlate(u32 *speedbin, size_t len)
 {
 	u32 efuse_value = 0;
@@ -46,6 +73,10 @@ static u32 sun50i_efuse_xlate(u32 *speedbin, size_t len)
 		return 0;
 }
 
+struct sunxi_cpufreq_data sun20i_cpufreq_data = {
+	.efuse_xlate = sun20i_efuse_xlate,
+};
+
 struct sunxi_cpufreq_data sun50i_cpufreq_data = {
 	.efuse_xlate = sun50i_efuse_xlate,
 };
@@ -54,6 +85,9 @@ static const struct of_device_id cpu_opp_match_list[] = {
 	{ .compatible = "allwinner,sun50i-h6-operating-points",
 	  .data = &sun50i_cpufreq_data,
 	},
+	{ .compatible = "allwinner,sun20i-d1-operating-points",
+	  .data = &sun20i_cpufreq_data,
+	},
 	{}
 };
 
-- 
2.30.2


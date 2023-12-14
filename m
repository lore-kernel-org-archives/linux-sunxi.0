Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956292583
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 10:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cL75M/2g"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-336471815c4so379183f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 02:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550120; x=1703154920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SZpEgDuZF0Kd57Q/v4Kq9sCIukMURy5kzt0ohYZmr8=;
        b=cL75M/2gwwgLGKNc3zjh2sKcOftE7IIne67ltNkoKFOVS9WnuV3lN1BhgdfQpkroN+
         T+0r76iiK+Miif3JIh021sctpVaesJkRYAo8rN6B/hRglUj1/XChpWY8e5Dq4n7MYkZr
         1cFCxoNaj8vWN6LoxoJDNR718+2vO6EWDO0m0Z3MVX3LA1GLdrDegjFE0x0wHT4DjPDS
         Rxd9/5JIhkUAvY2DkcdBqlvvOrQowdGF8nG/PAhXxljvsE44gGBH3uMDc2pWLdF1HuXt
         EiNZ/oT1trYcemOGm5WnUoofeb/hW/ULHChO/izyHdmsDP5PmcBThKT8tYfjXus5+X6I
         fVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550120; x=1703154920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SZpEgDuZF0Kd57Q/v4Kq9sCIukMURy5kzt0ohYZmr8=;
        b=CcXCZ+G7ZK1B3l1JmCfIwJ5GR+rH7w9xHxWchIB7V77K4eBY4plKPsYUanipUIQTfT
         ZpNtsDL/dbUGMP5t3EwRvCl+bcUvoKwKs5AsROD10YKGflwid1HCrPd9cyprfSjh72Kg
         /webZ8i8XCjAjP3qiNYU4jbAPlFhJj9nRffnym4EMKGo6aEOAUCnY41CIHDGGlYQ9OtU
         NjJfcmRYc0nX5wOmkaSgghsoUdieKLKSxSpKi+rE15gO281YJnpcJbH7x5qpU7LT11H4
         TwyWASTty1ZK09pTv7aeMSrWToltDiQA7hSm7JuCJdSHvA/KkS50NXItQUjUU7IJQKi8
         lr0A==
X-Gm-Message-State: AOJu0Yw5Ea4HvmhyVR85muhsPvblzJF4xjRYuKeiWqCgpNu6j6UFr81K
	kZWQ742lldTHF6s5pzP21RM=
X-Google-Smtp-Source: AGHT+IHYPY97jc9qd+t5is/0cCaszwyL2E4cFGf6c7JTug0/K/MlULH3FTa3Xttj5loEfnYxN8qi2g==
X-Received: by 2002:a05:6000:235:b0:336:4a69:aa98 with SMTP id l21-20020a056000023500b003364a69aa98mr115808wrz.122.1702550119975;
        Thu, 14 Dec 2023 02:35:19 -0800 (PST)
Received: from localhost.localdomain ([129.0.226.240])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d65c4000000b003333ed23356sm15849623wrw.4.2023.12.14.02.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:35:19 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH 3/5] cpufreq: dt-platdev: Blocklist allwinner,sun20i-d1 SoC
Date: Thu, 14 Dec 2023 11:33:40 +0100
Message-Id: <20231214103342.30775-4-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231214103342.30775-1-fusibrandon13@gmail.com>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner D1 uses H6 cpufreq driver. Add it to blocklist
so the "cpufreq-dt" device is not created twice.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bd1e1357c..2febcfc2c 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -104,6 +104,7 @@ static const struct of_device_id allowlist[] __initconst = {
  */
 static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "allwinner,sun50i-h6", },
+	{ .compatible = "allwinner,sun20i-d1", },
 
 	{ .compatible = "apple,arm-platform", },
 
-- 
2.30.2


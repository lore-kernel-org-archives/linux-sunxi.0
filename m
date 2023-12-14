Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8A02583
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 10:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9w371/X"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3364b049467so143309f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 02:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550107; x=1703154907; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YMMP/qsVfdoJtEElBLyEEO9c305KOAYJqUkekDdPZs=;
        b=Q9w371/XQJwb82l2E+5i+ubUR10Q+c5LT1qn7kKwTXXDEqbFQqsiwv7ap9tRElz5/H
         9tTQSz6SgmSUtAxyOEkTkNcqe0R4557GuEiVeNR+31NPyZhBLkTeqcGoPf/Evm3336Vg
         Sag3eMv/+IZsmTmiTKoPvDBJVnvraX2+pWb3dmKxfUyCIQ1U/4Z1+YIp/kqEV6l5v1pX
         hhVS/cvkal5EGKxQ0iaa8X+AGBeeugwem7u4imHg0nRwFh97A11Zzw7NzGjCwcHONGLq
         dhDYu1B59vptHxEnPR6kirO4ULdM+Jd9G5ZadGmNX2hwHcgwDD1M9jXjMlc9r0GBcmmT
         agHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550107; x=1703154907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YMMP/qsVfdoJtEElBLyEEO9c305KOAYJqUkekDdPZs=;
        b=Yt9USZoukjxX31R1SuxqAmSgKIezYTYlrEre6nRlrEPlUU5haG138aUZsBvN9djCnU
         XX+TKFo5wvaJqavqyMCWc7UefjKqzqT0Jj6fplZcbmxKme/I3HYotWe2pGDCGS7kpIJN
         LOnUWZGZePESCGA8h3ZfCJ7IaycwfA1LOtZ1y/szGnRqjWDIUpYZU/HYSmzXUC1R5X7f
         /Q/uXFuanoUae1aDSyBCy4a9A5arZwJviO7dSSoEX0j3ESi7JbOt3YqyNgmPbU0iTeeB
         OF2Hf2Kj9mXKQ0mRHy9el3Zxl0VXr9nDWccA4BEUN7buP2qWQLgLpJmOc8rNfRxgn+JN
         4VQg==
X-Gm-Message-State: AOJu0YwkS0tBhp2KZZ6jc26YqkViYsEUw1P/is5MGNikJXuinOc40OlM
	GyGzXSwrgWd5cAgTUE58TPc=
X-Google-Smtp-Source: AGHT+IGB2gMg2Mze62sZsH15EW7tQ5RddMXqMonm4fA8WEreIbA3LcsoIasFJ6/XxlhankFX/CQcBw==
X-Received: by 2002:adf:9790:0:b0:333:2fd2:6f82 with SMTP id s16-20020adf9790000000b003332fd26f82mr4844499wrb.140.1702550107021;
        Thu, 14 Dec 2023 02:35:07 -0800 (PST)
Received: from localhost.localdomain ([129.0.226.240])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d65c4000000b003333ed23356sm15849623wrw.4.2023.12.14.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:35:06 -0800 (PST)
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
Subject: [PATCH 2/5] cpufreq: sun50i: Add D1 support
Date: Thu, 14 Dec 2023 11:33:39 +0100
Message-Id: <20231214103342.30775-3-fusibrandon13@gmail.com>
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

Add support for D1 based devices to the Allwinner H6 cpufreq
driver

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 32a9c88f8..ccf83780f 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -160,6 +160,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
 
 static const struct of_device_id sun50i_cpufreq_match_list[] = {
 	{ .compatible = "allwinner,sun50i-h6" },
+	{ .compatible = "allwinner,sun20i-d1" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun50i_cpufreq_match_list);
-- 
2.30.2


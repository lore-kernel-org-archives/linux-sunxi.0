Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A0515A4A1
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713958820; cv=none; b=BsZ+WlfGORPLE3p1WAWWvB+uRA4nlu93p2GwBCajX2cNNG5aCckS+Yo0Y02OcE/YZWZx9BteZceigXOnVgN41Z6QKL+7ule+kvLqYiCi5ZEhM0AMazO2IAr8dok5oWoCsouQTn346gKggCYetMntq4ScgSwqdxsr8l9egA3AbLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713958820; c=relaxed/simple;
	bh=uPxQKTFjx1OojfL3XIvuRwqZqEHhetjhGQ/QNoCE0cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpAQHU4J7MBa3RBhknztr0YwQnMkPHZgzk88AtfaYCQqVN8KbpjP54InTx8zBkMjSQ+SwIyMNlOuq2sNux2S1gIm3vcyhazOkoAIo2Vzn1WOCCW0ftZH3ogIugHjUo2gk+NHQCglvAEjLscmiXzzWkJ1/0hm/AqBEpjwV6ADNFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXLFYk/f; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXLFYk/f"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-346b146199eso5347277f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 04:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713958817; x=1714563617; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lWMfbfXnYK3fqv0yrgeedC9giNqOZfecY/EM1i6Y9pw=;
        b=PXLFYk/fHu/VghJbeZcB9ek/b/VxvvZgFsseKe+O6Q3buQv8XStrzSNwZy31lUTcpF
         bEJOgx2kba8F3rjoKHdrnPPhAdk4SsY9x4oygqV6ps/KYrs/IbK3y8pJiJ8QVC7I9GYp
         BOW/olPYzCWtLPSKGXdG6s+9V4Kb2oaXyFCepoSz38a3FQB1v/UZ1br6EtWyfAzD2JGv
         UjdXvUqxg3YVQcOUfSOk8u5I0mW/JI8IZFJhp9KvZ8sW6dD8L0hE3nWCjHJCtWEho6Mk
         VBChfrsMPaGT9uIBWHPIuqpiJy026nQCMTL2q38rFSo/8bF6cJAGqrU+Tj/N7flDHKWs
         qjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713958817; x=1714563617;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWMfbfXnYK3fqv0yrgeedC9giNqOZfecY/EM1i6Y9pw=;
        b=DPLIG4v7Z/cQLe2IF+meNniPst2LGd/jDhT0b/raAoK1tuXBpRa+bI9lY3lFaUTM4s
         zR9D1nYE30ol7/NUR2dq7BWz4weW6SH+ftFGe+wPjII1iTvYHXOFHJYJZSSSu64EwAMH
         Cq1ZVHPnAk7LDqaudnMJuiHUhUNa4usS6mAFuHh4YpECBxv39cVbX/5m2MUTSiupvjNK
         Jg33dMqoMkdSgJtC5Kwk4ulb4YmNFpGsn6F+upmUpF6/qWP67GyXrFh0Usgb6n2Oh3Jy
         oCjOU38Sd3zIhXQ5ySIu+wjCjlI44XO4Qz9NqTvzYHiJca6ViJ40f4qhO45uRw/dMZv4
         ZWHg==
X-Forwarded-Encrypted: i=1; AJvYcCUFuZyyTMpLDK+gVQk/kUsCZB5V79dZr/991e7Oy1Zv3Ve0ZsEKAaEm+OM4+NOq2FXY2gn1JrgureDkLvqfy6UlDmwhljPKuNs1bqI=
X-Gm-Message-State: AOJu0Ywt5iRZgOO4pi2BeNJinvP3kDhMu3nWIyBBNEd1VUJpS1PNdnuR
	zqgtV17saccP4YFR7fbhGI/ZXihMejzActMVpyVQnPeEQU7ByugK+PFTVkd235I=
X-Google-Smtp-Source: AGHT+IEWJT/8VK6y4z/3yPVqZFVfOmJf5zYfnoJ8CK24bfiYAkNVefNagGs454ZH+JH0euJmK90N9w==
X-Received: by 2002:a5d:568d:0:b0:34a:9b75:cb95 with SMTP id f13-20020a5d568d000000b0034a9b75cb95mr1449964wrv.37.1713958816645;
        Wed, 24 Apr 2024 04:40:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id d4-20020adfe2c4000000b0034a3a0a753asm15306805wrj.100.2024.04.24.04.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 04:40:16 -0700 (PDT)
Date: Wed, 24 Apr 2024 14:40:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] cpufreq: sun50i: fix error returns in dt_has_supported_hw()
Message-ID: <9bfe5703-b39b-4d98-9995-f6a7d0ea558d@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The dt_has_supported_hw() function returns type bool.  That means these
negative error codes are cast to true but the function should return
false instead.

Fixes: fa5aec9561cf ("cpufreq: sun50i: Add support for opp_supported_hw")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index cd50cea16a87..0b882765cd66 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -136,11 +136,11 @@ static bool dt_has_supported_hw(void)
 
 	cpu_dev = get_cpu_device(0);
 	if (!cpu_dev)
-		return -ENODEV;
+		return false;
 
 	np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
 	if (!np)
-		return -ENOENT;
+		return false;
 
 	for_each_child_of_node(np, opp) {
 		if (of_find_property(opp, "opp-supported-hw", NULL)) {
-- 
2.43.0


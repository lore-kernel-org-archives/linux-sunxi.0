Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DF6158205
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714758762; cv=none; b=CEeuSFKpnX+w5V4DZ68Yg+VB3t1ozknnXTXXfI6RC3zQZpUROf/2aaUkN+BZUHOv5wiz6Lkr+sHniBiAapoueQGMLisLCULD8F7UEa5LIEVxsKMd/6MJIBgEYWe4BdDOPR/kaTdZNbtrcEQhrp4/LjcQtl6Qeb4gjzPva0yZ+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714758762; c=relaxed/simple;
	bh=Mri5fTd2blYcQR3oWWDwHWSCOTzmuxEMWx67fmd/ZzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZGhUkTQaPdxLPU7OCeADn32YKO61VHaG6p4O3FMzwdSjzaLwyrGnjIsNmblCiUW/1jFM98U0kFH0XkgeE+ItfjtE8IrNEv+ns1ES1k7fUefBBvl9wpM8eKkEVBndsiiEyb8UAG011C1r/HauZP9ckbr1yuS4oSs2W9hpzA236c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfEzmCs+; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfEzmCs+"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a598c8661f0so249927866b.0
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714758758; x=1715363558; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hv8U88MGPjGVlknzKUx2MPXN0ijTnWvKrGGtFBeWuHY=;
        b=mfEzmCs+hR6vgSCtXT8L71XlS8bhTWNSth1ED5TFLFFhMLF/Je9wVYijqNG1rD9LtE
         wBryfuBKbpWEgcoIcPVENGI9TRZ9HB9+NYryeqDmECqRlNzIzHG9hCQMcSE3bEvU1lqS
         XtU14Sn/951UkYbQ34y1EmjUg6byyl+EGFuk5Y55m4Qi0oTEd1z3S7J57z5Cp/DTqN1g
         Otsj24sUzHDPnLOG0drNW3dKms+2Q7GnPHXCcbUpD19fbRl3V8Gi57c8wHu9EjVbEn65
         hT0uTFg20nB4dXXaqIKcRtBy4STslPlo/lk7HszjoSQOshB+DVkpPET4gR0wpl4teTht
         Chgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714758758; x=1715363558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hv8U88MGPjGVlknzKUx2MPXN0ijTnWvKrGGtFBeWuHY=;
        b=qHJoaVe/ZBuEr1cYNwcIcCF1wTQB0Zs7ebuKtLQq5rhnTvoEgQB4gIHWs2We8btJa7
         3c+YLrzhf1bewkM6DNFSEd7JDYolORew5TDo4ULPxHUKnkBlQIKmMVzxGIBsAiXxKuoS
         3z9CfzL6o/NhB2B+RyRWb30/yit6EI8orbl0IQYaawpHhrglgQNecai5tZK9HHHh5o+h
         BD9p2EO0sIOx5C6VG4RXK0QQ1wz5kGw788SxXeHSDbDNPkKYn+XI/dEGPlTYIgTVKovh
         mOO8n7ERYUmsnyNQTvhC7ZdNnHNMbb57og80VsbiGx95ggjN0RVFXB+549y0hKyiOQhC
         GeFA==
X-Forwarded-Encrypted: i=1; AJvYcCVs35sarD/3vVeF3Q75rQKP5VPfs8/3wi074n4WP2wik6kJnj94Fc2rWKbZNW4krefbSvUH6Gc4YPtlQhjdjYOYKcRwBDooYMBB2a0=
X-Gm-Message-State: AOJu0YwkaoOYkCs6ZNqxF+Hd3iYmg/mGrKjKCU7Xm2znOLXTAz5EmUwa
	ib/HjBxn/egrZeuVhNpbm/K3ud32LFsOpDa9KLEHBvjfPWI5iK8X
X-Google-Smtp-Source: AGHT+IFda4IBg1SIoYzq/bSKmyVZMSDW+3JXaIB3rFnqcRC9ICD1D1DRaJaPNDAiCVlEqa/qxNFdkg==
X-Received: by 2002:a50:9fa8:0:b0:56e:2b31:b111 with SMTP id c37-20020a509fa8000000b0056e2b31b111mr2253828edf.7.1714758758304;
        Fri, 03 May 2024 10:52:38 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-47.cable.dynamic.surfer.at. [84.115.213.47])
        by smtp.gmail.com with ESMTPSA id q28-20020a50aa9c000000b00572469a7948sm1968368edc.45.2024.05.03.10.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 10:52:37 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 03 May 2024 19:52:32 +0200
Subject: [PATCH 1/2] cpufreq: sun50i: fix memory leak in
 dt_has_supported_hw()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-sun50i-cpufreq-nvmem-cleanup-v1-1-0a2352cac46b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714758755; l=1326;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Mri5fTd2blYcQR3oWWDwHWSCOTzmuxEMWx67fmd/ZzI=;
 b=udeaJHPt5rHhF46vbOWjAj99SPixn91bwWQoY9RNNRD/rc/kOQ3iLjl9RVmcNade0FxgOeYLv
 Xx9Nip+KoJxDW65l/77GOlzgmH9ZN45UEINZI5sCgACTRCbPC02afj6
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The for_each_child_of_node() loop does not decrement the child node
refcount before the break instruction, even though the node is no
longer required.

This can be avoided with the new for_each_child_of_node_scoped() macro
that removes the need for any of_node_put().

Fixes: fa5aec9561cf ("cpufreq: sun50i: Add support for opp_supported_hw")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 0b882765cd66..ef83e4bf2639 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -131,7 +131,7 @@ static const struct of_device_id cpu_opp_match_list[] = {
 static bool dt_has_supported_hw(void)
 {
 	bool has_opp_supported_hw = false;
-	struct device_node *np, *opp;
+	struct device_node *np;
 	struct device *cpu_dev;
 
 	cpu_dev = get_cpu_device(0);
@@ -142,7 +142,7 @@ static bool dt_has_supported_hw(void)
 	if (!np)
 		return false;
 
-	for_each_child_of_node(np, opp) {
+	for_each_child_of_node_scoped(np, opp) {
 		if (of_find_property(opp, "opp-supported-hw", NULL)) {
 			has_opp_supported_hw = true;
 			break;

-- 
2.40.1


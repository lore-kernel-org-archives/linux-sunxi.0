Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7871292D8
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 15:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403110; cv=none; b=ZBJt5ddmfkLEPMDYk/EAZFw7DM/28XF2yDLrVRalAtaR6GWMAJ3frHm1UzCTu/fa8rpXGQHmEGkRbVEAgAWT+86Ld1yuQHh2Dd65SJ/9SN/ElMdi0jSSEWoUD68Zs4tGRnnE/enPmyKSfR/rGnWM5kWqFMjo6DuuSDxhslyrDgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403110; c=relaxed/simple;
	bh=m351M6HyiT8IWLkyID5itxiSqWILJmFaZ7lxVFnP6BY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hm3OKx3ijmN/bEiLEAQ+RYhnNIDcj38E3H1p/bqPNrsG9sARiD+VDsyHGL4BuYBVaGNFHlENpJad9DTMsdVNFBS7ef2ziISjk2+M3N1bP+xgOJB2d0u2YeRuC22O19M+5vuMXdDNjtBVgqAtZtSyGLwcRub2JgbkijZ3Zcw+AfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y4WN6Aac; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y4WN6Aac"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-22ed075a629so1661017fac.3
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403103; x=1715007903; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMpzOFCFY/OFyCB78Iqov2ITRER3c7lueX7XaC40UJk=;
        b=Y4WN6AacIzV87VDZuQaNhXowEfSZZpP12DILJJuXTg0C/YUp39r4lTtFQfIb3pMMaa
         g23snBaJxBgSrIKbYHDHBln0mH1GryoG4i7TMgW9WtDDqG8ilFP0QYj8ZZ1dKOUyUGEp
         bC7132xCBIgTF+3oW5X4tordRUdwGFY/eMAt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403103; x=1715007903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMpzOFCFY/OFyCB78Iqov2ITRER3c7lueX7XaC40UJk=;
        b=qZ4b2ktqLoYDeVpvO6Rfz/H/K4O+oKVSrP8rnZec796+OJS8/zs4FjIxp/C/6bZNsA
         8uCbvEne/X7inwfyiCEe1YjGS4QjaPSwquBYnWRb577slG1SKrEJ7O54nruU9LVq7M5P
         MAM6/VzqorvXbPQej8DNy8MtFQkk4Ue9VQcNSu1coP5MML7jcOkOpsrRktIt02pg+yf5
         nOJwATktAreBztYKJVBcEAPOHAm2HEAt1WjWI4ia6cUukMZGKL1ep50OjfGPMe/mMVwW
         b0QzwCySeuPFWoYa3KMbH7wMvDclGjqbSXEmYZtLLxmVTHVJ1oUZQcZex9pp8baNpIA/
         q6LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZZAVmKmyVO29cIrO2VmPz+pS27Y78ABSx+Cs6FOr0iYQFml79bZxNJxtMs+jxZFsxktRBXlL9AFhXsM2jhBYR+RnOUphKIr23uU4=
X-Gm-Message-State: AOJu0YwfI37Sxrp63i/Yc17XyzpSf5zCSz7pIQHPfZ83nbT9uFkubCIi
	nJyMcjJPjCzcTY2DQ5EUwq7Lgs9FuQkCpceCnXwioqR4Ite1godJGr0Pbwv7AbH5TUB0Qbzc7Zw
	=
X-Google-Smtp-Source: AGHT+IFhJl+kGtaYhV7Q9Gv3xiaVng6RdI8g6vF7vUpIJM3CzWksrp2O5EtILgQd8YzMcEQUTtUSrA==
X-Received: by 2002:a05:6870:701f:b0:22e:d258:bc43 with SMTP id u31-20020a056870701f00b0022ed258bc43mr12416234oae.42.1714403103424;
        Mon, 29 Apr 2024 08:05:03 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:59 +0000
Subject: [PATCH v3 20/26] media: tegra-vde: Refactor timeout handling
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-20-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Reorder the branches a bit, so cocci stops complaining about the code.

drivers/media/platform/nvidia/tegra-vde/h264.c:645:20-21: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nvidia/tegra-vde/h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index 204e474d57f7..cfea5572a1b8 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -633,7 +633,9 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 
 	timeout = wait_for_completion_interruptible_timeout(
 			&vde->decode_completion, msecs_to_jiffies(1000));
-	if (timeout == 0) {
+	if (timeout < 0) {
+		ret = timeout;
+	} else if (timeout == 0) {
 		bsev_ptr = tegra_vde_readl(vde, vde->bsev, 0x10);
 		macroblocks_nb = tegra_vde_readl(vde, vde->sxe, 0xC8) & 0x1FFF;
 		read_bytes = bsev_ptr ? bsev_ptr - vde->bitstream_data_addr : 0;
@@ -642,8 +644,6 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 			read_bytes, macroblocks_nb);
 
 		ret = -EIO;
-	} else if (timeout < 0) {
-		ret = timeout;
 	} else {
 		ret = 0;
 	}

-- 
2.44.0.769.g3c40516874-goog


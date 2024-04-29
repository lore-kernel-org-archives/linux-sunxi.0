Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FAA84E1B
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 15:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403093; cv=none; b=ZiM8qVGDiRUbLBlBiNVmWMlrmdcQ2vOrACSqyKEHhGmJv5tjNDogntCiy32X0Xja3+wpy02vLOM46b0OSJE5MQf1B99OWfYV1IPefDI//GrZzAjo+O0OU/CDDoE+otZsJhRD5YlSmIsD/SPooVLwQBUVPsvzrlnnJ1slMzBrKeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403093; c=relaxed/simple;
	bh=aO+3XsdBSRpzhoc7Fyjg5oVGDMNe8NmC+5ZKhCG0BJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2NxurmMpvQI3lkmh3938eczIiggjgbg073LE95upYjXB0to9C8lcRhi7cjnPrQrq9N3g6Ia02XIuPta/JDa0Fs18aC2BuMtTriiChHpMTmfPrJ1PmcDJXHmXpjHVCO/b2tq0z4fvtIhS6xZCCftqtHWhJvncpFaF4YQ1OlrJ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XdoShBzq; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XdoShBzq"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78edc49861aso344054485a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403090; x=1715007890; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=;
        b=XdoShBzqUi+G6jDeP4g8UMhkdvckB61O8YoIIJI8+sufNS6vwlcmdw5pAohiTqE5/n
         PBzmIJ4XMy1CdnvQCtqVpKgYOevDoRrnyHk0seUvKlVqYdp55oRvlib+eDJpAW9JH5tO
         s95U5HGj4pDKG653yGfMaTvwg1STdo7hLWO4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403090; x=1715007890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=;
        b=KXG4Y+jDxlOeKj/Xsiqe7gxR0lKt/bWCaW0HL5pqm8+JHhNk0pJ6Z5ABlXgR2Y/UtF
         QUyOsjw9rVDcm+3Zb8Y7z6lmiM0fY8DVVx7IvkW/tdDw+gLz8rX7L8ALqG9O06PD5aYs
         w8GAK7N2UnqCq4g1hWJZ+RSl4izp7R21f/6e9/qY5lu8Myd9hLkG4qai7bHoFmvF9PQ9
         WOQNhyZFWJFxK0Qa/KNjHw5BYN8/oLoCH/0aAEG+MrpabM6aMlcNePD5LepZJdxyDBjs
         jN0Ce5B30i/N798aLNl7vPrHtVxLonHx2lB+iYc7KF0hmNnd3uxIVXmc5s635FN9h256
         Q7gA==
X-Forwarded-Encrypted: i=1; AJvYcCWtaDHIEwK0gXW0MFi0S2yc/Gh4u36JRwZpcVt9vB+LabNt7oxkrzw1n3/FNmX+kLTx4pEmv1xu05TMu4Rf5d6HF60Wrfpi+oSlVvM=
X-Gm-Message-State: AOJu0YzrDrHSL6umNMEbYrV1HrUPiPNoPFO7RzWec3gRg4L36Gj5fS5/
	nMSdH+jnU9SG07Ubp8/eA1SoU6oZ8xbXnkRgpXNwSGKDu1GIwqKpEBwV6lpqqA==
X-Google-Smtp-Source: AGHT+IHHKi7cqnMpYwnQDIZ9akhXG6vV1AIqNbLdBOwmjaLKTCEqbKtGqVQAHlyIVFw/U88/GLAn3g==
X-Received: by 2002:a05:620a:4591:b0:790:fc14:60ac with SMTP id bp17-20020a05620a459100b00790fc1460acmr2298793qkb.0.1714403090344;
        Mon, 29 Apr 2024 08:04:50 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:46 +0000
Subject: [PATCH v3 07/26] media: staging: sun6i-isp: Remove redundant
 printk
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-7-3c4865f5a4b0@chromium.org>
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

platform_get_irq() already prints an error for us.

Found by cocci:
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 5c0a45394cba..58f8ae92320d 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -386,8 +386,7 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
 
 	irq = platform_get_irq(platform_dev, 0);
 	if (irq < 0) {
-		dev_err(dev, "failed to get interrupt\n");
-		ret = -ENXIO;
+		ret = irq;
 		goto error_clock_rate_exclusive;
 	}
 

-- 
2.44.0.769.g3c40516874-goog


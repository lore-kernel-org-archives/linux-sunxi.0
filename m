Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F19812838E
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403114; cv=none; b=WkVTPra2LkGIvO0O1CpbKswGD8TljRfp/GRtZKm5mbTjLqpaTUKJSEKil4wUalX0X6b67pJX1kV/qxZAmYA+FjDvCdDvOTwMN6G5iBU7dX9SyVzSS0DtiHEA7LMzIhfpJ/DqjHd0+8fmkjpXWY0g1rtwOEnRhgC0JKjKvl73Zzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403114; c=relaxed/simple;
	bh=A2Ua3QkuJFffFg1BMdgqwGEYAvUbwmxlzRDyBr/ON+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUuMbDfMLKAa47JpkDi358kUvGF8CRp2rV4xhH+JhVbog+gxMvMl+QFUNUqLHM2CnVEXqK3RPEbZAdatArRLFch1yCQyDJsryBiB4AAQQ+/6Gvw/R6I7kALYcJd1LecK3Fzy1BN1Sx/cTSf2p9f01Tfze7ToX6KMp32F1aqcp3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NxFIGHGy; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NxFIGHGy"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-78f02c96c52so339122385a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403106; x=1715007906; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+ICFE9T0WtFgFxAAIzneJg+RkmVbFrs0mrpkqFICS0=;
        b=NxFIGHGyfkWJ1dBbq4WMKc/48my1lsMEnCoE44n2GJ1bGHOnYnHRTUDKrAxz06Z4rn
         UvZHouT5frHTkAZYRqdnlP+lZlMHN3+QAAgJjAEKgq1mTw4e7eYsvID3p5OPG22fbqPa
         Q88Fg10AZDKST4+izsHEoXmWPS/gwpr9uvm+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403106; x=1715007906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+ICFE9T0WtFgFxAAIzneJg+RkmVbFrs0mrpkqFICS0=;
        b=DPsUg3Upj1z6V2o6Uirgw4mqKD2mXWQtglMwruoDwAcKOnDXmCnywYr+0dpa4XcnZx
         alJVdNawk/Ddj+/tC8Z+yJRabe66S54rOShwHOcp/nkgDu8BZITs3nb6AR2z3X37hk5L
         deKqTH+xUWxO78muqNOmPmnAh1/o0x0MpFQ3vbGc8Sgx9hEXEyQKUZE/sm2uis3eVogn
         sWlMJbslcdn04f6dt59LuMhw25++ihwO+XRrioTvv/a6xXBXVKZP5PK6OUdzFIruS4Qq
         5Mp0cA2Ahr07Ocky9B4IUz89PbPGYzuTesGASJiX/XGrqO4fmTRik2yEvb+YR/Cx73Xf
         YdxA==
X-Forwarded-Encrypted: i=1; AJvYcCXehrLveIyWDXRkx6X5jEJI9OkhhRQQy36+eDgIesyVrvM3Foyih+CE3z3auLHEbs5ypbnKkRbI/HzkJbmKzMmvmwH+Qd70rvf3q+A=
X-Gm-Message-State: AOJu0Yy57ZvLxkMyd4k8Bq3aGpX/M759QPvlYePho/JI0jYmPEMTXAUN
	vyHkHpbCNqPEIvUVzD5gqvawyBSn/eReVj9rLrEVD1z4Yw59TQkpdH+HwkKVSw==
X-Google-Smtp-Source: AGHT+IE1jrRBd5HK/tPuhHP5Hku+rmhJzqzd24VfyQoPlWIHBef+7Xc9RHcUZ/XfTRZVrVfoGNJ+0A==
X-Received: by 2002:a05:620a:57d6:b0:790:b2a3:f86c with SMTP id wl22-20020a05620a57d600b00790b2a3f86cmr8844059qkn.34.1714403106175;
        Mon, 29 Apr 2024 08:05:06 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:01 +0000
Subject: [PATCH v3 22/26] media: tc358746: Use the correct div_ function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-22-3c4865f5a4b0@chromium.org>
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

fin does not fit in 32 bits in some arches.

Found by cocci:
drivers/media/i2c/tc358746.c:847:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tc358746.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index d676adc4401b..edf79107adc5 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -844,8 +844,7 @@ static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
 			continue;
 
 		tmp = fout * postdiv;
-		do_div(tmp, fin);
-		mul = tmp;
+		mul = div64_ul(tmp, fin);
 		if (mul > 511)
 			continue;
 

-- 
2.44.0.769.g3c40516874-goog


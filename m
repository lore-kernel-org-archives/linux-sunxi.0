Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6467081751
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403088; cv=none; b=r5ZC7/+FVRBBolM3hmpJwcYpUHo4cdEuhy0lN2CN/5Iwjgt1Ve4AoVMMmcNqPLCPdsscbvI7NmnuILgaFtw+xfV8jFq2eBA+mfvXhevFZOhXgsPOH+/9MngSrhUX5D0XUmPwDgGmHEtCokqR4eLvi7eoiXn+GtdMnvip8uWCXDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403088; c=relaxed/simple;
	bh=urLejDAQyDwbji+siqv8Du9RbhkbIBb0Js/GJvw2ut0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V1t5CzLBbAji/UNyU4EMyP5Sq/Jxi1SjpAICYiDYIrFxkxWL8AFjnHlXcZz3wnP3Swu9H/sdDnZ8/XW5hQ67skNS2tqN9siVUj01GUZfMYq3cP60hO1TSEWXyusVeP6lOrPJgQkGSGwIP6ooWDn0dp66GfUIEbJmA6Mm3WrIft0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OVQZDthX; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OVQZDthX"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-790ff1fa7b3so45276585a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403085; x=1715007885; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBoYdFZFpJunUvgv52P8o/805oLnG0rRdaJVdgyqfIE=;
        b=OVQZDthXbZd+8QneUN4Jc8b1c7JDekvUfFlq4PGlYCKvDQKrOkWkY656tKjUtXEJON
         l+xv3d4/VjXYzj3JMM13tiNqZ9XanfedAxjnN9lbFhujV2BzH1ya6WRZmuK2q8qyyq0K
         VD+87uGEDqwAr2BK8leD/PI7X8kNPPqHgzxgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403085; x=1715007885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBoYdFZFpJunUvgv52P8o/805oLnG0rRdaJVdgyqfIE=;
        b=rc40ehq/nXAjFVpx7Ut5BDFu/zc+wUp4sBPDwM+U/ykSQE0MljbP/0GSpPIRy+CWZO
         P2hLpVmXi0FBCtHoV6MAFMlUsCR6Ak0Rdk9ghJInseDo2fBMN6hF6qQbP/8APCxlxbAy
         guUxdb6B0JBlrm4gKolFdN7dmmUqzdrJckXDz86EnsUrbTwYa7W0VDDmIAHomzvUV5Bf
         /kYLhQMo6I2B2jP9kqyjYzYAuaZ8iT2CThMP3ZZXZXVNhZgS6DsZmKVM+rQBlepwRrtu
         A3OGV45wsMsXTKW8QNd6wR1rszePYVqAFDdFzMqu2d2mGcm0xuHgt6u22wTkIxf2Ouec
         XGPA==
X-Forwarded-Encrypted: i=1; AJvYcCUQxKjKIpikwbbLsS4mXU91gZP5eVX7s8urwa3ukAMP3hDJPG3wXG//8RYjZNPGQeJ0DQCsbqDRbKWcM2nnx9PrQOMNrD1e8pe1ht8=
X-Gm-Message-State: AOJu0YxiLDY6jK9M+w5pg0JJ2bw/yTVdifE6tMHuLJoA0SwscmlwLAR2
	ZQIcGFiwJXKUFB4GiAC28yfyG6xaeEp9gLEyP6zfhw2hpMr63xQRKvfdKPTfvw==
X-Google-Smtp-Source: AGHT+IF+chYPShGmmjcrkgz/giMi8LlMh1kKDt+AWNRJgL6Fjthaoaa54O+J4vw4mx2W4IdeglySVQ==
X-Received: by 2002:a05:620a:39d:b0:790:944d:65b3 with SMTP id q29-20020a05620a039d00b00790944d65b3mr8124237qkm.62.1714403084821;
        Mon, 29 Apr 2024 08:04:44 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:41 +0000
Subject: [PATCH v3 02/26] media: stb0899: Simplify check
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-2-3c4865f5a4b0@chromium.org>
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

chip_id is an unsigned number, it can never be < 0

Fixes cocci check:
drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/stb0899_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
index 2f4d8fb400cd..35634f9a8ab5 100644
--- a/drivers/media/dvb-frontends/stb0899_drv.c
+++ b/drivers/media/dvb-frontends/stb0899_drv.c
@@ -1277,7 +1277,7 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
 	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
 	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
 	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
-	if (! (chip_id > 0)) {
+	if (!chip_id) {
 		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
 
 		return -ENODEV;

-- 
2.44.0.769.g3c40516874-goog


Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7D6160799
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209698; cv=none; b=h4g4tuu3zqKYBDlXzkcnQh8V29ydrnNXYjIIY3Jw5N62mS/PbRdGe400tpBhDGI/eQQ8J/7Gfug0Ph78PCl7UKsPMDsxnyZHKColLYHVWVtp9c2hF0q5zNTRh+eSByn2eIZ64/T87J6dGa5w3bLdi+kYOZ6o1kyfJ6cwVATeYkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209698; c=relaxed/simple;
	bh=MeqIMsotIT3P9woLHFJMFBDW8LpTmviMFwTz7YYEGwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LyWyidTJr6YDdTNwWjZq4y9L6txuGfcPK2D1Cs2/c+2SXr3Jxudh4CcvvWhZrgxZLcbQJNHFGWn0yNyjhWlMfYU+esMTDZEvsaJeV/PiwFHdZEBERkT8ilc3KQMpj2hXgCG0Dk+DNwb9zD+Yd31ANniZUFSwhATML98bomPM/zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W08paxUe; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W08paxUe"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6ea2ac4607aso1923439a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 12:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209695; x=1713814495; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeRLp7zsOtUSdDFmgCUblI9njYJR1iKxSTZ/4ILbF+w=;
        b=W08paxUeiGVHpPV6z15Ue7VxvZ7P7pOCObe6p3tPzlPv+Wi6mTJT/oL0iZHEPBc3eP
         98zXkQ4OCEqICjzK0fbl5wnICIFKQuh4fTz6vMgYMARCgpHYTII3OzPSO5c+elG1jaOI
         JyoczGMbvdcWRJmDuw+h5nO7o3LpRHlSGs6lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209695; x=1713814495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeRLp7zsOtUSdDFmgCUblI9njYJR1iKxSTZ/4ILbF+w=;
        b=ut5ZjNyDoKe2IAoHhSndFtJCdwkm7516e9tuaB4azYsbnf6xPv/5KxrA+WkF31eEJB
         QA5E0Y7qF6BJHjp0SR2M6fMwHdlBEEvyKcfpyRas/w4IGoVguMMcVuziUYCi2EPWZvRC
         bYOfVYVJ51zffBLVDlve21KvQ4tfo6oc/OQPKjRuyvEL4RsSq2goPo4Y2hC5VwSTR3We
         WuqkCDCwvZQrnBiHBw7E+3PJBFPsK1GKZdACJ46xblLT5TM23rrFjB2pPGWNKHYbEpeu
         7RGxSXSNL5v87J6OOkRSjpXmPpQpsk3ASiF1ziV+5TS+xXTUrq0qSHgyKnCls4dd4xRU
         og+g==
X-Forwarded-Encrypted: i=1; AJvYcCWm7oBVRbiEg1u7hluF9pkPPgVNo32Fu/qyF0Xvdn+aGZ8+1mDNGlKyKL5kMocts6PwmI65YhOXIdb0s9ku1JKQVTVd7L4ad7j5BUE=
X-Gm-Message-State: AOJu0Yy9wU61745qZH54n8Er8I2htYNtP1RP4s2TMcrpr/XhijpLk+uP
	TULowQjMW873+HcaPa3iOD2VpImCL2ywxx/pC+NbgejuiS4CU96pJU3/BcJfVg==
X-Google-Smtp-Source: AGHT+IFsqXR5fSRZnzm1Kf6aaPblaNqmPYRQpJrXNEFCJBpTElAi4AncAaUAPBA9CFnD3PK/w6M+nA==
X-Received: by 2002:a9d:748b:0:b0:6eb:7d1c:f793 with SMTP id t11-20020a9d748b000000b006eb7d1cf793mr4227322otk.31.1713209695186;
        Mon, 15 Apr 2024 12:34:55 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:41 +0000
Subject: [PATCH 24/35] media: tc358746: Use the correct div_ function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-24-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
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
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
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
2.44.0.683.g7961c838ac-goog


Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF28127E36
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403105; cv=none; b=BLLzeTh5Vzft+vFQA0UiKQOPAtRoOw4YaOmv3ms9N14/7cNUdnHlWgolLBjlF/tKxTlbBT4O9PYZrMF3zKxNoBi1pUZNll8O25QJl/JcRJ/H+igWTq8giwHxpNN8EbhDHWJwlpg+cSzmJwojz6hhlFZkvVtAbS7cZN75Htg5A8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403105; c=relaxed/simple;
	bh=A6XSSayOn3r1ipxe/l3oVKgkfleRFTrQcYLCuzASKa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFNta+s+Bqp5mpKq9gTjMIqe8rwkOZtPbkNpTgxFXbtTu3n8zIKda80E8aE4J9RlzPLtoq8ji1rloFJ65fjUJ+z061/uH/70wkQWiBJdSU8Fzx6fn6E55mUWay/sB6dHLGu4LG6yNoiMSA4JXmRCXcOJMTXDlhDpd4Ptna5lGYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UxbGReyD; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UxbGReyD"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-78ebc7e1586so579686285a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 08:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403099; x=1715007899; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M868xcge+vjTb4vcqz3d1wlm8C5wkLs//kWdILTOdIY=;
        b=UxbGReyDDFboBHO5Vtg7/Qt3GTXaLAlneDcHC8fufyzjXzYc7tmLHZB3bwQriym8Pm
         afzjRD1BjYolZHlToIIknev2oIGxvC9p8z4PGz+F1DXl/XXHfOdMzo0alU3kVAXk1ZJR
         iWjv1R95YT7pvHOFQVcPXGPvf67eo9wxEgmFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403099; x=1715007899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M868xcge+vjTb4vcqz3d1wlm8C5wkLs//kWdILTOdIY=;
        b=fLgkJto6LK0GdqHWedV2YdskxYu3+ndKYbuz4+2dgkpwm+eqJN8iUghHnd3ZwuEz4R
         ibPVPhmYyEvbLEXNUTcGYvg1ITgtln8GwcLjDcRdPwDTygGEc8DovmSA3P89Xo0E4ZKQ
         rhRP0fIHRvINNCJDJcZxed08buu8nwvWMCGZ8VA/bl+BEIJ5f+wlxC3fTzF17xcbohSt
         SYutKnNMTQzXgBpu9m2Yq1L3F/cuse7J6vHiSn2NMykAAJU/ft0KbyxMpEOr0fbAeLb0
         L/N2auxgYhkcr5ALOzlxmZd+0Z90snmWc5sx67Z7WfVAaIOdBYhIWUV5ExXPXDdO2XmU
         tccg==
X-Forwarded-Encrypted: i=1; AJvYcCW8Oq1LxwqTXeUGnuv9tWArKW2yh7abSnYZe/UZ31wx/9sXWTubZLCyCsnn4w3Q39qbnjIPOijM5/zSBmKng3Hn2Igs7setK1Sbc9s=
X-Gm-Message-State: AOJu0YzICt8S2PHfajRbj5whCCUAQQVW6EYhYYHNGMPNjuH9xf1hV7eI
	XwBM65gCw+Ag62xRbABOHxbRYUwHDAt3OyndUU2MgB88tE9bs5MlUVJaJDvNSQ==
X-Google-Smtp-Source: AGHT+IFpnQ4ab2gf5wQortCnYRGRkza79tueM0GmMJw+OfK9t9OORYfudlojtT2eZzgU8317EfmzQw==
X-Received: by 2002:a05:620a:2005:b0:790:a961:373a with SMTP id c5-20020a05620a200500b00790a961373amr16658835qka.31.1714403099487;
        Mon, 29 Apr 2024 08:04:59 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:55 +0000
Subject: [PATCH v3 16/26] media: au0828: Use umin macro
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-16-3c4865f5a4b0@chromium.org>
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

Simplifies the code.

Found by cocci:
drivers/media/usb/au0828/au0828-video.c:605:11-12: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/au0828/au0828-video.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index fd9fc43d47e0..2ec49ea479d5 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -602,10 +602,7 @@ static inline int au0828_isoc_copy(struct au0828_dev *dev, struct urb *urb)
 		vbi_field_size = dev->vbi_width * dev->vbi_height * 2;
 		if (dev->vbi_read < vbi_field_size) {
 			remain  = vbi_field_size - dev->vbi_read;
-			if (len < remain)
-				lencopy = len;
-			else
-				lencopy = remain;
+			lencopy = umin(len, remain);
 
 			if (vbi_buf != NULL)
 				au0828_copy_vbi(dev, vbi_dma_q, vbi_buf, p,

-- 
2.44.0.769.g3c40516874-goog


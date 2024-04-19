Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9397D130AD2
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520189; cv=none; b=CcjXqJw+ApgHO2VokT1hURJybj/vBk4R7gzn2EdV4l682TO8iskKif1PGg0k1Ah4tV5TIx8BFq0G1wpariryxWHDT66Vup9YkHvjdGYr1ngd3E7X+UsqW4hhGp+MLQRRv3SexToEFazIWCqqcuFZ1YTtNpekai0e8/X1CvkGkO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520189; c=relaxed/simple;
	bh=gRjENzF1lqbj9nmqwtSdvwXeaHcWhTIjXKxE/9NkEPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UkdUz2egz/QGL0pJGes7tC+NSg8ZXnY+DkUMQR5RJ2Zb5785J/k/GwiCA0j84N7yC2GScC8BX9A9lwLT4lCEKJcyPdJNfFiXypAQ0EJd9/EsbQhxiPHO0IXCmQRIAkx4E57mgCy2G6QNMVuoapf9mIvca94ZXW67UKmMIbLXiyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gUFElABs; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gUFElABs"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78f05afc8d6so120969885a.3
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 02:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520186; x=1714124986; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvwwtJ325ZfoqM3HPbRlOXyIZjp4qomL5UkM84Use0I=;
        b=gUFElABsgNgRMaTDb210I50raU91nCyM9NbYtT9LurZ0ZBwysm4gNjZ/yFyb5YcRkY
         0eDhSiATyNOK6tguf2qKnRbNMWuztQaIN9+YBH0EO/SSKBhLQI/M3kmEEFnN6Sn+XTFT
         FAM3WEGlVEk+evJI7VuZQEqKd+AHbuylPyC7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520186; x=1714124986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvwwtJ325ZfoqM3HPbRlOXyIZjp4qomL5UkM84Use0I=;
        b=j2PxzotsIa2p9F8EDv4RJC0ax5F+ItBp9MUON+0c/+wJnR/rKNEntoL3MRHqyG6bfp
         T2gk4GbBzbRmWaJL/dfp48TGawlDM4sAsIq81HNxSQ4dKiVNEjgUrvn6Dzq7rvx6LjAc
         97U6jQldaekVkOfKDcG5o+eTPIcCIaEF886uwj01oJ5huuz+V3E4wJke7HzWuAYGkm7P
         NAFpYjAg7cQp/R26TucJs49j3fAXuudkMozUbx2+e0Hj8vyx4Iq9/9mbIP2FvyZN2tFv
         r/u23Pr8Piji+lJYak5mtWHJRXK6JEWm9eCBUK3qs2mH72RvecX77XMh4ft3e7c9zOn5
         sEQw==
X-Forwarded-Encrypted: i=1; AJvYcCXSOAI3uYCLpmBgZTO0kUE1XyBcCNET0huNk1WFdW/OCVUw2zo3yRDdUAOpq0SI3h9D3XN2Ch8J0nxFuFs5kee+kmA7jdrHLpiuj50=
X-Gm-Message-State: AOJu0Yy0N055gp0gUFpAAv3B8j7IZaUIzjuRDDqoVLyVWWg1FzqDP1bJ
	kmZsfO054D7ZCq0b08kOIMJ1jbACgp4W8p7O8pqhCavI9p1+QHAfJGxrNr03LA==
X-Google-Smtp-Source: AGHT+IGW/Q/7qXEnuhzqs7M7AiVQTUVEbbMcTlOeO8lJn5AB3n8uUiRJEECQ6N2ghfLB4OyUBOtkcQ==
X-Received: by 2002:a05:620a:1238:b0:78f:1622:5a96 with SMTP id v24-20020a05620a123800b0078f16225a96mr1817957qkj.39.1713520186635;
        Fri, 19 Apr 2024 02:49:46 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:10 +0000
Subject: [PATCH v2 24/26] media: venus: venc: Make explicit the range of
 us_per_frame
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
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

Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
number. Make that explicit.

Found with cocci:
drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..f87e33a34610 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -393,7 +393,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_outputparm *out = &a->parm.output;
 	struct v4l2_fract *timeperframe = &out->timeperframe;
-	u64 us_per_frame, fps;
+	u64 us_per_frame;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -414,11 +414,8 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
+	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
 	inst->timeperframe = *timeperframe;
-	inst->fps = fps;
 
 	return 0;
 }

-- 
2.44.0.769.g3c40516874-goog


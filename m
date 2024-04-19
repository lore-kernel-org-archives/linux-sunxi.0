Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF8812F39A
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 09:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520185; cv=none; b=TmsTaJnLggMt8axB9xqt0/j3OEEVT67XyyorUrWEfIMIwU7/6U4LuJUyBUci0Fvj5cxoQY4Xk//0fWLe8qiQRSAlQwIjJU/hwOglIOGUw5lw2u5EQRjQ7iD1IYE4wn8UIf+xioWkeXHJbj5hj4PiNKCYyS2veQDDUK/8ELj6JYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520185; c=relaxed/simple;
	bh=m351M6HyiT8IWLkyID5itxiSqWILJmFaZ7lxVFnP6BY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtExC/fAU3g/Z/spA7YuRRFACUdPW2hEsdkTBC3lDd48lBzosqqEeyYKs3qPI0wzHN/hGJgrIDndfifD3vVubSHycxUJrTUSvr7n+RFLVn4SGrAFpqBHDnMNIh21vrSPwdoOiTSeuf+eYAh86uZReMFjd3dT0YQ9YWOZBf9pRTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L1NOx4CZ; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L1NOx4CZ"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78f02298dc6so151342085a.1
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520182; x=1714124982; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMpzOFCFY/OFyCB78Iqov2ITRER3c7lueX7XaC40UJk=;
        b=L1NOx4CZoEbTMe5gBDTYfpZ+n5rAqQuyrMvyyze3xItVY+RO8mipxktNlGkeUDIg36
         f9vi32BxCz2qYW1PhvEapKIzKZddJHck9mf0PB+tg9ZWI0CA/Bs/lqo8240B8HRiRuva
         5a7DQQGDl6q0ue86lEjh+TnRRgGwrkFpYH+Wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520182; x=1714124982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMpzOFCFY/OFyCB78Iqov2ITRER3c7lueX7XaC40UJk=;
        b=mkJcNigBqWWit+bOlpbvMSSlXzK/J2c9EG1qk9A/aZUU5Vtxog8B6LiqGJ0qwixH8w
         9jxLCQQKS5eNHqnjW37pM0K+Alg+Mlww97ghlEMCbW/jx7S/rSmm1n4UJ1qBvLlgRCB6
         6w7JGm86Z8CTQU42p4IjWYguvdjCL091CQc/zMVXRphF54xLfAodjjW4U2jq0JiA56Hv
         bv4O3uskgKckHfrMuFphQqkwDbUz1Xs6FSwKztLAuglos0v9G4NgF4WUGmJj9pjoYfE3
         TgEwzie+1f0oQk8SZQpe+/Znk7SgGzzRngypYLQRtNNXrHCeTQZbizKkdEcdKSpGwecJ
         LacQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9vWOc9ZQrtJY+H6bsqAlby0ILzNPyl4tF9kjgD0qBr2wY0vrYH6HyRooxfRtm9ZQ5W2nMlQsFIONx9B+uNKkBWhr5vlq+M0VbrEM=
X-Gm-Message-State: AOJu0YyflATf/vKXufCXq3WQqVRueClZvbtpGPtHp5TcXG2Fl7/vtwQS
	N2obikJzCeJ5mn9hIp5MF09VAt9dRvbFUAnWCoSEfcoPRVrWPrv8pU292YZb6g==
X-Google-Smtp-Source: AGHT+IEXhcUKUor0dxuV3thvzJo2y+QPxtJebfEt+tWOQcWOyhTJf9Fve6oWEuZlRhBFIInhoP8+Wg==
X-Received: by 2002:a05:620a:956:b0:78e:bd2f:1088 with SMTP id w22-20020a05620a095600b0078ebd2f1088mr2994401qkw.4.1713520182200;
        Fri, 19 Apr 2024 02:49:42 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:06 +0000
Subject: [PATCH v2 20/26] media: tegra-vde: Refactor timeout handling
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-20-2119e692309c@chromium.org>
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


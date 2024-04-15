Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BD8168AF9
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209711; cv=none; b=GRBCPkIpbvw8Oa0t2wF+8MIksMRhm0C7wqJ2Z5KDt5LWw+Dy0LtSpQ2vEcjwjYElwIJnSjKLuXEu6J3KGUrAOhOfO2Fks8iQNCV6G3xgUXTsj3dxqKjlUuGN5Eqw0MQosZN+AGaFmMRXn/9lEnyge+RIis58WKFLCAJqOq9XyMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209711; c=relaxed/simple;
	bh=h0c4cQBYAKG+eCRXK2bSjQ0k2ogfrTqHDn/vqghdbGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJNd1zKH5TWFzw9lq2/iBCTFQxU9GHWxx2jeI9mIZBwcj4MJTQznjGBZleOH4VDTM5ZvhO6gP7OXp3Nz/z4EHImUmazI47zTKJRYkL7bID4SaCMA4JrwgfCB/SfQrl5xKcjsQpu5twqRLQDtijuUZdoI8Gh0dULLgzqONlglAOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VDRVUQZW; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VDRVUQZW"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78a26aaefc8so206591185a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 12:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209706; x=1713814506; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=deJ10dD0+0Xsb8NjdDYAyKNbuwQhOs8Vh4XFupDcv7A=;
        b=VDRVUQZWOJJaW4Rbx3YCU4+wQtSXJV8Gb4eIq1Xr3JOP3/8bkczvmM1tLYKGQjM+iV
         NyP4pysDOqJ2ptexGyk92vIg2rUJSENiYIlF8WlKnbMACvf34jFoep7Q2cGLXEAHehDX
         e8uvAl+yQ1TGcQOqB5n6yP1i7OWWnc6wvVe6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209706; x=1713814506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deJ10dD0+0Xsb8NjdDYAyKNbuwQhOs8Vh4XFupDcv7A=;
        b=dRCrfFvP7z2DXVKg3q6nQEOzBKOZ1Cb9iFwUUf2EO9qFO17kn5q4te6q8WIKnEFLHW
         12SoHET+OHZz7xEka6RxkJcKyrgmC2kTe/X3RaicSbgS6J+KOCJZCB3vQ2SVAlnVjLcc
         R0pZHeL9fxaS1ORRf6Rz07RA9uSB6CVjfSPy3Crozli+x9woQTS8JjPlgiyUJwLaHCWl
         riDMo8U7PIUaG/TWxJNDJ0H0d9ujyvZqmdsegH4G7cxw/8uVSZa41x/GT2Xi37PHJpIp
         7ZVF204bJMP20lkOHlta65KQXKpdzUs6DPdCG2PZlKL7Whkt1XRcIl1zR9P4HrKkvYo/
         9I4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlF3RtbVe9/S5Kx5C5w/tYzMBcnvrI19QIYVlEzaQxhKTQErjOoCTtf7j+429JST0cjDjpH2pbWakTiQlYEBpjKeWuJkhdF729ko8=
X-Gm-Message-State: AOJu0YxzUaxzdQsEp8rPaGnNwELVHLj36tJraQ/iSaawLHRnrUlit4s4
	w1FUXcfZgiDfVv1ipVRQesEyJOZj5OYNwehpV0JilGJqT9MNmUFP81Nwq5/HXg==
X-Google-Smtp-Source: AGHT+IER1oNXbfvuBYkiNGhDuuE0aNBQlaGZ+2a+oyzSSefdjaOmTqtivonyQ4TeCmkM1b+mS1nfvQ==
X-Received: by 2002:a05:620a:29d1:b0:78e:ef0a:387d with SMTP id s17-20020a05620a29d100b0078eef0a387dmr2507242qkp.56.1713209706006;
        Mon, 15 Apr 2024 12:35:06 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:51 +0000
Subject: [PATCH 34/35] media: hdpvr: Refator return path
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-34-477afb23728b@chromium.org>
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

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/usb/hdpvr/hdpvr-control.c:41:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/hdpvr/hdpvr-control.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-control.c b/drivers/media/usb/hdpvr/hdpvr-control.c
index 37c53ab85b30..a1bb0231540c 100644
--- a/drivers/media/usb/hdpvr/hdpvr-control.c
+++ b/drivers/media/usb/hdpvr/hdpvr-control.c
@@ -38,7 +38,9 @@ int hdpvr_config_call(struct hdpvr_device *dev, uint value, u8 valbuf)
 		 "config call request for value 0x%x returned %d\n", value,
 		 ret);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 int get_video_info(struct hdpvr_device *dev, struct hdpvr_video_info *vidinf)

-- 
2.44.0.683.g7961c838ac-goog


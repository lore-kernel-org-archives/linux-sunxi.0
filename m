Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974CE16193E
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209703; cv=none; b=MMnzP8NgxXKgz2BclqW5knednlGr1XGVTrLFIwppjtt+/KvpBVeB7TggLEkkjmDXp6gjlWDKVmaof+5oSQsO1AwU3uIz/s7ZoMeXf7HMn3Flnc325C8mGqmrq11ZfJxKxnhbFXlZ6rRhw9q2vl9DQQg9cj6D4TZeP36G1Dxg2uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209703; c=relaxed/simple;
	bh=FLhv08563J1Psy0r1V7CQ6B2BdCZZA68wZr/ZwGdZu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ss7p+31tQzicte6LMT/FWY1nOpPUqKODPaiZqGBjt24Hc9m9QgEUY6bZ1jhFkKizNkaY/wajZftsF1C1R/4AW0ouojg1ZnA6pC+5dQOxp9SJLZbotzHZlanysv3qERTqeTOwklcLaZ4CXd39m8Bq3RHxhMiUNHWPdQgEmN5eUhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gH+xw0Ze; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gH+xw0Ze"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78ecd752a7cso221952285a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 12:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209698; x=1713814498; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMZCcGT0at/n2sdsTlaxf6HXRDJtJnjvmf8GQe8Iq6Q=;
        b=gH+xw0ZeJKPPqLX944zxyXRWF9rvGheTiqm0s0qO5jyz/apTw4MdtK7GJBbGSDNaoj
         k4wDj/hCx0jaPO2gco+N88SctD7iEWFCkwwLJaCITqqCg7eYyEH7t0tEETCa6wPW5KYu
         0GT2KuxyfXJoN6n8DQVH0DRSeKRmmS+YQ0oBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209698; x=1713814498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMZCcGT0at/n2sdsTlaxf6HXRDJtJnjvmf8GQe8Iq6Q=;
        b=o74G2mucdm6NNKBmteD5FFBpCUVPbZFfV3RnVSJFHB2d2FD9ql09eT+cVVISkkmnGE
         br7g1oDRlSKnMwfLP4CeCAM4E3uwtA7cVhKBxa48Gk7f8P8D2EljUjhXPw85QLB8H29b
         6xX2Oq0O+CT5mT6G5q18cLh1RQoyiYOAGWiLMi5iDy4XoRrsXWZts6is6ePmWBi8Xp6d
         YdytILeXqBjU6CjrWyyO8c8hqfbI1zZ3EXuit9Wm9gv5LX5dxnkZU4GHtYymZKMG+fgb
         jcnax1nOP+N7O6FY75oelNyYwLwoCsOH6cEJCNwkzcpFwLew5cPJLYBIoNwo6PlaVxhL
         P87A==
X-Forwarded-Encrypted: i=1; AJvYcCV1tTwwlzj3otRrp46YIDf3beBDECFO0PfGrMa5lIKCK6Dww8Qn9FWMKnB8wmX+LFAopbezrfANY3d+smrdca1PLCLiiLWFudtrKb8=
X-Gm-Message-State: AOJu0Yy769DriAVjjD/QhP56+V4CtYb68PZQ5Ax6plRnmWXsHweZCDxr
	89Xrki1Q5zr9LgQ00VK7+ttTbqxydACezUJG0BmQnbSFa3EjUCyA8LdmIFNTUA==
X-Google-Smtp-Source: AGHT+IH3ksUcYlN9cp0k1WPEjfsSCCPteMBHE8e8FR9KC+RBDbDTxTGGbvdceo3EwW9xNOFzS8IB7A==
X-Received: by 2002:a05:620a:469f:b0:78d:66b6:a786 with SMTP id bq31-20020a05620a469f00b0078d66b6a786mr14598431qkb.35.1713209698470;
        Mon, 15 Apr 2024 12:34:58 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:44 +0000
Subject: [PATCH 27/35] media: dib0700: Refator return path
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-27-477afb23728b@chromium.org>
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

drivers/media/usb/dvb-usb/dib0700_core.c:67:15-16: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/dvb-usb/dib0700_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index 1caabb51ea47..b2ad2d0f76f8 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -64,7 +64,9 @@ static int dib0700_ctrl_wr(struct dvb_usb_device *d, u8 *tx, u8 txlen)
 	if (status != txlen)
 		deb_data("ep 0 write error (status = %d, len: %d)\n",status,txlen);
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /* expecting tx buffer: request data[0] ... data[n] (n <= 4) */

-- 
2.44.0.683.g7961c838ac-goog


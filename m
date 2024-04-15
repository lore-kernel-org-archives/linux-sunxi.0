Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D42415FD1B
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 19:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209703; cv=none; b=HLu9kNtbkqubK6JE19OOgcQX7ii8PdtgcY5H8hj1DvyM5EUTwDBRb0i6uv2GnlNP3khrL7bvjTk07IWdfZ0xu46tQFX/J+uBqTF1E6lk0IbJx4qXIzKzi1unYWkNbNbZfKboWDoKfi83kQDcRis/QJFbreLEEDoWhYviX23krT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209703; c=relaxed/simple;
	bh=z4PclDFur+vwHypm0cCW/dzU3Xu+onrV7HrMrh+lG0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUW2V7W66Kc5BuFzqRgqob9Q9nVVF0XRXTPTwtOT284OX2SpiQkHFcpAaEERz5SgR+Vx0mIVqQGHT93Q4UcJSk3ctO+Gi6LhmhPws5qSZaQcITNY4OcuJ0QvxmT9sTHFepep0YsNAGY27whJWIYG102RmA4Fp6Mgi1cHqjNWvtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mk1TSwHZ; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mk1TSwHZ"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78ecacab93bso327497085a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 12:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209697; x=1713814497; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iRxS0Wfwa66zl/9FdFOMvCFtgSuuwnNLZrwXVx0B2s=;
        b=mk1TSwHZWPHt7Goa9mSWtTBL5NVS9bmDgOAdup1JMD7JrA8YQ09iVyG/HJN+jY38XS
         PHG6wbfB/c81494KsPJj9XBbwoROZm54JLbfyD2ufCAshfP4kN+TOlnw5MSuvuSfsej8
         qdBzBYQvUjyHjNDRzm2W/Rz8wYYLZIkOqvoX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209697; x=1713814497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9iRxS0Wfwa66zl/9FdFOMvCFtgSuuwnNLZrwXVx0B2s=;
        b=d11xAYBse89Vc7fBY1E4ncK43rkuBk6/0K05VQ/L1W+CIdOUC0u3UuAdKaQzwl2drP
         OdIPXIdmA6MhziRNgC3sk3O2ErMXidhXezx4gikmq24vy/MGAwvAGyCwb8DdG4HZsCi6
         7w5py/SH5MIV48d16zveNVMm6nY1WCSip4tDG/T+P7RLKRMr2jrEOcXz9Z4ScF3Y41K3
         yyMIE1CMGWa3/X07ThraOFfd27CQK9jGF1haJkETnNJaQoVGLauLy6+9kDU1t8uXI4aw
         Sa8tXRDWWAk/TK2X+ad15b2t2YOAWUWPCm9wkUGjdFICjU4+Fki0AdhyXXrgrNy5d97z
         AXEA==
X-Forwarded-Encrypted: i=1; AJvYcCXwwkjC7PBpRVc1s/VmclJYHMnNLt+RbilataD7VewtnDIrWZe8HGyiLIoX02SWd506MU2jiAjD1JwQYrAfX6sxu69cm3aAMWr9dj0=
X-Gm-Message-State: AOJu0Yz351MR/qYkTUfhZ9qbI4I0iODDfaI2DV/MHKuzRd+vAjCD4Bzc
	8hF0bVfl+OeicboCsd5VpW2XOWLDkPzF7EHcm75MnjKOYpP0g71VeMRHHEusTg==
X-Google-Smtp-Source: AGHT+IGwiJ5/vTLqYTTLWbehOkrG3Z1CC3Ai73ckOtHPinOfOxtyAdhFhhrjbccK1nhZt1UUqJLF7A==
X-Received: by 2002:a37:e10a:0:b0:78e:d2a6:63e0 with SMTP id c10-20020a37e10a000000b0078ed2a663e0mr9260421qkm.4.1713209697430;
        Mon, 15 Apr 2024 12:34:57 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:43 +0000
Subject: [PATCH 26/35] media: venus: Refator return path
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-26-477afb23728b@chromium.org>
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

drivers/media/platform/qcom/venus/vdec.c:672:12-13: WARNING opportunity for min()
drivers/media/platform/qcom/venus/vdec.c:650:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 1dffeb7de76e..2bc7aecb35e5 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -647,7 +647,9 @@ static int vdec_pm_put(struct venus_inst *inst, bool autosuspend)
 
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int vdec_pm_get_put(struct venus_inst *inst)
@@ -669,7 +671,9 @@ static int vdec_pm_get_put(struct venus_inst *inst)
 error:
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static void vdec_pm_touch(struct venus_inst *inst)

-- 
2.44.0.683.g7961c838ac-goog


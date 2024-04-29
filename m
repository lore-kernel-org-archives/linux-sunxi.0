Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0EC12838A
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403124; cv=none; b=V/fEdo4RGXxTGSbYKSks+eRjY55H1ajObotm8TcwX2kMsZOIRduvcwp4HdMVvObfSj8IV2XfSleMeqcevgID6Q2BPGLwsnB0yihtZQ2pQiKMjhAzcerogl53jGEqPV9Jo7nIsEOy129CTDjlxwogkUVFgxel88NIJcvdjMv5FHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403124; c=relaxed/simple;
	bh=17e3seaVPIolCVRnz9dvrXMTILwJmsuH1BK6VcvWdM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZiCYnUEqu64VFB+Fd79fri1NYFndsIofp7rC6v7e/MxS67U25ysYkq5wmTW4rCj+ZBLHyjt+Hi1fEb9kUwK785Gr9RnfIjgoptm+G5dbTQfgxKMjImc6vV9JdiVpEhzCegESAlUuNQgqIDg9J2dO27pjEVZjSvBfoabA78GsMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WrJjTdcg; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WrJjTdcg"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78edc0f9636so308060685a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403111; x=1715007911; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STqazHEagBxWlHC69lQFp5WbvQ2Sdx8rB6+uKcUB0cU=;
        b=WrJjTdcgFXzhMYcZ0zkZ9bJk/1MICWQ01Q/OCH0piecAlKcsbmCShyvHGipEOECNNQ
         IAj2KHf5CX/tM32NY1d/ewmA45BZJSz+oCaF2V9g1aUjvtgXDVyZw7NWplTWbxPgG8sU
         FpnjoejH/ME1Ova4ES0OocnIsmMbZolmvuceA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403111; x=1715007911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STqazHEagBxWlHC69lQFp5WbvQ2Sdx8rB6+uKcUB0cU=;
        b=LeXiwXNf8afplJOOetw0jIdRwSvFiLrb0R7PIRhMhLUhJT1aucdwMDfoCncl6txfHW
         h5sdqdbcOgf6M92nQ/KkqQWsAQn5j0BLhTc7lyGMv1gX7Ft18wlR6qxtTInf80T9gHP+
         MOUfUNdqt1Jy59d2/Z0PUZQ9iERvz8GZ1MyWnIAg4ac+mrA6ePzFhZUGXolfQk7CToXe
         lpaDkXrNqmm0D+k/1HpwW5Y1ZmLko9cWg1BXmsFc/M2vpi1nNmc66iJvtJvQxduROgR1
         HYmOIBRjrYuqXR7x2qLvv37U6nnqG5Wtpn4BwsCONCgKueY9vLqnCWu1YaYp2h9DrfE9
         C2EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdZVE5ZlrgpqjqK7AvrUDyEQUx4NjDzLdtQlBmoEXX8O4/4ik2cNrUgzz3PUiVO2YjK/fvdWjP93/7RyTqIDv7pdqY8QQo0K0E5dU=
X-Gm-Message-State: AOJu0YyF/wOqYLgJp02Zd6UXv6v4SVWq91cqX5wF7bqsHzTTJ0UyY1Dv
	q81+WekAXn/9OloRFPLVm2UFiW5e/x9PdPPhNwUcsE7AktgxbGcVm2MALFuMqA==
X-Google-Smtp-Source: AGHT+IHvPitwm/34xW/kQUa8TA8n6UCg3fwO9ex2lf7MaH+MC5XxlTHiUGq0Riy9QnEe78dxXREmpg==
X-Received: by 2002:a05:620a:5e48:b0:790:c81e:7840 with SMTP id ya8-20020a05620a5e4800b00790c81e7840mr6919928qkn.12.1714403111405;
        Mon, 29 Apr 2024 08:05:11 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:11 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:05 +0000
Subject: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range of
 z explicit.
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org>
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

We do not expect the sample_freq to be over 613MHz.

Found by cocci:
drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda10048.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
index 3e725cdcc66b..1886f733dbbf 100644
--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 			     u32 bw)
 {
 	struct tda10048_state *state = fe->demodulator_priv;
-	u64 t, z;
+	u32 z;
+	u64 t;
 
 	dprintk(1, "%s()\n", __func__);
 
@@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 	/* t *= 2147483648 on 32bit platforms */
 	t *= (2048 * 1024);
 	t *= 1024;
+	/* Sample frequency is under 613MHz */
 	z = 7 * sample_freq_hz;
 	do_div(t, z);
 	t += 5;

-- 
2.44.0.769.g3c40516874-goog


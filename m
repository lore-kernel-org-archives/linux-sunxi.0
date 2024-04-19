Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B139A7C0A6
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520163; cv=none; b=Z4M7pL6EXyIi2AuJE4NhTGVAxxVmJo43LztDnWG0udB4V6H6bXj62+GEI17mrCJ/d2kaBk0fWMqwo0dhbMcnqAfaAzTRmeqFAxvKhvvKD2A26XgMhSdY8MIU+c5mx0du4gZmIODGHibff3ArIzYEhGY7zb/icebYoKvL7XG4uSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520163; c=relaxed/simple;
	bh=Oy36FoyBGe72y+nQ9C/xUGn3HkAwEUaNB0CeLr8vc+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tk686wlBrmrbv1dFItW/nV5llZ7mWAl09jwNoq5yoTchg0I7Pwixhrg0BT5vXc6sjKSopGHyM9qfEY3WdPIdgriJVtMyQdzxxz/gxyjEpYsoX4Hihm44Y3z68g/0fpe8n7Lno2+7THwm2E7E/a9vkulnt5hLAm8VDzGDNGiNShI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hLwccPn9; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hLwccPn9"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-78efd533a00so105605685a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 02:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520160; x=1714124960; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xe5eM9+2rh+qYMrEZDkgx2/xN2LnDn/yiZVZC6+s6fs=;
        b=hLwccPn9sKiqP6slTL4MXuJWtaZekXqj6rVgv4Kb+GDkaxjwMsZZG8zwc/udEQKZwZ
         z7WC6mJitzczJqkY3TWcXEC44yB7Eg+tTWUdoJcbXGuGAR0S01HkS9I6Dpje+Lyg2F7i
         N/3Y7CjUHNP2UstAMFHv3qSajayukkq1wZC8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520160; x=1714124960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xe5eM9+2rh+qYMrEZDkgx2/xN2LnDn/yiZVZC6+s6fs=;
        b=jG2Kyy8fH1sxWB7FukzBgLmu3KftFwVKCAJFCO4whvIK3dgNfezADJX2evqSDWFbOy
         ai7S9UvcUo0F9FKh71UodoaTw97r3e32g5jjN49FF4bbx77uasNVhXPWUeGKHpezQNQb
         0MXQggp0im8J/VniMoCKOZ/EqZDX8Avt2Sqt39i1Mz9hbVTxzjlq0AADC3fwJs5VM2Au
         KTKu0x5hwWLZYyOwx/uwSIEoB5V7o/FyY0R3T37jA+NaIsYxaW7IiOi9HHMWnf+ItE7w
         9NeDCXGVRELgcS6EZvBw2MkgiFsOoStIouNiw6lCAYjRrmy7k0GhaUySKAU0Eymu5GY0
         C8og==
X-Forwarded-Encrypted: i=1; AJvYcCWYIBR6/5ZLpLXCRGUaqrqcnh7UBZo9TlZSsxCktmLclIetRJB4LH5R0q0V6KrEFnPwwe8VjuyBbk+aVbh9mbmOfbFgfF3RwoUjDzk=
X-Gm-Message-State: AOJu0Yy0U0L73qflhgUJQ0+CkveMHbyu3YLW/DkUy5CVAj1wnjYSMqac
	K5/gYtRgfIdeH6xJxGHJU+Pc/QUP2BY6sWCp88TGinf+53sORKaq9JN+ANSfUg==
X-Google-Smtp-Source: AGHT+IHKE5I6bNN/ygxYDQdIMuWr0dmGCsznmTcTgLl7Ioa5cL0u9qYtPjL85KqnZCORUNl4F1qURw==
X-Received: by 2002:ae9:c119:0:b0:78e:ca95:81c5 with SMTP id z25-20020ae9c119000000b0078eca9581c5mr1646405qki.77.1713520160591;
        Fri, 19 Apr 2024 02:49:20 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:48 +0000
Subject: [PATCH v2 02/26] media: stb0899: Simplify check
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-2-2119e692309c@chromium.org>
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

chip_id is an unsigned number, it can never be < 0

Fixes cocci check:
drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0

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


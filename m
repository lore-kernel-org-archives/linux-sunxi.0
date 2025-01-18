Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D88818A92D
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 10:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737195754; cv=none; b=Vu1LMdTA+uMmu8TED7BZJMly7DJpp5VMgO4ABXOuZedRyYzB3tsbFM7p1wB7/77P4FvHGNMmwZE1cpbMZinBSh9bQzJYIgkXi+LXrJN7n8YizGcBy5Pre2Nd9MjgsosjyJjiF0fWYrVLZZehUMT+PSOdyi8GVFDko9KJeU80wyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737195754; c=relaxed/simple;
	bh=KH61Ntbej6x6hpnhYA7V3EmwG8gbW+jqFlWy2xKqc7o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i4i0C1wI6addCrg6glYYNpci7NBCMXlHqDw/aZcAT/5TZByvUwvJF59IzdfDKyPJ22EqwSK+Ana2NkPphHA+iw4d6edXVpgZSsto2UD5QkUbU2XcII96qfMOWlKsGw7y+WepsxmeYViDlsk8+WBMli2ED+Cs4SJHvwmkTGu2ESY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQXfJI2G; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQXfJI2G"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43690d4605dso19370275e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 02:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737195751; x=1737800551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nC9ffH/nTNUFv6K8T3S/PFYpK8wABX0lQdic/jOeTiU=;
        b=HQXfJI2GTI0skzcsvc5Jwct7uX+axwA43KiD/OcsL7lx6MtIGOJ+H05G3aVaNHzj4j
         z5GuJr0fGR9w2/mOFkeOMKtuIWqbRTRKaVrXETwAdcJUEedP5nHmjZho4ECsk2khkjgf
         e3/rK5C4fTC4+AS5ChjKNW1CHEleYlc/W76rL2iXJmmRmn3JO2npwx5wL2hDqw0x5Hb7
         RQ/tMZX+RFfan1Vpzm/qVdnsOOEyNVdlse71JVK6NChrjjBfwpVfhyqSaJnnb6XypSoy
         T8k5VOB4Me8rVginhoBzsHYJv8k9mf4UWuVzkTlSjdLq/cLhRjq4ZpEPud1egIo9hT6k
         1VRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737195751; x=1737800551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nC9ffH/nTNUFv6K8T3S/PFYpK8wABX0lQdic/jOeTiU=;
        b=du5/6Xk+g8UZJOOeomt+whGDZvhF2TKMjQxX731/3tu1uVNvfTpHLuMbmrL+AVDGCz
         U7Sjd0f/KU9FhSn70z25aYBUoSRMZ/fVuBQm7WU0DIM/D26Fevnx4aiRcBmhGuGr0VAO
         Ur7PA6VWVb5ae/mv4Ed1xbJNg4GjqcCz2p1qd2Z99dfSuv4AMKsXT/P/PY/V4dHd5vg8
         TsVCno87DjNjlxx+kk5esNAXO0aAfnPUGhNq7xm1s4mnPNpvlCfLKCTjXmogfyqs1uFu
         HncX9JeA+58o8ySMTAnMQC+Uit4yEqEQZePNBFD0AsHg+4rOqPxu9kzo5iApAidSU7BK
         kB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQOzJpnr7C0eVkpD27x+tuHxtV0vx4AlOOYEqqSWBmsD72/cnJtSP7Us4M8DQFpCw+m35mel68txTpaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzacex2OUvCtjwSEzysAwK8xQCcCHIn2JJB+wxmBCC7AmBhGSI
	QYp1W12k+YyqYrCCfKc+rI9sU8kHscpmLJZ4mbEabjDFUIFWuMQsP8OpZSGM
X-Gm-Gg: ASbGncszPHvgn72i+8QHA2hmr9bEyWqI5QSU69G6NUK6ectE4nGnZG80TgCyrqL42Ye
	pR1sSmNexIcdL2MNwQqLTAyV0lxpuMAOWUrBO+WRhywUj9BIAZSwkba0BG3kVBu+AbcvWeJoscK
	wS4EKzqN9TrluuEmbF3gpBVAJD79PAwm/EQ3G7UmEkiD6ilVcBnHl9DgXP9dgavD/a4EMorkMZ8
	WqHWnVZwWigNm67owyq2XftEex+vQXn9d8n1FWtGG1R+GAy6e1+b4D5OEeoDmE3DGOO4iRs2DIS
	E3tloCxUdTnWipPtt9Ke8mCVQFlCS3LGRsIPX0kHktnGd3gLZ+Xrs6/f+so2sAD5QJI=
X-Google-Smtp-Source: AGHT+IEzVhZwb9RUCfq/ONUwCHiNJip3Q45A/4YRARL89NaJTkSBtQ24v5vFGO4m8bxs52aAynsUuQ==
X-Received: by 2002:a05:600c:5101:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-438913c85e0mr55777645e9.6.1737195750502;
        Sat, 18 Jan 2025 02:22:30 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904625f5sm64954515e9.28.2025.01.18.02.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 02:22:30 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC PATCH 2/3] phy: override dr_mode for phy0
Date: Sat, 18 Jan 2025 11:22:05 +0100
Message-ID: <20250118102207.9339-2-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250118102207.9339-1-simons.philippe@gmail.com>
References: <20250118102207.9339-1-simons.philippe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PHY0 mode is fully determined by the selected mux route.
Ignore changes requests from controllers.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 24fbabe7a..f163b355e 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -544,6 +544,18 @@ static int sun4i_usb_phy_set_mode(struct phy *_phy,
 		return -EINVAL;
 	}
 
+	if (data->cfg->phy0_dual_route) {
+		/*
+		 For SoCs with dual route the PHY mode is fully determined by 
+		 the selected mux route (i.e. USB controller to use).
+		 As both host (EHCI/OHCI) and peripheral (MUSB) controllers uses
+		 the same PHY, both drivers can try to set PHY mode.
+		 We need to ignore this requests, but not report error in case
+		 of valid mode values.
+		*/
+		return 0;
+	}
+
 	if (new_mode != data->dr_mode) {
 		dev_info(&_phy->dev, "Changing dr_mode to %d\n", new_mode);
 		data->dr_mode = new_mode;
-- 
2.47.1


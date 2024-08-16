Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B761C6886
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 17:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723828369; cv=none; b=TCbfG56JuZ91vqt4Rh2UMEH2bGfsJuZqATtzW+sX17b6GriyBJWeaoobhbLz//PxR6gWDIcBcCzCla2LSye4WnufPQ1heysT1shyyYCnw1TLi2QGU4tzqeelXVU0qJypw1ddU6F3Sw/QmnVxvuOT6oEB+/HD07YaSaufBnAYiWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723828369; c=relaxed/simple;
	bh=BJbAOhfmR88tLFChbQZVoqdcx/W/pQUrC9UyjkKSkb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LKyXRyK76rTaD4bNRXOZi24W8irPhM4KG9tiwfYHN210pyZ8Hp26YAQb7/7kM/uBOFjpxxyZLtIJsH8EDrN/KRGHVVS6oVQBt4VWcNdpd3Cu3/zpvY/ht0HWULktvdAaO75Ter4q2yEuSzjJjAAP1WNGRGtkOte31eCWfMQ6S/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dc1nw+6d; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dc1nw+6d"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70d28023accso1802588b3a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723828367; x=1724433167; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gdy9zSqWjuC2tMQ6qbmA2POy13/um9sPqP+u934ObRk=;
        b=Dc1nw+6dR987m6Ct/1v5W9Z4UDq4zvHN1bWY57U8gqBzc72ePZxmWEJJ0FAKS3RMSb
         14XFHXGyY0J13+5t9eFAMKr45THi8tEzDevuhkf+CXN2DDVPQFVgstI573aTufhZP/1F
         Ih50hVvmB3QimoKg5p1b2MsVZww+/RA/GF73gIAGkyzeT7lqfeHFinbd3vQd3MoEqwWp
         CHbm/5RinczUy6gq1zZC4h2fTE8424+z8BD1sbyHujkpdmELtUtOxC5a+ElBTuDlWneg
         6bJE03u2GYACYiCL0H3KaaypFz/R6pKV25wBOCzxdgLFQdFVpfRRB0K/ihpwEFyN7+HT
         cIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723828367; x=1724433167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdy9zSqWjuC2tMQ6qbmA2POy13/um9sPqP+u934ObRk=;
        b=FfbS5CIAiCa6794itUDtZeT2ujWlAIxOnLP0seRKHefEStE7M7/L1H9qUhe8mCf4Jq
         FCcUq+WnX00wvtd/NNZndV+P3QcYBFEOVm+Pc9uwS+zHGYg04VslVRTMBVSmRGCSDm4k
         t4tXofhAXj9SA9a82rh+b0W09KrZq0EWiGJCW2W189D6dIpF4hZL0bzW+eeAriTQJSqf
         aVr/G7XT6/p/8W+cbRUirDzrTJJ4API88QMr7SvGu72RtZVGiOGaS/diuHxBNwVvfVcR
         4P4a2mz61ygZ2mNuXRwxhbu19eloTa+FlyQkxpC9Om+PbscMeiTTrZewdgBGk3gt+2wp
         mdOA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Fixy1WnCQD9bBmSGo2YKqOmBrmhKGoNiUttAc6NxExoIW9PyekjmUTnW9kAF2g9LvBefLlDT+pGps3nwu+qR9dC5zScSKZ0gD+Y=
X-Gm-Message-State: AOJu0YzaxHQlIs4njrAgfpanJAEbcMk4YT0cZtyHMGJpJ45ubC+L3DR6
	D5w02G+UoSn7cIrGbBBMZKBjgmNK0IhnN46jLK4K90YDDs56EQgU
X-Google-Smtp-Source: AGHT+IGksQuXa1bgiFvGegX5wQp8wdValbEh0BdyCcOBVJ1wMLE2USqtsc8QY2Gh0jFU6u6YMS+NPw==
X-Received: by 2002:a05:6a20:6f8a:b0:1c6:a83c:d5db with SMTP id adf61e73a8af0-1c904fb49b2mr4408239637.31.1723828366480;
        Fri, 16 Aug 2024 10:12:46 -0700 (PDT)
Received: from embed-PC.. ([106.222.235.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add3ea3sm2955952b3a.16.2024.08.16.10.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 10:12:45 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: sun50i-a100: Replace msleep() with usleep_range()
Date: Fri, 16 Aug 2024 22:41:29 +0530
Message-Id: <20240816171129.6411-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep() with usleep_range() in sun50i_a100_ledc_suspend()
to address the checkpatch.pl warning. msleep() for such short delay
can lead to inaccurate sleep times. Switch to usleep_range()
provide more precise delay.

Fix the following warning from checkpatch.pl:

WARNING: msleep < 20ms can sleep for up to 20ms;
see Documentation/timers/timers-howto.rst
+		msleep(1);

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/leds/leds-sun50i-a100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-sun50i-a100.c
index 119eff9471f0..4c468d487486 100644
--- a/drivers/leds/leds-sun50i-a100.c
+++ b/drivers/leds/leds-sun50i-a100.c
@@ -368,7 +368,7 @@ static int sun50i_a100_ledc_suspend(struct device *dev)
 		if (!xfer_active)
 			break;

-		msleep(1);
+		usleep_range(1000, 1100);
 	}

 	clk_disable_unprepare(priv->mod_clk);
--
2.34.1


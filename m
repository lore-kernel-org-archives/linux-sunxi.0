Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBE5186610
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509880; cv=none; b=pQvprfmGB6QOsQDBY66aHVbCf6hP+1FDTZvyRGBfIgOSzLEUIRmN+UUMXKxdo3c2GvNr0MCovSJScqEOPET92Lb1k3cwlqKXetUv/L0Eb0XrsaCiyXFzzjuLy7HRe4FwJgidezDK//4TZhXRW1/z+e4f9nHSMl0XUujvVt3w3ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509880; c=relaxed/simple;
	bh=vydiQbG1/1szEzLjhnhj91G7z0QVE9gqOa1tJ68qVcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFIZrdL78lkqYmd6eNDxMwo73TpEfehqKC8HUo473g1b0sAHrN6ZH15jjnJOOWnLYR+8UJ6aAncX1nknFKfY+R3Sbm7Vd9hjzl9UxMz5zp6dBEBmff8pdrLBV0kq1o/oSfeD94HwYEvpqQ3RulItkW8JBUb7jlLZb5VuGh5RcWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nv+xw1b7; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nv+xw1b7"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-27045e54272so205426fac.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509877; x=1726114677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mdzi002JGx1/VTYSFinhnta06n3PxzWkqyJNw8JR4ro=;
        b=Nv+xw1b70/O6dyewmISGnEgI28+t4OP/KMXy2DNF6yoKuofpX1wYBQRtHSd5MQbj9L
         vQKXPzO8okDBq34/+0kd6NVQYVKGyxhhkUkCHBuiao82LsrkzEltv6W77RpQA3eVtkMC
         uJYzMtSRKuVCjYKnL84q/kKfMHCAqrPtcHVA0x8a0WwmBcU0MoIBUGKZMNTwHFq/C19w
         7pUZyNGQmI/Wd12otHSjEv2pd65YCn20tm+oyV61XbfIrPG+7THjCYoo62Fj07G3Er2Z
         HMfjagFoIdicccrq6k49ubDWXRAJATOJ02QjbvK6AUb//3b8yHqvjLSkM2oh+i3PXQ4h
         /Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509877; x=1726114677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mdzi002JGx1/VTYSFinhnta06n3PxzWkqyJNw8JR4ro=;
        b=ri073Q7/nELidsiNX3dsUoHvupBXhjuWbd+8oo//ytInihHoaO/IkzwTbiCvlnyutX
         Y82BlHijgIZbwkfh9MSxukb+5+1bftImZT9xeH72YqIKN86IUNXZF7SlrNXzhNqZS4xp
         FhAUiXbYaTi35OlTvFw8E0Z9VteuAweNTl4TVNuSOb00LqM5dO3aEUhQQuMiGp5jer8O
         AAvEqGeLw7CfYzqVp7qsO3+JtF/jGtGci6zLZtvIbNDo/Lf4es1Qu3tbn83TeRU6ZKID
         TvsYbPpGWAeAWlpHPvTg/xZPFwN6chpy8zZPwvUgAKvGL7+Q1mYC00x8XyP43rpgR/xj
         1pfw==
X-Forwarded-Encrypted: i=1; AJvYcCWisFDzbewwXFA6ciOEKshGZEpENnfBUUVW8p/yo25XuXB26ieG2Mn4OVRmtu6X0iuyaAHQFS1CX5SEjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbD0D/tDhBGCmS8vs2JiToU6eJKQ7rxSAnTpIYz8oYJYfKpnmv
	omT/LWrJppJbVZjVS5rWAApf27YXxzCsEzNOTOTQZM8nB8IwXadE
X-Google-Smtp-Source: AGHT+IEeegP8PYdaxOx1oJdq99u2b/mnBeID80CKAiS5INtYMrMJc2IOIAmttT7NOBEVZS4HWjLcJw==
X-Received: by 2002:a05:6870:3d8c:b0:270:1dab:64a9 with SMTP id 586e51a60fabf-277c8055c7dmr17330298fac.14.1725509877129;
        Wed, 04 Sep 2024 21:17:57 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:17:56 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Helge Deller <deller@gmx.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Samuel Holland <samuel@sholland.org>,
	Lyude Paul <thatslyude@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 09/24] Input: elo - use guard notation when pausing serio port
Date: Wed,  4 Sep 2024 21:17:14 -0700
Message-ID: <20240905041732.2034348-10-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240905041732.2034348-1-dmitry.torokhov@gmail.com>
References: <20240905041732.2034348-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that serio ports are resumed in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/elo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/elo.c b/drivers/input/touchscreen/elo.c
index eb883db55420..ad209e6e82a6 100644
--- a/drivers/input/touchscreen/elo.c
+++ b/drivers/input/touchscreen/elo.c
@@ -225,10 +225,10 @@ static int elo_command_10(struct elo *elo, unsigned char *packet)
 
 	mutex_lock(&elo->cmd_mutex);
 
-	serio_pause_rx(elo->serio);
-	elo->expected_packet = toupper(packet[0]);
-	init_completion(&elo->cmd_done);
-	serio_continue_rx(elo->serio);
+	scoped_guard(serio_pause_rx, elo->serio) {
+		elo->expected_packet = toupper(packet[0]);
+		init_completion(&elo->cmd_done);
+	}
 
 	if (serio_write(elo->serio, ELO10_LEAD_BYTE))
 		goto out;
-- 
2.46.0.469.g59c65b2a67-goog


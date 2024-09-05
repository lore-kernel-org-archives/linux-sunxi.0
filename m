Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501CB18BC2A
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509889; cv=none; b=E87qDZ73wsBHwXsYuKPwgBwR4FjEkQVW0j8SdkaJauNNYX3l5RNe6ZRdflYQgIaHPlxAHsKOL+CFQHf1PJrDOrzsEoFaig0MzFSjM5qS/fiA5xTlKiK+LCIMPmuI4aeI7CpgfF1EAPc8HpNB3F8yT6OophpFKMDrjsFtbWNDZEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509889; c=relaxed/simple;
	bh=vmkU8MnH9ykeMGj0Lb9zkmS8M2GYo6xV57O1AmagHA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyzoBMojccH+j2AVhHP/p91R/8pg22flohpUufXQWWRvLqZNZnN7l0+lW6u8RMBeO2s1Z1tdYkE0Z1Q4QRCg04rmewWYK0dwfEAEEo7VOYRxr97bxrV6lZMp18YoOQ6JmoDMVNVs1PU56GZwrv5OM6ooWHi7N/N5fa1SmGCX6PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiXZM1V0; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiXZM1V0"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-70f645a30dcso287401a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509887; x=1726114687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAvYQ5QLNfvwvbAxc5bD+RAm1KaOm8ejwTdtW3p547k=;
        b=EiXZM1V0ZRL+8NgcP1P0qtUlyD2jKjhrsmq2DTj7ndK6c4qsMaKXTiTmIlJn0G4UIQ
         /fawTBj1277fZmpwgmeGrwfU8N5eosF7FYA1XQQAcAdmjaX6XcgCaHdlW+J0fuClT+xK
         2tgYplhigC+xW5e7awD4rKdP/J6yKOTkw9iO2HxnBgpar8n5FNJueUUuxNRYPMz3a4zu
         sgg01TZKaW2j//PCXGXOdSwyuGukuWhK2HVHNUG6dOLLyE533qf0c8R0lzDBNUSqvHKR
         CodlRSj0H5SphrvKajXhDa7rjOAldSuqrgrEsQKJ4mJgRMuqV1jGgJtdyocpDYQAEpSn
         yaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509887; x=1726114687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAvYQ5QLNfvwvbAxc5bD+RAm1KaOm8ejwTdtW3p547k=;
        b=iU80nHGHZEhTSgCnQcIsGBDYLscGKxhVJUBJSYAtlalIl2MHo9YFNyiw+vXlyxLgnX
         4jngjLtzBBaOjLNMdLfl4lgF8tvC4I16VKG/SfGiMUP0iC7xJVt6BA+ycrFkjLzwK03d
         gFiSRUpaCUfZHt47+wSndFC0MBlqrvCd+tCtp8QgBAC9+c9VN1As7wjTRb+iD99TiCXG
         ac4RVGVFzZ8RNjLGfmQV0HJB4nR2/+vmaceU+3GRx0UK8mCb1hr35kpE9+a5Ju3eNMn5
         BtCEdaIWXdfJY+2AB/Mx7CVJ6vOOuu97Jo4BbcuwohhyPRK0y46ZqCEm3Hs6Cu0M/ncI
         +eDg==
X-Forwarded-Encrypted: i=1; AJvYcCXy+sirXu5XfYjBE0LSN+9ea2KWfb4qtRZGClamlQwaJXrGX8ifWafaDq65yOpR9jc5ecTcAkH8GyxpTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyP9dCObseXErZqApOOqVKBPAK6WQK41fk1S0JIHaBZP3Gd220B
	ajoaYZtHyZM/NgQzE6W18hYCOAYvt/LMY0q2AWAH+n9/nbgyGD/yoFbXvg==
X-Google-Smtp-Source: AGHT+IH8XXYpPAwHhXPSp4iUYFOHjf3DLK6g5FeTGZwm65nE42PqOHWe35HEYgcGmzcKxgF6JQHDJQ==
X-Received: by 2002:a05:6830:618b:b0:703:77bd:9522 with SMTP id 46e09a7af769-710af6baa99mr9458024a34.17.1725509887298;
        Wed, 04 Sep 2024 21:18:07 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:18:06 -0700 (PDT)
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
Subject: [PATCH 16/24] Input: q40kbd - use guard notation when acquiring spinlock
Date: Wed,  4 Sep 2024 21:17:21 -0700
Message-ID: <20240905041732.2034348-17-dmitry.torokhov@gmail.com>
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
more robust by ensuring that locks are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/q40kbd.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/input/serio/q40kbd.c b/drivers/input/serio/q40kbd.c
index cd4d5be946a3..cdd5c4ef9b36 100644
--- a/drivers/input/serio/q40kbd.c
+++ b/drivers/input/serio/q40kbd.c
@@ -39,17 +39,14 @@ struct q40kbd {
 static irqreturn_t q40kbd_interrupt(int irq, void *dev_id)
 {
 	struct q40kbd *q40kbd = dev_id;
-	unsigned long flags;
 
-	spin_lock_irqsave(&q40kbd->lock, flags);
+	guard(spinlock_irqsave)(&q40kbd->lock);
 
 	if (Q40_IRQ_KEYB_MASK & master_inb(INTERRUPT_REG))
 		serio_interrupt(q40kbd->port, master_inb(KEYCODE_REG), 0);
 
 	master_outb(-1, KEYBOARD_UNLOCK_REG);
 
-	spin_unlock_irqrestore(&q40kbd->lock, flags);
-
 	return IRQ_HANDLED;
 }
 
@@ -60,14 +57,11 @@ static irqreturn_t q40kbd_interrupt(int irq, void *dev_id)
 static void q40kbd_flush(struct q40kbd *q40kbd)
 {
 	int maxread = 100;
-	unsigned long flags;
 
-	spin_lock_irqsave(&q40kbd->lock, flags);
+	guard(spinlock_irqsave)(&q40kbd->lock);
 
 	while (maxread-- && (Q40_IRQ_KEYB_MASK & master_inb(INTERRUPT_REG)))
 		master_inb(KEYCODE_REG);
-
-	spin_unlock_irqrestore(&q40kbd->lock, flags);
 }
 
 static void q40kbd_stop(void)
-- 
2.46.0.469.g59c65b2a67-goog


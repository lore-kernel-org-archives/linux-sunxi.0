Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B2C18EFC8
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509892; cv=none; b=bozcrXbXRNMBT5qsAR4O/qqGhXvV6pxIgVJOvvltg1N/E56QgEkwzL+4oo2EP1H2w2bI2F5IJprT5m80azrRocB0lggzWuFzCPJZRmgVIUgjGp3AMLJfjpk0vULZl9Tdoa2gSr42YwtbHjYBhMghlRyNg0fVdl7yd127I6aD+/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509892; c=relaxed/simple;
	bh=1ANKjU3VKrs6X/QdpJ9WLabYERlHb97KjzLTZSjxQWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFVDLI6wp0YnoTP2OpvweVpTe1i9ak5fCiEjzuEw1QNSsUbQT+3cep/NpEWeX0jonx26hKyg9aVUWA2/ZJ+4jWpDJYVMzXCeNni219y8sx/Ju+hA3UFt8b4bRBlXrjIhLCt8gxuhLNkIYsUokqBfP7TUbKMvb7G6CiQqaJZiMfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCQ5d4k4; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCQ5d4k4"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7093b53f315so117249a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509890; x=1726114690; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdj97WNnHfmaSgwSXHcMMW5oApE6Xxi6ExD1cTeMbgs=;
        b=UCQ5d4k4HVaaTIiZmNvO1Q03m5l0fMp/UgYwxEHwl2vLjBaj5zkZqYd+T3sTl8m3Fo
         /vcb3m48I3sB/17HVSvc5eZXKJjjNUdibRUloGZan7qn9jX7GaQmvdSHCXAZqdbH4lCD
         dQ46IKfp0sZsvLeAPm8EQotsGC9uxga/v/sqPXCockA7/Uts/W9DHz2edtdY9wpJRYW0
         d+JcLRNdBPgmGWGHHe20CtbkTcLrIpvYd8a0M9ENgt2oV76cgb6n8NB+QgNZU0oAYN42
         pGbTyz4K2a6IY9/Z7E9QFoWBf4eMkWoRtOTuDkpBc7FoqHlniPdIzguyhgmcYrDey4lw
         okGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509890; x=1726114690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdj97WNnHfmaSgwSXHcMMW5oApE6Xxi6ExD1cTeMbgs=;
        b=R4WSRia3Uo702hop/Ll/RJg0htm6Ezt4S2tBboa4le0SzO6NBItey3yMI84GZFXKEl
         egLfJHSk5pIwnR4Fd2ylmwsAnbn2xHiD9HlNgBeWHQu4g6xz7HilZKYaSQUKYXnjLQ2D
         dH5Z1t6wm4SXCIRRiEP6q7qNRDnQUmykjICs98uvjoIYM3Bg3KPXiIy72oHgXgxKmae/
         svhxfyUfm2Gmg/QjZ20zBaM27m8UVrYd7A64F4/uNP2r9LFjepBK5tUMUA5CW2eaEbxK
         OpxZQXFN7f7/Q7GZs+xKCWnkw/flJLzF78ypcu531rQTgKfRgnewwo2e5fBtlkhOTDCz
         l9Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUv4ov/Wjpdr2HL3js0n35f2VlZDof6GbGq8c3V8zDqrLQObXJOfm2oeYREf71/rJs0y3DWLOXdSSo6kQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzK9cDlYaCUPsL053pflv6PxXqYhDVh1icQFqnnXkFq1dFaGaGx
	darrAQBVSpz81ZfqOOoY/pgpoJ9BGr6V81Vy1xKXW01dtLxHU6Yi
X-Google-Smtp-Source: AGHT+IEMAZJeCSqiHRSgN3+WWWCHuQRgdHGicuqXLtwn/x3wJa2d1mAi8u8uVrAj+0Ri9jh32shyow==
X-Received: by 2002:a05:6830:6e8f:b0:70f:7752:3967 with SMTP id 46e09a7af769-70f77523c01mr18497699a34.27.1725509890118;
        Wed, 04 Sep 2024 21:18:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:18:09 -0700 (PDT)
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
Subject: [PATCH 18/24] Input: serport - use guard notation when acquiring spinlock
Date: Wed,  4 Sep 2024 21:17:23 -0700
Message-ID: <20240905041732.2034348-19-dmitry.torokhov@gmail.com>
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
 drivers/input/serio/serport.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/input/serio/serport.c b/drivers/input/serio/serport.c
index 5a2b5404ffc2..74ac88796187 100644
--- a/drivers/input/serio/serport.c
+++ b/drivers/input/serio/serport.c
@@ -50,11 +50,9 @@ static int serport_serio_write(struct serio *serio, unsigned char data)
 static int serport_serio_open(struct serio *serio)
 {
 	struct serport *serport = serio->port_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&serport->lock, flags);
+	guard(spinlock_irqsave)(&serport->lock);
 	set_bit(SERPORT_ACTIVE, &serport->flags);
-	spin_unlock_irqrestore(&serport->lock, flags);
 
 	return 0;
 }
@@ -63,11 +61,9 @@ static int serport_serio_open(struct serio *serio)
 static void serport_serio_close(struct serio *serio)
 {
 	struct serport *serport = serio->port_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&serport->lock, flags);
+	guard(spinlock_irqsave)(&serport->lock);
 	clear_bit(SERPORT_ACTIVE, &serport->flags);
-	spin_unlock_irqrestore(&serport->lock, flags);
 }
 
 /*
@@ -118,14 +114,13 @@ static void serport_ldisc_receive(struct tty_struct *tty, const u8 *cp,
 				  const u8 *fp, size_t count)
 {
 	struct serport *serport = tty->disc_data;
-	unsigned long flags;
 	unsigned int ch_flags = 0;
 	int i;
 
-	spin_lock_irqsave(&serport->lock, flags);
+	guard(spinlock_irqsave)(&serport->lock);
 
 	if (!test_bit(SERPORT_ACTIVE, &serport->flags))
-		goto out;
+		return;
 
 	for (i = 0; i < count; i++) {
 		if (fp) {
@@ -146,9 +141,6 @@ static void serport_ldisc_receive(struct tty_struct *tty, const u8 *cp,
 
 		serio_interrupt(serport->serio, cp[i], ch_flags);
 	}
-
-out:
-	spin_unlock_irqrestore(&serport->lock, flags);
 }
 
 /*
@@ -246,11 +238,9 @@ static int serport_ldisc_compat_ioctl(struct tty_struct *tty,
 static void serport_ldisc_hangup(struct tty_struct *tty)
 {
 	struct serport *serport = tty->disc_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&serport->lock, flags);
-	set_bit(SERPORT_DEAD, &serport->flags);
-	spin_unlock_irqrestore(&serport->lock, flags);
+	scoped_guard(spinlock_irqsave, &serport->lock)
+		set_bit(SERPORT_DEAD, &serport->flags);
 
 	wake_up_interruptible(&serport->wait);
 }
@@ -258,12 +248,11 @@ static void serport_ldisc_hangup(struct tty_struct *tty)
 static void serport_ldisc_write_wakeup(struct tty_struct * tty)
 {
 	struct serport *serport = tty->disc_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&serport->lock, flags);
+	guard(spinlock_irqsave)(&serport->lock);
+
 	if (test_bit(SERPORT_ACTIVE, &serport->flags))
 		serio_drv_write_wakeup(serport->serio);
-	spin_unlock_irqrestore(&serport->lock, flags);
 }
 
 /*
-- 
2.46.0.469.g59c65b2a67-goog


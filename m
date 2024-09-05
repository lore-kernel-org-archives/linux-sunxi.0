Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF49218A956
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509888; cv=none; b=ZgYqTW7fWXdv8G2weyJJV9OGT6pttWEDVBu1KAWU7WG+Z5Kq/4LgJSieuSotBFRVVY7T+dBt7hQMhuNDngjDt6NjsayUG1d2F6lxt0Jl236ZnMAS/+9hegEB0JFQZfprOuFqN7e0peKoRCZ3InwV6uGKnejkzuQZ8wsHDdBRO9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509888; c=relaxed/simple;
	bh=XvngD4VqarzUQtOcte+139wHHgYptJyp/bfLvV9NY2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PTt/4u0r+QkS2rD3g+yBWAHox55wRfSxGdOce+ogNftABy1HMc7eea0cyw00cD1xHH/l2UeiNLWvQ1C4vH535iV4hwtjRkJ5bsiMekjYH++m0v27OfLBQt25SjwwLLJhLwiTKRX3fd1FLf1JoaQ0Ad8dX/XcuXoXQk2JpuBHkyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRC6Cb72; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRC6Cb72"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-27051f63018so202544fac.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509886; x=1726114686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RJDHa/X116xPB0VZS9gOnIwjZdjbYo4abWgUGhtfDc=;
        b=KRC6Cb72wwKTWcTx+QVHMH9rQjYHEKOzHcXXUNyhl6P13NH0l9Pg990ndvNoHdJwJm
         6UBrEfORmdM/oyAgm2+jwWF5XyEN7elikTv/JvGsmTUuHpaCV97SUUA7w5GBoumiVoGG
         IkJgOScITxgjdPhjbzZ6TI/ONbL7s9y7cStOE/4JTsW3c0OBVCUyPmASPRF9UQTWpf5L
         KVzL645GoUe+cvkFPe82juvoCd1BHAj7WgliZOqOqq8Q6NL6hYwg4qLlr2gd/JTiUUvL
         WoVDy8qoCZXXtIXN5dcWNbkBy+yfJxV3bck88VQcZBtXDFLWoTwpWXVHn2NinLSazNPx
         xf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509886; x=1726114686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RJDHa/X116xPB0VZS9gOnIwjZdjbYo4abWgUGhtfDc=;
        b=jucIZDYc76hWP5zm8DxwPGaMpapZCu0dD8CcAqw8AaSWlF/MzwT0lQgMdTN5Bw7LZS
         YqXTrrTjgiLea2WaY3r0ATI38TKR+yrJpQv/BflZeJ6+oZj9z4YNolk7wlYWRfuIVHbi
         k1Th1j0292vStdPPsuddUcqYm5SG9UNWknBvbwuKcPZzS/9Y8MZ5QNAhe9+YuepU6ILM
         tedxYxb5CG3gLCRHAPMeZf9zSLI9TWndtynqJyraLjKkrhOLPk5shBq39DimUJ1xvZVX
         m5ppPuN/BQwBj+sap5KN0iPEQFRDiGQyyX4xRzlbQbq+i2RGhSqvtNJaITEazKLVHK6e
         88DA==
X-Forwarded-Encrypted: i=1; AJvYcCW6MYoYLWTYS3aDgtjrMgM37v9Coyfdi+nagTdOvxxu2JybkNEOk0SpDu3sXmhUgVzn3ONu+nfrU9LMpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMdbNHW6k0Fm7jWg6i0U4jBa1X0ehOW/eE8ntaL8be6o7FQIx2
	2C0Wk44Pv9i8HADdMiGjI/EjCYq2xEj6khFiv/oRsNbrGtd0clbk
X-Google-Smtp-Source: AGHT+IH6QFeFw4VUowxHMGT9IipF2N4THVz6A6eh0ihPM11BJx1xPLmHqcSlKYJ5qoFGXbsOklObVw==
X-Received: by 2002:a05:6870:6b89:b0:260:ebf7:d0e7 with SMTP id 586e51a60fabf-277d03ac4f7mr18125009fac.15.1725509885896;
        Wed, 04 Sep 2024 21:18:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:18:05 -0700 (PDT)
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
Subject: [PATCH 15/24] Input: ps2mult - use guard notation when acquiring spinlock
Date: Wed,  4 Sep 2024 21:17:20 -0700
Message-ID: <20240905041732.2034348-16-dmitry.torokhov@gmail.com>
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
 drivers/input/serio/ps2mult.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/input/serio/ps2mult.c b/drivers/input/serio/ps2mult.c
index 937ecdea491d..b96cee52fc52 100644
--- a/drivers/input/serio/ps2mult.c
+++ b/drivers/input/serio/ps2mult.c
@@ -76,9 +76,8 @@ static int ps2mult_serio_write(struct serio *serio, unsigned char data)
 	struct ps2mult *psm = serio_get_drvdata(mx_port);
 	struct ps2mult_port *port = serio->port_data;
 	bool need_escape;
-	unsigned long flags;
 
-	spin_lock_irqsave(&psm->lock, flags);
+	guard(spinlock_irqsave)(&psm->lock);
 
 	if (psm->out_port != port)
 		ps2mult_select_port(psm, port);
@@ -93,8 +92,6 @@ static int ps2mult_serio_write(struct serio *serio, unsigned char data)
 
 	serio_write(mx_port, data);
 
-	spin_unlock_irqrestore(&psm->lock, flags);
-
 	return 0;
 }
 
@@ -102,11 +99,10 @@ static int ps2mult_serio_start(struct serio *serio)
 {
 	struct ps2mult *psm = serio_get_drvdata(serio->parent);
 	struct ps2mult_port *port = serio->port_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&psm->lock, flags);
+	guard(spinlock_irqsave)(&psm->lock);
+
 	port->registered = true;
-	spin_unlock_irqrestore(&psm->lock, flags);
 
 	return 0;
 }
@@ -115,11 +111,10 @@ static void ps2mult_serio_stop(struct serio *serio)
 {
 	struct ps2mult *psm = serio_get_drvdata(serio->parent);
 	struct ps2mult_port *port = serio->port_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&psm->lock, flags);
+	guard(spinlock_irqsave)(&psm->lock);
+
 	port->registered = false;
-	spin_unlock_irqrestore(&psm->lock, flags);
 }
 
 static int ps2mult_create_port(struct ps2mult *psm, int i)
@@ -148,16 +143,12 @@ static int ps2mult_create_port(struct ps2mult *psm, int i)
 
 static void ps2mult_reset(struct ps2mult *psm)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&psm->lock, flags);
+	guard(spinlock_irqsave)(&psm->lock);
 
 	serio_write(psm->mx_serio, PS2MULT_SESSION_END);
 	serio_write(psm->mx_serio, PS2MULT_SESSION_START);
 
 	ps2mult_select_port(psm, &psm->ports[PS2MULT_KBD_PORT]);
-
-	spin_unlock_irqrestore(&psm->lock, flags);
 }
 
 static int ps2mult_connect(struct serio *serio, struct serio_driver *drv)
@@ -234,11 +225,10 @@ static irqreturn_t ps2mult_interrupt(struct serio *serio,
 {
 	struct ps2mult *psm = serio_get_drvdata(serio);
 	struct ps2mult_port *in_port;
-	unsigned long flags;
 
 	dev_dbg(&serio->dev, "Received %02x flags %02x\n", data, dfl);
 
-	spin_lock_irqsave(&psm->lock, flags);
+	guard(spinlock_irqsave)(&psm->lock);
 
 	if (psm->escape) {
 		psm->escape = false;
@@ -285,7 +275,6 @@ static irqreturn_t ps2mult_interrupt(struct serio *serio,
 	}
 
  out:
-	spin_unlock_irqrestore(&psm->lock, flags);
 	return IRQ_HANDLED;
 }
 
-- 
2.46.0.469.g59c65b2a67-goog


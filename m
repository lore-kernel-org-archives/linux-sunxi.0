Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3AE1891BA
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509885; cv=none; b=MuwdcnJES599P+lcX0jPZoZkdGULF2KBebm+ugwRGSq/Ye/brS8Okoo7qabQbn+ewtkmB6+dc1Hu0MmId8CmuVfKOJ9vg0LYfFAZg4GnAtxeFXW8X91c0kb0TnepaiUTLQz2pzg+oGzHLpUlEEAzzbNy8s90+EEAHzaDgdOR0XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509885; c=relaxed/simple;
	bh=XHDF65UMYbcNN1J2ncDViDYDlOQox8KGEG4MrzcKBVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Py3UpVmJn1/dw7lyBYVPO4nV/Xzvzes7mPuT3x7QzDUmN5eb+lFTkoLCFeHdI91ep5EMJHg6YRi+MpFy5RjSbHfOWeoLLorgO5aGmiAlXkTeWix6sJe4CNPnKD60L+P4Bvy3B7rUqzeyD0l6ojRxR+lSUaOJn5s/MFVpzCEPYFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYBAb3Yl; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYBAb3Yl"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-70f782d6ba8so192113a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509883; x=1726114683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXmUmnslyZHyZJLR+Zy+r2EKZKWq2y74P1oax/HM5cE=;
        b=SYBAb3YlxyT3kTAJQv+BXgwrZ69Npwcee+YyMLr2HAVgF6uWNcp5wtnD/YzB1eblTp
         MlAG6VZRYxIdiaUtSqs/k6hDXfrz4kPmMUZeuhw1QiSbHcoK8SDywSz2+H5IcWdDoZ9k
         WZNv11skqUnVtwmmJ0Gb5Hl30XRMl2g1HV3e6nAHcJZV1aVHRYNNpnUOaDZZeziKOOX8
         E0WoeqQ0rGuO2vssk49QHev7zxSB8gi2ufsNZLccD/cRlAQOgv+dXHUFYT8TaUYaiJ6U
         1KCE95T4YhZlVm2xZyngAqEqSebnw5tu5kZ9N8WMuW13mx0GVB5AJKMxxEZ12O7oJx2i
         rHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509883; x=1726114683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXmUmnslyZHyZJLR+Zy+r2EKZKWq2y74P1oax/HM5cE=;
        b=pKyvw5srpxI1ZH9Mk6DhRVkefgYvDbuOEZAb7NKuICHYPMUXz20tavKf6dVIA+u2CA
         Mk/9mFbe5pOevcdjgNQOf2NImiZcHWaKeW9pDP+xuiv99MO0/Cuz/Jz34cwfUgqlRUtG
         Y6cv5f5J8S2UUjK7rrm5hB1K/rFGJq806LxkkpS5reYjNmpyLBP3H/NMNPCVT8MSrtaI
         J6WfI4gkA/ZlWWKBz0UWQuNbzuRYYEpzWRVJFgvx2GmeeXhFc8a5496GsAVNEFI8unl6
         CFX6Xp8uLdL3IY0tDyUwdYYkXfU81sEReoRVmyQFHgF4rf9HcQA9G277OL6DvIQ7vhMq
         XYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI62jibGvjIeg93zjlNdwet5SW77ZVorf/mdcUbEXynKqtrEv/rwXMbvG+5sCCmZ6/6m94zkA48KIp9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv0l7X5lPDmpD0eRrPHORsOJ2bltMeYP0R0LdXXLdgUT/ZH/AD
	k7fb/djcueiGe5HdZSqdIEu525EOIeZbvvFqq55WlsYW+rB3x0yj
X-Google-Smtp-Source: AGHT+IHcMsyUFlTpAfo6lJFBaVdiWg5Gnvhy6xBpLteR2E7XriaKtgwaYzGHtMaMdLGv9PUE1ZycOA==
X-Received: by 2002:a05:6830:4111:b0:709:4060:1093 with SMTP id 46e09a7af769-70f5c467082mr29658656a34.22.1725509882956;
        Wed, 04 Sep 2024 21:18:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:18:02 -0700 (PDT)
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
Subject: [PATCH 13/24] Input: i8042 - use guard notation when acquiring spinlock
Date: Wed,  4 Sep 2024 21:17:18 -0700
Message-ID: <20240905041732.2034348-14-dmitry.torokhov@gmail.com>
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
 drivers/input/serio/i8042.c | 204 +++++++++++++++---------------------
 1 file changed, 82 insertions(+), 122 deletions(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 674cd155ec8f..86916fe3925f 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -197,42 +197,26 @@ EXPORT_SYMBOL(i8042_unlock_chip);
 int i8042_install_filter(bool (*filter)(unsigned char data, unsigned char str,
 					struct serio *serio))
 {
-	unsigned long flags;
-	int ret = 0;
+	guard(spinlock_irqsave)(&i8042_lock);
 
-	spin_lock_irqsave(&i8042_lock, flags);
-
-	if (i8042_platform_filter) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (i8042_platform_filter)
+		return -EBUSY;
 
 	i8042_platform_filter = filter;
-
-out:
-	spin_unlock_irqrestore(&i8042_lock, flags);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(i8042_install_filter);
 
 int i8042_remove_filter(bool (*filter)(unsigned char data, unsigned char str,
 				       struct serio *port))
 {
-	unsigned long flags;
-	int ret = 0;
-
-	spin_lock_irqsave(&i8042_lock, flags);
+	guard(spinlock_irqsave)(&i8042_lock);
 
-	if (i8042_platform_filter != filter) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (i8042_platform_filter != filter)
+		return -EINVAL;
 
 	i8042_platform_filter = NULL;
-
-out:
-	spin_unlock_irqrestore(&i8042_lock, flags);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(i8042_remove_filter);
 
@@ -271,28 +255,22 @@ static int i8042_wait_write(void)
 
 static int i8042_flush(void)
 {
-	unsigned long flags;
 	unsigned char data, str;
 	int count = 0;
-	int retval = 0;
 
-	spin_lock_irqsave(&i8042_lock, flags);
+	guard(spinlock_irqsave)(&i8042_lock);
 
 	while ((str = i8042_read_status()) & I8042_STR_OBF) {
-		if (count++ < I8042_BUFFER_SIZE) {
-			udelay(50);
-			data = i8042_read_data();
-			dbg("%02x <- i8042 (flush, %s)\n",
-			    data, str & I8042_STR_AUXDATA ? "aux" : "kbd");
-		} else {
-			retval = -EIO;
-			break;
-		}
-	}
+		if (count++ >= I8042_BUFFER_SIZE)
+			return -EIO;
 
-	spin_unlock_irqrestore(&i8042_lock, flags);
+		udelay(50);
+		data = i8042_read_data();
+		dbg("%02x <- i8042 (flush, %s)\n",
+		    data, str & I8042_STR_AUXDATA ? "aux" : "kbd");
+	}
 
-	return retval;
+	return 0;
 }
 
 /*
@@ -349,17 +327,12 @@ static int __i8042_command(unsigned char *param, int command)
 
 int i8042_command(unsigned char *param, int command)
 {
-	unsigned long flags;
-	int retval;
-
 	if (!i8042_present)
 		return -1;
 
-	spin_lock_irqsave(&i8042_lock, flags);
-	retval = __i8042_command(param, command);
-	spin_unlock_irqrestore(&i8042_lock, flags);
+	guard(spinlock_irqsave)(&i8042_lock);
 
-	return retval;
+	return __i8042_command(param, command);
 }
 EXPORT_SYMBOL(i8042_command);
 
@@ -369,19 +342,18 @@ EXPORT_SYMBOL(i8042_command);
 
 static int i8042_kbd_write(struct serio *port, unsigned char c)
 {
-	unsigned long flags;
-	int retval = 0;
+	int error;
 
-	spin_lock_irqsave(&i8042_lock, flags);
+	guard(spinlock_irqsave)(&i8042_lock);
 
-	if (!(retval = i8042_wait_write())) {
-		dbg("%02x -> i8042 (kbd-data)\n", c);
-		i8042_write_data(c);
-	}
+	error = i8042_wait_write();
+	if (error)
+		return error;
 
-	spin_unlock_irqrestore(&i8042_lock, flags);
+	dbg("%02x -> i8042 (kbd-data)\n", c);
+	i8042_write_data(c);
 
-	return retval;
+	return 0;
 }
 
 /*
@@ -460,9 +432,8 @@ static int i8042_start(struct serio *serio)
 		device_set_wakeup_enable(&serio->dev, true);
 	}
 
-	spin_lock_irq(&i8042_lock);
+	guard(spinlock_irq)(&i8042_lock);
 	port->exists = true;
-	spin_unlock_irq(&i8042_lock);
 
 	return 0;
 }
@@ -476,10 +447,10 @@ static void i8042_stop(struct serio *serio)
 {
 	struct i8042_port *port = serio->port_data;
 
-	spin_lock_irq(&i8042_lock);
-	port->exists = false;
-	port->serio = NULL;
-	spin_unlock_irq(&i8042_lock);
+	scoped_guard(spinlock_irq, &i8042_lock) {
+		port->exists = false;
+		port->serio = NULL;
+	}
 
 	/*
 	 * We need to make sure that interrupt handler finishes using
@@ -583,45 +554,41 @@ static bool i8042_handle_data(int irq)
 {
 	struct i8042_port *port;
 	struct serio *serio;
-	unsigned long flags;
 	unsigned char str, data;
 	unsigned int dfl;
 	unsigned int port_no;
 	bool filtered;
 
-	spin_lock_irqsave(&i8042_lock, flags);
-
-	str = i8042_read_status();
-	if (unlikely(~str & I8042_STR_OBF)) {
-		spin_unlock_irqrestore(&i8042_lock, flags);
-		return false;
-	}
-
-	data = i8042_read_data();
+	scoped_guard(spinlock_irqsave, &i8042_lock) {
+		str = i8042_read_status();
+		if (unlikely(~str & I8042_STR_OBF))
+			return false;
 
-	if (i8042_mux_present && (str & I8042_STR_AUXDATA)) {
-		port_no = i8042_handle_mux(str, &data, &dfl);
-	} else {
+		data = i8042_read_data();
 
-		dfl = (str & I8042_STR_PARITY) ? SERIO_PARITY : 0;
-		if ((str & I8042_STR_TIMEOUT) && !i8042_notimeout)
-			dfl |= SERIO_TIMEOUT;
+		if (i8042_mux_present && (str & I8042_STR_AUXDATA)) {
+			port_no = i8042_handle_mux(str, &data, &dfl);
+		} else {
 
-		port_no = (str & I8042_STR_AUXDATA) ?
-				I8042_AUX_PORT_NO : I8042_KBD_PORT_NO;
-	}
+			dfl = (str & I8042_STR_PARITY) ? SERIO_PARITY : 0;
+			if ((str & I8042_STR_TIMEOUT) && !i8042_notimeout)
+				dfl |= SERIO_TIMEOUT;
 
-	port = &i8042_ports[port_no];
-	serio = port->exists ? port->serio : NULL;
+			port_no = (str & I8042_STR_AUXDATA) ?
+					I8042_AUX_PORT_NO : I8042_KBD_PORT_NO;
+		}
 
-	filter_dbg(port->driver_bound, data, "<- i8042 (interrupt, %d, %d%s%s)\n",
-		   port_no, irq,
-		   dfl & SERIO_PARITY ? ", bad parity" : "",
-		   dfl & SERIO_TIMEOUT ? ", timeout" : "");
+		port = &i8042_ports[port_no];
+		serio = port->exists ? port->serio : NULL;
 
-	filtered = i8042_filter(data, str, serio);
+		filter_dbg(port->driver_bound,
+			   data, "<- i8042 (interrupt, %d, %d%s%s)\n",
+			   port_no, irq,
+			   dfl & SERIO_PARITY ? ", bad parity" : "",
+			   dfl & SERIO_TIMEOUT ? ", timeout" : "");
 
-	spin_unlock_irqrestore(&i8042_lock, flags);
+		filtered = i8042_filter(data, str, serio);
+	}
 
 	if (likely(serio && !filtered))
 		serio_interrupt(serio, data, dfl);
@@ -779,24 +746,22 @@ static bool i8042_irq_being_tested;
 
 static irqreturn_t i8042_aux_test_irq(int irq, void *dev_id)
 {
-	unsigned long flags;
 	unsigned char str, data;
-	int ret = 0;
 
-	spin_lock_irqsave(&i8042_lock, flags);
+	guard(spinlock_irqsave)(&i8042_lock);
+
 	str = i8042_read_status();
-	if (str & I8042_STR_OBF) {
-		data = i8042_read_data();
-		dbg("%02x <- i8042 (aux_test_irq, %s)\n",
-		    data, str & I8042_STR_AUXDATA ? "aux" : "kbd");
-		if (i8042_irq_being_tested &&
-		    data == 0xa5 && (str & I8042_STR_AUXDATA))
-			complete(&i8042_aux_irq_delivered);
-		ret = 1;
-	}
-	spin_unlock_irqrestore(&i8042_lock, flags);
+	if (!(str & I8042_STR_OBF))
+		return IRQ_NONE;
+
+	data = i8042_read_data();
+	dbg("%02x <- i8042 (aux_test_irq, %s)\n",
+	    data, str & I8042_STR_AUXDATA ? "aux" : "kbd");
+
+	if (i8042_irq_being_tested && data == 0xa5 && (str & I8042_STR_AUXDATA))
+		complete(&i8042_aux_irq_delivered);
 
-	return IRQ_RETVAL(ret);
+	return IRQ_HANDLED;
 }
 
 /*
@@ -837,7 +802,6 @@ static int i8042_check_aux(void)
 	int retval = -1;
 	bool irq_registered = false;
 	bool aux_loop_broken = false;
-	unsigned long flags;
 	unsigned char param;
 
 /*
@@ -921,18 +885,15 @@ static int i8042_check_aux(void)
 	if (i8042_enable_aux_port())
 		goto out;
 
-	spin_lock_irqsave(&i8042_lock, flags);
-
-	init_completion(&i8042_aux_irq_delivered);
-	i8042_irq_being_tested = true;
-
-	param = 0xa5;
-	retval = __i8042_command(&param, I8042_CMD_AUX_LOOP & 0xf0ff);
-
-	spin_unlock_irqrestore(&i8042_lock, flags);
+	scoped_guard(spinlock_irqsave, &i8042_lock) {
+		init_completion(&i8042_aux_irq_delivered);
+		i8042_irq_being_tested = true;
 
-	if (retval)
-		goto out;
+		param = 0xa5;
+		retval = __i8042_command(&param, I8042_CMD_AUX_LOOP & 0xf0ff);
+		if (retval)
+			goto out;
+	}
 
 	if (wait_for_completion_timeout(&i8042_aux_irq_delivered,
 					msecs_to_jiffies(250)) == 0) {
@@ -1020,7 +981,6 @@ static int i8042_controller_selftest(void)
 
 static int i8042_controller_init(void)
 {
-	unsigned long flags;
 	int n = 0;
 	unsigned char ctr[2];
 
@@ -1057,14 +1017,14 @@ static int i8042_controller_init(void)
  * Handle keylock.
  */
 
-	spin_lock_irqsave(&i8042_lock, flags);
-	if (~i8042_read_status() & I8042_STR_KEYLOCK) {
-		if (i8042_unlock)
-			i8042_ctr |= I8042_CTR_IGNKEYLOCK;
-		else
-			pr_warn("Warning: Keylock active\n");
+	scoped_guard(spinlock_irqsave, &i8042_lock) {
+		if (~i8042_read_status() & I8042_STR_KEYLOCK) {
+			if (i8042_unlock)
+				i8042_ctr |= I8042_CTR_IGNKEYLOCK;
+			else
+				pr_warn("Warning: Keylock active\n");
+		}
 	}
-	spin_unlock_irqrestore(&i8042_lock, flags);
 
 /*
  * If the chip is configured into nontranslated mode by the BIOS, don't
-- 
2.46.0.469.g59c65b2a67-goog


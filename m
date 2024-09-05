Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77FB155382
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509894; cv=none; b=cMMusVLc/w/q9FvYybN16dXWMc7TpUMc5iA1kvfsRIvYKWOhAa6SvQ9QWwWuiOzBQ8wmjAVN4AjmgTv06cQwYqFx1FwYXYifCOpuGeKl6VQFXK9O2VPeFpXMCfmug3EbFLvbdUWENTxv2VoCubpf+80cyVOX87/g/ICbrQ48J64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509894; c=relaxed/simple;
	bh=pakshvX2RA3yQrO6ycKRxTchHdBk7nScpIeEjlcuObQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tqdvGkCnsapzipYYZ6tLxeSjqenSSMz015nMHn4fH69bGrJb3jpIQmsmjJD4EZnuVdgPAcVAf4yDdtxvnkVQn3/vn6KvEYyD0F5Q2nKizQX1O6hDLurjngRZbnLVEzXC2gb/kcbl0UuclfY8MG/d9Gi0p6KQT5qVUQ1OZefEqh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7/tHAkQ; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7/tHAkQ"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3df094394daso162369b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509892; x=1726114692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPWoWt+316Jv4PRkQXpmOTDxa9BtNdvynfRmo3h2lZU=;
        b=A7/tHAkQN7c185iCVgWM0w756o1FK56nzG+19h494YSxSFtTQV4A/pA/HxDEOQE659
         O0Jf/gk8tBwgeZ+QUl7zN+j1wsKVktWU6vIPbYesrcdDpfR/INCKE3sK0H1UJ90gS87n
         /C3jKDQhZ4XwNNlr0YGQjmPdJSwqiN/XIUoI4CvMD0KgQRZIZCP3eMfBKJeBvg2uANUM
         b9B0DTXBvOgiCi0oAYRvBI4Gz2gxsNCkeQ5J1raFy2zNZk8PFzzHO/AkjafUZG1IxvKw
         1WhrL1JR0+2sEnet+3pg4XSpwD4g9JDj4e5CLQvuaeGf40CvN1OORC34dk860V1QQ0YL
         Do1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509892; x=1726114692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPWoWt+316Jv4PRkQXpmOTDxa9BtNdvynfRmo3h2lZU=;
        b=SX3WZfLrCbNtOi3jys4onmCSV2WcB3zzOdmskAnejWtt1EngGlP+ABF+1qBi3UZ1V5
         AS/xb5O0BbxqUq+IjzBJenac3SXVFlexkHhKXdDRzJySUE45ZFF/KWw5ttE8RnSOPH0y
         KpKLT7DMtEjNo1YQo4r4JSVVoPXL45zjIQkgmPzscNp774CJHPZIV6kpNz1J1zX16Ppt
         8YpTBNDYkZ8VxLq0ddbyRNL0jHfAsOvLrt3wHY3sWTYgs/FyVzh2nBHYLQ6HTNLYxX7g
         mYy/SZFM0IDM5znnfiv7PeuLDjIcFFBNWT5C83tJhlVULqXoavGUGUk8ZOw4a/fwb/iO
         cPLw==
X-Forwarded-Encrypted: i=1; AJvYcCWyduZlTKXPMXtlEn9y0eSjgtsbFxOKDGbm3TmcBp8y2VZHdJOlnaLYFVSRP5hw2pDA/zjcaJ0kv1Xfkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwyQQD0NUHzeZa42EhGl0cMPP5T8zTFyo2ivgXSKD6LWQ0fOTF
	WWE71+vnmuGcWrsQvkDMWzWWjuwXhU2rjJrVzIhMNSujUkO9HESI
X-Google-Smtp-Source: AGHT+IFtOulSXoC/ctTuMj+I0PsDPFtHbtTpoHZ22Oz6oQvpBi8n8BbUuwVttzMnsxsQEnZDRv+dFQ==
X-Received: by 2002:a05:6808:bd6:b0:3d6:3450:7fe0 with SMTP id 5614622812f47-3df21eea911mr18954848b6e.9.1725509891740;
        Wed, 04 Sep 2024 21:18:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:18:11 -0700 (PDT)
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
Subject: [PATCH 19/24] Input: serio - use guard notation when acquiring mutexes and spinlocks
Date: Wed,  4 Sep 2024 21:17:24 -0700
Message-ID: <20240905041732.2034348-20-dmitry.torokhov@gmail.com>
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
 drivers/input/serio/serio.c | 164 ++++++++++++++----------------------
 1 file changed, 65 insertions(+), 99 deletions(-)

diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
index 29a2b13a8cf5..aa386eb37a16 100644
--- a/drivers/input/serio/serio.c
+++ b/drivers/input/serio/serio.c
@@ -37,33 +37,27 @@ static void serio_reconnect_subtree(struct serio *serio);
 
 static int serio_connect_driver(struct serio *serio, struct serio_driver *drv)
 {
-	int retval;
-
-	mutex_lock(&serio->drv_mutex);
-	retval = drv->connect(serio, drv);
-	mutex_unlock(&serio->drv_mutex);
+	guard(mutex)(&serio->drv_mutex);
 
-	return retval;
+	return drv->connect(serio, drv);
 }
 
 static int serio_reconnect_driver(struct serio *serio)
 {
-	int retval = -1;
+	guard(mutex)(&serio->drv_mutex);
 
-	mutex_lock(&serio->drv_mutex);
 	if (serio->drv && serio->drv->reconnect)
-		retval = serio->drv->reconnect(serio);
-	mutex_unlock(&serio->drv_mutex);
+		return serio->drv->reconnect(serio);
 
-	return retval;
+	return -1;
 }
 
 static void serio_disconnect_driver(struct serio *serio)
 {
-	mutex_lock(&serio->drv_mutex);
+	guard(mutex)(&serio->drv_mutex);
+
 	if (serio->drv)
 		serio->drv->disconnect(serio);
-	mutex_unlock(&serio->drv_mutex);
 }
 
 static int serio_match_port(const struct serio_device_id *ids, struct serio *serio)
@@ -145,9 +139,8 @@ static LIST_HEAD(serio_event_list);
 static struct serio_event *serio_get_event(void)
 {
 	struct serio_event *event = NULL;
-	unsigned long flags;
 
-	spin_lock_irqsave(&serio_event_lock, flags);
+	guard(spinlock_irqsave)(&serio_event_lock);
 
 	if (!list_empty(&serio_event_list)) {
 		event = list_first_entry(&serio_event_list,
@@ -155,7 +148,6 @@ static struct serio_event *serio_get_event(void)
 		list_del_init(&event->node);
 	}
 
-	spin_unlock_irqrestore(&serio_event_lock, flags);
 	return event;
 }
 
@@ -169,9 +161,8 @@ static void serio_remove_duplicate_events(void *object,
 					  enum serio_event_type type)
 {
 	struct serio_event *e, *next;
-	unsigned long flags;
 
-	spin_lock_irqsave(&serio_event_lock, flags);
+	guard(spinlock_irqsave)(&serio_event_lock);
 
 	list_for_each_entry_safe(e, next, &serio_event_list, node) {
 		if (object == e->object) {
@@ -187,15 +178,13 @@ static void serio_remove_duplicate_events(void *object,
 			serio_free_event(e);
 		}
 	}
-
-	spin_unlock_irqrestore(&serio_event_lock, flags);
 }
 
 static void serio_handle_event(struct work_struct *work)
 {
 	struct serio_event *event;
 
-	mutex_lock(&serio_mutex);
+	guard(mutex)(&serio_mutex);
 
 	while ((event = serio_get_event())) {
 
@@ -222,8 +211,6 @@ static void serio_handle_event(struct work_struct *work)
 		serio_remove_duplicate_events(event->object, event->type);
 		serio_free_event(event);
 	}
-
-	mutex_unlock(&serio_mutex);
 }
 
 static DECLARE_WORK(serio_event_work, serio_handle_event);
@@ -231,11 +218,9 @@ static DECLARE_WORK(serio_event_work, serio_handle_event);
 static int serio_queue_event(void *object, struct module *owner,
 			     enum serio_event_type event_type)
 {
-	unsigned long flags;
 	struct serio_event *event;
-	int retval = 0;
 
-	spin_lock_irqsave(&serio_event_lock, flags);
+	guard(spinlock_irqsave)(&serio_event_lock);
 
 	/*
 	 * Scan event list for the other events for the same serio port,
@@ -247,7 +232,7 @@ static int serio_queue_event(void *object, struct module *owner,
 	list_for_each_entry_reverse(event, &serio_event_list, node) {
 		if (event->object == object) {
 			if (event->type == event_type)
-				goto out;
+				return 0;
 			break;
 		}
 	}
@@ -255,16 +240,14 @@ static int serio_queue_event(void *object, struct module *owner,
 	event = kmalloc(sizeof(*event), GFP_ATOMIC);
 	if (!event) {
 		pr_err("Not enough memory to queue event %d\n", event_type);
-		retval = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 
 	if (!try_module_get(owner)) {
 		pr_warn("Can't get module reference, dropping event %d\n",
 			event_type);
 		kfree(event);
-		retval = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	event->type = event_type;
@@ -274,9 +257,7 @@ static int serio_queue_event(void *object, struct module *owner,
 	list_add_tail(&event->node, &serio_event_list);
 	queue_work(system_long_wq, &serio_event_work);
 
-out:
-	spin_unlock_irqrestore(&serio_event_lock, flags);
-	return retval;
+	return 0;
 }
 
 /*
@@ -286,9 +267,8 @@ static int serio_queue_event(void *object, struct module *owner,
 static void serio_remove_pending_events(void *object)
 {
 	struct serio_event *event, *next;
-	unsigned long flags;
 
-	spin_lock_irqsave(&serio_event_lock, flags);
+	guard(spinlock_irqsave)(&serio_event_lock);
 
 	list_for_each_entry_safe(event, next, &serio_event_list, node) {
 		if (event->object == object) {
@@ -296,8 +276,6 @@ static void serio_remove_pending_events(void *object)
 			serio_free_event(event);
 		}
 	}
-
-	spin_unlock_irqrestore(&serio_event_lock, flags);
 }
 
 /*
@@ -309,23 +287,19 @@ static void serio_remove_pending_events(void *object)
 static struct serio *serio_get_pending_child(struct serio *parent)
 {
 	struct serio_event *event;
-	struct serio *serio, *child = NULL;
-	unsigned long flags;
+	struct serio *serio;
 
-	spin_lock_irqsave(&serio_event_lock, flags);
+	guard(spinlock_irqsave)(&serio_event_lock);
 
 	list_for_each_entry(event, &serio_event_list, node) {
 		if (event->type == SERIO_REGISTER_PORT) {
 			serio = event->object;
-			if (serio->parent == parent) {
-				child = serio;
-				break;
-			}
+			if (serio->parent == parent)
+				return serio;
 		}
 	}
 
-	spin_unlock_irqrestore(&serio_event_lock, flags);
-	return child;
+	return NULL;
 }
 
 /*
@@ -376,29 +350,26 @@ static ssize_t drvctl_store(struct device *dev, struct device_attribute *attr, c
 	struct device_driver *drv;
 	int error;
 
-	error = mutex_lock_interruptible(&serio_mutex);
-	if (error)
-		return error;
-
-	if (!strncmp(buf, "none", count)) {
-		serio_disconnect_port(serio);
-	} else if (!strncmp(buf, "reconnect", count)) {
-		serio_reconnect_subtree(serio);
-	} else if (!strncmp(buf, "rescan", count)) {
-		serio_disconnect_port(serio);
-		serio_find_driver(serio);
-		serio_remove_duplicate_events(serio, SERIO_RESCAN_PORT);
-	} else if ((drv = driver_find(buf, &serio_bus)) != NULL) {
-		serio_disconnect_port(serio);
-		error = serio_bind_driver(serio, to_serio_driver(drv));
-		serio_remove_duplicate_events(serio, SERIO_RESCAN_PORT);
-	} else {
-		error = -EINVAL;
+	scoped_cond_guard(mutex_intr, return -EINTR, &serio_mutex) {
+		if (!strncmp(buf, "none", count)) {
+			serio_disconnect_port(serio);
+		} else if (!strncmp(buf, "reconnect", count)) {
+			serio_reconnect_subtree(serio);
+		} else if (!strncmp(buf, "rescan", count)) {
+			serio_disconnect_port(serio);
+			serio_find_driver(serio);
+			serio_remove_duplicate_events(serio, SERIO_RESCAN_PORT);
+		} else if ((drv = driver_find(buf, &serio_bus)) != NULL) {
+			serio_disconnect_port(serio);
+			error = serio_bind_driver(serio, to_serio_driver(drv));
+			serio_remove_duplicate_events(serio, SERIO_RESCAN_PORT);
+			return error;
+		} else {
+			return -EINVAL;
+		}
 	}
 
-	mutex_unlock(&serio_mutex);
-
-	return error ? error : count;
+	return count;
 }
 
 static ssize_t serio_show_bind_mode(struct device *dev, struct device_attribute *attr, char *buf)
@@ -520,9 +491,9 @@ static void serio_add_port(struct serio *serio)
 	int error;
 
 	if (parent) {
-		serio_pause_rx(parent);
+		guard(serio_pause_rx)(parent);
+
 		list_add_tail(&serio->child_node, &parent->children);
-		serio_continue_rx(parent);
 	}
 
 	list_add_tail(&serio->node, &serio_list);
@@ -554,9 +525,9 @@ static void serio_destroy_port(struct serio *serio)
 		serio->stop(serio);
 
 	if (serio->parent) {
-		serio_pause_rx(serio->parent);
+		guard(serio_pause_rx)(serio->parent);
+
 		list_del_init(&serio->child_node);
-		serio_continue_rx(serio->parent);
 		serio->parent = NULL;
 	}
 
@@ -697,10 +668,10 @@ EXPORT_SYMBOL(__serio_register_port);
  */
 void serio_unregister_port(struct serio *serio)
 {
-	mutex_lock(&serio_mutex);
+	guard(mutex)(&serio_mutex);
+
 	serio_disconnect_port(serio);
 	serio_destroy_port(serio);
-	mutex_unlock(&serio_mutex);
 }
 EXPORT_SYMBOL(serio_unregister_port);
 
@@ -711,12 +682,12 @@ void serio_unregister_child_port(struct serio *serio)
 {
 	struct serio *s, *next;
 
-	mutex_lock(&serio_mutex);
+	guard(mutex)(&serio_mutex);
+
 	list_for_each_entry_safe(s, next, &serio->children, child_node) {
 		serio_disconnect_port(s);
 		serio_destroy_port(s);
 	}
-	mutex_unlock(&serio_mutex);
 }
 EXPORT_SYMBOL(serio_unregister_child_port);
 
@@ -780,10 +751,10 @@ static void serio_driver_remove(struct device *dev)
 
 static void serio_cleanup(struct serio *serio)
 {
-	mutex_lock(&serio->drv_mutex);
+	guard(mutex)(&serio->drv_mutex);
+
 	if (serio->drv && serio->drv->cleanup)
 		serio->drv->cleanup(serio);
-	mutex_unlock(&serio->drv_mutex);
 }
 
 static void serio_shutdown(struct device *dev)
@@ -822,7 +793,7 @@ void serio_unregister_driver(struct serio_driver *drv)
 {
 	struct serio *serio;
 
-	mutex_lock(&serio_mutex);
+	guard(mutex)(&serio_mutex);
 
 	drv->manual_bind = true;	/* so serio_find_driver ignores it */
 
@@ -837,15 +808,14 @@ void serio_unregister_driver(struct serio_driver *drv)
 	}
 
 	driver_unregister(&drv->driver);
-	mutex_unlock(&serio_mutex);
 }
 EXPORT_SYMBOL(serio_unregister_driver);
 
 static void serio_set_drv(struct serio *serio, struct serio_driver *drv)
 {
-	serio_pause_rx(serio);
+	guard(serio_pause_rx)(serio);
+
 	serio->drv = drv;
-	serio_continue_rx(serio);
 }
 
 static int serio_bus_match(struct device *dev, struct device_driver *drv)
@@ -906,14 +876,14 @@ static int serio_resume(struct device *dev)
 	struct serio *serio = to_serio_port(dev);
 	int error = -ENOENT;
 
-	mutex_lock(&serio->drv_mutex);
-	if (serio->drv && serio->drv->fast_reconnect) {
-		error = serio->drv->fast_reconnect(serio);
-		if (error && error != -ENOENT)
-			dev_warn(dev, "fast reconnect failed with error %d\n",
-				 error);
+	scoped_guard(mutex, &serio->drv_mutex) {
+		if (serio->drv && serio->drv->fast_reconnect) {
+			error = serio->drv->fast_reconnect(serio);
+			if (error && error != -ENOENT)
+				dev_warn(dev, "fast reconnect failed with error %d\n",
+					 error);
+		}
 	}
-	mutex_unlock(&serio->drv_mutex);
 
 	if (error) {
 		/*
@@ -960,21 +930,17 @@ EXPORT_SYMBOL(serio_close);
 irqreturn_t serio_interrupt(struct serio *serio,
 		unsigned char data, unsigned int dfl)
 {
-	unsigned long flags;
-	irqreturn_t ret = IRQ_NONE;
+	guard(spinlock_irqsave)(&serio->lock);
 
-	spin_lock_irqsave(&serio->lock, flags);
+	if (likely(serio->drv))
+		return serio->drv->interrupt(serio, data, dfl);
 
-        if (likely(serio->drv)) {
-                ret = serio->drv->interrupt(serio, data, dfl);
-	} else if (!dfl && device_is_registered(&serio->dev)) {
+	if (!dfl && device_is_registered(&serio->dev)) {
 		serio_rescan(serio);
-		ret = IRQ_HANDLED;
+		return IRQ_HANDLED;
 	}
 
-	spin_unlock_irqrestore(&serio->lock, flags);
-
-	return ret;
+	return IRQ_NONE;
 }
 EXPORT_SYMBOL(serio_interrupt);
 
-- 
2.46.0.469.g59c65b2a67-goog


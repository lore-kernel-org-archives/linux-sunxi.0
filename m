Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3582518786C
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509880; cv=none; b=LnQoxYqSRUYk9c7UebPQ89JMlh3mQhLcy+WzpcuA9QZjZmfGW+SV+WY/iSTJecnkNb8fcoUyn86L6ngzCVG/70K214oiYSHpd3HWK1ijTJ/mh4fowEzJggGX0R4dneLFVygyhGWNrGJqqdXePu1XxIJ9AA5Lvxm0qbB6fvPmabs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509880; c=relaxed/simple;
	bh=19U38uZCXEvKhulVokOxaN0gRvDzLtZltpAHJeXQyMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Or9pf+oepNEzbbkgR1h9o/Y3wL6vc6u18D/JWqnKwxe4LaovN0BqGsLOhit71kxEXtmsVUdlsqm9T+xf5HQwZfsB8ChNq1ScFZwtu/n8brk4Cmr/j1uMJzSxW+i8vtE6lvAQHum5X/E5+sl6BxARvLtFzkoBwpcjx24GkMnEU1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUniAJY8; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUniAJY8"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7176645e4daso251634b3a.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509878; x=1726114678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IVs44o6ciGNOoB3tvSvkl1E7l7ddGpRPi+mMdxWbfc=;
        b=DUniAJY8DxJJA22X0LVsxgg9OsZt42Qd2qfBVEEe+SI30BSy8ZU8z2CXaLc3DXI2Wr
         Q7RtvGR6E36ASKduVqFQ7bnnxaZUXbWHy51HMz8UzymlMzLO3k2NEBRg/7nphbC90acD
         nuWWh8QrTUSdIIEy27xUJHd/6AF3SoRPMDCcudgiComOjBWVt3gpxR4hF8eJwpDhYDBP
         aAA0DMv7rO2vFELoSI41pZ9eQRHsXoolSwY16vU/6zyuEnY+CZVUzzeLG7D4QaZR7sX/
         MKnjjeAPygPones510koM3/K3eGsZYiAejqkBkeGhytHeYkS9cYXjeu8l5tJ+1pOewEJ
         g+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509878; x=1726114678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IVs44o6ciGNOoB3tvSvkl1E7l7ddGpRPi+mMdxWbfc=;
        b=TukUQeCSW1bS33nM/AkBbLTqJCkrXPJaEl9WP0802eGW5z76PXmZ5RZSMM9QD3wjgH
         Li8sVBpJK0dGDOMCLlXTXINkTxYZCcXqVUqHMf5rkyFLZfBn+r6CzH28beC84gQHalEE
         oGT9k0K4n1qGKk7pF5Qt1+juWWyC+3cViE9IAKssoZ2z7mr2KSl3yrvB6Qy9tnYmfZmF
         FBvSsAF4iSF5RBemgk+ZUEARG6KQuz9etXIUafVHAPynilUHEChFe0qq2z6Dk2x/VCqr
         gPtco/Jp5vSWZYEciVHg7l/pptYkm0lYgJ0t4go9KySNzd0NPHURvu/2VyISEtK0iCCU
         ErCQ==
X-Forwarded-Encrypted: i=1; AJvYcCViFLBaF4+fnC7j0/FosJiojuz0miS2chmX7DFUraP1MPHlDjjQM4H5KSVNQjEZyO9OEJE/qz8HhVBLWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKbaLBN8+ATqlE3uuY2iK/I94PMz2ib0Zi1Rs5sIifFJg5I+I2
	G9NMiqwBEUBeJdVktYDYITOV4MGQs0Gz6Zfy1VvN2QJPXN/FCFpW
X-Google-Smtp-Source: AGHT+IHw/pyP6EniZwd1+0N9t+8Gq3aDd7Fq8D4lnLSFHwaJBTj9phdK/nCIOoeA80+G8TcVQfUhXg==
X-Received: by 2002:a05:6a00:2da8:b0:70e:8070:f9d0 with SMTP id d2e1a72fcca58-7173fa40bcfmr14087981b3a.9.1725509878530;
        Wed, 04 Sep 2024 21:17:58 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:17:58 -0700 (PDT)
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
Subject: [PATCH 10/24] Input: gscps2 - use guard notation when acquiring spinlock
Date: Wed,  4 Sep 2024 21:17:15 -0700
Message-ID: <20240905041732.2034348-11-dmitry.torokhov@gmail.com>
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
 drivers/input/serio/gscps2.c | 114 +++++++++++++++++++----------------
 1 file changed, 62 insertions(+), 52 deletions(-)

diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index d94c01eb3fc9..cf0603d1a113 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -145,7 +145,6 @@ static void gscps2_flush(struct gscps2port *ps2port)
 
 static inline int gscps2_writeb_output(struct gscps2port *ps2port, u8 data)
 {
-	unsigned long flags;
 	char __iomem *addr = ps2port->addr;
 
 	if (!wait_TBE(addr)) {
@@ -156,9 +155,8 @@ static inline int gscps2_writeb_output(struct gscps2port *ps2port, u8 data)
 	while (gscps2_readb_status(addr) & GSC_STAT_RBNE)
 		/* wait */;
 
-	spin_lock_irqsave(&ps2port->lock, flags);
-	writeb(data, addr+GSC_XMTDATA);
-	spin_unlock_irqrestore(&ps2port->lock, flags);
+	scoped_guard(spinlock_irqsave, &ps2port->lock)
+		writeb(data, addr+GSC_XMTDATA);
 
 	/* this is ugly, but due to timing of the port it seems to be necessary. */
 	mdelay(6);
@@ -177,19 +175,19 @@ static inline int gscps2_writeb_output(struct gscps2port *ps2port, u8 data)
 
 static void gscps2_enable(struct gscps2port *ps2port, int enable)
 {
-	unsigned long flags;
 	u8 data;
 
 	/* now enable/disable the port */
-	spin_lock_irqsave(&ps2port->lock, flags);
-	gscps2_flush(ps2port);
-	data = gscps2_readb_control(ps2port->addr);
-	if (enable)
-		data |= GSC_CTRL_ENBL;
-	else
-		data &= ~GSC_CTRL_ENBL;
-	gscps2_writeb_control(data, ps2port->addr);
-	spin_unlock_irqrestore(&ps2port->lock, flags);
+	scoped_guard(spinlock_irqsave, &ps2port->lock) {
+		gscps2_flush(ps2port);
+		data = gscps2_readb_control(ps2port->addr);
+		if (enable)
+			data |= GSC_CTRL_ENBL;
+		else
+			data &= ~GSC_CTRL_ENBL;
+		gscps2_writeb_control(data, ps2port->addr);
+	}
+
 	wait_TBE(ps2port->addr);
 	gscps2_flush(ps2port);
 }
@@ -203,15 +201,56 @@ static void gscps2_reset(struct gscps2port *ps2port)
 	unsigned long flags;
 
 	/* reset the interface */
-	spin_lock_irqsave(&ps2port->lock, flags);
+	guard(spinlock_irqsave)(&ps2port->lock);
 	gscps2_flush(ps2port);
 	writeb(0xff, ps2port->addr + GSC_RESET);
 	gscps2_flush(ps2port);
-	spin_unlock_irqrestore(&ps2port->lock, flags);
 }
 
 static LIST_HEAD(ps2port_list);
 
+static void gscps2_read_data(struct gscps2port *ps2port)
+{
+	u8 status;
+
+	do {
+		status = gscps2_readb_status(ps2port->addr);
+		if (!(status & GSC_STAT_RBNE))
+			break;
+
+		ps2port->buffer[ps2port->append].ste = status;
+		ps2port->buffer[ps2port->append].data =
+				gscps2_readb_input(ps2port->addr);
+	} while (true);
+}
+
+static bool gscps2_report_data(struct gscps2port *ps2port)
+{
+	unsigned int rxflags;
+	u8 data, status;
+
+	while (ps2port->act != ps2port->append) {
+		/*
+		 * Did new data arrived while we read existing data ?
+		 * If yes, exit now and let the new irq handler start
+		 * over again.
+		 */
+		if (gscps2_readb_status(ps2port->addr) & GSC_STAT_CMPINTR)
+			return true;
+
+		status = ps2port->buffer[ps2port->act].str;
+		data   = ps2port->buffer[ps2port->act].data;
+
+		ps2port->act = (ps2port->act + 1) & BUFFER_SIZE;
+		rxflags = ((status & GSC_STAT_TERR) ? SERIO_TIMEOUT : 0 ) |
+			  ((status & GSC_STAT_PERR) ? SERIO_PARITY  : 0 );
+
+		serio_interrupt(ps2port->port, data, rxflags);
+	}
+
+	return false;
+}
+
 /**
  * gscps2_interrupt() - Interruption service routine
  *
@@ -229,47 +268,18 @@ static irqreturn_t gscps2_interrupt(int irq, void *dev)
 	struct gscps2port *ps2port;
 
 	list_for_each_entry(ps2port, &ps2port_list, node) {
+		guard(spinlock_irqsave)(&ps2port->lock);
 
-	  unsigned long flags;
-	  spin_lock_irqsave(&ps2port->lock, flags);
-
-	  while ( (ps2port->buffer[ps2port->append].str =
-		   gscps2_readb_status(ps2port->addr)) & GSC_STAT_RBNE ) {
-		ps2port->buffer[ps2port->append].data =
-				gscps2_readb_input(ps2port->addr);
-		ps2port->append = ((ps2port->append+1) & BUFFER_SIZE);
-	  }
-
-	  spin_unlock_irqrestore(&ps2port->lock, flags);
-
+		gscps2_read_data(ps2port);
 	} /* list_for_each_entry */
 
 	/* all data was read from the ports - now report the data to upper layer */
-
 	list_for_each_entry(ps2port, &ps2port_list, node) {
-
-	  while (ps2port->act != ps2port->append) {
-
-	    unsigned int rxflags;
-	    u8 data, status;
-
-	    /* Did new data arrived while we read existing data ?
-	       If yes, exit now and let the new irq handler start over again */
-	    if (gscps2_readb_status(ps2port->addr) & GSC_STAT_CMPINTR)
-		return IRQ_HANDLED;
-
-	    status = ps2port->buffer[ps2port->act].str;
-	    data   = ps2port->buffer[ps2port->act].data;
-
-	    ps2port->act = ((ps2port->act+1) & BUFFER_SIZE);
-	    rxflags =	((status & GSC_STAT_TERR) ? SERIO_TIMEOUT : 0 ) |
-			((status & GSC_STAT_PERR) ? SERIO_PARITY  : 0 );
-
-	    serio_interrupt(ps2port->port, data, rxflags);
-
-	  } /* while() */
-
-	} /* list_for_each_entry */
+		if (gscps2_report_data(ps2port)) {
+			/* More data ready - break early to restart interrupt */
+			break;
+		}
+	}
 
 	return IRQ_HANDLED;
 }
-- 
2.46.0.469.g59c65b2a67-goog


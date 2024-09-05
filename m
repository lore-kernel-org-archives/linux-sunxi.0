Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B789818D65B
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509891; cv=none; b=BszbJZwuJLamNGqHwYWOMk/KzxDhglTK6Lk8Ye7HvFmFEQltWT9ModxY9Adq8s/No1E1Xw6WBEu08noqXCbPa1U8STntMri0OjyPqA+ZBVjwCIjXIhKrBQpNVF+M9H9im3sCkd7/BzRAlJNCpxg+cLgePXxVJ0YOcimr5gbZKas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509891; c=relaxed/simple;
	bh=+xmHtxPCJGTBzSClQJ+yBa81QsqtA24ObFByUE16CfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WjgekNkN5yBwVKmiTSATAJdSxZN0qWzD34dMvNSGBIx8NQp02kxDXcc2huTZ9gFMhhXb+zGAEusDrNHffCMf3tZ7c/qLYvqRDI7YHE6pu+wUhgDe8IJWxygY4VlFXIDBSfopQ9EA2SfcHfJ4l782oI35+7cx2A8Di7ztdLk5ygE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2vGn2UG; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2vGn2UG"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5df998d7a44so211996eaf.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509889; x=1726114689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hL/oJ8v77sFrESpjTE2muwhc7qNiYaOX9Ne/zSSlqk=;
        b=A2vGn2UGS2ammc8vEKwgqt2ryEC/z/4khzUSAouuvjrHSRza6id/xnSx5Mui88lFE1
         BQ5xkqEN+tGMj1V7p3JW05Df3CyTjDrmUfBBfpuzTCnBQVdmnFxI87RpR2BZqyib2S9X
         +Be8d7VCwkVLmITa9+L5C9qZxeVNvlJ4MFQ9flbDDjUsjtR46LfK1X6sXlE9R6r9eKQE
         2J2ylLR3obendM7vyFVqU0ybBcbzsCOwWzOTMXWdcvw1TNKoWS7jaTu5fGiMWuoPHIQB
         2N+y45omgANosGmApL6XL0V62aP/6h/ILvmyh+/JphE01ki49V9YkoBXSGlkfVAJRwB7
         FuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509889; x=1726114689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hL/oJ8v77sFrESpjTE2muwhc7qNiYaOX9Ne/zSSlqk=;
        b=GtRVgeu2LeZhw7pcBOqIez5WS/gFsr/Ed/CkmIBwYrWHV6IW4lTUaVbdynXrMLnuDZ
         apGSX6EezUgWwAb77NHG5Sp62LJZdKn2u/Q7g2dC6EfMDvrPi9U08NJzkMoLonOuKPCf
         4nc7hIMNKAx1zUxpWYHDNoGa8Xxhmhfcc2E73n4KELYsOwpapgx3+9/3WjeFq8vf41/x
         Ivm7ttKwSr6FjeOFCKY62/I3WeDIN1/e+nEOlx8YFYQCOS4WjC9BqL9xLWQaF3WQA1JW
         DX55CYYeZL6+/zpQT1/4726TmuLEHRCpFgAdRbecAXhUk1c1GNarCBWEfCBxqxJt17gd
         it3A==
X-Forwarded-Encrypted: i=1; AJvYcCWNMeLFDAnkoJvvaouAwJjzCvVTWb5+B/3LGXA6uYV85kwkT3N/WbEG8Z3e5hiDI63r/MqQsDCeBU09mg==@lists.linux.dev
X-Gm-Message-State: AOJu0YymqcgN6B6lOwq95qGSJm+rK4oj5A5P5vX3hDsHqcIsM93vh6vi
	K1wtXzddKHv9aSFwChqgYelTocQr1vEPNV25jhWOl84BJ5unlTBB
X-Google-Smtp-Source: AGHT+IHFtlZtt/7jfalAzcdSLrrI2tqquQOXGQfEgeIl9ZKOtYpILy5RI3LJ8SU6F2JK5e0j4C+FUw==
X-Received: by 2002:a05:6359:410e:b0:1b5:fa8a:791b with SMTP id e5c5f4694b2df-1b8117ef578mr1137606955d.23.1725509888625;
        Wed, 04 Sep 2024 21:18:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:18:08 -0700 (PDT)
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
Subject: [PATCH 17/24] Input: sa1111ps2 - use guard notation when acquiring spinlock
Date: Wed,  4 Sep 2024 21:17:22 -0700
Message-ID: <20240905041732.2034348-18-dmitry.torokhov@gmail.com>
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
 drivers/input/serio/sa1111ps2.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/input/serio/sa1111ps2.c b/drivers/input/serio/sa1111ps2.c
index 1311caf7dba4..375c6f5f905c 100644
--- a/drivers/input/serio/sa1111ps2.c
+++ b/drivers/input/serio/sa1111ps2.c
@@ -92,7 +92,8 @@ static irqreturn_t ps2_txint(int irq, void *dev_id)
 	struct ps2if *ps2if = dev_id;
 	unsigned int status;
 
-	spin_lock(&ps2if->lock);
+	guard(spinlock)(&ps2if->lock);
+
 	status = readl_relaxed(ps2if->base + PS2STAT);
 	if (ps2if->head == ps2if->tail) {
 		disable_irq_nosync(irq);
@@ -101,7 +102,6 @@ static irqreturn_t ps2_txint(int irq, void *dev_id)
 		writel_relaxed(ps2if->buf[ps2if->tail], ps2if->base + PS2DATA);
 		ps2if->tail = (ps2if->tail + 1) & (sizeof(ps2if->buf) - 1);
 	}
-	spin_unlock(&ps2if->lock);
 
 	return IRQ_HANDLED;
 }
@@ -113,10 +113,9 @@ static irqreturn_t ps2_txint(int irq, void *dev_id)
 static int ps2_write(struct serio *io, unsigned char val)
 {
 	struct ps2if *ps2if = io->port_data;
-	unsigned long flags;
 	unsigned int head;
 
-	spin_lock_irqsave(&ps2if->lock, flags);
+	guard(spinlock_irqsave)(&ps2if->lock);
 
 	/*
 	 * If the TX register is empty, we can go straight out.
@@ -133,7 +132,6 @@ static int ps2_write(struct serio *io, unsigned char val)
 		}
 	}
 
-	spin_unlock_irqrestore(&ps2if->lock, flags);
 	return 0;
 }
 
-- 
2.46.0.469.g59c65b2a67-goog


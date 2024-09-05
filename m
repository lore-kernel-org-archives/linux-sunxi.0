Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61B126C1C
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509896; cv=none; b=fN3JFG4Pi79ROcJunqpyArd3jb8YDmRoiQCL95JmrH/h9z/oNv0rzQEMVrD9gWH3iOHLB4U/Z1UVbl3jN25YCi/pT+8SE1KfdHfCyETNfR/EtZur4WDH2cWbR6SiGStEhshlrazPUtBDkCjI1NOllugZcckl2Y8PfDYMse5vcKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509896; c=relaxed/simple;
	bh=komCIO/1EqUhOEh024NdqNhz+3ocvxMCYj+7ZMEMtMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K/yccywMaBuigxmrjAmotYR9H0Qcw98dKzHMWPkiGjOKwkuszFCS+kaKfqyXCd+uFnW3P/UEgiL0+eucrI4mxlKaxzGkO+SLY4KY1j6bYuTnBCyFdAzHR+ctiMv64D2lhuHH74qWbXUJg7ii8nCxb0F2+kGDz1eFecbiJtOBmWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8GT9YiZ; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8GT9YiZ"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-710a1bb9ecdso262217a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509894; x=1726114694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nD0rUo0iZKECgz1mfgeWlPajiiX/VTTiXfcH67/TdcA=;
        b=Y8GT9YiZXqCPQJQzQSENfz8vwlnkCb6XsHJvOn4H/ScgAkA0x4P61+OlBUruTzW1ZC
         MF1ZJ0J2yi3MXnjPzgh0UlSfRPYlfjaRHJ+Y/oMEiXDi8nkTuA7aZISRpV803/iICqFG
         ehuoVZdj52Tg+NRYzwP83XNdjnjwRMjDRp6nRyzLPwyDA8cJAC5sIhiirMp0VLL5fyQO
         7euBx5RR4fEZAVttq3oxBhATw5H1pn+A9G9gdOb2ONOuUBiyVIZPw+mm4u+FFGSIypb3
         sMLHsKqyMJgD+Ji4w8YYARYK99iC42ySA86C/yhyE30SbmUy/bIdyGxPVysbJuW0q5QT
         Hzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509894; x=1726114694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nD0rUo0iZKECgz1mfgeWlPajiiX/VTTiXfcH67/TdcA=;
        b=m7eVfihMDsjGslRNoh0HSMzkLTg0HNfxRUeWXoGT1sGkpyGCUU6+EALCXXNXtjtTMi
         AXJLtqnltDT8QbwxCqhe26yARe7V7MXQvQCHUkGz/V+hWDTDv16e3O+U5zXHMHx8Rp1h
         xn4EOCZbRHaS88cKIV2a5LfbVxKABAaUf8PVKacoFtVohJ0ya9tjrqGYx0WPhUjnkJNM
         SX8sSBgOhlR6A9mlf7oKGiBUAd3igRO0gNpi7miuJAtrMVIvcjF3nNebl0KEsb2phn9g
         kSa6HRRDZfnLfVwfBgVADGC5DoUKHZi9FtBXtILAyJppRxAFfbhWJkBSVtgaKWS5R6ip
         1dDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY9AbV17Fj9IQBFtHaBfyZS1MhJ4i5M643EXHA9/LbBS17zdMxNf2jUBA2GrfTVqD9fjzvHZ7mnNKTEA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn1iO276VOvdWKy8JGk7dp5M3dv5VeFL5yVEfMMvaXK3MCNoE/
	B8croplifC2oY7Pwqo4aYONoZ6EjeQiI1lb8bTzs+b4wAM363OGx
X-Google-Smtp-Source: AGHT+IFZIWBeGssZlbykHlhtPJzaOPXIEAb+m9BSaPwc6IUQXl2xcYZG1msLYwzKd+swNkLxBLV4NA==
X-Received: by 2002:a05:6358:88d:b0:1b5:a034:4713 with SMTP id e5c5f4694b2df-1b7ef352898mr2009643555d.0.1725509894565;
        Wed, 04 Sep 2024 21:18:14 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:18:14 -0700 (PDT)
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
Subject: [PATCH 21/24] Input: serio-raw - fix potential serio port name truncation
Date: Wed,  4 Sep 2024 21:17:26 -0700
Message-ID: <20240905041732.2034348-22-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240905041732.2034348-1-dmitry.torokhov@gmail.com>
References: <20240905041732.2034348-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When compiling with W=1 the following warnings are triggered:

drivers/input/serio/serio_raw.c: In function ‘serio_raw_connect’:
drivers/input/serio/serio_raw.c:303:28: error: ‘%ld’ directive output may be truncated writing between 1 and 11 bytes into a region of size 7 [-Werror=format-truncation=]
  303 |                  "serio_raw%ld", (long)atomic_inc_return(&serio_raw_no));

atomic_inc_return() returns an int, so there is no reason to cast it
to long and print as such. Fix the issue by removing the cast,
printing it as unsigned decimal, and expanding the name from 16 to 20
bytes to accommodate the largest possible port number.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/serio_raw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/serio/serio_raw.c b/drivers/input/serio/serio_raw.c
index aef8301313b2..e058fef07f57 100644
--- a/drivers/input/serio/serio_raw.c
+++ b/drivers/input/serio/serio_raw.c
@@ -29,7 +29,7 @@ struct serio_raw {
 	unsigned char queue[SERIO_RAW_QUEUE_LEN];
 	unsigned int tail, head;
 
-	char name[16];
+	char name[20];
 	struct kref kref;
 	struct serio *serio;
 	struct miscdevice dev;
@@ -277,7 +277,7 @@ static int serio_raw_connect(struct serio *serio, struct serio_driver *drv)
 	}
 
 	snprintf(serio_raw->name, sizeof(serio_raw->name),
-		 "serio_raw%ld", (long)atomic_inc_return(&serio_raw_no));
+		 "serio_raw%u", atomic_inc_return(&serio_raw_no));
 	kref_init(&serio_raw->kref);
 	INIT_LIST_HEAD(&serio_raw->client_list);
 	init_waitqueue_head(&serio_raw->wait);
-- 
2.46.0.469.g59c65b2a67-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591300;
	b=SuXFhCNXLgNh/8qO5IFObJGHrwRcKYYLqlInXkVcPVZZHzCbjA0gynbTtgRNW/ym5q+s
	 w9bD7RimHxoRcXXsPMy18OL08bPnupcjGvvkjT7Idf0JDFB7v0vY9Lc846/C3KckrkkKJ
	 rOTmQb8zcy30RmR0lA6PdEywbgbLIYATBx04CT+slbY2KLdWnfCkIeBB49RYgS1y2YlVI
	 T7gsbsuIXshXQLvcFpmO4LMwZMAj3VbTXBci+CuECW8MrZn7oWV0CoVTN4SqduLLHHIyX
	 4GQudCAzivH3PJ62cBkYdTvk8/mqElN9BZJSKchQa8/UwwilrZ0fQOgmNJ+Mr80qN9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BGofZF7WnGSF9gs6MjlInhn49MlqjmtmyUenZnGkdj4=;
	b=CFpsU7dIrLTqLddk8HGwdIPgz8DGcccnFmmlX52w13hoTNMFSp7yNXqPxi3iJJS81dkn
	 Odg5wOHZRTcYCxWXMsgJVugX3Mm8CtcdTCzOtAYwTRrx1Xrs3J0hkdjqr42HGYEW2fy6L
	 vj8KnXXvnX5gQ3Lg7yv/5qyoSr3mN0f0+BCzI4dBizWg8NcP0zrCi9189Z88ZXpcNR0Da
	 3RV2tLmgEEPXzzr9xgXeFJ1UwtjQZkV9/Fh+x8xbO8XnA/qpAj4pa4SpCjzWp8Xhxb9KK
	 mOclIxl7jGLRzgD9gifHCuEP2elYFspa0zBairXxUK2cWsmVYO6nDD21aY7mpAb51iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wZjNiYZd;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F2606A323
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 07:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 413F2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wZjNiYZd
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38190551625so10863582eec.1
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 23:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591299; x=1796196099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGofZF7WnGSF9gs6MjlInhn49MlqjmtmyUenZnGkdj4=;
        b=wZjNiYZdflp8TdFCOBqa6w0tTzTDR65HLXJTpdXxRpBhcKL0mwN28hlM58bghjILSp
         ep15/+uRG2ntIb8F20J7+aWcfDL7LjYN1iIAZQe0BK9XvDagBiTB0yXN6plfPv12bSat
         sk2ckYt/WBp5qZWwuApLXXyC73n8v2CjJgOVgphDL/uiQVO7TL/lHemAczQ2t5CYBQ9h
         54nVGnoNKZuKHeAaRjf+NY5G6dBnCZTu+Py97zlw1PJkWCFWwwFXwJ60TXLrd3Ipe2db
         Qm+7AlV4P/T+CHFxpuHScHhRKv3+3gTNxKUdYGuqgsKlsRU+mQr9ZKQoSb8RSmwRVwry
         fv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591299; x=1796196099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGofZF7WnGSF9gs6MjlInhn49MlqjmtmyUenZnGkdj4=;
        b=xEIeBfBTMZBYsMCy6Zq1qPY7SUVBLb9uALa7Kt6deD268UUt2MHXUUM8lWFQBGQ8LV
         yZxPg61inKGH88pLfPPnuo+uI73uYLV5uF6YWJ666T0FlWX2FTy7RwzZa+N4Lynpu28A
         vf7tTFw4nvvHvwgps7y2gnfbsX7DajSNGhViOpks/XyqC/FesQl+4IVM5usQjilNM+Ji
         j1Kpy6KyiAQkLIRJB3r6mPWDnOD3qq4bCUQk0+qNI2ko8qVVrVKw9+b686Sk1xjUbC2j
         G39fzvGzpbwFgYpjw3GaYDJunReyLSW6lZMVUOmuwj34QGJcqWcq1P6Xmgn3DeRzvtPp
         sHAQ==
X-Forwarded-Encrypted: i=1; AL+hErH56+kZlBbgeYqKELtgNsM8A/EiS0sWO48ryQHy3kvBYh8jKXqMiBrXsPzCwNozolsEIN/V2FjlTbhWCQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9CwZ1ptasivOeiVCBGTycOyi5bJKZ0w5xoGxA90q9XLe47mW+P
	PcjMe9JGmYUKh7NR43Biszwan6/swqNbdgSmIxHwXA9G+FmjuHce0HX0
X-Gm-Gg: AZFdTZeB2Bd+t5tsVSOtdUX40Pg8rqDb65akXgnOmMT2Jl3ZiJy4KuVCe8luap8A1KD
	KEx92z34DYmRzlDhwzkxQHvqT/LcIdfoow57bZ2uELiKftWIa2nJChVUcjFJJ+DzowOz2FcB6qV
	0NNjd/vuR9ECGtY4KdZbaOHY7tvI5QgfKmmWzNMxwaux9s5UP/HFvstweS/8ZZ5yYkvKNjLvduj
	Qos0AXcyOW086NGvh9ZdMO5pA8RhJZ4rX18FFPDu4Qy/1y2IYEyNUqgvHm4yduXv8xaV+mpVh+J
	aTBznsfGpKuzi+tkkjLaboz+SjI5feTaAEFJS6Wv3c4C0D9VgKn3WSkpC19L/jY2zkhjNGc75Sf
	OztC2prkIwh1Arwk0NGpK+mjWA0dWPeZzSNTHyCcEws5S8wzmuVtHQ0HcD0onmoX3mAGzArhmwo
	CeluHthugIy1fK7YFjksPFxv7sNUszx6dhtcaPER46i63W5USKErgDG75OHU+p0hIIBfURQHEqv
	1ScBi97DKBNuP8S8Sg03IdLXYzKcSdOPz3pfAJxNJ9o1gQY7XMgErzWg6qiKncn0NYYr/pCq4qr
	4Qs4wGmS9oqz2rqCMgxLLbabFwMgdQUCOSdoQj8PBhDFhmzpldTZWmmeTzYIFt7RDIo0hAaqIoq
	V6KeeCTZkPQ==
X-Received: by 2002:a05:693c:69dc:b0:386:aff0:6109 with SMTP id 5a478bee46e88-386aff061f8mr9195868eec.2.1795591299376;
        Tue, 24 Nov 2026 23:21:39 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm62232352eec.11.2026.11.24.23.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:39 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH 3/3] Input: da9063 - clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:21:24 +0900
Message-Id: <20261125072124.2997511-4-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
References: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Prasanth R <ragaprasanth@gmail.com>

The driver has no remove callback, so the wake IRQ set with
dev_pm_set_wake_irq() and the wakeup source enabled with
device_init_wakeup() are never released on unbind.

When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
IRQ, warns "wake irq already initialized" and returns -EEXIST, so the
driver warns that it failed to set the wake IRQ and does not enable
wakeup.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: d7781232b5b2 ("Input: da9063 - add wakeup support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/input/misc/da9063_onkey.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index 98297ca1d..304fd674d 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -229,13 +229,13 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, error,
 				     "Failed to allocate onkey IRQ\n");
 
-	error = dev_pm_set_wake_irq(&pdev->dev, irq);
+	error = devm_pm_set_wake_irq(&pdev->dev, irq);
 	if (error)
 		dev_warn(&pdev->dev,
 			 "Failed to set IRQ %d as a wake IRQ: %d\n",
 			 irq, error);
 	else
-		device_init_wakeup(&pdev->dev, true);
+		devm_device_init_wakeup(&pdev->dev);
 
 	error = input_register_device(onkey->input);
 	if (error)
-- 
2.43.0


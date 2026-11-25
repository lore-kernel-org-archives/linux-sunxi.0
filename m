Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591295;
	b=c6XVPS+E6VPqA3gqdIBQ7QcqQeseGnNe3qZcGHXPCzjKk6/ebtbd+S1FQNQoUo/XSnB1
	 oVU8Y58ajMZmgVktVwK56bvhLcrQjrVNVkHP6V4s9bMrX6LkqS3EUxarZnh60BBnPfayx
	 ao0PsfKxLsBLWU0QOsDG60y49VMpim2xqyP0BO/pM0jAYCm7cGcvPpMhsUzXvEsOvxbNW
	 wFgdEXz9lva/r9HQrpcXkFAY4QRKVLV0hIQcOsmlsbKfZjtP6N55WRBjdP91IbeO02sZg
	 GBy7b93V3YM3/l8l0jLFoWqxFe2J6ilXvU9nUYlLLnawKMEqh6lI+MPFWAcIU6ScWTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mdnrXivS6pphO0ni+EiUpdP5k6p87bnP8SNlAtan2c0=;
	b=ybxaqWf/Lq2Shh8Xml52xBiaW2C/pRXYMVrMuRpNMqlDhINmAdzVoMokbLU6BVF63rQp
	 7h+DYoc/Yx9bP0YbSh7q9LIleXiRZ8KTdq/MD+6qqySiDkpaipSLOpZnMYAr6wLs6j1e6
	 nAmvYqvS2GgZF0Ht8xRmx5HifzxvSKEZHRMgt4t1EGT12QSjEb1sVfOebRVMxtH1/QG5Q
	 VOHSsgC7P4d0lNiF4WrKAn5+B69KlUrtI+STkwU1ugOUp6h5xnQAwe0jS3AaTe/jBQtYu
	 bL7NurTEecFPmReeB+OY6H33KTUfJQnG/EJbKYkEWUIoegqpyftTniu1kJOwOm446NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AULk34Ph;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E878606A333
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 07:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E878606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AULk34Ph
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso7141651c88.1
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 23:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591294; x=1796196094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdnrXivS6pphO0ni+EiUpdP5k6p87bnP8SNlAtan2c0=;
        b=AULk34Ph+x+z65YDrTYAeN540JRvUwgIMJacYdNyW/LmKe23xQDo50RVMFb4ZW/Oey
         7ZhmenHFxnT/+hDLC+VOpyQo5KDETXSDCioL9mjGC6ENKoh5FhrfdyuSFp1+ALkHQ/Sy
         CaCNKq5dMFRy7mSNwXBM8aQ4Cbo2Eq620QkTj5YwDYTbGCR8Tgqj4S1u0Kz9tKc9mcnx
         EmcWdK1t2ZXvup+dX/w5Xlkx8fNnZMJWxAQ8IU8yY5o8zl1HP+4uHil7pFl64SlgPSCW
         gGzO4/CpT2c8HXZbMT8CAhDZNW2aICuaFT0imdYLw0VmKQ4KxqD1OcfTux+hXWu3Y4aC
         Hzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591294; x=1796196094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdnrXivS6pphO0ni+EiUpdP5k6p87bnP8SNlAtan2c0=;
        b=lF/OagHTJD1BJtsx2nt3rbxQ41Au6h2ApTkaYcQ2MbDCxHuJrDdNJvrcY+YXOYnoRv
         j8ljOOf514oC1AMYRriDkDW9sp7qMV72fkLlnDOFOXl+hGoZyFAM9i5zilKFhE2WDVkf
         2UuyW3niZ53o9BzeYK890pd715NYHZm3cJj3hINtrx/Ofb0iExYuYVrU6aeKpDw2SyRY
         kppD0YDblgaugwssBrZdu/YEkwtaJHiXhwa2QOiAJvRajDxqjZZxHMNf6myoMACfNGsY
         O6l9IPeGjUTx8pwptDDIrLEowaVrKvUYw8CkHoEsWx/LM9MUfQL6trRWcNgzQviOHgVN
         hZWw==
X-Forwarded-Encrypted: i=1; AL+hErHygmW3hJ/g/ADVpzkp4ZRTpz9R5eLlDDOZSNfSl5cPgpVHIixqwXkjXUDsb8XWa4V5Omp+P4GDz38Xgg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/JEFn4Rvnm01b7jdnWbk26VoVH1CJopFADNrPTc9CtIwHgdTQL
	hn1UUKxZviuaHCKUaCgBkDBVP0RWEXJT8ngfBvYTYaqQ7n6QWrGGr9I1
X-Gm-Gg: AZFdTZfa9qrV3sStGDPv2ZDIhhm8jFxEn1WSJZtEqw7tierm0sdlGtI4faVWbPJvqSc
	zMTaIheWv0/vsBfDStMFS2tB3ymVPGsB+qrH5ZcsPEqYgIoVBhcw00PD3crzjCn1HGCRPpRgdiH
	Ex2O1e8HxPH90KR8Vneg9Hdm9XTtY+CGG4P25Y2hZKW7StvitxOcq1MpSyVCRc1EIMGr3SJ0rR8
	Tl8/T8k6qLRtYgtuYON6jeArl7FBNzCGyB/Q9QTkWiAjaEUQ0EJbl0ko8WQ7aeBuz0H2qltkvPi
	/HBlNL8bOTzpImAX0E1Buy6+uIJg7AQ/YF2nCON3eMtXsHXPZkv1Q1RS5yQif+wZnQXrOBNpGIJ
	L3AMVAENyF79bCjiPhaKK3bnYAFWcM+dngEmicPcJ8QYfE+rqGCyvpGASGzad9vMAhN1vlw2ZTU
	oj1UWtQNLJf2AIaoqsDydocHzq3Nsfw3kZWsPIK6vxCavqgq91FJMMgOE5OJVyWH8cDkLTBun7F
	Y0cdvJHHkIUc92TwKQFr/+OnaCzHqT54/S4QHIL1ludRD6AqYwKV5lOIi7DScS1n2H4lmKC1uje
	/FXrbmpvU5DzMcnZAPL++cI2B8p4SH8xmw10fknCyxPpPX8y1aOu2nNig9mA7Xc3
X-Received: by 2002:a05:7301:6184:20b0:386:b006:c8 with SMTP id 5a478bee46e88-386b0060806mr8919262eec.35.1795591294367;
        Tue, 24 Nov 2026 23:21:34 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm62232352eec.11.2026.11.24.23.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:34 -0800 (PST)
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
Subject: [PATCH 1/3] Input: snvs_pwrkey - clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:21:22 +0900
Message-Id: <20261125072124.2997511-2-prasanth.r@lineo.co.jp>
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

When the driver is bound again, dev_pm_set_wake_irq() finds the old
wake IRQ, warns "wake irq already initialized" and returns -EEXIST, so
the driver prints "irq wake enable failed.".

Use the device-managed variants so both are released on unbind. Only
enable the wakeup source when "wakeup-source" is set, as before.

Tested on an i.MX6Q SABRE-SD board by unbinding and binding the driver
through sysfs.

I used an AI assistant (Claude) to find this and write the change.

Fixes: fb3c09ba20ff ("Input: snvs_pwrkey - use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/input/keyboard/snvs_pwrkey.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 33bc3bd0b..513fb9bbd 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -245,8 +245,13 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "failed to register input device\n");
 
-	device_init_wakeup(dev, pdata->wakeup);
-	error = dev_pm_set_wake_irq(dev, pdata->irq);
+	if (pdata->wakeup) {
+		error = devm_device_init_wakeup(dev);
+		if (error)
+			dev_err(dev, "failed to init wakeup: %d\n", error);
+	}
+
+	error = devm_pm_set_wake_irq(dev, pdata->irq);
 	if (error)
 		dev_err(dev, "irq wake enable failed.\n");
 
-- 
2.43.0


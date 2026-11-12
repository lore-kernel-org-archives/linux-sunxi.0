Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466586;
	b=jg+kCs97xbCL6mHt9zoPoMIJDIuqCtlmm5n05n2j5jGJEPJfJP9qHMiTe/dWNqEWkBuD
	 YoStjq24wwKENDhkN/L8NX4gKDSP0lGr7Q4c27sqI5S+EBYXqzn2ABwY6FFdhnbzmNdUg
	 /PtcV0+PQcfNc6qE4hkwqnfC7Nn2IcfP+WGXeRp56aLOutpERa8O0fR75MwcqgEuv7dQ+
	 8sdBgmkYV0fD4erOB1GgClCgIoAP16iXCIwg9gPzJHy8EVLTwBzx9OXrSoMcplEOKb3Uo
	 3LgauPMvelibJUp3zOWJNp6XeC/EaRCvaSaQYldfOzjE65M4LMGRNTipUsuTcYZr/yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=csZSNdtphR4UrJionrHwtrF+cPcKbhAt8xmIfm2H+zw=;
	b=3rhn1FBkAKvyPYlmlm83xu8tCGnQZhuIuMSHICzbfJvxxKrOkxdtMNVN2ws2qnr++srz
	 Ka6nJd+K7sjP6rbypg6hSDSS3UVNOeFmKS02us06hkv6uyr+mk8Wdg5dq0Ic69k050CCq
	 NpmVw6mdhBg3PpuTGeJJid5YykL+ip+RCsq4NWUWOiy6xe55k671tP2kg4sP1n8D4jiQR
	 fueW18Mfe/jyNuNw9K+aVpod5fZJPyocQ5XqIixW3rXTIj1n8mi/+NNNxESzrL92lBzQP
	 FfKT57BMLKcEHOKPn+td+DThm1903SgaxsYGNFk0GvDfMEzY841pdfo+IrILj65OxrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1kSJEsx;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85792606A33D
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 06:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85792606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1kSJEsx
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53394bffe0fso6677281cf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 22:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466585; x=1795071385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csZSNdtphR4UrJionrHwtrF+cPcKbhAt8xmIfm2H+zw=;
        b=b1kSJEsxKqj7Cg0Eif77z6HNW3gUt/cMnnNWyczNW61e72KVyF3m5BPFTrd07BagzK
         KlCkp8FNguWNj5rAOnK2knqBMY9OT0+vKe1y1kIO9gGDejUzcvwMRIoSQAg+4ntsX8h1
         14A/xBEh5Ot+bM58/gNYGAEYcknYxhpNGxDERyiRjmxOxkLHKeTtHyjq1oFwe+aYVzUe
         +ZHYEA0CEA9Ra4ZqEH16Gz4d73H3ewMBrIXmYuqa3d8KUbUJNAcmJ9Z/HZvvpSot5JMe
         /iREBNMdMmXa4kosBhFR97eRDc3tP3nSuIHsiSCadUFZ5sOlofUdWR6MrwYQu9ipy3Tx
         blKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466585; x=1795071385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csZSNdtphR4UrJionrHwtrF+cPcKbhAt8xmIfm2H+zw=;
        b=zJx6fPXsqLi2Aek6mD4UkUHKEn0GJ/LLLzhyF7UTHeE8LqVWqlvOhuWPDgfs7mbbg9
         1A6dKj483ofXxIuvrvuEij7KcyfriI6+Ukx8VebHxWpyZo3u+n30Lbpkc6tvPk4+iixr
         IwvkHUeu0o/Cod2W68l1XCEBKtD1GfjajqkRtn2TBwKgJwCZnh+CHJOBwKa6mVk/7BiQ
         6U+Rav9HuiwBFhuuVwgtbmRne8+hpRyyORIhn9vQdw0d7us5SklIpknpTZlLtL8OJG0t
         3ap7x7jFG4Eb4wDTENQy85WoLjkuDrIt61T7Ah6nrWKGeTCRh87IgVY05K+ijEdmZy4m
         LUgw==
X-Forwarded-Encrypted: i=1; AL+hErE1qDOV09ZiMvfT5LsZXxHy5dWKKgx+zC7QgIkabNncel8JT7+00pFko+t53/oKPZjiU+21GMl1Xj3eig==@lists.linux.dev
X-Gm-Message-State: APuU4Z81eekkDpHdTt+empSJ4KpEFrKkOMaqi1KxALYKGCzwGsO/eWGl
	7oN5lfau4XagU551bHViwi7ZwPjrPwWSHITn16s1Se3A5lZd6+YizOY=
X-Gm-Gg: AYBFou1srHZ0PD7LUna7oquikhYyfaaav2dxIl8LD2HXj5YDPXxImY95oOkkN50hAO+
	DG6Gu09+wWmSGEB8EjkkfJZdfxUEb4WiKUv3QgSxQFwhHRlYwxmuFAxDbbPd5DGgAw7ccS4lsMQ
	UOCGFUazgm/8iCIJeNDN57R8GRAbPF9uowDzQWkoND3cm1fEV2smdMBbNN3tW1DcWiWWPMXW5WZ
	7vViySNaMTkcaTGANwAM9zgv8K7iExl7h1ZCgEK2BB/lliJs2BhOvS3Z9Q7IMZNrnA8XK10BozC
	os7RBPcYyjxO/C+VQdt/tJHlmkohUgWBRb1Dguuwc42BZYIpvNGEkjxsyFgQ/asB6gNBm5CZ7xu
	+SBtqH35Zjjoa5Ih7bu8baa+/U3kPiayZwZ/ebENQh7FCRTkKwK4PYKjneL/dNymGP2VSq7nwWt
	dCa4M4hDlATSRAQJwgh9mN3rgFVgZmkLSgAB+7eUa/zV0qJih4btXPTYDWIK2KRzpojow9cIc20
	/vMs+J3n3M5QiBBW2uGfRtJ/AKz7TprEJjDz0tJ4TSxNW/8BLl5KRYGMSQrUPXcrePYqqSMZVWl
	xwe1iGDv9zTjlmK+CCdj1Vm3RSRefRn9wfjj0EQGB/xjkzqFwj2b8RxvvUfRqOLrHPTZ13PRh6n
	7jMdPj4lYj8GaU63PYvYKb+DlEsIx06B651KpecMuv1HZyNKrB3UaYZVrqd9ERWMH1rWC2fa1cE
	AOidgv9FczW/049Ezju/Yl8znMkBPB/sz2Y68nRc6IDcUZcoUKV9UHBQ==
X-Received: by 2002:a05:622a:1dc7:b0:54f:7f40:799d with SMTP id d75a77b69052e-55956e5ebd8mr31073631cf.31.1794466585518;
        Wed, 11 Nov 2026 22:56:25 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef054f382sm64827376d6.43.2026.11.11.22.56.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:56:24 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: sunxi-cir: Disable the interrupt before stopping the hardware
Date: Thu, 12 Nov 2026 01:56:23 -0500
Message-ID: <20261112065623.34296-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

The devm-managed IRQ remains registered after sunxi_ir_hw_exit() stops
the hardware and rc_free_device() frees the rc device. A running handler
can therefore access the FIFO with clocks gated or pass a freed rc
device to the raw event code.

Call disable_irq() after rc_unregister_device() and before
sunxi_ir_hw_exit() to wait for the handler before stopping the hardware
and freeing the rc device.

For backports to kernels where rc_unregister_device() frees the rc
device, disable the IRQ before unregistering it.

Found by a static analysis tool under development.
Not tested on hardware.

Fixes: b4e3e59fb59c ("[media] rc: add sunxi-ir driver")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260729153104.3F6641F00AC4@smtp.kernel.org/
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/media/rc/sunxi-cir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index e97bd9e03c1f..9d22ad7aa94b 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -374,6 +374,7 @@ static void sunxi_ir_remove(struct platform_device *pdev)
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	rc_unregister_device(ir->rc);
+	disable_irq(ir->irq);
 	sunxi_ir_hw_exit(&pdev->dev);
 	rc_free_device(ir->rc);
 }

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0


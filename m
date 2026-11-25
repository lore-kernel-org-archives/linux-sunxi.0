Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591299;
	b=2lLFk4K/cd9Dd5F0G3UQR/Ueq2rmOdMnWt4nUg89OX7pI/HuPtVXuZduGiBmuF5Ysp20
	 jBHjzgv+lcZtR0rTMdq9yVgw39kdZ9QYMfr5axsAAMnxoYno8DI2qDmffRYkhe3RKfX1I
	 FuD5p67ebeYmmDcKVexz/sD1Hbk5QzcJzqxizGG+HE/hULMXXOh1FGIUlgWOANpSexQNC
	 j2sypvIbWfG54IJT47wz85UlM7cDwQxwnOxYp2n4P4VzchNAk77VFJUKgPB7oDm0iy5/O
	 8w6uMxTl5QA2jlSXdNdT6iOjaosD6oV/B9jEUHcsahh+b4i8BIYrvt7Dbr1/wf+kc1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uP6f2xqQXzq54FxHQMZJOGM6VDsROKZT+DhRoGkRjNw=;
	b=F1tqD0fOev1sAihD6J3nq0db7JV7aN7X+ffNZVGXlkD9+kJ6xA7W3IM0UJJs6tirsiqF
	 bqID6S2PjcADUlEGff64lyO6rXc6vh/VRdjf7g0tj3ycXBsy3I6/Gj/ZC5uECTTPfQP3S
	 EJGn3XiLVGi2ajkvl2xl0eBCKORpP9lnI5zPAKKuq+WHn3U4/obkSFNXgBH3nej8VJd2d
	 X2HZuqYfl+9HAPsZ44LPpl5CZK5pCG3Wt/03eAiYJTw3b/nY4jfQ1ATngMzwkRfzxA4cf
	 NLVqtQf+XPQyWrri5032Z5MaqnGYunrH99HGZBA1N97aechpH7HPcsb4evrvDSeaY+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Uv97/Yyc";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7BE606A333
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 07:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B7BE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uv97/Yyc
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386cf1041cdso885489eec.0
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 23:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591297; x=1796196097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uP6f2xqQXzq54FxHQMZJOGM6VDsROKZT+DhRoGkRjNw=;
        b=Uv97/YycXan5IDkaYJtsRwLOM1O9QapuurnnT/+HWviJ7Rh9oz8Eo036jWbU6hAeB8
         aUvqaboKQrPJv+dNdRk2sb6XeqCbelXSd9WpnmFLTqJD2OtzR75/fKAn/s6EqyHkU2Fb
         ZTR6fHYry+Nk6Dx3edwhcYfURwkNp8RA6jL0mhggLXq/T/hh2cxehB3KslKiFmfXoxb0
         BoekRycxM/gcVvUyJtHhJzoJ2ugodGh/QKcL4AG7gyq3Qe72SOhmv3gX2Z3bWIw9cdT9
         yqu2WXEmwsKyNyNH73A1ePoemec3a79aEcCIWETdxx7rI53NPCd2g0VeI9T24jpyLRAv
         2Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591297; x=1796196097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uP6f2xqQXzq54FxHQMZJOGM6VDsROKZT+DhRoGkRjNw=;
        b=R3VdJM5IXsDWsKtK/YmGLkjgwSifkhGURcNNS/iV/npFV2f+0DGIvuhQ2tWE/l7TaK
         O4e7uyUq5gR/eevMvD4sm6Pb7XVFBZGVT/DDAOPKv3Q0dQvWw41WAJz8eFeekxUcyFIo
         sMADSWW+wcKEzw5xIO1ksQkSXJe/jx7mMcG49QdvVz3oWRqCtoQwX5WFtWh/hrhzZYHc
         fS9Saio2pUPHgp0SJH6QUQKSacEpp8KdsZf1K1z/akVnEx5Z41Lhc+j6MBRNXHNdkWhO
         HoQE3UpmiO8fAmrrNqr6VINGy8+z0foU7yr4XSBjywT7LJ4Z/1cDp4i6KPvLJnNIEWzX
         oRYQ==
X-Forwarded-Encrypted: i=1; AL+hErGxAw0NFeWLVKqfFXg5Z2hane9csG73uqd/7ZQECmvoAh8+3WVK6qBlPocs7sFizw56OsDV6wt294pyhQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z//ZdPEQkRaz0PmCEGSIXBqs8DVKnGrCJk2zTAgCFsa2ATO1YI5
	gKWTjZW3oWvf7ezHYzfYlOVUgQ3u31gtU05FdAz+n47VOMFnRy1NbdLH
X-Gm-Gg: AZFdTZcJT19vy4i/eW5k3imrv9KBEDzRQ0yzHPD8/pNDUGpdm5hKRMfYPFaERr3R6C2
	Eqaaz3pgdKVk8G+YwuGm8RcX+cbqVfLXt8M09KxfcoFw0SjGtsVTUz1k9J+v9k4qCKai5Hyab8C
	fS4VRpGmNz94p+Q0jkY8avIJoHiGDXHpP+isBRbkSmI80J3+QOCLFE2KNZAMgBLimW1CCe5j6Xt
	TfODl1pLI9RedzfuiGVRETrZQ81GF1FWPL3KVbaYihv9+rb9adLy58rw7UlACC3CToQzaxqBczZ
	GpqBwmt7jj5vbSN6g4IKx4Y7FnBF4gwe83pJ06NqouYC1GSJW02UuRj4rmKphKqsmf/Fz7X3Ah5
	ve41litYgIq993E7LlI3zIaDk9pRU7QNQfzscrVCjFdQsw0P6bHCJ1FfI+6t91J8q2a6jVFtVi4
	Ui3ZMk1D2EOZGjoszTNIyjGhEizitoW2kowkfVgtKUGGlUXlfVF4+FA9yEy3XBKGUA/sdvVRA0b
	ndqFCvA/0SqMFlHiirAV2vF8a4SQ2ke/7PNsiu/B4FkxC8rS3tdB9w0HH0La0koJihhlFNh6u1c
	E4HAXUTOYCxcBPbvOYOZ2dh4T5S9+KQx9InnIXSQA5+68ZSHkTO5DjZ/rnm5VRkYpg==
X-Received: by 2002:a05:7301:6083:b0:386:a01f:a36b with SMTP id 5a478bee46e88-386a01fa8d8mr18967962eec.35.1795591296844;
        Tue, 24 Nov 2026 23:21:36 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm62232352eec.11.2026.11.24.23.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:36 -0800 (PST)
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
Subject: [PATCH 2/3] Input: sun4i-lradc-keys - clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:21:23 +0900
Message-Id: <20261125072124.2997511-3-prasanth.r@lineo.co.jp>
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
dev_pm_set_wake_irq() is never released on unbind.

When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
IRQ, warns "wake irq already initialized" and returns -EEXIST, so the
driver warns that it failed to set the wake IRQ.

Use devm_pm_set_wake_irq() so the wake IRQ is released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: b243018eafeb ("Input: sun4i-lradc-keys - add wakeup support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index 05983db3f..eea04d27e 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -321,7 +321,7 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 		return error;
 
 	if (device_property_read_bool(dev, "wakeup-source")) {
-		error = dev_pm_set_wake_irq(dev, irq);
+		error = devm_pm_set_wake_irq(dev, irq);
 		if (error)
 			dev_warn(dev,
 				 "Failed to set IRQ %d as a wake IRQ: %d\n",
-- 
2.43.0


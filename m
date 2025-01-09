Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA25414F98
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Jan 2025 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437185; cv=none; b=SEnZNyjn6AwyfhuCAEYFxJiCh04kTe0GOxNIchk6xKGrZtXjL/AwO9WzaNcuQoAr5/SyHxQDwnPJOC9VXHV/Mqgs/4hImfW2ykEsDbYTFMQGYUW9ctatjqIDA0W+pcunMRzlVmiEDcWIByNk36Rm4jTUYlrPNDWaKf6iSQKeGTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437185; c=relaxed/simple;
	bh=Rzhtth1R3PE39OCQiIAGk0XTu9RAO4/mwAObJ0tCly4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZBi1EI9BWsnyzc3RPMddnaZhh9LehjiX9F0NAsL4xthVWkhc+LDjTbHPOhN90kBfURhHgX5TL0+eOUh2yHt1sMS/WeXqE5NKt62LEwRJGlhwsXe7wy/3Kf5nP3LUjJcydPZs+TNNguTir9M5bIiBnWkbWQJvkmabLjVZme0UEc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZsKHjwA; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZsKHjwA"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so202570366b.2
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Jan 2025 07:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736437182; x=1737041982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vk6+7Zp7POqWSiiv1DSP428bWeQZRwfTw6RhTWCJyw=;
        b=HZsKHjwAdSFE96x/JnFywbnKjvdZUmpXZQNaP0dktPjOYJQSi1GxAwPHGECw/Qx2EP
         NOJjkTDanfuGtfIq3mGlpR5V0tNaaLG48jRq01TVI/O3Jn2EXfjmOhOTE1NNI2vOwYv7
         NVIfYg/IlRtc4Ut+jyQG3fX/Gx4oDc4nhAiIDctsCxyip4TgtjorB3QZw5acbLSGwcKb
         pc76f3aC7/KQ6iWgnMySWdoDaYio3FE5wF3ZLUgW0uGc0w2V68sENH62ixSVHETICYwh
         kAM1Bf/LPvhB+hvlkUIGNbtBYZgIvFDOVWlnslvTMk6Rp85rYXUlwqQFaDT4zBj1GoVw
         CFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437182; x=1737041982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vk6+7Zp7POqWSiiv1DSP428bWeQZRwfTw6RhTWCJyw=;
        b=MX4Va90RbMYdLLKuubFvFya3zDJQrzUhPUprezxV4LYZ63+BE+MmGf0ipVDWnJWEss
         LuIIFL4cdI/nmPyFuULCakLCgsI4OAiHf/iusIRRx9KZ5cmlOLfKbzaNnktUa0zlulea
         F4V3rxFfOS211rRfRCprXOL8xt77ubyXMJva+404xSPiYnbbQJxfos3n6C614fMcb0mh
         Y5OH572yAvHZ1m60OokZSy3K3PDUiKSqZmx5yrlvFXNVfxmroqhj47iG4uyFULp+gkCa
         F1iV5kPNRBm4LwcZSTT7KVF2JhSOu/0N3RZATc9+jn7wf1NcWGUi+LIufl1wzLya86Bo
         JfTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9hY3L23hbreIB4bs2mHmxKfFPw/37YpyR+puoCm3bmKvWTkrQ8dCG5YNJLwsiX/Z0x4nNYgSeqhczUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4j5X5ql4xMlkK0dyaUx/nEl3QDm6NbTTShCvCS0EKa2ET8r9e
	dH6s/SMbRqU5bgdyeDj/FTWeTittfUKJIJ7k9LPUsLa2pjFuXKwn0pdT4JhV
X-Gm-Gg: ASbGnctlAPUDqLLWADCRHcHRHiOLrjKzkE2wvp/BAsdlj68VRuywGqnu9ktfBd6i+UF
	zwKukjIDHP+ipqsRvlpf1nA1FvIDISNjudrT+avfCoU6U4LL3GQ5QO0/n1XZbgRgzt0bsa9UBTQ
	vUZyDI8RpxMbaHsUQ0k80gFMSZBMToxmQhmCc+nDB47slJoJLjf3j9VOJoTiDoIm9NSBA/XEzFM
	HjEUmlsdrZXo5dg32uGUJin9HTHEV0hFRssaJK+7k5OowZ3KUHWyl9pmrsP4yq/BOAfjIr0iTc7
	tShgdGFXefmmtJnV7+/WL+q4g+URQ+M6G2lev7fyP8U=
X-Google-Smtp-Source: AGHT+IFj2+tODvSpYPQKL+ViJ0DL//Q+lzKHKCCuLpU5rxscBjkzMHzjJznmcSvRpQo5DVH64bosjg==
X-Received: by 2002:a17:907:787:b0:aae:849f:3255 with SMTP id a640c23a62f3a-ab2ab709e27mr618538166b.34.1736437181824;
        Thu, 09 Jan 2025 07:39:41 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95aee31sm82176466b.133.2025.01.09.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:39:41 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH] irqchip/sunxi-nmi: add missing flag
Date: Thu,  9 Jan 2025 16:39:35 +0100
Message-ID: <20250109153936.1908044-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AXP717 has a PEK to wake up the device from sleep
AXP717 is on the NMI irq pin
add IRQCHIP_SKIP_SET_WAKE flag is required to enable wakeup from the suspend
---
 drivers/irqchip/irq-sunxi-nmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index bb92fd85e..3e87ca724 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -186,7 +186,8 @@ static int __init sunxi_sc_nmi_irq_init(struct device_node *node,
 	gc->chip_types[0].chip.irq_unmask	= irq_gc_mask_set_bit;
 	gc->chip_types[0].chip.irq_eoi		= irq_gc_ack_set_bit;
 	gc->chip_types[0].chip.irq_set_type	= sunxi_sc_nmi_set_type;
-	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED;
+	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED
+		| IRQCHIP_SKIP_SET_WAKE;
 	gc->chip_types[0].regs.ack		= reg_offs->pend;
 	gc->chip_types[0].regs.mask		= reg_offs->enable;
 	gc->chip_types[0].regs.type		= reg_offs->ctrl;
-- 
2.47.1


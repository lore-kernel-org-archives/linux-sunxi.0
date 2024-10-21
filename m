Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF39A1FDFA4
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Oct 2024 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542514; cv=none; b=Df6Op8VTcdQS3KohYntYWS3alcO4f5rZ4ji0dHqsoZ0yKkxE0aGzx1rbUIQZudUpOy5uGQeAq8VW0X7sTF9ysI2Jlih/cyy2w45nmNeO4zlp/uPNo5kT9hxzK1WJSlDy2iZRlfM8YIo02jplRfMKd7F0zOZ7XApbi7OfkHlRL7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542514; c=relaxed/simple;
	bh=F8YQ3HQYY2w+VhZkKOD4BkQV8/JYW/XDhWfSKzi9Psg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J159L3EGMiA24qdsEsc8/Y7GELVCNTH0wDpQToe2wv4FdChsGFxunO82VYQ9itPcPH4+ABLgcQmueBNlcX7goRNvLkd3L8tQfS8IFlZ0TlAR6ctXNZln0gOJ+hH74Bxeiko7X7+wqvm3ooXTei+CqU0Ism2i93GFFyVuKXgXkdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ej/NhgPL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ej/NhgPL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43155afca99so34586385e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Oct 2024 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542511; x=1730147311; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXOGORusAheGbXjY9YsHgDJ6EQdczoB5sORBvnGhFxE=;
        b=Ej/NhgPL410aRR74Er66PGzfGMTaDQb1vz8RWvCG7SwQ710kbIbDezyH20IGDbd07V
         6i/IE6ZztZw7JYQMt6WrW+ESnJH8ho3Y5IMWO79IBzlOLslZ2Hzugdkt4g40DytDc5cj
         ubh0PVXQTo1GVp6uhpY4Es5Itza8z8O35YY421mX3DRDsDS1F6z69P3TIpleW5i9q1DY
         Y52pv6y1wdcR2kSHoXX57BCncpBrMceu8qZf5NsaL/p+BzafpQ9JhkHKCBOjWHl58tZC
         oq9NDwIK7bCyEqatIBVWg3EI2mTSPSz+GHLhWxvbR0XZfUQhUq/txRn9ZKiL917WhqIu
         AFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542511; x=1730147311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXOGORusAheGbXjY9YsHgDJ6EQdczoB5sORBvnGhFxE=;
        b=VPEdR0r2jo+lg3xbKNyZ2kAZpQ3HlzaS44rdamezWzRzzyqyBR2CqJBRbGqCo3IA+K
         1KtBRO+H2QESsySPp7HxU+XlzvzH4p6oMhSyZ/tXfztNlvUqeB5CbbKDWrY8qxmtPk7h
         YUvTjyXTK1i17KKoBrX0OzIlzhUYq47kXkJAvg0OZ4GJFZUlYaAfGbgPjlfc0XCPl2nB
         RZJ4p4be72aDkYxph3FFdHfhWDnRVGi3HlwVnnMUsrydLgN4EKmPr9ZAcFHn15B7kXRG
         u9EgYXLrg01Xh1LRisJwYCyIJ17KIDz1wyf/vfWJdDVO9aZ1KhntmaBQ56HI1v3POw9P
         7dNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHN4WX+do9AyaVl8ZIqbpUItL+/ityJB3j4RJx2aR/m3aVee0niPBjp3emcHAHVgGlKRZaQq2e2RNWjw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfWXWsm9T5Q5wiCMtpwM8JVC7KSrrTkjmrj/VT/ovPCRNY6SHH
	bOwPZxK5cqkkS1T98bvSmWS2K1LE3xqVvnYl2jO1VMeY59rmhvZx
X-Google-Smtp-Source: AGHT+IFeBUJWb0/ZbDfeWjDseKy/gwO7cFLphK1AYxGeWiXouKa5IzBBH4eytV8fsrQlZUdSg1h2BQ==
X-Received: by 2002:adf:e00c:0:b0:37c:cc7c:761c with SMTP id ffacd0b85a97d-37ef12628famr494947f8f.3.1729542511079;
        Mon, 21 Oct 2024 13:28:31 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-023d-d91a-ee8e-da73.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:23d:d91a:ee8e:da73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a5b98asm5093263f8f.61.2024.10.21.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:28:29 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 21 Oct 2024 22:28:24 +0200
Subject: [PATCH v3 2/2] Input: sparcspkr - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-input_automate_of_node_put-v3-2-cc73f636e1bc@gmail.com>
References: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
In-Reply-To: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729542504; l=1243;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=F8YQ3HQYY2w+VhZkKOD4BkQV8/JYW/XDhWfSKzi9Psg=;
 b=M3sNpqf8PQCbKNRdH+2y4CtcxjbUY0Y4O+QhTzB0pxtLymehiwDv34D4DGZCIPoFG4+SgMjxG
 o6LPTXFYrTVCCVm12J/rHqr8htvu+Jf/gW7E3cYP+i57YZdxSIDbWpb
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the 'free(device_node)' macro to simplify the code by automatically
freeing the device node, which removes the need for explicit calls to
'of_node_put()'.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/sparcspkr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index e484d79b5597..8d7303fc13bc 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -182,7 +182,6 @@ static int bbc_beep_probe(struct platform_device *op)
 {
 	struct sparcspkr_state *state;
 	struct bbc_beep_info *info;
-	struct device_node *dp;
 	int err;
 
 	state = devm_kzalloc(&op->dev, sizeof(*state), GFP_KERNEL);
@@ -193,13 +192,12 @@ static int bbc_beep_probe(struct platform_device *op)
 	state->event = bbc_spkr_event;
 	spin_lock_init(&state->lock);
 
-	dp = of_find_node_by_path("/");
+	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
 	if (!dp)
 		return -ENODEV;
 
 	info = &state->u.bbc;
 	info->clock_freq = of_getintprop_default(dp, "clock-frequency", 0);
-	of_node_put(dp);
 	if (!info->clock_freq)
 		return -ENODEV;
 

-- 
2.43.0


Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53F31E906F
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 21:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595575; cv=none; b=BoJmOjt4I8ErkfygqbGPkDIFuxEjcDgACDo29DT94aIU31l6Hvhgw6e/XrnTcGuN1oknAc3jbQ7+U74mI6AkrQz+CiuUmR4QWSG8uqrQN8Ys9rJQPzFdFJRM4BEtHCHNPh2j9MQKUKru805mkzze8uKEdQDJEoRtkGgO4GDCaXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595575; c=relaxed/simple;
	bh=f+TcIDFO1FofKlmr06Cec6JytdWs70QlHA84jUACDyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IthPCZ92avphI/UCo12R8611bUaVXBbUVPzTxFnmjyYOZnA7Ie6IX4u5Ya4nhE0zMXoVRnGFmnDV3KdpHv2T75Vr4B9PRYVjWUHw7tQGHSO4wx028fmmJ9hzDsHogbDmolwo3TT5rHhWvkrri1XHYDe+nU4Iq9ZE/FLuL6VP2zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfDe9Wie; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfDe9Wie"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37cea34cb57so827811f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 14:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595572; x=1729200372; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6P7FJOWA2mY2iTIPWe/1vsKU4sSdy22YB05qi0Ew68=;
        b=kfDe9WiePBwqIiHsJnx3lKzWayqkjZAsPkyNXsGhE/sCnmfy4bvqYb0lB9gq8ypdjj
         LZ58SvvusPLiFggBnTd0qqMyp+kNqiXcHxTXK9/gQDjXwKcgRZkUsLnvtLE/9B173Lub
         WfomrYrjy7lSQACjR2fwMmfwyx/UWPsXYQTEn0Ye2MSaI/ziTC4xeBD2ctnrAl0wM1m8
         a7wA9N5OZonlqlJGtiCHAGReL0NxDh4kNSVZ5LR0/u9DrALYj4SOmvV75UNDattyPEe9
         dVYoS4sNaRkGoRDigaRWultecYWl6cZB2vdYDjH//+u+zEK2D0Y1SSxF0fFU4QTjRf3u
         ZQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595572; x=1729200372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6P7FJOWA2mY2iTIPWe/1vsKU4sSdy22YB05qi0Ew68=;
        b=wyFuwLFHvAewlG6PcqRM0VDaJ5PqyOusLyXKoxb1lOLTeuzZDx7GSi9NgqTCt0cCCU
         LYvAJHk5iRMVW+ZU9KVTjmXVUtxhSMUb7pEIwijVCMTGj7Qeq4IBh16KNe1snwdY5Hf9
         G13d2FNL+alWnoatBxrMxgNqVQm1I2zAWsPoinfWCYxWu+f6Q0Bkye4IGHG1CZByyhYc
         wnz7PrBbAAaYpAOmtbyk35j7D/URub8SKAw4BaVjDs3P7LC1gkYQwI0bJn3JoHJTjtir
         Fb9BVK7dvHrGgxQ3ROybTOjJtAjH6Xo3GXN7+cS8nFI5xv1abvmM/KNHFEWFiWIRng/V
         sZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCXwJbtFLmkOeZROJO54BIYUXt2zLjocQcdoEUA3z0sm+Mm0begMrM22wU1/FRZgvjSjxqg7XuG7wDKGBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOsfjdAvhmW5LYAgw6hRu+k2z1RBK9QjBAvZ/YB+vKHwSL8l4B
	XdRboNAKXHn7STbMoTsUYCAyCHG+MEsLFNhYIXKnaPCHtHGEBdZMJF74cCUQ
X-Google-Smtp-Source: AGHT+IH8aKF7ZsrrRJ3ZAqBCFliO5puHhZfFhiaORhFDWMLDX5I92S5u/UpYGz9iWlpxdFrHyFPBzg==
X-Received: by 2002:a5d:4fc6:0:b0:37d:453f:4491 with SMTP id ffacd0b85a97d-37d5518f628mr265658f8f.8.1728595572326;
        Thu, 10 Oct 2024 14:26:12 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:11 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:56 +0200
Subject: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-6-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1254;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=f+TcIDFO1FofKlmr06Cec6JytdWs70QlHA84jUACDyU=;
 b=rSoTsyqTSVQaxGJxx7Zk2ybfk4klIzu0zmDb1G7zEN3+e165HJnqYXSyzN09nq9Rh5EpSBTea
 SN2ySImkHOKABewNi/o9w3aNg+p9MtGzaFTKn16I0mkRni86QdhGwvt
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
index 20020cbc0752..bb1c732c8f95 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -188,7 +188,6 @@ static int bbc_beep_probe(struct platform_device *op)
 {
 	struct sparcspkr_state *state;
 	struct bbc_beep_info *info;
-	struct device_node *dp;
 	int err = -ENOMEM;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
@@ -199,14 +198,13 @@ static int bbc_beep_probe(struct platform_device *op)
 	state->event = bbc_spkr_event;
 	spin_lock_init(&state->lock);
 
-	dp = of_find_node_by_path("/");
 	err = -ENODEV;
+	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
 	if (!dp)
 		goto out_free;
 
 	info = &state->u.bbc;
 	info->clock_freq = of_getintprop_default(dp, "clock-frequency", 0);
-	of_node_put(dp);
 	if (!info->clock_freq)
 		goto out_free;
 

-- 
2.43.0


Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4561DFD1
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 18:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729448842; cv=none; b=lWiKiS3dgjHCjOnkWXAJo5DtG1YmFZZVgFox21bcO2vlKhZwN5OnyFc5vKiC2BW2/vKrt+CZKEXcCp0ZzN2gW3eHcVF+RnnA12DCm6gXQvtIzttv/yUGBHtfG0EXyvGX4XFJlpOYv/S+i0UjxC9RRdJvdrhJh0XVyybOEGpkvoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729448842; c=relaxed/simple;
	bh=Ww13dvSbpLS1CRSU7TPVVRBFuyPAJT0QbJBdP+1IZ8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xj8RZKjPc1qQYKhpnHDqE3oqBIIevgeR3gmbH9+SPHgg8/hFr3SMVTzORD3ygghA2dAUxNBHYxhl6hxLE58jFfAsQ8RGgHhrBeufrQURvpQtp80rNNHrUK59h39h2On1sR7DN5jgfWfecpeKBKI3ItzcES7Ymt0kSlrPQDP4+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7vCp85u; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7vCp85u"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4314c452180so31701745e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 11:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729448837; x=1730053637; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oC94XqAfObW7gsifgeU8sWbkg+sAsaXMzC798gctVto=;
        b=V7vCp85u5ynFGnPj6F1VdPbcxvkWuStI71N+ETbG+XvuTgACYpj78WwTB8ewzQoBRT
         kZZQqfWNa1HwzcXyZiyILpkCsrpLGbN340pmZ8hbLZagHC9XPTrs5nmfr1iE6eptffEx
         sxYNyObC4dFAmaf7KoFOhUo8Dw0cs6zdJ0/HPnX++jOUqoP0GuiwgUqbzmK7oYAQ3lCY
         f06TZtmiel5VwvO2STNE8Tnwh1AW6ugiLry7/8ZChDTvdx5oVdEcKxnmb7jbM09zkZT8
         D8KzUkFKeEX3HooBPT2Z+e/4eIhprEUa3UbPalJ76w/gyn8ggSInM5iXl0pmpP3z365J
         qCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729448837; x=1730053637;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oC94XqAfObW7gsifgeU8sWbkg+sAsaXMzC798gctVto=;
        b=cAV36Gimy48rIb1AAegUkGs2a89s1GPFO4sexhv/AEWZis321WnugAk519ovvHk3Bx
         SwD1jGARxiXOL6aLX8za+kg7b6mTmbDhWezoRmVdNwSlRE+2alE/xoOnvrm9vxtSOye3
         rxS626xKElhajC66rCtcFycI7jdO4gPYaAQJIsdjw5nyjJTuPPUd6v16klvfTq6E7j4Z
         RhqUlemVJTnYz9kXr8x4h9n0PHk1y3/D51MFZSsGciNUErehVS/q4mFAwdsJd1vlCGXC
         e3uqZ5SlD/kIjLsyv6RDbmGZi9uLD//mWOcJJ3fAMXl110kLacz90hOuno33mKyGQEsV
         BHaw==
X-Forwarded-Encrypted: i=1; AJvYcCWCvnIuWYSLRIYhE3v+kh8nWcWSAHtXfrLORRkwsM2uvBkUWLi5Xoa7ka+rjGbUEENZuvCJInI2UP+Xdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAzOJLbupQGAnN4koRoeRL5goMMZKzs8P1neABPBcf5QronQYr
	xQOWiTtpp18jz3rbDdKuRsU0ZVWkvxRzquExLaTADMycfzios9b2
X-Google-Smtp-Source: AGHT+IEM3cXnu7Szl4hCwHLN8wVFsmNZ4NIEh7q1lVGN/TNryiPhzRMZ+nRPrTxss73+eZIvE3gk5w==
X-Received: by 2002:a05:600c:1d27:b0:431:44aa:ee2c with SMTP id 5b1f17b1804b1-4316163bb0bmr55994265e9.9.1729448837337;
        Sun, 20 Oct 2024 11:27:17 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6b9f-98af-2a5c-6ed2.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6b9f:98af:2a5c:6ed2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58af90sm31023845e9.21.2024.10.20.11.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 11:27:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 20 Oct 2024 20:27:13 +0200
Subject: [PATCH v2] Input: sparcspkr - use cleanup facility for device_node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241020-input_automate_of_node_put-v2-1-ddec58b4b99e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIBLFWcC/33NSw6DIBSF4a2YOy4N0Ee0o+6jMQTxojepYABNG
 8PeS03HHf5n8J0NIgbCCLdqg4ArRfKuhDxUYEbtBmTUlwbJ5Vlw3jBy85KUXpKfdELlrXK+R1V
 GJjqNjb0YLvsGCjAHtPTa8UdbeqSYfHjvX6v4rj9W8H/sKhhn2JmrFKfadra+D5Om59H4Cdqc8
 wc8IiUWxAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729448835; l=1854;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Ww13dvSbpLS1CRSU7TPVVRBFuyPAJT0QbJBdP+1IZ8s=;
 b=4JJ/8rNbRS5CDLSsjceGOzrXN95Je/MHjDmrnycsm3LBmxcv6W1rD4Kud8D3RuxIWD1xGrIml
 i4ByO0r4793Bt9BGAEzqktKDKifH7g0va6oGud7Buk3Csn5Wl2gpBxs
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the 'free(device_node)' macro to simplify the code by automatically
freeing the device node, which removes the need for explicit calls to
'of_node_put()'.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- rebase onto input/next, drop applied patches.
- sparcspkr: drop goto before node declaration and return -ENOMEM.
- Link to v1: https://lore.kernel.org/r/20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com
---
 drivers/input/misc/sparcspkr.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index ff7b6291894a..66ddea9a203a 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -182,25 +182,23 @@ static int bbc_beep_probe(struct platform_device *op)
 {
 	struct sparcspkr_state *state;
 	struct bbc_beep_info *info;
-	struct device_node *dp;
-	int err = -ENOMEM;
+	int err;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
-		goto out_err;
+		return -ENOMEM;
 
 	state->name = "Sparc BBC Speaker";
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
 
@@ -221,7 +219,6 @@ static int bbc_beep_probe(struct platform_device *op)
 
 out_free:
 	kfree(state);
-out_err:
 	return err;
 }
 

---
base-commit: 00850d7b542aa4a8240cf977d43dc6d2158e48d7
change-id: 20241009-input_automate_of_node_put-1bae9f5c02d9

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB21EBA09
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 21:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595582; cv=none; b=LE/X/hvBHwjv08Rgpwnwcqasrvnhy39G4+na9wgELwnfc2z6weIIJ50fBl4xroyg1Qmr7JctPfVcd0+tQ3h5RxFoBHRDixLfO3QqnwN4laaQ9BdMeyNt9LtBL4L8Av+CFMZKVasmIMuJpH6HOZhsePnCbDJXJ7cnETEJ+cClxVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595582; c=relaxed/simple;
	bh=qaHmN1vj3OJMngtAh5LlltSL6miuty/pRQh556o6ku0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7YuRB32qsmwptWrcDVlI/4hizr+PiW8vWtTYJePfXdepYSVDSGpW+H9TOSHxhbqYElamuTvezgZxB96XxxHvij4UAU3O0axnzsGvaa2ZYghMAOG6HqJHfpEEiOU9rpJk3nPcMIaAmpzuhfoQe1S9gxI3w6RcnQdEmLveBQadr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0NUXGz6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0NUXGz6"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d4c482844so597006f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 14:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595579; x=1729200379; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmicnpp9cd9JtqZFSnHyB6Y93ime6LMtu/deyDIKcMk=;
        b=U0NUXGz6UbGhq5BnOpyXDIFyZC4xTGzWPcyaRhO7FjXFnxPsxPrMO3Fj3O74eqc69D
         y/IMUHugP6TROaOBtkzNPYe8fef2NLiI39ksTlH267xVT4dYpXvkozZQWe7RK4nK83WZ
         SV7EAYrBiM0cMjw6m8nq0j2qMURo5Zvlrw1CS9POnF+2GxNhvDeRHM6BAkHV2dWTPpFm
         uMSi8ocxJ1ht9gEQYNNPPYIQHl/nekFOIdFME0Mf0szXcpjFNGWr1l2fZYmuFlbOJ8Qe
         6OCf1d6fh5Un16iHkKb0a6Dw3IkEqRlvS9mrmsXJAFa2m1mJ0QU+FpzyuYvvzqRXqpsL
         wIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595579; x=1729200379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmicnpp9cd9JtqZFSnHyB6Y93ime6LMtu/deyDIKcMk=;
        b=PNX7amdyh+/k2OnFPtGB4U4wW8DTns6gUVW54RjKprbVcKwCvqlEtUOrlAQfSzUB7v
         KzUVX76QfEuZBMESskNtpFlbTvwei6MZHQJfNQXcBcSdevrb15FnfrehpfgI3vB+ud4P
         exFz3IHK7VfteVTSrOUW7ECEEMoQlTpHpni/3uigSTDUW/8Qzs/XLtn/rFcvfK8FCZID
         /MawWVpdhFesgcV6oO70Inbpo3lZBui3CamyFOAxLOg0qwShbwbVFy5P/7KA0TImsap/
         A34xNsPjWBlMicnQ65jGspM2VCiDDhpYg+Z9X32sdzeYV5e3pccOoUY8IaqUmMYV/ytY
         fBEA==
X-Forwarded-Encrypted: i=1; AJvYcCWPed1M9pKR1m0KVdtLxGKs00s92sCufkIP3q6ziO8RHweW1j+hk+kQk/zvHdg1rFKKoCauJ5rGmmaihA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxN0gLNe01T3goj+Mi9Ul6+9AmJdAWSIQ+nrj/J8oQf891V/Bj+
	A8ynat8kmLEETs3V3i/rjfNWouXhyz8oYxXKzNPjImRk8eSz011p
X-Google-Smtp-Source: AGHT+IF35HrnKs7WD26F1nGHKplWO56RdKrMZQ7OOp7vbg+9vF8z0Burx6lY8GWTwDksnELnrk9jIQ==
X-Received: by 2002:adf:e90f:0:b0:37d:50f8:a801 with SMTP id ffacd0b85a97d-37d5531323bmr302685f8f.47.1728595579251;
        Thu, 10 Oct 2024 14:26:19 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:18 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:59 +0200
Subject: [PATCH 09/10] Input: raspberrypi-ts - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-9-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1209;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=qaHmN1vj3OJMngtAh5LlltSL6miuty/pRQh556o6ku0=;
 b=e1/0RKq2raIunj/4RBLVw/Zc3mleb5v6VF2G0Gas11OFUKozTrqrF4MulYBCUvD857OzZgntV
 dW/x3ybOLxPDEqlxp2QL8JWTqTMc0scMnU0b57l0w0WuOer7yfMUZp7
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the '__free(device_node)' macro to automatically free the device
node, removing the need for explicit calls to 'of_node_put()' to
decrement its refcount.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/touchscreen/raspberrypi-ts.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/raspberrypi-ts.c b/drivers/input/touchscreen/raspberrypi-ts.c
index 45c575df994e..841d39a449b3 100644
--- a/drivers/input/touchscreen/raspberrypi-ts.c
+++ b/drivers/input/touchscreen/raspberrypi-ts.c
@@ -122,20 +122,18 @@ static int rpi_ts_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct input_dev *input;
-	struct device_node *fw_node;
 	struct rpi_firmware *fw;
 	struct rpi_ts *ts;
 	u32 touchbuf;
 	int error;
 
-	fw_node = of_get_parent(np);
+	struct device_node *fw_node __free(device_node) = of_get_parent(np);
 	if (!fw_node) {
 		dev_err(dev, "Missing firmware node\n");
 		return -ENOENT;
 	}
 
 	fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
-	of_node_put(fw_node);
 	if (!fw)
 		return -EPROBE_DEFER;
 

-- 
2.43.0


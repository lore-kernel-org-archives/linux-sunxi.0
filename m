Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469D71E7C30
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 21:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595570; cv=none; b=XbMooOlVtppYNQtj04+WSRBBGzz/ISVCRW8t12zL23J6oZ0b97uMLW0LQ1TRIH5JGUz58gH+C/aYD4uVEtyx7y92fKoCbjnHGXbDZ0tdDx2nc9JasxlmAEoAqywmkpy7o5DJjWFP0lzgHN9kklExwCDDRBH1P4JaAjkn0kY8baQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595570; c=relaxed/simple;
	bh=tDYGmTbXvdvpbRFG0IrCSIV47mvFQRYsGGj+NcIIddk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdSDbhK2368Cy/SLOSIbn8PVCdQuj/Z9wkHJLqrFhniWPP5m/B1PmQdY/nG3FBZZZ1ufkyCT+VbBoKrSlItyWw+ktA7EBxjcysd39PRgDGabwNDSK+n/mWkT2BlPloJgBd7b8egKwdj1CXIdSO8brLSZM2w41YZJhiINXd/u+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtKAuW2t; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtKAuW2t"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d533b5412so240115f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 14:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595568; x=1729200368; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHWRZlXxWyBjeMmMTHiCSMSAw8Pbb8irSTDpVqQUOvo=;
        b=GtKAuW2tu5vJ6h1Fkv/aCglmUeU8BjB2Cz7H85quex7+m7jKW6sRjf+TYhR69bE5Fo
         KyC3ngV7229i7fcgrYJpvCKvHP3/gdspGRyXmcN2xI76rv3iBDSVucxCIQTfSmcmotoq
         zrbWloBL9Syo9gO5Q8fav21u9EFW1KSpC3S4efyaZZX0NaV+G1RcTuDWDwt2mpOSJZGJ
         DSkQ2IgjOP/cR6G4+OmtpEb01kYKfPTBeqLZ7hRVf8aHkLy5VFvmaew/c8bN0rBQOy63
         YvC74xwNAxl+BsJOz8GUNYunf0+ypqDLcrA9fX7szxLOAhDwumHilXe5lpLsdfXJoYhJ
         CY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595568; x=1729200368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHWRZlXxWyBjeMmMTHiCSMSAw8Pbb8irSTDpVqQUOvo=;
        b=eualC9UPxDx05HPMgovMUz3SgZjBO4HzpSTyW//AQ/bGTfJI6HY8kjgBY1WELQDh0Q
         VL+rarzjJ/RXU54wpcpMmjxz7WY+pJZ6P2G3ypnVBZueFWVOTJqrjbQLrkxmQcrtP2Fu
         EiQi3TayIyWIpxcPUUv3gnYzWd/B3zmzUYfwjZmXdN27MiQhkpk13aj4VJXINBuElG88
         gCTh8fArmfR4xR1bYSwDnT8UBilQwJtzvA5465KA+D5320qHenU4d9qRp2jfW3A8WC9J
         nlcOFwpxEPVJOt6MPpaHFxK1YNKTZrTWhYH+Kc5EyVayHRvnaSgZ9qmZvUhbCk0kSk41
         4+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVaNWVGb/KUjdvR+jQ8ahr8YNjczE6jmyd2HLv03+IdJ1KSTTkhHFkKdakE6fNBfl4RoS7dl4lJGb5+3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwVUE14aclRhZWZTRPLif4SM5Zgd2pzLfUUEYBoZFUvKpVSL7x
	FvIBW9jQ2bthiZxRmok4xKdw1JU2lcRVSQwdXMmpYn62WeMLbk26
X-Google-Smtp-Source: AGHT+IH29d2ZIsfU/u9DFVW+6yCWUZ10F+EwzMZ6/EKx3GvDGWDTA3iS7grS2mWveZO8jUN402sziQ==
X-Received: by 2002:a5d:6843:0:b0:37d:43ad:14eb with SMTP id ffacd0b85a97d-37d551b7365mr236307f8f.14.1728595567520;
        Thu, 10 Oct 2024 14:26:07 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:06 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:54 +0200
Subject: [PATCH 04/10] Input: twl6040-vibra - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-4-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1953;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=tDYGmTbXvdvpbRFG0IrCSIV47mvFQRYsGGj+NcIIddk=;
 b=aQSM4gB2oKRbGTKDUnb+JrhfhsQ4SuW3g/7tQuRTKwxhS2Fu6V3AEwkunPJT91s0uiqLyuOB1
 PpjDY5LHIRBAvqrVdAPip7Uj9SnWp7iBwmBWmqkARDaPeBAPVRV8kuS
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the '__free(device_node)' macro to simplify the code and error
handling. This makes the error handling more robust by ensuring that the
device node is always freed.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/twl6040-vibra.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/twl6040-vibra.c b/drivers/input/misc/twl6040-vibra.c
index 78f0b63e5c20..afed9af65bf9 100644
--- a/drivers/input/misc/twl6040-vibra.c
+++ b/drivers/input/misc/twl6040-vibra.c
@@ -229,14 +229,13 @@ static DEFINE_SIMPLE_DEV_PM_OPS(twl6040_vibra_pm_ops,
 static int twl6040_vibra_probe(struct platform_device *pdev)
 {
 	struct device *twl6040_core_dev = pdev->dev.parent;
-	struct device_node *twl6040_core_node;
 	struct vibra_info *info;
 	int vddvibl_uV = 0;
 	int vddvibr_uV = 0;
 	int error;
 
-	twl6040_core_node = of_get_child_by_name(twl6040_core_dev->of_node,
-						 "vibra");
+	struct device_node *twl6040_core_node __free(device_node) =
+		of_get_child_by_name(twl6040_core_dev->of_node, "vibra");
 	if (!twl6040_core_node) {
 		dev_err(&pdev->dev, "parent of node is missing?\n");
 		return -EINVAL;
@@ -244,7 +243,6 @@ static int twl6040_vibra_probe(struct platform_device *pdev)
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info) {
-		of_node_put(twl6040_core_node);
 		dev_err(&pdev->dev, "couldn't allocate memory\n");
 		return -ENOMEM;
 	}
@@ -264,8 +262,6 @@ static int twl6040_vibra_probe(struct platform_device *pdev)
 	of_property_read_u32(twl6040_core_node, "ti,vddvibl-uV", &vddvibl_uV);
 	of_property_read_u32(twl6040_core_node, "ti,vddvibr-uV", &vddvibr_uV);
 
-	of_node_put(twl6040_core_node);
-
 	if ((!info->vibldrv_res && !info->viblmotor_res) ||
 	    (!info->vibrdrv_res && !info->vibrmotor_res)) {
 		dev_err(info->dev, "invalid vibra driver/motor resistance\n");

-- 
2.43.0


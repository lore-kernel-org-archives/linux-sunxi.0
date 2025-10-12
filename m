Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795042F28F8
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297055; cv=none; b=SqGAxJYcBS5SOh0rLsTxeeGxjX3sZDrvi6wWcUYlnxbm/quDsr5CYe5EbudNQ3Rj0uoPf9+j5DiRXKpHFsEOPbyBRpk72R7aY6QGPBABFVayMlF5SdxOOAlzlMj4mh26PalTMA9VNzr3zKisJvA1HIuO+wJ5LDzeu+9Y8eKqBP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297055; c=relaxed/simple;
	bh=7Vpg5pdcwhpe6j3H4rCvIT3PXPexXBscDV/N0+A/BKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bY0IrxsZf7ak33Teid/0YKiv05X4K8TtEN7ElOHJ+4N/kxXw6Cr1SbL4CJ6d4aa1nfBDeoLWvPMZHSStAI7uJYZxJLKuUZeB6JoBZc6M6Mn1dMFoB/u/wtS0qmva+v6F8wYYSDuS/MWaUQkUPGTD333itExWxuy+xj420oamf98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmSiBcVW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmSiBcVW"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3ee18913c0so549782566b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297049; x=1760901849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhJ4Mx5N84YekwfwtgsaM13tMkuKqezRguQA+ougb2A=;
        b=EmSiBcVWg9lG+8PL+sBw4jyDd7xnh5K83rmf6+ix+bQalmfEv7kT+NQhpOp6wyQcPX
         jqIkNxD0u4k+UXot5546OG6xyrkuNvaIXKFKjCnnLvLvNWKs+qz1IGDiTewpUiG+Xx1q
         5eA4occLwcbK4XYFZPXLXxOCMdPAwhaxXrq2t+A10JWyuXOzXi7Rx7biMWIbeMnLbtxz
         N6HPtx9RCi1sYSb4o0bNKOVK9Dd6kyC7Q5gpRQCzxeHz7w4cBGJi5xGT7/CtDA5D1kOj
         9dErtB+8SBNWutk7VsvEQ0bp2lRVbTwGD1/uVTsf7ZMk2FShFPmWqaJwd35UjdFyrgPi
         BAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297049; x=1760901849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhJ4Mx5N84YekwfwtgsaM13tMkuKqezRguQA+ougb2A=;
        b=lJi8UoUa9nCFFv/mNA56n7fq0uhKXMOfQfJTNNy7bDz70yDPL8Dv0f3rjjAacGuGhD
         bQj/LZZvCYGHu2Olrby7V9ZqavCMlChl1DmGp9sOgLHw7XQ6CG/KZHtzO7ytIYNoO20q
         75SjM6zei1VIXWbBpEWkpYcu3mxK6OQWYMaRwAKPZtLc0BMyHpeoZZf0HIs6JJ40tZz9
         sPtYBMfOT+qHvrZgS+E/NmXd9hTCK1+AuOxR+Uv24ZMMxIIDKJEwhKy8XvJCXVCAnMSe
         GULWgJztdp/jeLv6FrOC5T5VdCgL2UmMIr/R+kS2rc2JnRQxtwCm+oZTlC1LNtAJKhCq
         0a8A==
X-Forwarded-Encrypted: i=1; AJvYcCUdIfeg+hzDMxgruy1TMcjafJcCO0TEAHP+mjmJZ7mete7ptaRjK9k8+woepoo6lNWnYl5IIS5HQqLlYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWUPQ7shhTqWH/vQsPSde3Is28FpLptu59d99Pq/ABgMh/lFgk
	ROaHJ5rI3LjmcDge/JOUaeyDaHE4tbZbqRp+ILRxC/1a3ObqO1lnWi1z
X-Gm-Gg: ASbGncs5L4pU/MA4hS5OOy09b1P7hVmXZ53S5v2d4JQIFjPgHMQctUdhchhv/iBYhP7
	nWwZk76LArBmLZI5K9rb9u2PdP0M+5rbY/Pl3qtY3QIItpalbLdG8ynyb22feX0ppMeFAJtJOnq
	H7ky79MS7qx8IBKiKt6QpgN/psI4ADXRbkzgsPl2pjbePOGhMJ810CkC9GXYTfhqsZ0SekhS9CX
	3E9BMwtNV7p8TVJELYzComJE+uZkcky5fVuxgUpNZ8TEmutyWnvlZNc+XGRMDuEp+DAc55eQnA8
	0RAdQ4nHMvjUhS7EtywVVKE7q8s33eypPARcUnT6s/F60D2qcX+WtlvIbYh+rXpSv5x6HHSS9S+
	C36kDt+gVeNb9nbM+/yhWGvlTKh5OnpbCMOkoYuD9uwTSkBxpUHU7r/gtbGwGtyaTVIjDtZe5G6
	09qSpQzK/i5Vz5V/GO7PsHWGrgSHfDZKU=
X-Google-Smtp-Source: AGHT+IFR0pZ/YrbCaB4kbdDAW62+ktVARq4KWPwTuGdcL/MYc6Uu9RhwoTSIe+WpqZdntWjE7guIfQ==
X-Received: by 2002:a17:906:1b47:b0:b4f:3c7d:ff5d with SMTP id a640c23a62f3a-b50abfcc8f1mr1504360166b.51.1760297049525;
        Sun, 12 Oct 2025 12:24:09 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:09 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 25/30] drm/sun4i: ui_scaler: drop sanity checks
Date: Sun, 12 Oct 2025 21:23:25 +0200
Message-ID: <20251012192330.6903-26-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They can't be triggered if mixer configuration is properly specified in
quirks. Additionally, number of VI channels won't be available in future
due to rework for DE33 support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index 2fc54dc20307..c0947ccf675b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -132,9 +132,6 @@ void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable)
 	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
-		return;
-
 	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	if (enable)
@@ -155,9 +152,6 @@ void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 	int i, offset;
 	u32 base;
 
-	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
-		return;
-
 	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	hphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
-- 
2.51.0


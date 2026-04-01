Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B7B2DCF4C
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Apr 2026 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070902; cv=none; b=GxAuI/Wb/nKhazNVJAqZr+CleD/vyPRRGuVDcp+vMVcgoWllq6OJX1g/Ul4c/6KkrT9yHs/X6l03dHGsViG5cKcjwxTttfpUO8Ik2NDhUIJ5E68j5KU1AjdAziftDVezCMLfHKCR6I8zc4+iF8V62BCBd//ULGAlc8ZnLhrXfCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070902; c=relaxed/simple;
	bh=aOQvwFmNxOkcH3hY6TC/0qXbXfPYEsiczqDbdm09a6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVAaXhrW7c1cmfDG31PjD4WKkaW0D0PGFxGeX6B1cNhncgBQ7MXwWykEinqJzyVnPJIJbwD8GyCg05clgoTKKeNu0nrVauQr88F2AttDvtr/Qpcv9FX+kKcNX6Kt9lCT6kq1ZU9DqQumEmioA2E9b1U0dphyVflljymcVK7Z8zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNAyNPF5; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNAyNPF5"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so154189e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Apr 2026 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070899; x=1775675699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a53m1M0yPC+0hsBR8rulFA+iVXVX4Qv0HU8oZpgQDvA=;
        b=nNAyNPF5f8/4NWkS0aay42PkYX0B6b9yZrZR8xVv7Hd67Fos45oPHgRNW+0zZLI3P4
         PxAiLnVo/SnJq1HYqVNtpDK/UUBho56dfz/+Z0Sut8/fonVQfNqA8fXrpzB/r8CyXsqm
         /0r+qMFcpA4IhYuH0VSNEQl6yFotlKJxCQVsh2iRTRY07+01vZubQ9bo4GF42NY9v9qP
         DDrtewfBcHvt2ZvzWJuI4CEC2fBhLhO/iUnQXXtmhKnlreOhoZ15Qi5UDKWOOTpOdrM0
         lWWenVyD3b6pD+3Tp6TlXCl2/q1c0W25dI6II2VnW/OI6PnjQMBq9DQtPnUYGv9PC736
         zNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070899; x=1775675699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a53m1M0yPC+0hsBR8rulFA+iVXVX4Qv0HU8oZpgQDvA=;
        b=RldJr0mPDIXMBywAG1YRRYfPRfvRs6OifMnl3rVD6KRPf3I7kZ8xXu6NUggCGn/ZLK
         +eJo6TL8oOsaEDYHL+jUGNB3CQ/j3ldpcNDKs80OwgSStq1Idr6dHvf2W2lP71TciXEC
         Hyrn/wcQS8onz0R2+w6FrkXmgckScIs3bSPmOvPxhtug4p4ej0deI9qxwCCK/cNpagcO
         /l3C+XKqm+ED3M3WJX5m03So2pmBvHNDJea9Kz4fYNawDgWfzWbtbBVfGx+Gqqk6uvvx
         EDaOK3ExjAX7g+B5H/JSEq8nJZu+QKfAI9pk2E+usLqFFcHmTBgd2Ha2T1vBDqN2xNEP
         g/wA==
X-Forwarded-Encrypted: i=1; AJvYcCVffDcBy0tViqKrWZgmCww26UwYmRV3l0uCw01sGu0C8Q9edf46KY30MzBebY7dO7q7csG9iVF/J4tSBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmsNn4JcfNOrg6F28Zrv4/vULVoHQHNl2+d3skvR+TYA3aqFEj
	TRGevz+RidKX0l3KkcJEEOoEtlDbstg2rqeUEm/scobAZuYLDXaLKASL
X-Gm-Gg: ATEYQzw0lhwD70BguEtsH8u7tY5HCtClNAF4eZmMNvn7ArYTL6UVOBqmoiLTa70qkw1
	mhlqVoQ8ZGppo8IYmAt6J2v79CI5ja7oKGbiATxJwDog7R1FpT9zdJjqYMg5AFwsG0+XC8Yi0tW
	NAdVMtjy45hwNvA1J4AeczHz+Jkrd8epPDxJk/OTRX979mvFH65xltcBDmNeUW/q7dFdY0Lejts
	LOGvqR9c8mbSEjqMt5lYVuVUWwumK7O++6YBdrUOnNP3URso8IU/2Ngsoc1v6KdoLZBnmXn9DMn
	VeiROJs6AYvDG1UByXM4LfqFXBSwy+eXpZxB/dC5CqR5cOhg/ey4WhYmK//V2A9kmvc24CyLTAF
	W59luY653gHKpRMkj38AfBLILekJvg/hy2YbuNTrkcWAkxFPd/x44lcmNNESgxHPNYirT5hn/ex
	juGVBBzAIDu5HblvrCmgw1xwAm+A==
X-Received: by 2002:a05:6512:3b87:b0:5a2:78fa:2700 with SMTP id 2adb3069b0e04-5a2c1f3c4d5mr1943599e87.23.1775070898394;
        Wed, 01 Apr 2026 12:14:58 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccca2dsm141855e87.60.2026.04.01.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:14:57 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH 1/2] media: cedrus: Fix missing cleanup in error path
Date: Wed,  1 Apr 2026 22:14:40 +0300
Message-ID: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

From: Samuel Holland <samuel@sholland.org>

According to the documentation struct v4l2_fh has to be cleaned up with
v4l2_fh_exit() before being freed. [1]

1. https://docs.kernel.org/driver-api/media/v4l2-fh.html

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff0e2..1d2130f35fffc 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -391,6 +391,7 @@ static int cedrus_open(struct file *file)
 err_m2m_release:
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 err_free:
+	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 
-- 
2.51.0


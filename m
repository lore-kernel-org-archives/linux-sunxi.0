Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C350D30CDB6
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Apr 2026 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513657; cv=none; b=SsSNmZBFsfKe4y7+dKDq5PBaO8AC0gdPpafEPoao32EnHg3SqK9upvCDxnDp94k7d91KBbsn1f0okXUMmUSsKMmWOEj65P1DHwMn4JWOA8a63hEqh5wJSG/utFlYUYTaGWS5zfPBXzCzh1hfuaxs/iR+F/UKaedztXtoyKKGSlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513657; c=relaxed/simple;
	bh=IyzDmVjeEnRf6+N6CScLBbeU8C6QP2hQxk/cAXQX89Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=siplO/wSbJneEI1/KEE7gJyTa7tVzw7s82wWOTzxLQcDH7HNhq1wnunxcTWiWB2MYlnKqD5D3mp9f1WTz/04YhhEq9861dUmC6XrLmERbFSNdN80DTi3IIgWIiX807fF12pClWjnwq7HWD6rIE2/bJ2LczdfjyV3MTv47ZZnP6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIkmidw6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIkmidw6"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so4424464e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Apr 2026 15:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513653; x=1776118453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xs65Y7SOJhiSPJ4nfKCjyK6aCu/upRFc7BfzdjxKzvk=;
        b=XIkmidw6CmlSgFABuFnpVc6jvHTO/aRhBTjk284ZRBD0Pf6jkCn6SsWDiG39V1koiu
         e8E9jJoLuHOeAVWtWVrNpYr4a4xXPmBmALJUA2yfg0Bb5LQUB7X/kVOu9dWKp9pPd/Ts
         Tt09LnIaTebsXqxXUEz6f54kSNnTnzQ4EGAq+FBC756KzWAsZbygvpDSmg/48pYR1baA
         DpdaJqFYEPLqjdto4S6GUKln7A+cmcQy/DPRDXcX9Bqva0T4sejDKwwy1yuDM9Rhs+r4
         1EEmZ9/jMcbtkouqNHaDEnh3322xE8MwcWbLj1RKUJ5k4YewKqDnjsd27pQatCszAvaE
         CsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513653; x=1776118453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xs65Y7SOJhiSPJ4nfKCjyK6aCu/upRFc7BfzdjxKzvk=;
        b=EeCxMdQQDuFFtT4z7z0ryQZZ1YiHFwxj4f48OzjPn5WSznEkCSn8xbFmUT9aBlsmK9
         W8GpuITL92QmaMihLoypBn613li/hk38gjJBBf+aASlwrBTIjrwfbybb7FXenn/NdEQE
         gWQWn4OuCtsEv/yaItt77gtpbuiP0id4mdpCyq27xEtMyNKDzkKNj4oGPSv5R3HZz9Bp
         M0UoZEpNso4uiimI1MRnFNb/Y89991Z1GhaLGBf8i9lpoU6x6HBQND7irEEEP1opmNjg
         4sOoGWWNyEEGwpxav6m3aUA9Jq8+M+UdAFZ83p3vY8UDJj/3CwRgitDPAkK5QUgE/kCm
         w3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2/6fxN6Tl1nRl66QrT0EEzhwIuPGrK4XK5SK7fdf/rJ4QHq57wcW+S23skqd+Wo+DaZXA3bZbKL8baw==@lists.linux.dev
X-Gm-Message-State: AOJu0YztW2nYIA5VVq7If2ch4uxZFdC0Tn94kfk/JTvj0rDgfcjzzyrB
	WdkZtXtHmaFZ6SM8wJLdFjofNLfEAeuHG1cFyCSwdyu0Mswm81NAOj6N
X-Gm-Gg: AeBDieujzq6CmGP4N5WTnZT9Yu8LuUx9VRvTz/rxsVo5Yt4gwKXTym5+QUq5QM1OAZd
	JcZdmLy7Ig7C6UJufDtRfB2Nf7QVDHPFYCAdpBZSVtqDhIDsg4F5BA4VcNRJCPL72nibyGksXID
	nzruqJuowbD8xGdqL/WmQR+2ZRGABeEbusSg8q+QmNtPSCLhiuhjh5mitRGrhDpNBX3nLGi+MW8
	upsJipxWHwHjvN+q0Y+5YWhvAvk7wT+N6KMdMctDVRjpo0K9uM+ufNo+s4B53t7auhR9Ch2119C
	mCazv3C5IYEZxczSh3Ox6sEVGILFAgVy8QLro5Axa8HpOiU9b8qc7ooknvA8Juh0408e60He9OM
	Qz0Njl2iyiiDS4JpMkOT9IP+wF8LNQKPVZcKPpDb2HMPZ3ApEbr7TJP2Y6xePB/GKR30LAijbG9
	/TLL1/T4tTXFfCjYvJaHzJJ8ETuw==
X-Received: by 2002:a05:6512:1151:b0:5a1:448b:317b with SMTP id 2adb3069b0e04-5a337591959mr5666904e87.42.1775513652798;
        Mon, 06 Apr 2026 15:14:12 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc5f90sm3738693e87.49.2026.04.06.15.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:14:12 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
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
Subject: [PATCH v2] media: cedrus: Fix missing cleanup in error path
Date: Tue,  7 Apr 2026 01:14:02 +0300
Message-ID: <20260406221402.3721777-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

According to the documentation struct v4l2_fh has to be cleaned up with
v4l2_fh_exit() before being freed. [1]
Currently there is no actual bug here, when v4l2_fh_exit() isn't called.
v4l2_fh_exit() in this case only destroys internal mutex. But it may
change in the future, when v4l2_fh_init/v4l2_fh_exit will be enhanced.

1. https://docs.kernel.org/driver-api/media/v4l2-fh.html

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---

Changes in v2:
 - remove duplicate 'in-body' From: record
 - add details to commit message

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


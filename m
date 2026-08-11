Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB441F12FB
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 06:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428129; cv=none; b=gCzsK0rjtP4U4KpUyQSNWBkOAKMJF7cVAsEeX435OFoxmcb8kgN3l6aTbBfhcv/iyzdo5WiyTkJa4LY17PNurW9DiPTB3XJDK74+suNa19PrhR3ytkgcFxUD6D19pmuZxej3tVUYCm1sF7kj7/stvKWZKZfQQ6AIcYfYE/Jybhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428129; c=relaxed/simple;
	bh=iRP0CAdUA07Tc6qOCkr9zEvKUmtM9XUzzhNmWcugr1I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fXyHS6KBiMB0ppMTYPIM4XE/qCSjvIm+vwbCozNbFMseCzEL5hNgHeGFSozHqSxNIBK+5Rf2BOQcwlo9ceexD514lncsYcME/gAurbVr1fJnmFmwWvSDcSqbNDWBh7+WTHC3y3672t8y45E413oxcoaSson8RtD+99USnrjYFCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGwAAgAV; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGwAAgAV"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7ee4399c423so1627160a34.0
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 23:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428126; x=1787032926; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5VtF2e06tpanp+udcTWrYBDeYnqMz5g5fGAiiALqjG0=;
        b=ZGwAAgAVahZh8R/VvyDAyRq4/oNRUfwhEJyKi5Ebkzx92JRjmXRhbms7Bd1r5uhCYk
         BHylLkhXcl7H0fU1Xa74BxCzU2lWXOSezjyBSFeaI4ipOqJ84rP8mJZqRPVXwEsteN04
         fHlt1SJhrtRbBMJitN5VmWFZiUe+bjf+QjW0MC0ub160CLsAvghvxfLeYdt/fOg8Xmnc
         GaJa4ZVrxgRtMc2+ShchCz+9rAIyY1mD8DkBBA1xFftv2aMeiIio2Y7NZc0MQsJ1gVW/
         f5abR+b/10UCbwvHyKrRRc+Ra4Zu4QTPi+CSEL0RTaFS3SYvRmIqW9IFGJt3bHbloRKu
         Tq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428126; x=1787032926;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5VtF2e06tpanp+udcTWrYBDeYnqMz5g5fGAiiALqjG0=;
        b=SiPfP0VoIbmwoVzYzMIVfpM+XwmLwleB1B9I0yYFIdn46VcrEVDKW2uXSLdSthyfIA
         crCyLjzVraVu1tVzEWG0HaUrRk39eFBCzoNamUETebTBqQt+Wp5d6bVrs/4MYXuWWmSm
         BsNryG3jEoBm+D3LlPIPvZgwzd1HCPSdbAAqArh8xoEpd2+v1a8hpL7gsh08U39+LZkq
         fUM3S/Gh1EB0ZQOIMHB+qRL9vgIuy4wEO/YumeowdRv7G1vjc8TLoS/HP2uPAnd7OtbT
         bUFFDkFX46tDp11LDL6YwAYO+ZTawCnwRN/lhnULSNV6L4iMQokTbrh73rTqmDxIQOhF
         45eg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3EKzz/ldvVpFdMRB48Ts9dMRkHaYPj5B+dzxRAFE3TQ3rmze/EjkcW9cnWipvrTTACk9npt4z/qF2vg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnc+IEpde0+DMmzNNRjwhvT6Jf1SV8ACRcrFw4t1u6M7f42Oe+
	KJoAdwuOn6yMw06zaOGV2t8pTZHhSlFQxeUehdpG256aobl4+7GhSw6+
X-Gm-Gg: AR+sD12t0w9EAZONqvJrxzTMC+PXCIxoqecPLWNywkNer3GVSXRTOqAIxiT2Y15p4T0
	1sSwVMw+PPXR6eX8smyUa+q2AoGpHs5KnwRlY8e9ddiNW+aDqwQOfuVTILkauDOruEvaJwRlF/E
	hiCUMe5s11YS2H5oDLMtK3DDRlGIegvnf9nd+kVL96uWrCpIQph/2RZxF5tNy39AmQz+tb0Nh0f
	NG6SYSNvUOnfR2g6SQaj/fo6JyFVWgjAuZbD3APYRETMIWo0U+6X3/IO/2EGYHeHt6rhQ+YUGzI
	U0iE9kpa4Ka13ygGNQcaM9Gcg1oF6VWZhi36CULQrW97I6sJQvAZ7a+Z7glfTrU/DtLKn7Tvskc
	XSjUzEK8OjMAv1Lx0OOf2hN3vkxZprSJ5EAKBsJayfOT92rl4XYH/UwW0wpbqIHPqT0JBtBaLZ2
	Oehk/fTcnKJ/xKnL9IoRdNy5J4T7XSELdzVzX9vENUPcqWWENZ+cjc0F+eyFz0Xgu+Q4UGuuwiA
	ywerEmnDOWtFQD1eUjdT7ajyQtlIvu5fkNyvJipTtgk+lbM8chSiDMOU6FrmylJWfEpRnsZRX9d
	QLF1XgfB7RyIsJ/28NoMa4XMTIv+kEN6htxRhkFx0OoXcMsWKVmbIILT2sdbc+gBPRuw3yiGc1J
	zVuM1N8pJxu5j4ov8
X-Received: by 2002:a05:6820:f026:b0:6aa:c3f3:fbb0 with SMTP id 006d021491bc7-6b0a31e9e09mr310661eaf.32.1786428126556;
        Mon, 10 Aug 2026 23:02:06 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b09fa1ef9esm676004eaf.0.2026.08.10.23.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:02:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: sunxi: harden protected OOB handling
Date: Tue, 11 Aug 2026 00:01:58 -0600
Message-Id: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDuQ2FaCVyldJGaq42IiGS2Ce
 PdO2+XP430HKFUmhb45oNKblYtY+EsDwxRlJORsDa1rOxe8Q91kZ5QoGZdaVhpWylhKwhfvpOj
 vOd2uXYghEhiyVPoNZjye/9YtzXb7qnCeH/SS012CAAAA
X-Change-ID: 20260810-sunxi-nand-protected-oob-fixes-15db4368a8ae
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H6/H616 variable protected-OOB implementation has three related
failure cases around its per-step user-data lengths.

First, propagate failures while allocating the per-step length array.
Then reserve an encodable four-byte first section for the bad block
marker and reject layouts which cannot provide it. Finally, replace the
per-write heap allocation used for BBM compensation with the
controller's bounded 32-byte stack buffer.

These fixes keep the calculated, advertised and programmed OOB layouts
consistent and prevent zero-sized sections from reaching the BBM path.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      mtd: rawnand: sunxi: propagate user-data allocation errors
      mtd: rawnand: sunxi: reserve a full user-data word for BBM
      mtd: rawnand: sunxi: use a stack buffer for BBM randomization

 drivers/mtd/nand/raw/sunxi_nand.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)
---
base-commit: 15a3cbce32994141252bb4ecfe3ff3a5d22d0b4f
change-id: 20260810-sunxi-nand-protected-oob-fixes-15db4368a8ae

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


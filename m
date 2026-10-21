Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616806;
	b=siHQYhiCkmGpAbSAOQiX6nV2M70QWQJin1DEErshuSlSx6kxlQ3KshW832/Yoyp7tmdL
	 7cho6OIWlfKy2msF8Z+ssSMuFCbnHSdXGpXJh4Y8PMpvd7PVDp6+6m/fsdD2hYdMjJSAf
	 luD9E8r7J+eBm59Fi0/eQU9r+bM/ylry855xRQsDDVgpZh/qUglOA553QD3k3gy9EndZ8
	 712MNRBvojwzeuKp5L+C0vk/KiC247EMDBg5IR0ZJVeb6UaSSspv6RFkzTjsg0Ld6kiLD
	 hUQdbIoIfFlImbEvzysc9O8rDOOziQrcDw9o7if+CywJjHeRFbUoXjdqD1vZ/AvpDwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=fxNhFdCnRx1TnZ/VZCHBg1thsLr/kiS3HyDFHely7YU=;
	b=rzt6TZzz1a9GNYH239BEvZPD2yzNqtRBWMuewI1dqRYZBQq/nEjgbvavslAaRv9J18E0
	 NFR3xzZ3DWlq2NxI/AdQI7PBWHUcMtkJ8P8gaGwVk3cq74nSeujeaxh48T0oX6KPdeT05
	 qZPf4GZQ+cQynC5qE7J9sF9jzvw12Fch8lxBwqUY+jA6KaLl7XwFybExY+YwGmEkhJdd6
	 +PpA64DciWUbhKJpTXos4SImxsN3UXdm/GuVMF0ortr6kAPA/oYyes1TAb9yiyTk046ve
	 61xWNcwnmG/gR5xyh3ATuwrMDqVnEFjQLj3MGT9LP5yhmTO5TKj29Jj9Ev6+dQnXCWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NxQzrLSj;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA738606A31D
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 21:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA738606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NxQzrLSj
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-823e4047037so894251a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 14:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616804; x=1793221604; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxNhFdCnRx1TnZ/VZCHBg1thsLr/kiS3HyDFHely7YU=;
        b=NxQzrLSjSIlm4GnVqotLcgUym02FdyRuiJiZPmpiAH+5ZIDQNR4V57dMu8db/7YWiR
         KwG4Y5ktCVIhrnIcZhofeEA92bbGqdydZHFzw6E1rWoAjDgj/czSgbfAjW9n8Kir2ljq
         Rp6vD/8ksnurS41t9KhL219v2qSLAurZhiQgg6E8pBJcA0kGUijiG73ok7dcHTMfb/Ug
         2kbblgplJncWu+59Q8+bXB3JGss8XbpwYhQIKbsVz6eJQICyym7Ty+CCBBnZ39RqtNqH
         GxMrTE46mkfrm+vejFWtuSR8dudS58H1BkJSEPA9+tlLqefLIuLuaYxTqpL0B8uqWrw9
         7nYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616804; x=1793221604;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fxNhFdCnRx1TnZ/VZCHBg1thsLr/kiS3HyDFHely7YU=;
        b=Itz3m4kFWqhozSC9tRoDqUhFLQ/Z6CrWG/CS6jKUkvBW/nQMpA0PCPYywW/WlSykCO
         BekLxtd1DOID9i/6U6eq2bCtvlc3i7o6++T/bWA6HNEdAg3SUAAreCm6cHR0TpRerJ/Y
         e0U4GiBBieRW6mnIiJ/4LOAWX13EmxT/mhFWzD0Kup3U94/8EsCQmCk9sFaM4IhvpXTg
         Kf67c2X2iR1dinEedxptsdbFw3FMpCB0JRWGRPfyiU91ljuCc60WeqeM1h16vNz2kUnB
         5mN1hQfp/Gz4LYOLf0IsiK8lQSLXav8NdzJJlalpLxiHbpDjcyzdQpsQcbMaiduU9Yoi
         F4EA==
X-Forwarded-Encrypted: i=1; AKwUvBwNQDEzkDhvHmUfDyCGd75nYaqtoqwiDndEEy1+5GGb/qTpGQTKnSzDpS1z2W8m25QQsGQflJeu7XS55g==@lists.linux.dev
X-Gm-Message-State: AFq9FYK2GWc65MEe0Udyrp9eojpJeHej5zpOau+cH0FEZupRlygGyLKu
	QhJJi09+9ppZInvfxse1XmfIAbH8NyiQ6sz3bgge3ZH8A3pfGNMUkME3
X-Gm-Gg: AYBFou07W/c8iVGUHPpctIKt8ukEZWeZeNClsaiTtkB1oQM1n/rdewM6A4CJuEjm+Gm
	CMj0llQuSm4aAJ9f78kMwSqWGSerm+ywZsb/vnxEfurJXXLKL+a6QHWoHPpr74mO6tt9E3qrQiK
	tV3BFzLYytjuysdU96ei5k24cndG/Y1Zaw5jLYYzANunR1RuDLvXw792d+iIC2CvwBlha9f7BCX
	49WNmBsU3/eRlvL37Is6ENgUpvOW1j+B2KnjlNUwn/0sM992+VNacLmdJgZx15qWNuiVeADT7SA
	pI3OEvkDrEeFBFfF9l/H9nonczJ/SUD5Lxpmsh/G7jA0MvZF09hbkTVFnCaf46Sq4QkKk7wfhjs
	EnqX+ipw/52VlucKT+JPWfO/AUANu/frZ47PtBqWXY9XVlVCFLUGVAR4VSmltGVNHlT4OxXmfan
	TyV/wy2+CJGlzG+YT6IzRTd/LVIOoCGLGU8VJBUqEEJWHoOdYeX7+diI2s39rS0ApWVxPmkPv/m
	AYPuVc0BUUfIXuYkYRPOlOk8RfstQb+HT1+fGIeB3e50TwxTyWrEig3epqE4NkcgSUAR40kHcIr
	30OaGtTBSF6FokX830WO+I6g9b/oYX17r8k66fyMbRJ56ZP9IJZhoJ4sHSCPTu0MA+nZHi4KWf1
	n1nVeyXma3HPnODH8mMTgnXoNJGiHVLL1/n9xcOCBC/boZpSjelRXEBzv8TEmvc6r2k+VZplXVs
	lGVQ==
X-Received: by 2002:a05:6830:3495:b0:81c:a8c5:633e with SMTP id 46e09a7af769-84d08afde73mr2463140a34.11.1792616804678;
        Wed, 21 Oct 2026 14:06:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd2d04b5sm3466826a34.14.2026.10.21.14.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:06:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:06:33 -0600
Subject: [PATCH] dmaengine: sun6i: bound burst selection before shifting
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-sun6i-dma-burst-limit-v1-v1-1-41a7a476ef66@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0Q6CMAxFf4X02UY2CUR/xfCwjQo1Us02iAnh3
 +3k6ebctOdukCgyJbhVG0RaOfFbFMypgjA5GQl5UAZb29bU1mBa/MxZQ1rGYXbol5gyvri0q8G
 mo4u9dqbpDIFaPpEe/P0v3PuDVfGkkIu2XHiXCH10EqZSqZNkZKHz8bfvPyr+VHqlAAAA
X-Change-ID: 20261021-submit-sun6i-dma-burst-limit-v1-47e32971471e
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

find_burst_size() tests BIT(maxburst) before reducing the client's maximum
to a supported burst length. DesignWare UARTs request a maximum burst of
one quarter of their FIFO size, so a 256-byte FIFO supplies 64. Shifting
an unsigned long by 64 is undefined even on a 64-bit CPU. The fallback
loop can repeat the same invalid shift.

Limit the search to the highest burst represented in the controller's
nonzero capability mask before either shift. Larger client limits still
select the largest supported burst, while smaller limits retain the
existing power-of-two selection and the zero/default case is unchanged.

Fixes: 7178c3586ab4 ("dmaengine: sun6i: Choose appropriate burst length under maxburst")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..a8b12262b3c3 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -590,6 +590,9 @@ static u32 find_burst_size(const u32 burst_lengths, u32 maxburst)
 	if (!maxburst)
 		return 1;
 
+	/* maxburst is a transfer limit, not necessarily a valid bit index. */
+	maxburst = min_t(u32, maxburst, fls(burst_lengths) - 1);
+
 	if (BIT(maxburst) & burst_lengths)
 		return maxburst;
 

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-sun6i-dma-burst-limit-v1-47e32971471e

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


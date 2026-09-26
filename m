Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177423783C8
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437774; cv=none; b=Lsa8ZGI8DsShY8jfoeQL9rIH6TlHIh5f8PsMMtIOatonB0DsC4EEB98IhH90HqKcPTR3+cdfp6YaEcsc1Y3PHOTbxrWVFy7m2ErLlKUDrdaY+xaVgp7v0MAt8PUb+PZaE9UTVhIXXI33tu7OVdFQFYQRlL5N0WisY1vXKlgQnN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437774; c=relaxed/simple;
	bh=2ChPtfS7fuQ6xmL5pBM0ED+Tz6MNWUwwNmCfWCfm6zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uT+JvImz+d3c+3qTrwMm5m4S5gmPLLlzW5JH8KqBKWgCDSsB1NjwYtw6Tktlr7hmOYVoYhDwRmktCfssCkW5zRd7ij1dw704TQHwEnaOwlUTGYaZc11vstvCTbZlTBxw4FbRoW1a6f+hrmF9PjIsyfujthIJboqwfXyqJAbxQ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B611xEvn; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B611xEvn"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-81b8e8e9cb0so10065a34.3
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 08:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790437768; x=1791042568; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pt1JZ0Xx4dSQpjlcwcv4OrOAetyhY0kdTpc42Knguac=;
        b=B611xEvndTs7NOgglix1ToB19FYuNlwEPqCvzyGATZN3mbXeLw+eXt26rLVNAC2X1t
         JGKF4tJsfKaF2k8UT3kos66iw4fIuZgdhdpAo4e/LJ9chKjIpMJ+RkfjCWe+tZqF6ZDe
         a30L3RcaYhnY0xXii6wTD2Tstox6nsEC8jnLL7OwDdDQ5q/JI+QGknx3hCgqF111izB2
         Y53B6iGf5kX1y+1r2p6bT00ljfSMEDzdvZy7syCXetVEO0YRc0vyrKo2f1+ZwLcxKd/u
         bNTmdrRau4LqWAGn9AwhVSzAcPIUx5HBq4P83vnWgYGuyyPr3o9kyi6ZbZudgyC1YQLS
         68Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437768; x=1791042568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pt1JZ0Xx4dSQpjlcwcv4OrOAetyhY0kdTpc42Knguac=;
        b=NqAnPg6yKSYcSHemncEsOJ6OMpKJCtsW6c4eiDrOGMfenCWwrkWwjYFfH3BLMOX8xP
         yBUY5/XfLUQ4hHwgPa5ahm/BTFuQNb2NTw3A0iBCMkcuju8IU355rxwDXOkerocGi/2E
         /Qi1l2hhdOjReV7/Cq+qIRFG3agWV7dbmdKlKHnoC/tnoWFn2l8DaKHF/mymJ8wkYw2A
         5XxpvB8c5VD8IiQ9q0BKorrdEtRkA5tp1gYCWzNZKNxtlmEn8gdvIGfUBF5dUaKUVExY
         DQs3m1bT7o0BIqg0zkpU3WfM0LFlAqKC7yGuarhEZn5Fh2YsYMhvb66alXA9b9lWUtqd
         doMA==
X-Forwarded-Encrypted: i=1; AKwUvBxaF6vumedhLYLsdsZDqBOofyA5NAwAPQT10ipnnVuL2HN4DQAv7ZzK9FJblyY4cA4CddQNVyibQgyhbQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mUXjuvv/HNlPP/fDeO3fZmHw3AwaQ2tAm0+rRXehk4eNa+cLIC
	yHpzGqKUxeE4IX+J+QT6LwPI+mUub0h4jJgf66pNNSzcaOU+jyB5N70b
X-Gm-Gg: AYBFou1Zs2TGRGzakTiyHqNRygJOmI9WrOlWuyS3S3GwjDs6tyLzyORSSS7XGBQr8BE
	3lyc0HNZi6TwFc8JlsTWjx2/cSfCKwVvkl2KFs5B8XrtzNXXjbY+UUAluih94QnVCkkA/bxT7BR
	fxblZR89wB0CiYQxUty3QdKpb+Il/yUX33/AU/6/U5Zsy4VStYKDI5p3ikefe05z1dMeJQvpIwP
	0+4hL/Sd8n8akePx3EziGhldcoCEHfS4GBew+q104MWhhGeeQd+LU02s08fUGu3fx18KQguGqEN
	Vmjj0TBp1+t+gbNabG+RpQSDGRqMFRj54/fDchyZ+X4Cj/ekXFRHuInHd2ypvZ0PmgNXBGP8UYI
	i7iMxgTRQZfdpGEz9f9k/BUcdLxJh2UJDqbMkPghu9EJw53WggSNVDXvitypAxV2v6iqOu1RFcS
	uP5ULzfNdSz8xaXGxZhrEZZf3ccSzHoKcGyVrgpzmrZTArP4Vb9plTb92VmYdPDdPaa+7zrQz0s
	uJ9igTFGaVqCV9SdOjhZhVAq2k2hQvxiFrsvPszltcQzxcNOv9/OB7fGtCVmYjD45b5HRsFt3KT
	07wIyzZJdfXqBFHDKkExjQV2DUej17G0rfZBIPxtqbjlIHO+5NM1i6S0R4zzxF07FhIE1OuSDrl
	xLJXdZ+V+jHP81AbrmzlX
X-Received: by 2002:a05:6830:6734:b0:7dc:4a43:fb5c with SMTP id 46e09a7af769-81781294540mr9561085a34.11.1790437767719;
        Sat, 26 Sep 2026 08:49:27 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm5442366a34.26.2026.09.26.08.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:49:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Sep 2026 09:48:59 -0600
Subject: [PATCH net v4 04/15] xsk: freeze deferred pool teardown during
 system sleep
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-submit-stmmac-reset-fixes-v1-v4-4-ec1c0250b3c9@gmail.com>
References: <20260926-submit-stmmac-reset-fixes-v1-v4-0-ec1c0250b3c9@gmail.com>
In-Reply-To: <20260926-submit-stmmac-reset-fixes-v1-v4-0-ec1c0250b3c9@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>, 
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.15.2

Pool destruction calls the driver under RTNL from system_wq. That queue
is not frozen during system sleep, so ndo_bpf() can run after the device
suspend callback has gated its clocks or after the noirq phase.

Use the freezable workqueue for deferred pool release. Work already
running completes before device suspend, and newly queued destruction
waits until device resume. The pool, UMEM and netdev references remain
owned by the work until then. This does not replace driver error
handling after a failed resume.

Fixes: 1c1efc2af158 ("xsk: Create and free buffer pool independently from umem")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 net/xdp/xsk_buff_pool.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
index 9d2d94f1fb75..c58f56f24a9c 100644
--- a/net/xdp/xsk_buff_pool.c
+++ b/net/xdp/xsk_buff_pool.c
@@ -337,7 +337,10 @@ bool xp_put_pool(struct xsk_buff_pool *pool)
 
 	if (refcount_dec_and_test(&pool->users)) {
 		INIT_WORK(&pool->work, xp_release_deferred);
-		schedule_work(&pool->work);
+		/* Teardown calls ndo_bpf(), which may need powered hardware.
+		 * RTNL alone does not exclude the device's system PM callbacks.
+		 */
+		queue_work(system_freezable_wq, &pool->work);
 		return true;
 	}
 

-- 
2.53.0


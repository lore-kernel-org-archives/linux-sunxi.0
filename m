Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780963;
	b=Nv93Mfgdt0Ji9ciJz7yR48xFAmdAZsA5qADsHVcgdvtW5Byn+zecT4vntRF1sl4yLQjf
	 3vJCp8YndHOT7Xo5qk+fX7hl3/tjYjW7555zm77/M3nH5ypV54jUxSKbghRUWkUzpDcQ6
	 ucD27W0x9OAwqlh4NM4Jqa8G5e8tIUm87kUcd5IC3lEEk2tLjDh7aP6TB6YgGq8e5JxzM
	 GPSdm1Gv25nL34Bk2wOANO/H2OixvqUc1vtjqocbAxq9KOpSs0alpUACwJCZ1d6eD7yGR
	 0m3M1TTQez+amsKtQjK5TgaSogKNLfQ3PYmIrKQU0MELhwLVJf808o0UN5M5mW9jEfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=WsTkc8bAO4KYYktDdouwEoWdlbtwYIQKUFGzzo3SgDw=;
	b=yjtky1gTmH/s6825fhlKW0/xvxGsiYAwepenRt5Ucdr1cJgrEqzKKxAJAUSl04xns6R9
	 wtavZBn9ppaRIvHdAU6526CURk5qNtl+LttUZaZaNaKUztqHOd/t+NEpx0lcl0PdwPriI
	 tTyoRaG+6LJfaWtHCg015pMdSFyX0BgpKE1v8ofdJXdn9uvPu4PrtKFoiQ/MImgSLkO2V
	 3aTFCNI5ZhLumFbnWgOqXzETivpH7349gd8uXAktea234XAJa9fNyfdTH6VciMGRhHADH
	 EmZ5+mQ6x3MD7uj9+WAkz6qKxS0bpNXsC845VUyob8jkXroDQlWtXLr3ZHbD0cPjEFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SlJq5hhV;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472A4606A326
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 18:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 472A4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SlJq5hhV
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f84a55e31aso758866a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 11:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780962; x=1793385762; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WsTkc8bAO4KYYktDdouwEoWdlbtwYIQKUFGzzo3SgDw=;
        b=SlJq5hhVL1ST3Z36OguLTO/mwANRC7SjThID+bvDpTysW67ALLYcAvw/JggxvZcujr
         LYr85NSdZOsWXlDig1YOLCuYr5Ye3M+q3jEkeSR12XWEclGSyylWh+fNIhJwmry5OuZo
         DS6bqbiUBuE+RwHs7TvaNLQqcGl1qu3doGEe72vjdp6cO/QPjsjv4GuY+7KfwtTQ2Qx2
         cLX+q6kVPfNLoOviP7L4FRKAZIeWxH0urhJ3maoxd9oTJeGh3Z+bwYe1heI/XzCCY2i7
         O40HQD5B+Hf5xxBrBOdxmVgTQrjxce5U5s71aoDUOYKGLxnjO9YkiIDbjwxjMnJCfC2F
         HkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780962; x=1793385762;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsTkc8bAO4KYYktDdouwEoWdlbtwYIQKUFGzzo3SgDw=;
        b=sSh/VHu9ZBTBUwg6Ide5G4Rw1UpvXTe1uINYDrxTUPkQ2SVn+MnpZptRuCTwksElqz
         5zuai4YhF+LIkqOMXsLD3MJjCObCnvq3REaRs7e5C7ibQ120mo1yjm1ORcSM1gwoAeI2
         RXVhyFKY45HSpOA0BVU5Svo9nS5xkVuLQ/g2nrvwN1iXqPUjVw6kd9YVmMB5oGfEjth4
         Uf477RJYbgy/6bnw8uCLsVvM/x+oIh9pl8NWkRPo5MRSYqA21rSSH4pqAgWKNHk3NH0B
         IGF41Q12f97a7z5szKQrIGJe77Y9whdk/hEaEobv5mf3rjjolGiu52/7wES40G60/Ie3
         Z5Ow==
X-Forwarded-Encrypted: i=1; AKwUvBzfoyPe8gP1rfwViTgFg6b3rA9OYeVnAPzXZDqjGjkviVh4Lk4PgfIHtxCVuucqXsmj26w7Z0b6QA/D+g==@lists.linux.dev
X-Gm-Message-State: AFq9FYL6aoVAypFxA5EbYsxmCQakGjYIQRdRh/Q0tQ23AxkcPApywY0y
	cr5/lf2gcwrwufG3j1E0YFcM7l8DWtwd/Ltup7vx/tJhsEX7fGSkRMXa
X-Gm-Gg: AYBFou0QrF1PB5zS7CxNrPvuCZecLs34F4IT2gDsgDHhx9fqy6mxmey1NckmhvWjPK3
	DmMhYfQhmck/vY24XO+4rfdKR1AKulePFFp5/hJUO2rdeU31mkS6+/ll764V2nOhxolT2KDd6Rh
	kjOw8i9VE7rfKQEK53OlVkU3LNbJfpE+G/rslLWlECq4wXtyPek+WqjWYSFYPXgHFjPZktm4GHF
	7KyIcUW2VbLDWHv28i/vYjKQ5Hig0rqg+IBg8OuMPOG/BxuK4/MOCWHzblL38DVI6oycfypny0k
	Godhf8fpmGVeOTEnwTK6f71joV9lR1+RFhjEiE9GC1mRcnPqW9k5MRGPfXvLfEltRQ+eS4Ji9lU
	XFYxQhWYTNZtUU5xgT3VjYXPtz/Q6t2gszKqFT5Fy917SDjXBlm0TYWzvr5qgUQsIFZ9hOLvQo9
	F6aEfqnno0/FnwAZs5/gtLJAlojPuT1pk0CC6E7y3Ad94QsZ8n9KjA9S6IeLXR5fMFA4Efl9cZq
	aJVgxuqSx23a1qwZ6VehJZxn6EOhmpO+JQ46D/5jFI7FV35JrwY+qk1dCYzThy8WbQw6cUalHJG
	28ab0kTYX9ZWOTxfCH+68EXHz1kWfS0E3hwmG/VpoZjb8hYg2Xrap1usEloRfNs4eKnWUKaaInZ
	be6LmB/5zm/OO2Bz9TnEMWsyonVsTKyy5PVL1Xb5vpA08Hd8kMbpd0iitaaSGTIOI4l1gvX+lWU
	u4lQ==
X-Received: by 2002:a05:6808:138c:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-55c00426714mr42788b6e.67.1792780962175;
        Fri, 23 Oct 2026 11:42:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/6] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Fri, 23 Oct 2026 12:42:34 -0600
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQy24CMQxFf2WUdVPl4TgJq/5HxSIPG1J1hnZmQ
 FSIf2+AblhWsmRdyT7Xvhex0NxoEZvhImY6taUdpi7MyyDKPk07kq12LYwyqJUxcjnmsa29Tdh
 kHZP8bExrG0lOdF7lSUtni9UuMATQonO+ZuJ2vnu8bx+6Qz6orDfw38RM38duvj7GRE4LyXIYu
 9VmSMyOMHnPBWPyBaIygIAugqo6gDHVF7QPs7SWfb95M1S0MQB4BJ+Sqjkr5XLn1II5RSQEQ5w
 CPm8x+qI51FAjKQ2loFNs2HZMQDRgVbHZ+/y8FZwxwYfKQKUCdytfuNoembYuElJ2IWlicft/3
 5b1MP/cIz/p+7v/SLeXkkqr4BgDlMhvuzG1z9celther9dfuW0aOdIBAAA=
X-Change-ID: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

Correct interrupt routing and serialize physical-channel ownership across
allocation, completion, pause and termination. Keep paused virtual channels
off the allocator, drain completion callbacks before releasing resources,
and associate cyclic state with the descriptor that owns it.

The first patch carries Hongling Zeng's physical-channel indexing fix [0],
adapted to the configurable interrupt-bank size introduced for A733. The
second handles partially populated banks, including H3's twelve channels.
The remaining patches establish the ownership locking, pause bookkeeping,
callback retirement and per-descriptor cyclic state in that order.

Based on DMAengine next at aff5e6a77fc6, which includes A733 support, with
the posted IRQ-safe locking fix [1], channel pause-bit fix [2], and the
virt-dma synchronization helper from [3] applied first. The synchronization
patch uses that shared helper for the sun6i device_synchronize callback.

[0] https://lore.kernel.org/r/20260706064123.66035-1-zenghongling@kylinos.cn
[1] https://lore.kernel.org/r/20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog
[2] https://lore.kernel.org/r/20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com
[3] https://lore.kernel.org/r/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Clear the active descriptor pointer before handing finite completion to
  virt-dma, replacing the completed-descriptor pointer.
- Release completed physical channels while their virtual channels remain
  paused, and clear the hardware pause request before reassignment.
- Keep the ownership changes in patch 3 and the pause policy in patch 4.
- Link to v1: https://lore.kernel.org/r/20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com

---
Hongling Zeng (1):
      dmaengine: sun6i: fix physical channel index in interrupt handler

James Hilliard (5):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: serialize channel reassignment with interrupt handling
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 180 +++++++++++++++++++++++++++---------------------
 1 file changed, 103 insertions(+), 77 deletions(-)
---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


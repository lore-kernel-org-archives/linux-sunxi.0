Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735194;
	b=WUO8W7qUDLbjyUA1Lnz4vQ2Q5X/RxhsrZ+PvVmcunVzrdcelwSxfu93vtrrgoNDHMnEU
	 X61hlkXfoJt7OX9B0J2kC3xEaRGWOIeT9MBEpHpoV1g9ia5w24lQB2NaZgBZUPA3tXkaj
	 5w3HyvTip/Ka+vfZB+YX/sBPMVXQ26Bci8lBIi0jMHPXu6jbJK78ihgGecUAIwcW+2b30
	 P6AtidSwdnG+wCqY+hYfbTnbRioUcslSHLojUY0lG7N8BkFVOiXnXOovajgHyB5DHqkQ3
	 P6eiP2r852nqD87Ksp0wpHd9ijI5D3txtMHFWji76nNXtfiNunFkjUFiIsh02uCTGHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=5e7EmmrAmNsJKP6AOjhCJAku3QB+VBI4feI+to/QFAw=;
	b=CbMsFNQYGgdPyDQer2v2OR9aIMFXV69KBDD3ZvTobOcKxDr5VIijxLm1i3dchQfYPSXe
	 VkSPoaGPm73e5kZo7sHpanyX39qIfOxNIh/J6zugotFE0okRuwUhA+rf5dxwDcJ3M1iM9
	 FrwIIhEwJK4v/ALOkN2ktGKxmHNjbzdFK77ohHZ/RdcZrFT1CBByA0pKe/FWPLvScPIjN
	 r8FbOq6QRdivQv192YfdU/7R7+oFHCmzigr0ivYX7J9roERhqF6tV3LH5nyxDpOwszGsT
	 KziIDQQWDnT+lCk9FkGx4FDM7Jv0KNFd0eiAIIaDI4wIao+yKDsSJOcmo8UThyYNBKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDXUvIaD;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9304B606A31F
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9304B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDXUvIaD
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-716b58a4365so1874910eaf.3
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735192; x=1795339992; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5e7EmmrAmNsJKP6AOjhCJAku3QB+VBI4feI+to/QFAw=;
        b=bDXUvIaDON7BLcdFdVlsOTcIZPp8lebwl1H+aqJn+7TTdKALIm7/v84hPBhRVGtQ+Y
         NWJTPPUxf9iiptDngu7xzi9cl6QkuJOtQVNDGj7rHfb7uhw8FXv+h9zZbOIHuqnb7faF
         iivkrV5K6o76fgKKdj/RnAQ8Es4HVyYcqd7aP4/O0bpIH5kJaw0cOGQArYZCb/NlZPWo
         cKUtUD9KufODzeft+bJtvLsC+YgCrDC93Jp166z4zNr/cNm5AjbzKZVQo5fkOo3HCS26
         CW28NA/53mqe2zG0hLKEYSoSlUzkIJAklcxybTSIcX2nurcZWgvrUp01RksAAYaQIxQ9
         TihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735192; x=1795339992;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5e7EmmrAmNsJKP6AOjhCJAku3QB+VBI4feI+to/QFAw=;
        b=QojU7hxWSK0eiwQDfS5qS5Ew82RhbIVUpe4+XBnacqLdRjanWSZKH5LUD1lmOC3rop
         4t79kcOEVkLdHDDDo93TWhWHUUnkSUVZpIavqAVbLAFat+veHrNpHsDSDI7NzDEcFUh+
         Q6aYafoU6M/jwTsN6MAd6Ci5pNvSsfu3QCHjukbBmpS8BcG/VjQnWmMHdGFCV2/XXcxS
         r3EvoXxVliQwvOlm80eRFrJzVqxcE21SmJGUAsGuX9oAuKSkBmyXyX1FbTL7DzEVnYr1
         CaAsmwaNOqAK5y4vn33kdJWdl/nw6BBR4zp210hAGqZLYQ6Hbe9x6Q8TxmIwG/WPrWlp
         QL5g==
X-Forwarded-Encrypted: i=1; AL+hErE3JbVhWoD74ZYl1xP1WsSwBelqF6Ix39G1SphATrV27KcVUNdsgp/Jy5W+I8pZ4PCwCQTn2CdRp7eguA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/whdtTh999XRk2A/h0vtWcTb8lLgxJGR/l4Lv3npY8HRx2RVzV
	fcI0qpFB1CN2HsESroBg9+7mMfkTEtoQYvGgjYpxyxGnx+/hqTaZj8T8
X-Gm-Gg: AYBFou2maW7wDaiFGwNM4PSRXEKj4tSRNOWu/+JIVDNJRvfzZHS4cvkzsDrJUhNLNH/
	DRB6zsOV7SYunyTJnZs0EeBB/I4bHvbbSYxOvKt9BTISemkdHpR+r1Z4NmluUNEFfx3Pv+QyP8H
	6D5UeBD3W+DuPozLCTNVKcsXa73k+qFsTkaEyvzX1LjSp3Qw754Ve7Qf9vuAauDxfLjZotYbzLD
	9LB7MXN3YU/N8nwnCUNNxmG8Fgk/gr1Hpm6nP/2TysjIGZ+rS6q3sEYicCwLkit4p97IzRMYFGs
	Hag9mdJepbCFYgdUAdjowRqP02AMVhFYf1IRJ4VwcJ78KCLzN+bFnhzK4b9sYH03SX6AwnvC45k
	KD0WOjK/W+QqAsU2PTCtDQ5Hz5JrXK7QL2d1ttXBBHOH9IxWORiuXaEJkTKZgIDi7G7Poj3dM04
	+PrEu6avd8ENjzJfcIOmILEoloVDrLPio6yAnLvxMpSNuUhE0PBdt0YeF3sFyO70+v5uzQjsuU/
	mPkh8rskL9cwdWFZLVgw3kXoKDb1XvDYo5l0qDAAEV8Gwa4j1U+6qKGiz3PXpF0MqchEdpmah2C
	YCFCS2BxUWG0v5qp6EH7bi6udi8G1xO1vAaY/RUNsrWv8sUlG5numGoIckZ7VDZ0A7/Oxay3Ktx
	HP9ffqfOCb9eCwwZoiwY9KbDeHObyCLBxeTccBqx6C4x2UuO7LkTfaMD30ziyROWXO+EpAWrwl/
	/pPnWmvXxyQ+Oap6kRYwF+HbFvfRSdkLrlnQnIVDEcICPxR+cmlww=
X-Received: by 2002:a05:6820:617:b0:71a:e82c:1eb8 with SMTP id 006d021491bc7-71ae82c267cmr724986eaf.7.1794735192405;
        Sun, 15 Nov 2026 01:33:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v4 0/9] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Sun, 15 Nov 2026 02:32:48 -0700
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQzW4cIQwA4FdZzblUBoyBPfU9qhwMmCxVZredm
 awSRfvudSY9dHtqJCRkyf788zatsgxZp+PhbVrkOtZxOWuAXw5TPfH5UcxoGk8OHFlwzqzPZR6
 bfmcaps1snkaXbcxizvKymas1wVdvQ+qY0E7q/Fykj5e9x/eHj1iRH1K3d/hPxiK/nrX59pE2F
 V7F1MusrY4HIpckNqxUXKip2dStxyCeHTRnk8vMEgV3ird60pmPh0Y+J8RIGJmhlQIQShBqynA
 mIXTSOdF9VadYbU8ttSxgsVYK0F33yiSdAz1UX2Is91XoI2AB9UqkmLlx6EAlh8wBLCCE6BEyT
 +/7n8a6XZbX/eRXu6/7ievqA6NmCp0S1ty/Pc48nr7qsXb96v4W/f+ITsWq68ZaEUtP/4r+06J
 XUbrlWqBIpDvxdrv9Bqn1lJV2AgAA
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
The ownership work is split into lock ordering, physical-channel locking,
completed-descriptor retirement and interrupt cleanup. Pause bookkeeping,
callback synchronization and per-descriptor cyclic state follow separately.

Based on DMAengine next at 6628e7d4c6b, with the posted IRQ-safe locking
fix [1], channel pause-bit fix [2], and shared virt-dma synchronization
helper [3] applied first. The synchronization patch uses that helper for
the sun6i device_synchronize callback.

[0] https://lore.kernel.org/r/20260706064123.66035-1-zenghongling@kylinos.cn
[1] https://lore.kernel.org/r/20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog
[2] https://lore.kernel.org/r/20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com
[3] https://lore.kernel.org/r/20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v4:
- Explain that reading the pause register flushes the MMIO request
  before returning to the client, following Frank's review.
- Collect Frank's Reviewed-by tags on the interrupt-bank, lock-ordering,
  ownership, completion, interrupt-retirement, synchronization and
  cyclic-mode patches.
- Rebase onto current DMAengine next, retaining the upstream residue
  snapshot and NULL-descriptor fixes.
- Use the standalone shared virt-dma helper from MediaTek synchronization
  v3 as a prerequisite.
- Link to v3: https://patch.msgid.link/20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com

Changes in v3:
- Split the ownership patch into four commits covering lock ordering,
  physical-channel locking, completed-descriptor retirement and interrupt
  cleanup, following Frank Li's review.
- Document why virt-dma still takes vc.lock independently of sdev->lock.
- Check pending interrupt status first in the per-bank loop condition.
- Link to v2: https://lore.kernel.org/r/20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com

Changes in v2:
- Clear the active descriptor pointer before handing finite completion to
  virt-dma, replacing the completed-descriptor pointer.
- Release completed physical channels while their virtual channels remain
  paused, and clear the hardware pause request before reassignment.
- Keep the ownership changes in patch 3 and the pause policy in patch 4.
- Link to v1: https://lore.kernel.org/r/20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Arnd Bergmann <arnd@arndb.de>
To: Maxime Ripard <mripard@kernel.org>
To: Jens Kuske <jenskuske@gmail.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Hongling Zeng (1):
      dmaengine: sun6i: fix physical channel index in interrupt handler

James Hilliard (8):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: take the device lock before the virtual channel lock
      dmaengine: sun6i: serialize physical channel ownership
      dmaengine: sun6i: detach completed descriptors before invoking callbacks
      dmaengine: sun6i: retire interrupt state before reusing physical channels
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 184 ++++++++++++++++++++++++++++--------------------
 1 file changed, 107 insertions(+), 77 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 43704b0efab7679ada5f06b959a501040573409a

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


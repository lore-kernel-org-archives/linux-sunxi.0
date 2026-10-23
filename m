Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798712;
	b=E9+EbfKmT600CFqD7IapemJfLP+rIImFpaKJn7hp70TOOWsS1IvO5NRwnf3jdt6EJmLu
	 McVXihFvjt01cMoNZu9PJPZ5eexidtm+qTB3XuuIfTHlVlztDuNOegPEsd6fcsVVFDfX4
	 LwiJQNMdgabtWKW2I8PCGMb4SlwEXDshebVu3FFd2VxKrYQmnsDty3UxVqWAzgyeN+D0t
	 y+y0Kz4txm+s7qJXov/FwXh84cK1lmzSQiXIHcQlS6cSrw7f6KZP3yLwiqIYL52gcMB7w
	 VPSjTNdNN0MVkm1IZuXuxibz/whBZ9KnP99qBvqd4o2idJna7Wdqy/WLo+SwU9uVuYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=5TT2qKFHVhSy1i/+TLyLe7Zn0Ot6zl7si4UQtRA1syU=;
	b=s07fXCf6LwH3imfX/E6TzyVdfCyMn6uAawGWUXmHIT7J+Xnex6tdVB7MVPwIW8voLJd4
	 N9KQk2YP8Vt1uruZk3HOvgd9dPmFuyg5ogCzKHiNqL4hEVlHq9BU31OKbAVwtGzVvgEIm
	 NZAN1Ec1gWXfGvLCbCV/N+Td3b9bmR8YfDr8zE7grOZ8348cIUcJ+wDAc9fFnfRfWDlrh
	 jh+EA38+1k703QZRl1R68OtKolc1gdJuP/9lVabW1U2uyMTkaAfWdwTgf985rw3bExEvp
	 6HdrjXYxZI92jA2WC3kcwWgJcL1TnbBDt+JzEjvqBL2ewKnmFmlD+P81zWPYjU4ndCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SvY1ZORx;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26694606A31D
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 23:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26694606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SvY1ZORx
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-475920b9ca2so551921fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 16:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798711; x=1793403511; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5TT2qKFHVhSy1i/+TLyLe7Zn0Ot6zl7si4UQtRA1syU=;
        b=SvY1ZORxx/7lRhBRD3zJHMIWwvxtSKVEFufrIpAc5J3muevRMzmd66uzPK4+CAosO9
         45HT8P9w4ISq8X/CZjTLPtM/HYE4bcbTQNhZOWQ+hFJVqE9qLXx0mOgpBu+wQb2C0y4/
         /2+n2XY2NEG3t5YFpazbS4VeV9qWiQIHIPMrLezoNDUQ4gCeNbbRVjRLP4DDx3SwfLI+
         GNV8NEBTemvXCaLICBI08MzSPthmIsktCFnkwQyhECmUPZJrVFLCNhWlqY15S8pM86xj
         nqZkBusCUlPNTpuZoamI1FM0LWSQz7nyhrPdpqQyI1pfJCtEfcvMMTFuf+OcKPXqp6ui
         TuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798711; x=1793403511;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5TT2qKFHVhSy1i/+TLyLe7Zn0Ot6zl7si4UQtRA1syU=;
        b=Ae3bpHYMas4o7q3zVq2juIcy7KKZ/zDslFSI/dGwDQvKSBlKgjSnH2qIccdX1zmBfY
         Xc1Mp5NfpUzo6pnzyrvxfN3fcohbfTsqHpMJR+SDmlXiS+G1lgoq1c9NDzzsGT/7QY/S
         onA77x4euX++UkGCftWjE09uZFyio6fk6dVRJO49gA0Va5EoWTLztQaRmP/7Fb37aZx2
         mUsyyE7qmUM9i+8Uh5Pzmt+YbHx2fS+zPw2IUbG5+K2F9JlyFGKaa7YCLhvOOyCtbC8Z
         UbUbbbJ+YopcNXODjGl2e3rn9uMVkuR3yi6137qZejAkzeXwsjW7kJ4PDw4VSzrwwjur
         upMA==
X-Forwarded-Encrypted: i=1; AKwUvBy8Y3kV2xBLS/g0ZPOfnyJUKBrextNRuTLCzgO+OgGPswm5SpWHQwtsUNfWTz0GZIRKMHnYfY52hoQrdQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK/nM423zC8AXFA90C2kp0RwpI/Q8lsYtsb9q8B7eH/4Ybh0JQ8
	k7UwdC2cVhfw6LOxA39yMl6wa1CiGi+elUMBsGfRXEVcVT3DpM8z0i8Z
X-Gm-Gg: AYBFou3W1YmNJ3JS3c6yiOE/o/1DEvoOCDGOo7XhgEKq09UklxYvlVrvXrpLYdEMBaH
	RiBn+GtKsvUJ80FV8wi+uX5w7Pyi8E1teBzjBJIcjFWpgenQKl6tVSO8uI/f///rbEhgVj68nv8
	IuKPEYEmEnCWcBJVrZOQBThkG7AXcMTwmUTPbObL6bc2DbQZhDWUOU0aWyvdya771L84uIzu/6Y
	v+7lGjT1rIVmcjVYcXCFLWkvZnmdDhKhnKHIncxt+ga+SUteltBc8VW714l6uSy5oe2P/8qHeIG
	E8jOfHQ5sjPBsOhmYhf5JV/iU/f0lDaKoSXHm7FJaLtv6NFfUBw4T8hP6Cz3lpYbe+SPiOsrM0p
	4Wwx9cIR8WM+rO4FUHzffTbXxVi4nNFBEL0gYGd3UkqLJPOJ+0FFKdd2vStI8xykgBPvkmSbPIY
	l6BETNPv+AyjvsJl6Eu6BAmyVIlcmuX1BnWu2TuK6RDXq1X4UxKI/FYE8T7eiAAg3/iVYmx+toy
	7DaHXQ4a4atpB5sfiUA3IeAQI0BKI7i5JmNIgDskBUiKUyKwYECPCX+lnOA+765e5uY3SnCb2mu
	kFFNxAjkC803HmTFAnfib2+YGQCZndevvIK4x48HEeoYKefeIm5wYtWnruGUBbwC1Uc9CD63XFW
	8PIVtcTws28TIiNNYsYzI1I+R1ntlcMHZPg5PCoBm7pfXl29xP+qisvE7fG4eme7f74AHhZCUvl
	90awYq
X-Received: by 2002:a05:6870:71c5:b0:494:a88e:3ec7 with SMTP id 586e51a60fabf-4a83f5ecc73mr613357fac.39.1792798711052;
        Fri, 23 Oct 2026 16:38:31 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/9] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Fri, 23 Oct 2026 17:38:19 -0600
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQzW4CMQyEXwXtuany4zhZTn2PqofEsSFVd2l3F
 0SFePcG6AFurRQpGsn+xjOnbuap8tytV6du4kOd625swj2tOtqmccOqlqY7qy0aba2a93moS/t
 GrKoMSX1U4aUOrEY+LupglHfkjI8CEUzXOJ8TSz1ePV7fbrpB3pmWC/h3YuKvfTNfbmNdTjMr2
 g3Nar1KIp4xhSCEfQoEvbaAgL4HXUwEa0sgdDeztNC23bxeFXR9BAgIISVdctba58YphDn1yAi
 WJUV83BIMZCSWWHrWBojQa7HiGiYiWnCaXA4hP25Fb20MsQgwFZBmFUiKa5UZ53tGzj4mw9Jd8
 m/rvOym72vlB3ON+49229NKGx29YATq5WUzpPrx3Mq60g/2nuj+QrSNSC1uIALIEu+J5/P5ByH
 21fMkAgAA
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

 drivers/dma/sun6i-dma.c | 183 ++++++++++++++++++++++++++++--------------------
 1 file changed, 106 insertions(+), 77 deletions(-)
---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


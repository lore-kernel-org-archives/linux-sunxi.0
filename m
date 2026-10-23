Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725299;
	b=WtqmoRdQWJJzwOWX1iuw/BTDaZqqZy0mYFvZ1ppwyRDYVjJgNZZ0leFVEGfQBxdqG6Xy
	 gzyZADrYh1FG9/uMgWe4CGXSAM4VTwM9LuL1g7rphX1mSiPTWlQYCXKlsZXV9F3adDW8V
	 9bCq7Mll0PGDMR9x37Eb2jVkMnPTvQHN+aM7XzQ64PjC0UgzRl0gJ+X+4ZxWQ+hNMPbyn
	 svngfaqqVxK27SC8oY54TgxKTAbe9gr6ngnD+i+YbWhT3CR3+eTnuCJMyP5ZiBQdBHeLQ
	 l+hpevOPoAbzgFFKxZTOGgonOH7zM+mbm2aUVNB6xoy/29WFprucMgHnjzvNvfWwWIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pm5LxVvpIboHfA4NG+PJUVszg46D0jGE/bRr+E4n5SU=;
	b=yw6cIH6NA1a37cymDDr1dw2jHBd6pUYLkHYPXKtNODChNGQuFeXnioVM7tnjCTFNjmYe
	 miz938ZLMHgeq91Lmexz6mZAMhmr87jR+Q2YiX5dQDq4fUtuPvTgXAgpQY+qly0xxvlhi
	 SaJ7tyiV+0d8ueyWHvNkAwooadpl6HPSYpO4vxb9UhfsGH6O2GQ9rysL6lsg+eRmxRncn
	 YllRdQUYw5unNx5hioLTbRNU1vNinQx1omn6WDT+GfASqPOTCwqIZxU9wHLlDe9uh0FF0
	 iDJUdm+y5kH2PCUUqMgP+87HqDAuj/T+VIdD6ZVjh4u+kNxfLQnVomcZ14+AIgfTZdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hcnn+7JH;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AA2606A319
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 03:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55AA2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hcnn+7JH
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8479f46ecd8so183801a34.0
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 20:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725297; x=1793330097; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pm5LxVvpIboHfA4NG+PJUVszg46D0jGE/bRr+E4n5SU=;
        b=hcnn+7JHoc973Zy9N/jlDtBwGRqos923SK1DM4VmVBqWGXtOTWowLn8nIB0TDlXePj
         xl8fRTB+7oURkLtQN3lpGsi4BwBN5bfENkzT70XUbrDZdiYJbudFqrosGVqNcrjEx5mh
         4fKpwcOoP/WP08G+Odn6zur9hpL/7/dP7ovg/WRZyKfH01Tju5vL2citsys8RrOqYLVt
         CUpDu1v8Ck8JyU4NXshttLZ9I0VLnpPIJTKsoZfqMcQIQRhQ68FPYunyd7x6VtXKwdtQ
         KKEwo6h1cohsI40gGPJEkvIOyr+jZARnKbYvxsEkNeF6oAhfdNHJ6syE1QO2lbPfStIa
         Hqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725297; x=1793330097;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pm5LxVvpIboHfA4NG+PJUVszg46D0jGE/bRr+E4n5SU=;
        b=TgVGe1RCt0HAK5ryUhCLB9u3UYWKhh5RE7baENWjXQnfO06YQt0WZvKm5p+RHw+v6T
         Pi129DCqxmCM9P1os/fOUt1OzCg3/0VMn9MPKVlexmdE8RvRIPd8Dffutpv+SBgpFMoc
         vPF1IdvwnWtMN9OTjorIwq3LTf+pp4VKeQXwTbrr6tSlVtAA1Ldzp3OpHPkN3ipZuyOj
         +bKPpQsPyELa0tkBOOFR3CLRDNDuFAbJYUTC7PIYvb+qd9UWDXjEqEllhyv1fRUuY+wz
         MWCC/SYnm1fGGoGzkygZ2rMx8H0l5qiuC8j/v9PV3psO/4t9h9vkavH+WEYTcqy+fgv1
         u3oA==
X-Forwarded-Encrypted: i=1; AKwUvByBudMANjlr/iwD9EPvuhQRvnSqLyB4JWvIM/LZgeuarCdIvDPY0r0bBWFO8XYWohjTVsMF+TyV0ThwDQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIzhPZPLk5IeJThF9cTUKuAxaaRnjH/p7hj5YC7zOBkq7NKCUrr
	BrLWNohl0UHNw7dtBlVUb3HAEhKU7m7+BwJcQV8BD/V3yRTJk4Cba172
X-Gm-Gg: AYBFou0Bh/fo6ad9aFLXHHD8EmhZvciMGhWaMrv0xC1Tlg2Al9Ek24tGxCZNOoIpMQi
	ddCMzIl2hdQa2E3PWMR+1vXYKGlXzmrAmKH5Qv3ejOzAtfMNrk0OxdtZGF9f6kVAhWshMZDZCS2
	G6NHnv2pYklxaTbskV6VxkOwkkGFPJZCHkXuch17371E5DAdWfrVzJ2Pcl2xyjhtlcARCdX/orW
	/+MnUYeim4nglptnHgBXFkFTxs2lS4D0uwyuUFl+yb3bZqrb0fYIDNsvQdVtDyqvNMkmhMbMKn4
	R74yy0/ttbpPzZ2V1MbFGUSrDqN1O4VfH0p8IxRJRtAdOofP63by8QEjBmup/PhhEdIG74mAwtG
	4MOgJEI1Y1GhicjAD+d+CT7CDxLJLaRFGKNU5N7ltSDqLlzLd26E1HmHStKMwH44mlNPj370z1d
	jGy15YHIWqJB15TVEWOXjHZaNdTby0Vv5tB3tPaV0/KSEEOlh4ZUw//EX06BQS6NHIFwnJ2pbl7
	UeHJmaH2nLgJin/+siNaPZZ5hpVIjKCbc6VVN7R7KZveRpxUiVQICPqMRRTLM/qSwRMNZd0PKJy
	AjuOaRSPcC+q/5EB4juGionC7ldetj78nvawEHRckk7q6AyuM7ApvB/VYeJKDBoYDjFC1tyyu+m
	UvBLQnEe89CbhkCfFrYogBoltpGmmopc8y68zsT/R9ThGfu1xjiBO49gTM5JGlyE8lD/Wr2Jgis
	Kw0Ls=
X-Received: by 2002:a05:6830:412a:b0:821:94d2:83cd with SMTP id 46e09a7af769-84fafc689dfmr760717a34.9.1792725297222;
        Thu, 22 Oct 2026 20:14:57 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:14:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/6] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Thu, 22 Oct 2026 21:14:51 -0600
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WQy2oDMQxFf2XwugY/ZNnOr5QsbFlqXDrTdmYSA
 iH/XrfpJitxQfccoZvaeO28qcN0Uytf+tY/lxHsy6ToVJY31r2NrJxxaI1zejvXue9jLNh1m4v
 +6MJ7n1kvfN31xergyduQBBJYNThfK0u//jlej488IO9M+y/4f2Pl7/OQ7481VcvGmj7noTpMR
 SQwlhiFMJdIkI0DBAwZTLMJnGuR0D9kZafTuPkwNfQ5AUSEWIpptRoT6uA0wloyMoJjKQmfW4K
 RrKSWWmZjgQiDESd+YBKiA2/I1xjrcysF51JMTYCpgQxVJGl+vMz6kBm5hlQsizre7z+Uy8BEc
 wEAAA==
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
Hongling Zeng (1):
      dmaengine: sun6i: fix physical channel index in interrupt handler

James Hilliard (5):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: serialize channel reassignment with interrupt handling
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 153 ++++++++++++++++++++++++++++--------------------
 1 file changed, 89 insertions(+), 64 deletions(-)
---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


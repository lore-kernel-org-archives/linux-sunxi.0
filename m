Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733612;
	b=DStSxSkUKL4dxeHc8HSAr+B/TFket1Ai3Oae0xOgQgqLFzwWXMFV5B3h7ntyY0/ab3C5
	 6kx9HUDFaXHyt3swqTaAq6uxF12+6ajfA+iZAdS2WecWo7l3F7imvsMb/nVFuOXB6gvVj
	 kxuefOSm3whNOOT3yBMbNwtj+mhxhH5rmI2gsO9RKwLGrUd5Ej2BgDyDmv6dfYvsDHLSz
	 Edi8c3ZtwkffV872qEz3RXLkO6bTFVlCRRvn7f85Fy8Gc0LKjkkq8PQh0gnI4Qog0uRrT
	 UpH33gWwAHR0+nEkv0IFATloyQtWSHFgObre9/FWdgfqDSaEU8/kniJADd9QPh8pXWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=EICA2+Ii2qgfcuNngaTE7AGwJ5yMZFSeIndPaowbVuc=;
	b=ovbVnazivu/bfYls2N9kLAwN/DkWBTicOGaBWE/fBB2Ulw0iUiiOExmYhpdK70bFZMmZ
	 2D89ViOafSFQgSO2SxRCVPaKY4SDNWQtnhnKnQAQHTMkj7tD+a8ByJONbELdILv+GGiaf
	 P8AbjaC8q2EhadwmL4bserKZtE6fXRMUHS97ZVq2VcCRSqLTmREFMdBZL+jMWhgks08+L
	 k5nuxifx+qwN1YCv6tWfibgvnorjeD8kKUosTmgUTpF+/OFUqSDQQFkFJgfuz1rVhlf2l
	 W8F6NicPRUlBzb/GkZ7fAbvntlCjSxpo/G2vjfqxN+Dg+qRGxDPTg8V2Dco6sXSzPjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GbQM6s3K;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7E2606A31A
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E7E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GbQM6s3K
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-843cf077f10so4494915a34.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733610; x=1795338410; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EICA2+Ii2qgfcuNngaTE7AGwJ5yMZFSeIndPaowbVuc=;
        b=GbQM6s3KsKrRroBgbKQrSdItVeWP5a3MQpa0gB5bAXh/LWhQI60AZP0/a+5SnBXoKx
         dQtnqUn0YG5rcui8rXC58NLvMyzIuasdGZdYLqhqS2qYQ2vGPgw226txKKig8sMulVWK
         sDBpVtElkg+qW9lbc3vSDeW7K92vD8ZPhl+hjnExcgLbBWJbsauEFjlymPJromVjZghy
         gDiDhf5c3hcXox0dNsZH5XzK2JJuWBhgeWOfxnzXKKvUORuYHGzD9Ma5kKEeJDtNLr8W
         gk8q6hU9Y4A4R1V49tC6sYkg+efzMvcrHukL29hUO3y3UsZVvSrmrXrTYtqjYGla3Neu
         J3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733610; x=1795338410;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EICA2+Ii2qgfcuNngaTE7AGwJ5yMZFSeIndPaowbVuc=;
        b=z4HLbw5WHwSjFaXNQkntR2W4AFRHATxaRKSYc8JqaursGA3gMZD7JT78MF/rxGT/Mw
         WtJECyM+k/Npzp+XoDxQ9/Q7NvGDBjmU9lyex40aGhXwZTPO7xTo1fphv2k+FktTDDBs
         EPgDviXNxhE/mmqMNgisksNc3eUX/I+ruqyYXSDnRCm6VyFzklQ1NEygXO496y+f+a7h
         aNnfdOChNq157BIJNzjpy6DGsEW9tj7hKSuwnVX9HMkr7Bwpt5JQWtSEyIvpod2dE+kP
         PXajiLSlvp6ZjOgJ8GuoydEUoqBEkajd2z4Di4qLyyS7TiacGleSoJnSJDod2xlwn/nE
         5svw==
X-Forwarded-Encrypted: i=1; AL+hErHOTfukKOqKbT+zzzI5uMU8T1hG0VF5vjXS4HhjaNfG04Q98lrb9QAmPQt0s4DnUIo9E6ik2vAhBKYqVw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+191ZUzndaAZgD93pZWGzvx4lDS4jL652t0rlwMpKAlGY/3V6C
	YskxuhNjj/owlqE6kCMYf3eRiTzWiO4e3AdGbstAZAhMmZgyEl0gsSuQ
X-Gm-Gg: AYBFou2HrlVYZNISrwM5q9HBNCB/O6u4P0DsKlJO5YZJbWR2HtlK9Gx4Y5XIx4c2bj+
	zfzwhhLCLOUSC8Jh1/1U8S5zGh+O10xQkEu/pR6kEFHPnP2EEf5bEm7rt5P2LxyunqZRiy8CIN+
	+7j6tU8p9KIB+NekTM9O3JhtVlFNs4+51c/5A3OMFacTQ1t1Kc4eqdFCxn4zUz2sjkuF+0uaCQR
	wRNM4spOnxUUUA33WdmXAc3zxWc6PYeqZhPpOFHpo3Fq51MBDShjVuojaFLHqh7dkmC7w6DRcn8
	dBSOoq4BlXUaUETWPHhmiw4CeA02JTLMCotW9JTjtPs70SIMFi+DS7qvXqx9FPXThsIKiDrC+St
	nSGZMCsfnENKnMehr6oqZ70HkAEVR8cQPZUztV8NQVwNG9ZYg/rqYgK6FKYABtr0Zzn0Ubg1mMi
	NrAb0AarqNDoyY92B+TMOLK/4XLNQAj7fIKG6RqEa7qATRFn0Z3aJTBuUwc/AFi3zy1xfGh02PB
	ljmg2as+a5bV9nvQ+FoYVerqjTrHdV9c3079WKbaBOBqkPjxemxOeiwHk93ZJKnFBRvOtMPYtPF
	1wtNKbQz9Vw2NIhFPw9RnOAsJiww2LA5oEB+l2e9nXUD+0ZL7vp8KswHD0SDYt6d8wvm/mII8Yr
	bjT4tkVTW/m2HxiZdawTX2bZRGpGXj3xnq7vdU1q3VOK1rzpD7dCtAm4o3MmskpqEBrhjlBlKvw
	MHXGxS90G6prJul00tA4U1tT0VvurQWL3ZZAVE6H4YmBQ+bLnBTjZ5
X-Received: by 2002:a05:6820:2d8a:b0:71a:e62f:62ee with SMTP id 006d021491bc7-71ae62f6ac9mr968000eaf.23.1794733610517;
        Sun, 15 Nov 2026 01:06:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
Date: Sun, 15 Nov 2026 02:06:33 -0700
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6dkxboEZX3sOwaMsURimYthIN4
 e4WPIHJJD8v+Xl/FhYxEEZ2KRYWcKZI05hBHgpmez12CNRmZpJLJQQvIb6Mp5RjrAhar8HqYTD
 aPmAgh4k8wizAKHGWXHFzUo5l1zOgo/e+c2t+nEV3tGmTb42eYprCZ39kFlvv3818Aipba67qU
 vDKXTuvaTjaybNmXdcv6o9WGuwAAAA=
X-Change-ID: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Retain descriptors through callback synchronization using a shared virt-dma
termination helper, then use it to fix sun4i cyclic callback lifetime
and IRQ serialization. The helper keeps termination usable in atomic
context while callbacks finish in process-context synchronization.

Also serialize pending IRQ handling with physical-channel reuse so an
old transfer's interrupt state cannot complete its replacement or disable
the replacement's interrupts.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Add a shared virt-dma descriptor-retirement helper before the sun4i
  fix, following Frank's review.
- Retain all collected descriptors until synchronization, avoiding
  provider-specific cyclic checks and preserving repeated termination.
- Retire pending IRQ state before physical-channel reuse and acknowledge
  events under the owning virtual channel's lock in a separate fix.
- Link to v1: https://patch.msgid.link/20261103-submit-sun4i-dma-callback-lifetime-v1-v1-1-4c5a0653104f@gmail.com

---
James Hilliard (3):
      dmaengine: virt-dma: share deferred descriptor retirement
      dmaengine: sun4i: retain cyclic descriptors until callbacks drain
      dmaengine: sun4i: retire interrupt state before channel reuse

 drivers/dma/sun4i-dma.c | 68 +++++++++++++++++++++++++++++--------------------
 drivers/dma/virt-dma.h  | 20 ++++++++++++++-
 2 files changed, 59 insertions(+), 29 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


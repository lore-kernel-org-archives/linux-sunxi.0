Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111387;
	b=MCi7wf5YDXFKlSFWK9ISqW2HFI3YNo0mxc7Jo4srMI9mfju27NJkAbai+cOLE7cbsfbb
	 a+Ns+iSyTVYKISE4GbBBdC8voH0/U9C4uZ1HbZp/s0XPxb1uWX25+KuF4jsEbQ77k0tgJ
	 2zKzzqVQwmvXFbhklGlpIgsKUHT3mjuw+18UK15sXjkRkSyPNTv1RUooC9jZ7bGAENKSZ
	 9LmUs9Z7TyHTPThr/FQ59k+yXYsbZzXmzhHoeF8VAo/YTBTO10+rG32SAhKeOhJ3bjY4f
	 2Myu1q6tVQGT+DL4UaMcy+fG5l3h8I8RJCMcJfCjbEBD6vVSTaaN69HGQjyq9ER/Jlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=RmXsAjAcTfcq6c7xsvavkfoeRMZk5EmBWQcvZmkAZtY=;
	b=HSXaN5jyV9ssQmizo4wqGEs1itNUrNpZsHLrb80230nFs5vRpVpZReHMLdhIJqYgeQxA
	 dLY3v8C4yl80ubTtbdIU9CFfjpVL8W7W2R1QDVYGhhLPYp9sa4s8liq0EZbZm95a5AobX
	 tH4wcd/ZE7KZ8KBlK/3Rve6F4IkbsOr924D7nZ8Ut4TAh48cLLHC5qA0FHStTay+1ve+e
	 ZTFAQHr38LTgCUQCWS7S7c0Cl30ajLLvk17wTAX+/OYEde3XdVYPpfpE7htnVa1+7sk0x
	 kkmHVeA5VC6cS2LQ318h9yI7Hg8eP+L1bDKjzZ65TPXg092TbYVbvR0oqZ3yqHwo4YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BR2TO/Re";
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936DE606A324
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 18:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 936DE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BR2TO/Re
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6e560e00a86so9435eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 10:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111386; x=1795716186; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RmXsAjAcTfcq6c7xsvavkfoeRMZk5EmBWQcvZmkAZtY=;
        b=BR2TO/Re8w4gczCmXRXVBv1ugOGkBTzSbZk9dxvpEU6IKKzq9bSwAOM+3YXmK5hg+0
         So0c+CYId0n47CS5+YoqTPDk2LE+C3UTTqkKUNaIjxu2NuXygF/eg8dD9/EPvb1fiutW
         trgK7tsu0hQ0wK1394N62GMGdJUMI+u0VhLMqdmWn8vBnPhoWCiT4R4ZB/H2aiZuB5r/
         Lmhkyt7nicpSfRplOdPgo6Ei8jD0X89AYx7SC6gmFhsO/qwbBQ7RzclRxr5XKc7cnyk4
         EK0kzovT3C6hvhCcoB2CBWr7R9+q1TatzfvaFu3BMHoAV6Xqjl/VxvpfC985ee2bdgI0
         Mjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111386; x=1795716186;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RmXsAjAcTfcq6c7xsvavkfoeRMZk5EmBWQcvZmkAZtY=;
        b=wYJj2/cjm7TGaf1BJjx0hCkURg6f5GaTlm9G5bbuZm7ME80CKd8/PBE8tsXi5aw/qG
         aX3kBdnxfdX1wfkoweEJ0ZurxaBlODY4G6FSD4XUM8ERTwrOdRaKGMH7ld8tnb+NU88w
         V7aPlnJ8Xv+N94hS+qpTW8YBEVGV01odtTpF4nhHjjZP9ZY0C5xoKY37NMvC4MX67+xx
         0CDTA9XUZ7S3GhStCzTcTt/FiECZqlDjnXeJ7nU35+ozTN+DgtFbphvawboY4dVOJtTD
         swgTsuscfd0F4yfgZas3IkzMTOhVu+z45wSguAPrMThLRV9ayHs/VhExX+ldxUcY7MBj
         A1pQ==
X-Forwarded-Encrypted: i=1; AL+hErGfvwJeNJwkqrNB7oBYxkS5UVhkMNm3EtYI7tUiYYsYr3vYatjdhz8/AQ/ZXfh/xP8HCt3VMkUFNfytZQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8z8LPX0zoIfxZe4QlxLTbTl8CdZ/L3FfALJ5VqhMUFaUnL/tXI
	+PrvC2vyVOm+xq6BA23kayCIlvnzN5iQN8bOcJOlkHJnWqwKiEW19uXn
X-Gm-Gg: AYBFou3jKyqsJ25VWyT5V6tlJAjBQngUYsP1pjXFDP5yWNMxVxSHj3/nRipTujZz5NW
	a55ewDHlGb4b2IYdY51Na1YFzI0MbCVJiyrZYgCsT/Wf6zr3959hYtFb8B/sNL5l0YYXqypX9dF
	A2z7NdlNhrBav28Gro0/+pa1mNB2jmf8iJIW5NfvAXeMxLkC+Pe5jT3cYXuJpnAOMHWvZvyIhOR
	5zu+CS4u3RCXpvxibY0S/oyEdAhtQLPRRWx6xbQCzX8gcrQksOHRItVciDyY4Vmp4jiPaBSZcsv
	pNV1fvaVLDS200Q8GIk+7rStKYQ2+obBfGh7QCxvuhnb4va9TM65QSmtcfYbO+VGKSaAe3ff28a
	n39+jmwPtMSPt/2MtRiYvmEUPy9IA8usCJG3MCFs+fZaRwsS2xlPbobOWhTht5h4a6DPYx9gTeQ
	lIXW0HLDCxc5Lq5qIoaIVnSffxdh797d0T/ue8sTt2pYXcKDSjZgZJp2luNduDJMakt0EVjxBWX
	clwTbI/Wkqe/3qhGGT4WLVJvyVTT5H1BrugDO56EinsFSiNvRRbu+WWQvpmTLIixZcxTuXfD3gO
	xwP3CrphqBj4CQ2XhLoMgIxgjxL7h5hhJ9GfZoHKGiDWOF+/C9K1K8zNotcTUYapVBHp5mHdz0y
	YYPnyeKiED23v+rKJ8B9BCu3LiZJBhmKsZyHbiu3y7Yrr6FZuTojyLUtG8gJE7HGowKhMHmMCPf
	pSbELg9LcfyHMJMmmyZ3IH37bq0InGfB8mR9rrfxHk0b7eBJvBAS7Je6wIOozOy+qr5bE3OEggQ
	A==
X-Received: by 2002:a05:6820:f006:b0:70d:a53e:845 with SMTP id 006d021491bc7-71b394d5f20mr371062eaf.17.1795111386435;
        Thu, 19 Nov 2026 10:03:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
Date: Thu, 19 Nov 2026 11:02:20 -0700
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr2K6dkxboKAr72FctKWFUQqGYqMh3
 N0WNyw1meTnJz/vzUy8GdF4ctrNZDQBPQ59LNl+R3Qr+8YA1rETTrlgjGbgn8rhFKPPEWonQcu
 uU1LfoUNrJnQGAgMl2JFTQVUpLImsx2gsvlbP5frtEXQzekrwtGjRT8P4Xh8JLO3+dcZjkOtCU
 lFkjOb23DiJ3UEPjiRn4BsqK36lcqBgVVnzoiopt9WWuizLB8ex879CAQAA
X-Change-ID: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

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
Changes in v3:
- Leave prepared descriptors with the client during termination so they
  can still be submitted after synchronization, following Frank's review:
  https://lore.kernel.org/r/av8mu_ZFxNKSgFTK@SMW015318/
- Link to v2: https://patch.msgid.link/20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com

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
 drivers/dma/virt-dma.h  | 21 ++++++++++++++-
 2 files changed, 60 insertions(+), 29 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


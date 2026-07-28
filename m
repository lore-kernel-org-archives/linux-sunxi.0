Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4702F39B8
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Jul 2026 02:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206961; cv=none; b=uLXMgkGkfu6JbEC1OjLQ1C0uGJyZAxABdFt9y8EbK8iggim9fZywgR/tAbOwCv2TYw4GffzvxbBujgDaLBp4BBZ9Wfu/XcH9ZuHmox6jmhOCbyPYkDEmK3/SpnQFpVmUMI/LPxoAeQQ1UUDY1MoRQZnn3mBlzKN1k6kPB2zMTbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206961; c=relaxed/simple;
	bh=4s/5NQ0BfIjDLx6nsMQcUo1NGNPJIEOAUaykakbWfHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g0kUwiaVQxy9CBAVml5tbFQ0UFDGa3FEWXwE27gEWzw8hz0rp9avoiRA1QkZZMbandh5QwFuCotNR9Mia2NiNPgOa8HPNzKuribzEeMxXChR+42aP5UrF/xnIkc6WGvO2VZF8aVS9K/971d5NoDXxzfZn0Do870ZG1cv+wJkZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftaQDMmr; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftaQDMmr"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-80bb41f7f3cso32915017b3.2
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 19:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206959; x=1785811759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=quHt3IGaKOPL78wv/QDtYvLCereMlp/accQxjxBXbGU=;
        b=ftaQDMmrDV4lqpiNUkac+Xn0Kh86CyJPQgTtFKDeFCCH9eme7YPHGRzkBCLv0AucTL
         0aTdKXSO45cLZ+t9HSO6nf2vv/0Y5lemi47CHB8SOQMOG9a2ehH/FkI53WhBCiUSc/86
         vCnhdlM6CA3B/mnc2wEtjGiJ9/XkQ2HVHVfiWKqOPNn3HUNLNqhaF1mfZlAiehgAEYOQ
         B5dUc6qCxUO4KKU/VNlBiki3KRb3T6mkfw2PJkbuhJkkLepCiIxycMVfDURmEtZdNGBS
         GSazDxnL3VMgdCXSKLbfvu+OEV2dTRjl3DTh0C0rlvzuwdSpUNnEUou1uU7CeMtIL3Dr
         /WEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206959; x=1785811759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quHt3IGaKOPL78wv/QDtYvLCereMlp/accQxjxBXbGU=;
        b=nxXAauUMQuvvRk3Hc+Pcs3Ua25wyppw5CfUbxiUSQdYvjjAfrt0fi7IyD/atA5Fhep
         +k2EDR/0fLT5/J0O44s/28h/GWMxi+CHkMnz4FWFoEc0RzNbj5lkb1Daf/xoWqW+oDNN
         Rjz4EgTKUEyib/UXo32bKwSfu+9nnOfikxPQb1tHPzl8h8Q7YYRjue01S0tSPe0YJVCW
         Ng/xUIwNkZdQjg825G5UCcizESOHlttH33hMxtrWdyDMlsS8//30C3XTjkhh0j+HffaA
         wQJ2cKqu+QABxRIb3JxowF9EpCNJ+6zIPInZ+mVarP5vN9HBvJYzloS+75hQuMrnYHb0
         uujA==
X-Forwarded-Encrypted: i=1; AHgh+Ro20gt9bEsYJkViK7baXVHFpjIoia72atnlbZobi2qHZGvMVwkUCH6a9+sFKOWIz2DGdomsr6Xp5cvq/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfj3+Be3gcRpbA9EutC8LiT68CbGYbPtZ8jUJVUUj+F3/ZP7Sa
	CEilvseieOdC7M8qZZBXQ8BWeBW5M/2htL8e4t3f9bTMqU13KExR5PbT
X-Gm-Gg: AR+sD11Z935y/lsTK5MNmMzUlCDXt7y8nt0bJnKnhDhG7UXQxLOuLvU/SyWivC3R6gK
	GLxSm1FNJQwEZKD3FiUFi22JyItRiLRvdsDob5t0So74c85fD89b3NSUB9PPA7nTt942ZSvnXCw
	9O1oyUGRuZ9SeN9VLY1sy8y7vJEtf9L0868CNMHrY6JIjcF4JOr3r5Bbra9wsCH84cZf2nUXkoj
	cWx8qXr5QaP3rnUaJxkfO9j42/qsIoLi/7jZ5OC5uSlLlWjXeqhoH3PRNGuIEwBfzZv8BuBJe5f
	4Si2OzSovaAHe5yyoTp543ryfyXAw51bWTZXZoC6gsrbAGGSj7+XpGc3vW1uHeN00kemYwco7ko
	DezgBEeP+3a709LUVSdjgFJy6iH1C4xJ0KwIJTkZD+Xd8Q5qIFL4mHsHZMUAb/6QtKXysu+7fru
	qPCUz6oOKrlRo1IN3U4pCmlbGg7x/ue2RGgZLz
X-Received: by 2002:a05:690c:7244:b0:81e:d009:1956 with SMTP id 00721157ae682-81f991fa998mr2277897b3.12.1785206958757;
        Mon, 27 Jul 2026 19:49:18 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:18 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v4 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Mon, 27 Jul 2026 22:49:12 -0400
Message-ID: <20260728024916.993224-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds support for the CIR receiver on the Allwinner
A523/T527/H728 family (sun55i).

Apologies for the hasty v3 respin.

Tested again on my X96Q Pro+ (H728) TV box with the Google TV remote that
came in the box (using NEC keymap). Was able to press buttons and
get readings from lirc / ir-keytable again.

Changes since v3:
- 1/4: picked up Krzysztof's Acked-by, no other changes
- 2/4: add /omit-if-no-ref/ and rename the PL11 node to
  r-ir-rx-pl-pin (Chen-Yu)
- 2/4: take the PI8 pinmux node from Andre's Avaota patch, named
  ir-rx-pi-pin (Chen-Yu). Added Co-developed-by for Andre, and
  his Reviewed-by is dropped, as the patch gained a hunk and a
  node rename.
- 4/4: drop the moved hunk. Andre stays the author, with a
  bracketed note for the move and my Signed-off-by added
  (Chen-Yu, Andre)

Based on v7.2-rc1.

v3: https://lore.kernel.org/linux-sunxi/20260722233604.3001063-1-utilityemal77@gmail.com/
v2: https://lore.kernel.org/linux-sunxi/20260722201717.2205609-1-utilityemal77@gmail.com/
v1: https://lore.kernel.org/linux-sunxi/20260702214750.3428694-1-utilityemal77@gmail.com/

Andre Przywara (1):
  arm64: dts: allwinner: a523: enable IR on the Avaota A1

Justin Suess (3):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  arm64: dts: allwinner: a523: add IR receiver nodes
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  8 +++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 36 +++++++++++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  6 ++++
 4 files changed, 53 insertions(+), 3 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.54.0


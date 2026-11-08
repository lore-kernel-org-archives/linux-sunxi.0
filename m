Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153494;
	b=nyHWcFaBjvHEtiLszIZjtgzqowRSo26LQFNe38fg7NVKvASKFDTCbY62XCE5UEDQlveV
	 15anxXQM2v7MyIMjjwm+pcgMvQZBm3FG+MfnDXXS+YPFY/8l6vkgJctojrbT35bSk80BH
	 GNL/iKi3TipcmvFjI1sp1Bg87VHskyo+LfHcSrw+N0aj5L5/nu7vSQtnlxgU0u7GG2N1l
	 zvU/Bg3MYrEOgf5W/WTbwFu1//+QyouF8L7eAlEA1ZQWMV5ZV9qbYLqrQABQ5gWDgXqRD
	 Vez+QI7omz9kN5obojpDHOXnQOiwKknz3GxaEJClmCVmecxLjl+R2ESDQCDG/T/+tuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
	b=l+OSp7RoGYa8glOdRJw13JWfouSTTq2wIHR1JEVBTNB1/nxlra1YkFtM76NrefZIAycb
	 w7hA50L/imuCFAWl15X6rJSkENBObNxwjQ5F8siRJhKGhNTSGgokSyKjdBQ9JbSaBq8zH
	 7LsxOtnGeC+L9Q6yWDqtcBl25Cw0Jl7CB3cC9tzDd/fXBRxfPFlWKEc4CT5yZOkKVnKBc
	 XHBgxmrwh97SimrWgjJ+hREsIaaaU6sAgeyM5N+HIOYcHrN+Cuc0yR0bU7buR3MHHAdOK
	 vTgsrmEYTHRvee/qaCIeAwIDYp79tf9eVYQz9d/ax/42QL+nMFfneyCvbl1oRWzwksQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HgQWZNX/";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CA9606A31C
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Nov 2026 15:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44CA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HgQWZNX/
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e4831c028so167530f8f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Nov 2026 07:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153493; x=1794758293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
        b=HgQWZNX/YFLS8qfyGRUhgrjmZq1t40l8JRoy7+6kZJ4PL78ozWAYjw8y3O3wJvlq/V
         ADgl1Os3WUunrZ8O1Y/V4lLOm5VHnD1/SzPTs+5/cR0JK0xAIuq0WbD6hk8j3kEZYbyE
         BrGWAp+L2u14qIL/Zakd7vgVgNEiLad7+aIAkszH7adCuN3WRjBoqqX87ninVUEdAgzX
         +PgAkn14Oz3x7xdjcYgzrt8YcFFEvPjtPwZ0QUeJWHwgl0UrzdgF/qWi/b2cJ6nhL/yh
         6fyVa/6zCHkwyT8p5mFLxoKdYaVwq/Jub03joqCrBsc5EyE6xYC75hw3AXWQ/Po0bGFV
         1klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153493; x=1794758293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
        b=oDyqpeHwSn5XcOVrBX5JRQwkGT5adB3zl3TE3QLk4DvqTgx1gJzQV0OK42iN2i17VB
         dMtCU/mTcFn6RNUEnBYsX9KuT9n1b7RJDTF3m8EX2X48ZrgGvxfOO99aqARmZ8B3enm4
         HZavF5Zt0tjDCNZYA0fp+sdAaAs2qinM07BN11jsjDm4hWr7DiLqwbqFCTafE8MNKs8v
         78WFgmQ5ko8vSbQxtbC0iu6dzifdvmOw783HpVlOP4pbpoSa7wbEQ7qVSAM/aeFwrv7G
         irKz4C4isOLHc0UijKP/nkDsnPJNoJJmTy9pGfk2RPkArWCmiIJeblS2/9MT46QSnwLW
         dOAQ==
X-Forwarded-Encrypted: i=1; AL+hErEILRMtESg//DiIwVhf+IVzaMRqhDg3ByA/i/jt9KAF/O4dZTv2rnvo0xTked8dCh+yZlLlhOw58L8pKA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8K4UfPrYRfymYmx2L9xZkIJ53emYVCN7UshJx5dbcKE9tJPaRV
	V/bt+jYnf7zYELkhHGgijPv6k74pTvsg4KmDJBUFTKMrf8v+tutr5LAB
X-Gm-Gg: AYBFou11a2X5RMKYLg/zkIQ+xYsruyv50TZ3M41VJHeqhSfnzqXu+p83FfLjz1T56gc
	wvj7j5NBySWhO0igZtZXufqxaHGbrWRdj3Pd/c0YGTaorzFl1pWQ9SdQjNqdyzph4UqZfzM4aWq
	IMqQxia5VKAmKt//BfphQiJD8TtEpqfjVyQHenEFI3T54UBEibxUyaDGZ7sBAIymRiUBhzN5bhG
	3z6VAGEPkoh4KyuK6Nbt4U9KDpU4TwAfdlzH3m3CMUf8+zRmbABmaQKNe1fWGp9VDRzekDU47x/
	7MGZ8oa+OQLVbrW3J5yUGBlWPxad19l85KHI1rKIbJpiKy4tpCfE7vDKjCDYsGLohXb6bxCFbNj
	1hU0emTHhd5PpURU+3ltwn0JLgTFMRgn23ceu5/WOYSDIpWgLaM4IX9w9ofSk1DDiOzt7YaSW9m
	jcRdVTydUxJXLw6rD7we8U16Ntqt8FqCDeglVMZyWCB+qze0clESvOqI3/iZKsqXQtXf7sqTJWK
	fqvsji4YUJ1+/tsQosNcKx6ZoWNpZ1PXUOD5ReIy8DnUAMdlqrko+pL0uYJcDBm/6E7l1zRWPDA
	CqO5iMUN7D7qb2Y5JKutcRsrfy7zR1qdMTq9MuI+n7MNFJtcukyYel8EDF/ytzBUGQNYHwhtRMN
	EV3EGFckb+g==
X-Received: by 2002:a05:6000:2303:b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4958530ca7amr4049074f8f.39.1794153492539;
        Sun, 08 Nov 2026 07:58:12 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f316esm4753282f8f.17.2026.11.08.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:58:12 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] clk: sunxi-ng: describe CCUs as tables, add the Allwinner B288
Date: Sun,  8 Nov 2026 15:56:58 +0000
Message-ID: <20261108155702.361022-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sunxi-ng drivers describe each clock as a static structure, list it
twice (ccu_clks and hw_clks) and keep a separate reset table. This adds
a table front end: a SoC lists its clocks once, indexed by their binding
clock ID, and the core builds the usual ccu_* clocks from that table.
Bus resets come from the gate entries, and clocks that a SoC generation
shares come from templates. Existing drivers and bindings are not
affected.

The first user is the B288. Its driver is 212 lines here, against 749
in the current style.

This replaces patches 01 and 02 of the B288 series v4:
https://lore.kernel.org/r/20261012100816.331033-1-pmazzini@gmail.com

Pablo Mazzini (3):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add a table front end
  clk: sunxi-ng: add Allwinner B288 CCU driver

 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 212 ++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  11 +
 drivers/clk/sunxi-ng/ccu_table.c              | 510 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_table.h              | 233 ++++++++
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 +++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 9 files changed, 1101 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_table.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_table.h
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0


Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C36012DDB2
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 14:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713362419; cv=none; b=GRHT25X+GnMpuAGO3kVSPkq/6RJfh5Fl+8GO1H40E1xq+sr8XzdxPnf5iWjvtb7c1d4tpTLCL2W3VeLuX81+AuYa8fnuySegtHwmvn0qSq2xJ2lophRfzb9lwWMax+ML1PSGzYQO2aaO2WJHyX9h3hgI0U30wIuot6Ba6vVDeAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713362419; c=relaxed/simple;
	bh=poycfEjd07nE687ukSESANnrC+zUdZahfmNMKFeb8Dg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAaKWr39orECuqpuweq7JCCEOq1Vuo5o21woKH/w8PHb8DpCVfmVUySRXfKnpSvIwf4ES6OtXxagOBRYuguo1m55wgYrvdqGbPGM7x07d8HUmQXUoUfV1XMjIl8+u2FIPsGPOA3RQVvjdhUGvecRay8F4USFPfy6bLWnii4QcjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=If5lmaP6; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="If5lmaP6"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5194cebd6caso736941e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 07:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713362415; x=1713967215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X8h9sytoh0eNCRrXIWGk2wWof0lykgyqJVSMJYB9Jf0=;
        b=If5lmaP6jRg1vGMrZkLeKwrdN4vPygWYulFi+MVc9164y0qfFYTbt9Wll3jvk9Ty7Y
         E/dxU/LQ745P4s8wCzF2QrExfJBuIpIrTqsZjV/kPHSQD74to/gZrHf2sd0CzPnubGo5
         +nlPFu+8H+4y+I64lkn7jzZ0wDmxTPoXJwu4d6PVrOdSVIkQXRnlBJwLv4R1g+zgfZDl
         Hyhj7bih6SS6pq9cy4Qwjg5sZ39JDb6bUHl6nh03dYDO4mxSCd3pNO0dOczyYY++qOSN
         RkUAvD+8dFs4iG10MFPV+Y5pqMljl8w0ztZrMcFXaaTprRmKJkoJD+JcmTqjRfR63DEC
         Gntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713362416; x=1713967216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8h9sytoh0eNCRrXIWGk2wWof0lykgyqJVSMJYB9Jf0=;
        b=iA4z9ZFG/SNOC721dqOqvQhwK4Bl4MPrrGTOczS9RPMl7RtzMukJ//VJsak2IOoBK2
         VkweeFhr4pRw/COOmV8x0Ce8ZJbaNRFeVZd0lc2QAIYM2O6bnE1q3+JL4PdqrzaPD7xM
         lX00hBfc9Ba5loaZJr0y6oymSyEiKeJ3ugOxB5b2wVfYgVcoal8ka25crwUNI0yT4wxL
         SwKmQSh24Jw/o+Jn0cUsvfTUcazapHJtJUJnBnpKGjHtqIL5Z/2Cn9B0qTsfW2eBXahz
         HsYN6GSo8pxBn9dF507JwHs6pR6fRbyMbyW919vxOQgzA3Cs3n8wgIMz70IY6hFuj5Ub
         nweA==
X-Forwarded-Encrypted: i=1; AJvYcCXSKHkyM5BjbtYX34n+U3wcmFfW13ji5nW+goMJtDHJZxHWH9QA0n+XUPeuKVSMIdUhevZJn69CN3zQwwjh+Mso1rxRNuwi+ArFI6E=
X-Gm-Message-State: AOJu0YxXvQcQLIAcgsk74xQBFRWC1N7LJUE8GADvyxxwR1VB6cQUiMdv
	BSGtc9ARNwpwY5xH/Chcw+lyevoj2DFsM7g0dyY0uLrhtHdgC2k2
X-Google-Smtp-Source: AGHT+IHYR8jJSuOJPPMs2fzwb2lRhApbksKgiORcX73kn7lgMCayLUhPAG0NkusHwU1eUl3geU6gaA==
X-Received: by 2002:a05:6512:1103:b0:519:3a8d:2ecb with SMTP id l3-20020a056512110300b005193a8d2ecbmr2701316lfg.5.1713362415457;
        Wed, 17 Apr 2024 07:00:15 -0700 (PDT)
Received: from localhost ([94.125.187.42])
        by smtp.gmail.com with ESMTPSA id g10-20020ac24d8a000000b005159fa03501sm1963673lfe.302.2024.04.17.07.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 07:00:15 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Yanteng Si <siyanteng@loongson.cn>,
	Romain Gantois <romain.gantois@bootlin.com>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: stmmac: Fix MAC-capabilities procedure
Date: Wed, 17 Apr 2024 17:00:06 +0300
Message-ID: <20240417140013.12575-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series got born as a result of the discussions around the recent
Yanteng' series adding the Loongson LS7A1000, LS2K1000, LS7A2000, LS2K2000
MACs support:
Link: https://lore.kernel.org/netdev/fu3f6uoakylnb6eijllakeu5i4okcyqq7sfafhp5efaocbsrwe@w74xe7gb6x7p

In particular the Yanteng' patchset needed to implement the Loongson
MAC-specific constraints applied to the link speed and link duplex mode.
As a result of the discussion with Russel the next preliminary patch was
born:
Link: https://lore.kernel.org/netdev/df31e8bcf74b3b4ddb7ddf5a1c371390f16a2ad5.1712917541.git.siyanteng@loongson.cn

The patch above was a temporal solution utilized by Yanteng for further
developments and to move on with the on-going review. This patchset is a
refactored version of that single patch with formatting required for the
fixes patches.

The main part of the series has already been merged in on v1 stage. The
leftover is the cleanup patches which rename
stmmac_ops::phylink_get_caps() callback to stmmac_ops::update_caps() and
move the MAC-capabilities init/re-init to the phylink MAC-capabilities
getter.

Link: https://lore.kernel.org/netdev/20240412180340.7965-1-fancer.lancer@gmail.com/
Changelog v2:
- Add a new patch (Romain):
  [PATCH net-next v2 1/2] net: stmmac: Rename phylink_get_caps() callback to update_caps()
- Resubmit the leftover patches to net-next tree (Paolo).

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Simon Horman <horms@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

Serge Semin (2):
  net: stmmac: Rename phylink_get_caps() callback to update_caps()
  net: stmmac: Move MAC caps init to phylink MAC caps getter

 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  8 ++---
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  8 ++---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 36 +++++++++----------
 3 files changed, 25 insertions(+), 27 deletions(-)

-- 
2.43.0


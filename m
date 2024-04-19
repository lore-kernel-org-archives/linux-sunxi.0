Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED5E651B6
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 09:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713517448; cv=none; b=XALbm/u4O473Dgb+y/u+RdbT1i6fnHLr4YdZL/EbOpChw+OyJ52Qfa85ywAwxI+fsH5VZb29W1GONLFaZie18zvV+YLcsphqpRCyrWBpHcM1wLq1G1OI41R0Kest74Ehl8PhcArEEHgon0qkOEaGpo05C/JLz18i2x5TI7UI4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713517448; c=relaxed/simple;
	bh=nyEbjzkCc7+KWWvrhINgBitJsBsfmKTLRX81KrOL4UY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RukL6C28wHp8wBLayz6g55k1okdoTKdwHykPh+qbn9Q09yvLMkURcEjuNsL4r9i57Y8zFC9A4G5UupX3o5KT8E0W52zcQWr1Hb3YTeTd4dQk/nmrY3RhCuZ4kFSYwEBN48EG7BMsF8ZfNtTo6jNqNPgHisBzIV6vDtZtRqrYvx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRal/ACB; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRal/ACB"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d895138ce6so26180891fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713517445; x=1714122245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZYagrKgL3oRgietAYozGj1whRQiP+RdxmQVuv0PkQ4=;
        b=aRal/ACB8bcnzSKCBSkjNmeF1T5creDyHoeaP9IVxk8C/obU+6rPOZ86qIoJ5rzLmy
         XxNysE136/uShilYQ05nfaa16l5ckwndLZXyyV9gcpshK9LxiATWUqRVPhaL4CUMHEub
         xC2OKxlKjXhRy56o7mlsj5HFIZAmE39n30Gj52QOahK6Qk+aINQPHQ6V9uJPrmkevQ83
         y/Za9Vp9fJUnoVxN5rS99f3dBnYBjOyRmvll4th7zSZx8GSI2v8wsRZhanfrUQgzNG7Q
         zYg2fWj2v2XyoeEICv8h0LF4PFe2uQ84euMg8TYc/e/e88k4WAOSyDQHaWPngolRj90P
         ziAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713517445; x=1714122245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZYagrKgL3oRgietAYozGj1whRQiP+RdxmQVuv0PkQ4=;
        b=lFV7lsM71B7P1e2OwfQ8TP5POBd8NrJUfkWRBDbRxpdvftZtCCk/yaoGe3tanes4SX
         r13vHsgw/8JOAp8r6UmYz4GX6lxfyomSYtLzalo2DdrzZ36kYgD04pFEwWgUs9NYl/dn
         KeTFCm4Jsw+cRRF9Gmz1xWuy1ZR603aVehfRTks6dbd9qNHKFWaam1QKY/cIXDBRTWsg
         UdMy0AVMX4zJcK6qlwrTaDn2/UMU2HcVjC0u7VlqcE5QeMXuT+fpxbvcmTbSJVePPLnK
         PaiiNAHiim7K+p84PzsPRttLwoZ5yOtV87CAYa8DZMAsD4yxyKcWwDTE80gPGDq+FfH3
         3Thw==
X-Forwarded-Encrypted: i=1; AJvYcCX73drL+uypDnSAi2+T5T5eQT7ra8+9VzhWZbJ/4g0XyZX8kcm5Uhh6Xup1t3DHzk7rsf+Q0mQ1SeYe8y0F8Ny/6SFdfwZ5dFSoQUo=
X-Gm-Message-State: AOJu0YzPo+NDC55nbeEOvbQcr3ydl5xBa8OBmGb52BkNixt/kYln3ihD
	Zdpvn+bIv8BxPIegfK9WjNPzCbyMZthvFv0wdKxM3S30xh6yZG4W
X-Google-Smtp-Source: AGHT+IGg1RrYLe0BtHyA885HiTeG8lWReO6DWGy/i3pNp212dINrX0hNxqF4nt96xYKpLfOiYPULBQ==
X-Received: by 2002:a2e:b90d:0:b0:2d8:a921:dfbf with SMTP id b13-20020a2eb90d000000b002d8a921dfbfmr863882ljb.19.1713517444592;
        Fri, 19 Apr 2024 02:04:04 -0700 (PDT)
Received: from localhost (srv1.baikalchip.ru. [87.245.175.227])
        by smtp.gmail.com with ESMTPSA id b10-20020a05651c032a00b002dcafaa0993sm355004ljp.14.2024.04.19.02.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:04:04 -0700 (PDT)
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
Subject: [PATCH RESEND net-next v3 0/2] net: stmmac: Fix MAC-capabilities procedure
Date: Fri, 19 Apr 2024 12:03:04 +0300
Message-ID: <20240419090357.5547-1-fancer.lancer@gmail.com>
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

Link: https://lore.kernel.org/netdev/20240417140013.12575-1-fancer.lancer@gmail.com/
Changelog v3:
- Just resubmit (Jakub).

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


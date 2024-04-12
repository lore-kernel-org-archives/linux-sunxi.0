Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99834148313
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 18:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712945045; cv=none; b=FiV8pkqXcCGpB9ILxDv2oGjuYTEmnp+M1NLTibxS+6pMdB6uqAumqrn/CzzG3ySaAAWE/rAC8EKrkQau9TDF2zNNnS15P82fzqM7CXiAhzBq6IBB2N4HSnyFi7obb61kK2bgqeC9laOVL62agWl//6lwKheiBu5g9RSv4BF7EBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712945045; c=relaxed/simple;
	bh=pL8DEPrlq502m1lqM9mSVBGYPc5Ax5zq2wRmPF1el9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mvZownwZqhohE8TIfYUhrD53RFKyOot5CSdz55vS5Q8QV3dBjgZA/ZlqBmtX62PauEUo4EvzUPddXseyhWLlR9dwj7Yag3gZz2qSi10r0Vhuua2jzNw+zsSrwDQHe2biG3quSle1Ll2QaEGGhGtrC6bZzZJKycwJ0rfY2+BoPa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5pcNZtH; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5pcNZtH"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516a01c8490so1614032e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 11:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712945042; x=1713549842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CocCrXTkILxb+H292FlYFL20d7nBS8XixYwTUqYokkU=;
        b=X5pcNZtHYRjQeqB2EJnwiJ7TNuDUEz8GjDfOYeTr1+Dc+4gQ7WTUT0L4YMyae2gLI6
         nHE1QmCpADr7K8RTfx9l+bwnxzLkMepVCvpOsk1wrENk+SALKKANoeVXl3tt18rkLPkI
         F4/y+9Vy8IgCCu16cHTkNepluMRXlCy19+OpcP3tUh/UT3gEJccgfhBbecO99oq1NDUW
         97mUi1AL6IS19ON2rvjT739LBFvswoiXadlra46t6em/hANlbL9dVbhB696utsE5Kr73
         coRkXRsHMuUETG+Ecjv34xIhv0cjw15FiAM2loPb0e+17xslHRWn6mR7RjZlUmPk3FcN
         VVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712945042; x=1713549842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CocCrXTkILxb+H292FlYFL20d7nBS8XixYwTUqYokkU=;
        b=HeM1+DAna/zZ9nYcdnb3vr44N6gEvQRLFdFNNGGrmxqoqthw4pK3hl42uA3Q1L5ph4
         8WJ2TcdWSavaLqN0P8p/jnPw56itA7DYdYkMCmHpJaRG1oZvPCwJlhsbaWjl/l3Eh8HX
         ZQGaFFlFFiQL+kklg0zPEAAgtLRRQOzI3PLMmekh2o/ksC0ucTH5LOTn1ZJmo9qYUBXN
         vTAU4AQkaAxT2O5nfebA6qb+uIXl6C9rpPVlMkVkNh0dtFdcPVzwxq93yB/EZmSiyQne
         66ELqeiLORxvHEXFqs0IkY78nYVOzKMZWHUx34ZjLETKCmzde9ikTijlUtunwSmzczuH
         XpmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxo6EcGQM3nUxW05JKttnINV07ZSgJQFwTK1QXO31XhYIJgd4Y2fyWkOzHnacacY0lHreBW142TNF03YR4Jr2oq+fnSqDLqp2GMI4=
X-Gm-Message-State: AOJu0YxYz5qSp2XEzpwpaqkpveaRM03jI8uY3AUCGJL7a6Li70MiIL3/
	5CxwPDZqCsUsLrDClZh6Gg1RVTX1T6WWbAP1PVK0Esu/ZJv92/a6
X-Google-Smtp-Source: AGHT+IE+YdnghDsV0obcJRUikyE+vRG7Z625VF2VfIjNL7bgReRC31FSjtwU16I1XuF0ATXWLD1vaw==
X-Received: by 2002:ac2:52a9:0:b0:515:c0cb:3ca2 with SMTP id r9-20020ac252a9000000b00515c0cb3ca2mr1979670lfm.16.1712945041542;
        Fri, 12 Apr 2024 11:04:01 -0700 (PDT)
Received: from localhost ([95.79.241.172])
        by smtp.gmail.com with ESMTPSA id s23-20020a197717000000b00516a25e9ce1sm576691lfc.294.2024.04.12.11.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:04:01 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Yanteng Si <siyanteng@loongson.cn>
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
Subject: [PATCH net 0/4] net: stmmac: Fix MAC-capabilities procedure
Date: Fri, 12 Apr 2024 21:03:13 +0300
Message-ID: <20240412180340.7965-1-fancer.lancer@gmail.com>
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

In particular the series starts with fixing the half-duplex-less
constraint currently applied for all IP-cores. In fact it's specific for
the DW QoS Eth only (DW GMAC v4.x/v5.x).

The next patch fixes the MAC-capabilities setting up during the active
Tx/Rx queues re-initialization procedure. Particularly the procedure
missed the max-speed limit thus possibly activating speeds prohibited on
the respective platforms.

Third patch fixes the incorrect MAC-capabilities initialization for DW
MAC100, DW XGMAC and DW XLGMAC devices by moving the correct
initialization to the IP-core specific setup() methods.

Final patch is just a cleanup moving the MAC-capabilities init/re-init to
the phylink MAC-capabilities getter.

That's it for now. Thanks for review and testing in advance.

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

Serge Semin (4):
  net: stmmac: Apply half-duplex-less constraint for DW QoS Eth only
  net: stmmac: Fix max-speed being ignored on queue re-init
  net: stmmac: Fix IP-cores specific MAC capabilities
  net: stmmac: Move MAC caps init to phylink MAC caps getter

 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  2 +
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  2 +
 .../ethernet/stmicro/stmmac/dwmac100_core.c   |  2 +
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  7 ++-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 18 ++++----
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 43 ++++++++-----------
 7 files changed, 38 insertions(+), 37 deletions(-)

-- 
2.43.0


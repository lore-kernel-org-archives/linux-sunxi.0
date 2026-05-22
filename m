Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230BB3BF667
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443759; cv=none; b=ocXoF3Sfh1/e0z2OF+dUaJ5wMVXtw83bSQk8en+cdc0zPQPSZTMBT2aajt1q5u3QWHHcgxFIiByboTL85Kjok5e6AJ9jGT8QSuHzJYZuG2zGyqPXxcCpVPdIUzSgHdn3oGed/i+rMOQ337PVlzZH/aLOJtyJm2a/8xG0SlspR1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443759; c=relaxed/simple;
	bh=xUYDqpMUSiYjYknvlUc2DtVTu2MReCm/9zoyeeggXbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qznam0iST0A0KcsFSx4AvTHpUITRclCEgjUql8L3wQipttuR/JCYF+auyB6tmGd/vizQKS9S8l4hg5EI3TM+0/FPjjnF5qb79mXVOUxoqkAdbiuJpqPTkie+ZSAWO60brBIxjl/SMS6DTOGIclGTC3gWaSHvgxVt5Gj8+sJzYKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDl7y5GV; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDl7y5GV"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8367df48711so3094324b3a.1
        for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 02:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443757; x=1780048557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdspRS+hKmJQmW0Wsieo4FX+5eK/WlAigCd6WtBtyGk=;
        b=PDl7y5GVdpPUtx6HMC2Tcp6/20NowYZLNnjcOkmyhzkkRTq0hwq27gP1EKevmmWTT7
         IxLJQc7Ak0oumqoCLJwRLFRSATfkUp/sBgUElKiQ87xBffAsiV6cJn+yeqN76MMAs2xW
         oSnI4fyQfwzEnGVH0W5TSZq+ZaVxKmTkiAYLl5S242sltCZ5VJnqS0yWwJ1/Z3CFX+Ce
         R0A4R9S1che67ADSchDIsaJgYL34LgUdSFcBOR7Z8EPzoVhHuZ8z/bh574eW2U5v3ABQ
         QBEE/swv8Hy62ComFXLnKLBf27UHUcwE0qOdTK4BImjCGAAOHcho5F16tfmTsbEPIySb
         f/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443757; x=1780048557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdspRS+hKmJQmW0Wsieo4FX+5eK/WlAigCd6WtBtyGk=;
        b=fuEApHjbf2PiMvA140o3X4kfd9QUhjYHnEqRVFmqAnV5u1SBd/FQWkyOcWBkW3qdWM
         hv1gHo1RTb0SkoCUDGjbmePkfh2VzGJcEnRCgGhIrGfB3y/nDUkdu2LxTdbSYnPB2uQh
         UBGp4hAbih/hYX8FiTvZepnyTAZd0+Ryi08KcWGm516zT6b3j6pY2UZr4kTEXg2MWtQu
         Q/+lb/jhLjOP/hqH0//A+KAn/9zGV9C0hRzjJy+AMthcodwGsdavJ0zg+sCPBsB1Bw9j
         BCLE/d/3kTpaINGFEEzF8JAuBKOlWep+Vm4b5/ykAoS4Bo3Eo4nPgIBuI5yv8HzYBEch
         Zi2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/9qEgeX7r4K/A91DOIFV+CN8pUgh7i4/AA/aXkfh2P0PV7lWfA2jz5Qrx4ru1ljxOnLLOmF8tMNVVCcA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt77jCYVMFAoBUPrcekFByLTRv01QmKoULE98Pe15H9EP/icS6
	zwgjNMzMi4mPpkEZ6ro6FErvMFOTfVRit6HsJ7VAN3WeDQrRbZhCIo3o
X-Gm-Gg: Acq92OF9+X8LgzpJZ1nelQRjjHhaey0QEnnNhEA7Sa5H0y7PPyKtXao+7zsvNZ9sLZE
	xZck/v2xXuDsO7TJ2ghdP1LQLDCVXGOBBLJ327CMRYbbpZ/SxWBMoytE8jupKpn/dbHfAq7jH0v
	IYQkDcFGrj2yvsz0213JU1jBX+qL6mlXpcrrKgcFGGviMA689UxJ7gEGKhgAXUqhybSq6l8zN7Y
	a9YQmFyQ4I4LZk6eGb/HQbHnhXjwnAQUzJ1b9p/Asrpq+vbynh8Mmp8k8BJCs5du2bEIf2j+zpY
	me09xFj6nW2P3vZgLdR0c6DHA+wf5clrb9pKmmjFJS5B/sIsRlzJECO7GeSsANu9KfKeb37iMG6
	tmIGHSFQIaCsJ1T8NpGOQcB7IskexicQ/0RxBj75hUJlrnDBqVGLfOp1WfOHe7E7dhHkAjImfIW
	A7dF+JwxtCsToFhuT9tA3j6Xie3uiZelgqA1SfajtVXTMH8Bmy1q/Wb+OUWLNm031dq5H9
X-Received: by 2002:a05:6a00:3020:b0:837:e9cc:d470 with SMTP id d2e1a72fcca58-8415f330e98mr3144147b3a.20.1779443757359;
        Fri, 22 May 2026 02:55:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fe0bb8sm1338786b3a.51.2026.05.22.02.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:55:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: codekipper@gmail.com,
	jernej.skrabec@gmail.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	nichen@iscas.ac.cn,
	perex@perex.cz,
	samuel@sholland.org,
	tiwai@suse.com,
	wens@kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence
Date: Fri, 22 May 2026 16:55:39 +0700
Message-ID: <20260522095539.73025-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the bus clock before the DMIC module clock during
runtime resume.
The bus clock provides the register access interface and
should be enabled before the module clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun50i-dmic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index eddfebe16616..7aff1afdf265 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -323,16 +323,16 @@ static int sun50i_dmic_runtime_suspend(struct device *dev)
 
 static int sun50i_dmic_runtime_resume(struct device *dev)
 {
-	struct sun50i_dmic_dev *host  = dev_get_drvdata(dev);
+	struct sun50i_dmic_dev *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(host->dmic_clk);
+	ret = clk_prepare_enable(host->bus_clk);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(host->bus_clk);
+	ret = clk_prepare_enable(host->dmic_clk);
 	if (ret) {
-		clk_disable_unprepare(host->dmic_clk);
+		clk_disable_unprepare(host->bus_clk);
 		return ret;
 	}
 
-- 
2.43.0


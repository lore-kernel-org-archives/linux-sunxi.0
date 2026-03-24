Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303413A16B0
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 18:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376843; cv=none; b=MQxIaWpFbEPs+UebabCyg7b61qIBImFxKSMlIxeXuoHOzZZ3S+oz61Hb80XDKFubbpFW3y2TbZufYAf9EjxgLLB1pd3s/wRoL1lXbbcEm9oyEFC1nySZBjsyBC0RqEifNJOVmaG/L4sPnLwX37iTFsVC9AV/dvtoLdfqZh2SDas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376843; c=relaxed/simple;
	bh=WceX/6ppqZ5DUDCGfEWL1pZY9tLdtFM/DeuPHESZPQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J3R47qlohky9aCmNtHEEm6QOH4nqe56v/KFRHiqroNXXHtrnhuFLkjBJBGOtrEfpyU1gRES01U69c6P4G6K82Cv8tfS+LEE73M4PMKozbgSBcRPCBZokMJTC0vzbNDoDICt3ELtVCOO3M3+GXmpP7k1NblvEarsM3ZF4a+OAgmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqShDOqR; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqShDOqR"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so67967a91.1
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 11:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376841; x=1774981641; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JU53ztXeIg9rAt/w2RhxQEA1HrNV+jGEvjmkGqWYdZA=;
        b=NqShDOqRvtrlvsWd3H2TIAdcm5nt8weh9rXl1S8D1RXRJtfQNPjD7ziuNUB8xFxjCz
         mX/XGWhUFmvko4k2AAAVzllTwbFMAsnoy++yBevFFXahyzolQLlEsNvFS5fnjIOf9qJk
         S6R1r0TUScXNvaMOpFf3ohG7OLTGOfxs4DwTRqYt0vaWhncYabikkyUpNOfT7Hk7NWOJ
         Kke/tKQmsrKRKUOWZXTsOoSmTbvTJxQIKaRAVLJNGB4TKmRT/1iECYGX5bqYTzBHa7x/
         RwFMBwOnT1BntPd137N8tgGlwLNuy+HlhHp1FAdoL6+mQZGvZPjosM5S5YXDm43nfjq2
         yPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376841; x=1774981641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JU53ztXeIg9rAt/w2RhxQEA1HrNV+jGEvjmkGqWYdZA=;
        b=KuSgwYAPQ0875ztoYXPy96yW1bKTZciCklmb4Yo5LQUQVlPAo6idrmGo0JKDHa02Wf
         51DdU9q6pACnIMylHKP2KxRR2ExUmNm1l/bTC1bzxq8kUejXqlbSLrTrWuW0rZzpPdM4
         Zb2JmxspI5cvRFkLIyDmDPk+td4lo7oFwuETrHP63Rw9gd52SjwM3FsjoT3LIEEl3zKe
         dcbIkhnH0lQNYvj0yTCtjsTxH1W/n00M3NvnaJw/8rTN5n/cFnnq7ASptBqThX1Lc1C5
         FNWpsLXl723It07ngFFMEi9Eq3I5MqhPsbcKCU4gaZMhrjavDfu+QWISRQeTDaMWvEX2
         j9gw==
X-Forwarded-Encrypted: i=1; AJvYcCXVJb3lDNATK071ogRyfwVHIxjllHqnPKdi/mj+WJMHZyLqxYttIf5+RM8r9IHT8RDwW0/1hlVkxSNTzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyaQFR1Ut5j0bbc5c8uIgn1p7U3kJia9gOO18pc3tS0aT7D5hR
	s8BfRLG3r1YKRu7Tf2piZqlnr5AO65xxTrgvH/bONXDX4lQFWWdVdgNU
X-Gm-Gg: ATEYQzwLpShHu277J52nVFHTP04FMMThCfyQb3bqkHUQW9WxNmcUV62zoUeINg+DaaC
	IDZaXqnatJ8jm4xgyaZ9RFDZCEn7eBdy4gQ4FirCFSU2goR26U0I4SY4VPi0QELJpvJ2VUkIe5s
	t/t+4f+A1UYi7i7Xxvr3Ouv4AF+XT0+MJh1b4nD+j5D9vdCIrgQCwUno1YQSYaxoxbgSmbAz/HD
	6l9ssB25in5otHNNlNVww1nmD+GB4kdj3/hTa7d+7TLLKnzctNS5hBGsDorfABBN53ZwyFw6lOO
	8i0Z4WTMkbO5v6RWU2ce0z6Q7kyHkNJIQPgLy5thP2TH4rzZyAWIVFYYKq260pTNKyqQUwp3z89
	MfBsG+W6P0FE5zajiE4nvqxm1uAmL8gTQvZojtH67htEEXJiPU/8Dk6FmYNAwbpxiVG3o7Ork2Z
	qiCoTKy1+9GOF9b/aeGu7g/lVpLg==
X-Received: by 2002:a17:90b:57e3:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-35c0d1451d7mr559615a91.8.1774376841343;
        Tue, 24 Mar 2026 11:27:21 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:27:20 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:49 +0530
Subject: [PATCH 01/10] i2c: tiny-usb: Replace dev_err() with
 dev_err_probe() in probe function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-1-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Enrico Zanda <e.zanda1@gmail.com>, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=922;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=/rm2EO54Io9Vb7rL8ZSyeOBixCamQEqxJe9F/gCdBcU=;
 b=ndfdbjfGLfy7wqu+RVI89cU1BdFSOOxdC43vbHuPhEqbITAhbeTXofEpCDO4hCGofdSsBz5rg
 /eaMZdocnKzBw4U70BqYrFGGqU2cbJzMF6jNMLwPSl+hIPTFUD50Y/N
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-tiny-usb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 9ef495f88ef2..0637c71126f9 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -260,9 +260,8 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
 		 dev->usb_dev->bus->busnum, dev->usb_dev->devnum);
 
 	if (usb_write(&dev->adapter, CMD_SET_DELAY, delay, 0, NULL, 0) != 0) {
-		dev_err(&dev->adapter.dev,
-			"failure setting delay to %dus\n", delay);
-		retval = -EIO;
+		retval = dev_err_probe(&dev->adapter.dev, -EIO,
+				       "failure setting delay to %dus\n", delay);
 		goto error;
 	}
 

-- 
2.43.0


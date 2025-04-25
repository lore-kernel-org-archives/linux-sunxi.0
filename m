Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6940A24C067
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585151; cv=none; b=JNNRacuRfYOOsb6KIMp6VaLdPpbYK/USe3xJrHDuWPT6SL8fCUX+sgqyiU2n1cx/ik+RvSzClp0GEBQ+r2Cy+mO8kY6OnW6138sgctOFZf+HHPlN6ZdNyKsj2wS3yHN4IU0xwdnxFIGfi3L9P9q9j8vhZg3YVly2lr3v4cigUmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585151; c=relaxed/simple;
	bh=3iija+D+wAivPTxPgQkDWS76dXwwDw+JDuIms6/61uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imNlsI1thN4p+UVr6AM6GP1RiGFESY1ajMRX57R1ujSMZcTfI4BCgN7Bjk+VgaKQTkat0D7O44AhjOJyOk5XG2qd4gW5L54x9wE7BcBUlUj90vISu5rfj6eW95GjZnrB5rmu4F5EIqVP/LCw5YIfvayShmzpRPBUt3RwtFMRArg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgeE09Ch; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgeE09Ch"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaecf50578eso337732966b.2
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585148; x=1746189948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5+vsDywURKto5J2uSvLDBbpGVTjH81pRFa24AxG5QI=;
        b=JgeE09Chi7rKu3Hl+qbOv+iearYSGTzGknM0gJzN7709d0lGKtEG0iDg/PQBeoxOeN
         tmkUIlRRLIJcQf9J5R3TlmretDly3tdRp+9KcWoW4/D73W8GiPo5imWvIEWiADCn+HuM
         t8XBYAKzEXCrs8thlsH0pGJ5k4ptRwxrtpPFMDDxvvnV9kK6tnlGxY56MmFv59nrFor+
         LW72ZaeVRYCPm2JMEHTGJ97Ip8e1b0/aSad2bgTMrVcB0ZasPZ8ObYBruOvpi9AFjif1
         SKttlLVVsS75wjJpV5LuSLJRWegG4/+4QVOF1lQZDfNxsbyTLZbPnXaUlyhYmYfLTP8m
         507Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585148; x=1746189948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5+vsDywURKto5J2uSvLDBbpGVTjH81pRFa24AxG5QI=;
        b=A4dgQkc5p96HbH5jZ7X5o/PEL8nlmDmox6iTlRD/9gw7HBO8N0Qu24QnmKvDhxBGUq
         Myz4UGzHZKoeYnBHVSR0P81PPEKRq6TqMWCepJuUr12BLi0XoJmLqRozSWk+Ycymz3xy
         nXMwng1/WF/DA/2HYedb/ic+yvx7ZaEiWzKkAtIGXmTSflfHGhkdCAx9Efwk+GsI0laO
         foI+1g29gUBvfMKd8rO+g1gXV6crz8uKiY7ooNDiolOAsy1z+uiqx414zakI2p8tD9a2
         WAgXy3Ny9UdXrbwpu0rvmqFtZZY/lLCvjxA/Xug/5zagdjRK6AJmVURA0QEZ7xJgMC2F
         RMGA==
X-Forwarded-Encrypted: i=1; AJvYcCVrrSmABn7zcCFnYN/ZskVMz6/3ooWufigh2kUSqYo1xMf9GVpzg3AyM8Zr0tvpdIRcK2SqaNPVFrH2qQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsJn8hiZsOwUnTJTiP0lXxTT7bwVQWE1hx3rRVP8YbCg2zM82l
	k48Hjgg/FQsahr4XQ5+JXsnie7gszgNQUjUQjpdJ1eQyM9rNBaRl
X-Gm-Gg: ASbGnctQG6Ecr3scgmptmLN3p2hb3As0hoN5vPyCsXvkEHyoxUROHC2NXhnLtYuJZZx
	nXaCBPwMO0a/qtLDbFJK63eL/KBmpk/lnAQSWVjINrjWv4Yan1uWs6DnfDZwbNs6MoihGwgLHYb
	46N635juXh+nsSdUtarLqpIzC/xUv5X61HgBeXzeLVB1uKk57gcKchMqB+iVMGJl8IXxjMnsfye
	olAmypA4edl0spIfyZtOC4XpPp3YXZ6iDt9S8AnBc7QoqtpWBFfDJ3e59C645HfhfSLasgLTayG
	k6JWWXsKOcKzcQNrwGTV3aGEhXebCSbkE4gj2LB2Mkrq1Ir3+Z1clPBHImlx1rkbns6e
X-Google-Smtp-Source: AGHT+IHslZla2YsavTI3FKWyUmmzSPKtVbN76hsEb/Nq6bQTRCWaVxHsrrr0xKG5Y0qcVDJqED8AMg==
X-Received: by 2002:a17:907:9485:b0:aca:c507:a4e8 with SMTP id a640c23a62f3a-ace71095212mr185275866b.21.1745585147374;
        Fri, 25 Apr 2025 05:45:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7094sm134641766b.56.2025.04.25.05.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:45:47 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 2/4] crypto: sun8i-ce-cipher - use crypto_skcipher_driver_name()
Date: Fri, 25 Apr 2025 15:45:15 +0300
Message-ID: <20250425124517.2225963-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use crypto_skcipher_driver_name() helper from <crypto/skcipher.h>, instead
of accessing struct crypto_alg directly.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 05f67661553c..f03a8fa7bfa2 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
 #include <crypto/scatterwalk.h>
+#include <crypto/skcipher.h>
 #include <crypto/internal/des.h>
 #include <crypto/internal/skcipher.h>
 #include "sun8i-ce.h"
@@ -438,7 +439,7 @@ int sun8i_ce_cipher_init(struct crypto_tfm *tfm)
 				    crypto_skcipher_reqsize(op->fallback_tfm));
 
 	memcpy(algt->fbname,
-	       crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)),
+	       crypto_skcipher_driver_name(op->fallback_tfm),
 	       CRYPTO_MAX_ALG_NAME);
 
 	err = pm_runtime_get_sync(op->ce->dev);
-- 
2.48.1


Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC0619D8BC
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 03:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047248; cv=none; b=TYVWNusJPoDckbSGxky9YsFbBwSPw9C/dQCkucnW/QwLriVyTDzA4DRUwIn+ip6oAstE2WtUJZS61rcbQSSYjwYecE7dgahmUTMTVhwPWbWLqRryMGHXvJqVh0HV7VbqmIvgL+jTZlUSGsxLgoFJEmSEkDN74P3hjknwwnfmPJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047248; c=relaxed/simple;
	bh=Zx/9MBpB+EgUJFor4JlLXdd0yHAV7pvEgKtDi0YuxnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VORrZ+gDDPU2DEKdKMw3H0OFbD7jlwe5NF2x5aO9wl9CsQTLsL3kUFGXk60Bq+FUo4dqNNfT6GnVC5J9aXuBdVdFTXcyxjtnxOWwWP09mg9ots4GGkLlKYzb93RBSQ3lDxdJ/ERet6T8yA6O27E23R9Uz8bHeQ/N9bbD+1WGjYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfkON5d2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfkON5d2"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd68a16955so5913485ad.0
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047247; x=1790652047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYeRwN+G3teKav5DbRF0AzCOQ1OUDJvL0VrYOUOutI4=;
        b=UfkON5d2Dnumh6oYoNZyfkrp5ZdLcM5lYhUjgDk0Obm3Xk8gGPcvU0dKEURg9PQnyp
         kIdaOCypaHOFtGQ8NOynRKad7a+pECxi5a2pxmeVH8wwnvxPV2L/qDdN1v2IzU8vn6zQ
         WFSIgJwZl2ooiwsOM2+L/xOjpyBJG6NAh6006h1KfKygRhDMS4dPTLqcmNtRZU0D83FK
         TvBY1wSuSEGQrQGjaqT8UZCDIP4U/c51vGUJXMOCo9ZyuB+U8jA6iH1OmqfvDRGlMS9v
         6Mx4DBRkKEWbTIxRJw4JZ/nOgSuyA1JnVVNT0WeeBD7uqpd2L3EiZ+MSRnFCoMk5WLAa
         ukyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047247; x=1790652047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tYeRwN+G3teKav5DbRF0AzCOQ1OUDJvL0VrYOUOutI4=;
        b=bdO73b6WP/yGX+6d/yOyD3Cbs1j6x8oHDO3doODDTIHKPsP0Bp13oPwu3KMAkPFwST
         ik+u3d4ArAxwRZ7segNwOpZ7112Z2kBuKCUkZPXWS3xYXnHwF4KmI2/C+02TIyVq0YfT
         YT02ylhGv1r+IJciRsFjzFXykm7i+2vOwVrC/fhdyqBpgg/6Gn7nVaGdpD5BAzSoPOYR
         kK3EAKchsSRJsEVWl/SPJPFbBEVp/ryEuP6balPprl/Vpf8HkPOt17uH4rHaWSWS2FoB
         uVPzAp+D30TpCBRZHcAMBv6FCVeFml5BQFfi32K0fvM6KeHPR9a5GcsidIs3cjA3w37h
         jN8g==
X-Gm-Message-State: AFuF++ld3egjF91GX1f8PRDUbMLraPA6Soy8/38mkhFqbVTBl1Zziw0r
	e8MgY7m8Frao0iQUcynzD5fETiSTf6eoN7nI8MAA4ugpArD8vWnSyrWl
X-Gm-Gg: AYBFou0YLfMZl1PzBBHamvhxcgf3opRr2m1+keUDK3FH6DZCwjGHPxwjsTn+x/8vpUN
	qvHg/5/dt9+ygCI7e5pWam7uu053JHD7gqaqgp2pLQf3EGC90BAXLw/zt4xs/i37C3MC2Caz2OW
	OdBlrs+BvNfHi778/rKV64fimvznnUxcpDxRrL4mie+gI/UzGb1s05WHgDhhbVdYlfWaT6IG+mj
	vbYxkckyPrlWIaVFPn2+PM0gN2kXn4Wt7+HKjRioMQKkAh6bQNAyurEB9N3esX4Ahn7ZoHCQs55
	EUtHRD4KGN+zOYJ3a9IfgF2LG/7qZFIDaXlJn+6H0M8O14cq31SFc3vNRhfhdUVF09ZuZKkPkB2
	IdY/0Dub2sltyetEVmJV5aiPEV4m11LvEgdrwyudwzu+MUwCgLuY2byacV54gMTz6Ziu9FCsNBr
	PdGddetVNYWHh1549KqHjDS+uHRkPsMT1pAn7gDFKK1uBYM6HJLV6Dt864K+0L2ALggIG3bqhOQ
	uD6Cc/YSTxG8gH41f8jZ2xML6ez/w7UNeXhPn304ReQyF4UAYiCTFrWp50OyVdCgbUfV/2lwfyu
	MjY5nNdN4ij3zQ==
X-Received: by 2002:a17:902:e741:b0:2dd:ad7d:72e8 with SMTP id d9443c01a7336-2df59a9ce29mr14324825ad.31.1790047247091;
        Mon, 21 Sep 2026 20:20:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5cf83512sm1940355ad.5.2026.09.21.20.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:20:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] crypto: ccree - Use pm_runtime_resume_and_get()
Date: Tue, 22 Sep 2026 10:19:53 +0700
Message-ID: <20260922031954.320895-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922031954.320895-1-phucduc.bui@gmail.com>
References: <20260922031954.320895-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/crypto/ccree/cc_pm.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/crypto/ccree/cc_pm.c b/drivers/crypto/ccree/cc_pm.c
index bbd118f8de0e..666866119588 100644
--- a/drivers/crypto/ccree/cc_pm.c
+++ b/drivers/crypto/ccree/cc_pm.c
@@ -66,13 +66,7 @@ const struct dev_pm_ops ccree_pm = {
 
 int cc_pm_get(struct device *dev)
 {
-	int rc = pm_runtime_get_sync(dev);
-	if (rc < 0) {
-		pm_runtime_put_noidle(dev);
-		return rc;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(dev);
 }
 
 void cc_pm_put_suspend(struct device *dev)
-- 
2.43.0


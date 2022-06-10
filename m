Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12FB7A
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Jun 2022 18:33:24 +0000 (UTC)
Received: from hednb3.intra.ispras.ru (unknown [10.10.2.52])
	by mail.ispras.ru (Postfix) with ESMTPSA id 35B6E40737C5;
	Fri, 10 Jun 2022 18:27:24 +0000 (UTC)
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ldv-project@linuxtesting.org
Subject: [PATCH] crypto: sun8i-ss - fix infinite loop in sun8i_ss_setup_ivs()
Date: Fri, 10 Jun 2022 21:27:15 +0300
Message-Id: <1654885635-32290-1-git-send-email-khoroshilov@ispras.ru>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

There is no i decrement in while (i >= 0) loop.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 5bb950182026..910d6751644c 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -170,6 +170,7 @@ static int sun8i_ss_setup_ivs(struct skcipher_request *areq)
 	while (i >= 0) {
 		dma_unmap_single(ss->dev, rctx->p_iv[i], ivsize, DMA_TO_DEVICE);
 		memzero_explicit(sf->iv[i], ivsize);
+		i--;
 	}
 	return err;
 }
-- 
2.7.4


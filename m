Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740464A9F
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 20:56:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 7-20020a05600c228700b00385fd860f49so3843506wmf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 13:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mh4jiSkDLwsXXr3eCwHVBQsjqiQzNM7iBR5uhA4LEdU=;
        b=RyxOa44Cou11d6dAd7IrT8ym2ReKWPZNo6u1lUp6B2x0DpQ+KyQKAy00ug4t+FTHcw
         HDuSg2+o+nlr1siY+vAl0J5TKQyEZOOZSL3NXEU55Q8WhwYe8Q1Qvbty7sd8Pn8rv0jP
         oJHND4hRhiqmqq3V/JHrL/28TNGuOatmW0GeSbJlL2Djq/rywmr8ZmxhlF72Tje2VOxG
         WsTqIfkCPnTDAQoPcLsmmBzMyxFZ2b5zuG5BTwALWFpfa0duWD4r/Crq9sVDJHZkETU4
         2RuBNUeGVcqnKx3QU9rBNiNLwpFqY4G6p8P5VCl+LfUwd4JflSN7Hn5LNp5XVuW7JpB8
         xFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mh4jiSkDLwsXXr3eCwHVBQsjqiQzNM7iBR5uhA4LEdU=;
        b=nd4s5Z8r0evVFBlPnBDguWOST1ziTZOV6GjXKsyTlu8JmXA/eXRywl3ueXfOHwT4kx
         1zIPsxH1LyyLpxg44q2wYUmsBNSuiy/y+2vwsTk2UnLijjpX8dTXeTJyrA8/sEoNDKVB
         IeD5K7ghPU6OOkkIpvNuRFqicTRLz3C9PU/agH087CO0/aElpYcLgdPyYkVvlU9O0AWh
         2ccCUepfOhkEdKCbVI1JSio3b1rbE40C4xDd++xosP0t+2YooSGLjCi7A3YxZ/R5MWTz
         oQtGsgpk3QVjY65t/tZJx/eWPQNmLjyQGuSbXD33qs5tV4zEPFzCU0UBCsxujjKowjBx
         I5+w==
X-Gm-Message-State: AOAM53350U6HfAAD5/aTIzCG/jPTQigf1IIHpeoGssTfBxuZxllQJi4w
	+5BeML811KrjA9xc7Hm4hEYsHKjvfnM4vw==
X-Google-Smtp-Source: ABdhPJw5dlriYcc9uqGoP84adGYCZXOx9OG+Nxl7pjmm3Tmgd0DJ60WWmg/crDMndcSeFXcIAa1YkQ==
X-Received: by 2002:a05:600c:1990:b0:389:d72d:ca77 with SMTP id t16-20020a05600c199000b00389d72dca77mr5605859wmq.1.1647550582838;
        Thu, 17 Mar 2022 13:56:22 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r4-20020a05600c35c400b00389f368cf1esm3695424wmq.40.2022.03.17.13.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 13:56:22 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 16/19] crypto: sun8i-ce: Add function for handling hash padding
Date: Thu, 17 Mar 2022 20:56:02 +0000
Message-Id: <20220317205605.3924836-17-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317205605.3924836-1-clabbe@baylibre.com>
References: <20220317205605.3924836-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move all padding work to a dedicated function.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 95 +++++++++++++------
 1 file changed, 65 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 859b7522faaa..820651f0387f 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -248,6 +248,64 @@ int sun8i_ce_hash_digest(struct ahash_request *areq)
 	return crypto_transfer_hash_request_to_engine(engine, areq);
 }
 
+static u64 hash_pad(u32 *buf, unsigned int bufsize, u64 padi, u64 byte_count, bool le, int bs)
+{
+	u64 fill, min_fill, j, k;
+	__be64 *bebits;
+	__le64 *lebits;
+
+	j = padi;
+	buf[j++] = cpu_to_le32(0x80);
+
+	if (bs == 64) {
+		fill = 64 - (byte_count % 64);
+		min_fill = 2 * sizeof(u32) + sizeof(u32);
+	} else {
+		fill = 128 - (byte_count % 128);
+		min_fill = 4 * sizeof(u32) + sizeof(u32);
+	}
+
+	if (fill < min_fill)
+		fill += bs;
+
+	k = j;
+	j += (fill - min_fill) / sizeof(u32);
+	if (j * 4 > bufsize) {
+		pr_err("%s OVERFLOW %llu\n", __func__, j);
+		return 0;
+	}
+	for (; k < j; k++)
+		buf[k] = 0;
+
+	if (le) {
+		/* MD5 */
+		lebits = (__le64 *)&buf[j];
+		*lebits = cpu_to_le64(byte_count << 3);
+		j += 2;
+	} else {
+		if (bs == 64) {
+			/* sha1 sha224 sha256 */
+			bebits = (__be64 *)&buf[j];
+			*bebits = cpu_to_be64(byte_count << 3);
+			j += 2;
+		} else {
+			/* sha384 sha512*/
+			bebits = (__be64 *)&buf[j];
+			*bebits = cpu_to_be64(byte_count >> 61);
+			j += 2;
+			bebits = (__be64 *)&buf[j];
+			*bebits = cpu_to_be64(byte_count << 3);
+			j += 2;
+		}
+	}
+	if (j * 4 > bufsize) {
+		pr_err("%s OVERFLOW %llu\n", __func__, j);
+		return 0;
+	}
+
+	return j;
+}
+
 int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 {
 	struct ahash_request *areq = container_of(breq, struct ahash_request, base);
@@ -266,10 +324,6 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	__le32 *bf;
 	void *buf = NULL;
 	int j, i, todo;
-	int nbw = 0;
-	u64 fill, min_fill;
-	__be64 *bebits;
-	__le64 *lebits;
 	void *result = NULL;
 	u64 bs;
 	int digestsize;
@@ -348,44 +402,25 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 
 	byte_count = areq->nbytes;
 	j = 0;
-	bf[j++] = cpu_to_le32(0x80);
-
-	if (bs == 64) {
-		fill = 64 - (byte_count % 64);
-		min_fill = 2 * sizeof(u32) + (nbw ? 0 : sizeof(u32));
-	} else {
-		fill = 128 - (byte_count % 128);
-		min_fill = 4 * sizeof(u32) + (nbw ? 0 : sizeof(u32));
-	}
-
-	if (fill < min_fill)
-		fill += bs;
-
-	j += (fill - min_fill) / sizeof(u32);
 
 	switch (algt->ce_algo_id) {
 	case CE_ID_HASH_MD5:
-		lebits = (__le64 *)&bf[j];
-		*lebits = cpu_to_le64(byte_count << 3);
-		j += 2;
+		j = hash_pad(bf, 2 * bs, j, byte_count, true, bs);
 		break;
 	case CE_ID_HASH_SHA1:
 	case CE_ID_HASH_SHA224:
 	case CE_ID_HASH_SHA256:
-		bebits = (__be64 *)&bf[j];
-		*bebits = cpu_to_be64(byte_count << 3);
-		j += 2;
+		j = hash_pad(bf, 2 * bs, j, byte_count, false, bs);
 		break;
 	case CE_ID_HASH_SHA384:
 	case CE_ID_HASH_SHA512:
-		bebits = (__be64 *)&bf[j];
-		*bebits = cpu_to_be64(byte_count >> 61);
-		j += 2;
-		bebits = (__be64 *)&bf[j];
-		*bebits = cpu_to_be64(byte_count << 3);
-		j += 2;
+		j = hash_pad(bf, 2 * bs, j, byte_count, false, bs);
 		break;
 	}
+	if (!j) {
+		err = -EINVAL;
+		goto theend;
+	}
 
 	addr_pad = dma_map_single(ce->dev, buf, j * 4, DMA_TO_DEVICE);
 	cet->t_src[i].addr = cpu_to_le32(addr_pad);
-- 
2.34.1


Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C9D3204
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 20:19:55 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id u3so20899496wrg.3
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 13:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ev6VkzNd8mWajKtgoY5TumXP3duJOCaOdR600zP4Pxg=;
        b=Z/Lw+lnGWpcXrOZnRWxKzRVo+wFU5ra06ZgxPTSqzBJpOHO4n17m7KTCr4Sx3BrL+d
         tJ57TKr6ykabxjkBF0k95jGnlLgO1av4r8iBkp3STLbzb9iT+UfIrgGyrgUPtghKuxeM
         cBVI9as/TkxdOWs8UzlsbA1XGJ/NcA1zOvtFS3pqwr3aEE+UL251CJj0EsOKuLrMBWG4
         gH7ALbq1LlnlN0yVou8nVSpuXgc1U7JbrSdO9UHSVqQMN9aVtp3cw9NLqnrhafg2xsfa
         81Vz0of/NRXBdhbmufz0cZGNGHSvp+3MwmlYtsTq3GibiaRiMBRMcJKp/Uu2HUf5dDl1
         UjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ev6VkzNd8mWajKtgoY5TumXP3duJOCaOdR600zP4Pxg=;
        b=0FTtMV4RDsXCdfzLEtzxdUL4Q7mnIfwHb7WGPGI5Zls6X0+H07gWFJSYk3oSTywzXx
         tyb4quz7DW6r6X6+3CzXZIEVdsKQQ4s92or3e9/PqKNZArnUzZRcCobNBvBcOly82Pyq
         /hPP8AnNypgSB5qSQmcZFTgLNxqaQ/2zDNK1uXPgWd39j7tsiNy+c1rtML/rzTPh3JAh
         8aazwk5hZzbeiMVUoXGB1hBT8EmpELfhG9U5JQYG9RChLa/e5+yDuFYkpkAjTX6gg1Tr
         ATlWjgR8F8nZKtsdbYjZkeyxHqzDi5YB8QLdoOzWHV5SvHOr8vgusfqtukn3t22GfyZ4
         GfNg==
X-Gm-Message-State: AOAM531w/txSKQVBEzgmL7KxA8s+oT6ltXer8Rqm7l3bKWKFpkNqt1+P
	2Hmb/gH2iNWnWa+/mlAfkukkOA==
X-Google-Smtp-Source: ABdhPJyemTLSgoak6z+//F8uVgKbFZkCNOJ7AMgwijmSMkhH9eOY/9nZNrRffO5kHMaJB0L+fasVjA==
X-Received: by 2002:adf:d1c9:0:b0:203:c4f8:dd17 with SMTP id b9-20020adfd1c9000000b00203c4f8dd17mr10465301wrd.633.1651522793740;
        Mon, 02 May 2022 13:19:53 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l2-20020adfb102000000b0020c547f75easm7238183wra.101.2022.05.02.13.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:19:53 -0700 (PDT)
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
Subject: [PATCH v2 13/19] crypto: sun8i-ss: Add function for handling hash padding
Date: Mon,  2 May 2022 20:19:23 +0000
Message-Id: <20220502201929.843194-14-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502201929.843194-1-clabbe@baylibre.com>
References: <20220502201929.843194-1-clabbe@baylibre.com>
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
 .../crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 87 ++++++++++++++-----
 1 file changed, 65 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index cb510ec21ec4..0db1e8253667 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -328,6 +328,64 @@ int sun8i_ss_hash_digest(struct ahash_request *areq)
 	return crypto_transfer_hash_request_to_engine(engine, areq);
 }
 
+static u64 hash_pad(__le32 *buf, unsigned int bufsize, u64 padi, u64 byte_count, bool le, int bs)
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
 /* sun8i_ss_hash_run - run an ahash request
  * Send the data of the request to the SS along with an extra SG with padding
  */
@@ -342,11 +400,9 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 	struct scatterlist *sg;
 	int nr_sgs, err, digestsize;
 	unsigned int len;
-	u64 fill, min_fill, byte_count;
+	u64 byte_count;
 	void *pad, *result;
 	int j, i, k, todo;
-	__be64 *bebits;
-	__le64 *lebits;
 	dma_addr_t addr_res, addr_pad;
 	__le32 *bf;
 
@@ -421,33 +477,20 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 		i--;
 
 	byte_count = areq->nbytes;
-	bf[j++] = cpu_to_le32(0x80);
-
-	fill = 64 - (byte_count % 64);
-	min_fill = 3 * sizeof(u32);
-
-	if (fill < min_fill)
-		fill += 64;
-
-	k = j;
-	j += (fill - min_fill) / sizeof(u32);
-	for (; k < j; k++)
-		bf[k] = 0;
-
 	switch (algt->ss_algo_id) {
 	case SS_ID_HASH_MD5:
-		lebits = (__le64 *)&bf[j];
-		*lebits = cpu_to_le64(byte_count << 3);
-		j += 2;
+		j = hash_pad(bf, 4096, j, byte_count, true, bs);
 		break;
 	case SS_ID_HASH_SHA1:
 	case SS_ID_HASH_SHA224:
 	case SS_ID_HASH_SHA256:
-		bebits = (__be64 *)&bf[j];
-		*bebits = cpu_to_be64(byte_count << 3);
-		j += 2;
+		j = hash_pad(bf, 4096, j, byte_count, false, bs);
 		break;
 	}
+	if (!j) {
+		err = -EINVAL;
+		goto theend;
+	}
 
 	addr_pad = dma_map_single(ss->dev, pad, j * 4, DMA_TO_DEVICE);
 	if (dma_mapping_error(ss->dev, addr_pad)) {
-- 
2.35.1


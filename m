Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3A12C032B
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931963; cv=none; b=P+hgXXEfA/GaI8aRePWqodNEzhtLt2kLhgwwxwV4oLXszu2gf4eSyNzqBFK3z/84/6siPxPX6eLubnP7VGtyCGkJ4wMNCQJhVgbCEuMnV0d1PmEBJZsgZNSPTOa8k1XhW9WmtPjzaqPSKneL3FmGeizKsb1JJ6Q8pXupAcsHmNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931963; c=relaxed/simple;
	bh=D3Fpyml+Pwh/ot9LUtEAJrW9x78rJDQPnjdfBz8Z7cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bt94gvEVHFwI/r8A3HKBfaadfNXI16CdBXKeEupif5cZD0D6IG3JUDgvMkuW1xS+2y3lcu5XP4SVL9TuyWZivnfZefGQyir64VwkR85910OgJ2bbgwUuyEfOj6wGRc069Nzr1SxjfyycB1OHNTTLCeCEZcoPAIkPK5B+hPjGYqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8dxDJbc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8dxDJbc"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade5b8aab41so169083366b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931960; x=1751536760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HrsFLSEEMdhGLUzZIYXTdJy0VycwWTY4NZmzeB9UZg=;
        b=D8dxDJbcxvirp2TYjdwVRuZUVIii1/d2pgzLMyrFs/1mgX3e35n/OXzPqfEhYTR29v
         7epJL4jbvfYDUleNX6/yKVJUIUNphSIMel1N5yknbM/RW7g5hDWKlUvxEvG9WhONLQhU
         7Vdr7nY7MCC2s6YHL4HcDEgjcc4McD60NogZgKIr1WUft9JlEacAgEeWoKHs46Ub+KMh
         9+myUTcWU5szFT40HUrg96r4FTWgbGzsICueaEAvu0RmbvWLvAfRHkrs0QvkJdPOTNSg
         uIXJRQ/E2+3p37CguGtLsFcRuySNyAuNqN1F2UKTDIHSLI0ScuP5KoL2hJtIvId1FISc
         DUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931960; x=1751536760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HrsFLSEEMdhGLUzZIYXTdJy0VycwWTY4NZmzeB9UZg=;
        b=tqcKqI3WDt/IjFByIjRW5UyR+ontkSInzsShNj1Rfq5raScxZRnZhWEiNZH2dJCPfj
         5+3+QRRcRgAgq7hFFyM3uJObmWgf0YIEoTpWbQ/glOAogvCAmQrSiEycbUuUPSeungd1
         glLv74T+2evFRRj+x6aB8C2IoZmYC5mWD/avY3iCnRYYAfYjd5AQ5sJFrTl/oCO5cL8A
         vJ9fdiDxhs81ms2kfzCpsi4Uj+/ZF+N/dDRzouTQBxk3DS56VSLLWblkuC7+3lPJbMlz
         GYBqiDg3eJBh9RJutlU1lqHH4HcvUNg29gA49XpqdcK/Z+xx4ibfkGdI9EfH1jTWzvJL
         21mA==
X-Forwarded-Encrypted: i=1; AJvYcCWT6i6n7G1JkVaVMy3vEUob/gzcwHquBlOiWjhvrrhJCS+IjNXndCLrhojis4G9XD4wAqaMylv6j8A+KA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwK45w2fn4pAJXqq6pd8UZuvgXoGoF1NuLmXfiQutiXFURsQeyW
	yA7ugeudqce6U3PWHv82ZrwPsu1OlL4VFMfVmaY4ZgqiYlnwHmUVdy3VsKSyFQ==
X-Gm-Gg: ASbGncuNZcm5BEp/vhn6QALFcoZ+PkXu+NIUZjN9XfUB+cfLB1Tq23tiCoivfTgmLiB
	PP1/BEIhdMJNySSqVUNxCAgKjPIs5UBsfaTm05+TnrYrNcb0nWozt5OF+30pta7buBxB0JkUlKJ
	fZwc9vN/G2Es37ndTqBGJHksdNKdV3QuiM/c+xFhspAM4XrB6QtFYMqDvtvUaoxtL9ENYnBsnjs
	TbZdzL0mZiLN9eSKbuecUP3KYRFLPW4CKh4+tTTBXw2b//vGpZ/c46oI40uqYCwSrz+uvhcAcx5
	yQQCi+m/JDK41X5G8QH1f19rFismI9N5L0ZLx7Cvru9XqsWMa37by//qa43hk2Dhp5OZwnJLbU0
	T7mUKD+FrF8USPe3i1U9DnEGd
X-Google-Smtp-Source: AGHT+IGcHkgMnqpZF93lLxs84Oee/gXcIKO2zDueULt6PM5LIPG4njAWAD+IiAyNDCajyksrQT6oWA==
X-Received: by 2002:a17:906:6ac1:b0:ae0:9fdf:25e8 with SMTP id a640c23a62f3a-ae0bee52de0mr552743566b.47.1750931959733;
        Thu, 26 Jun 2025 02:59:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:19 -0700 (PDT)
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
Subject: [PATCH v2 02/10] crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
Date: Thu, 26 Jun 2025 12:58:05 +0300
Message-ID: <20250626095813.83963-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Retrieve the dev pointer from tfm context to eliminate some boilerplate
code in sun8i_ce_hash_digest().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index b26f5427c1e0..61e8d968fdcc 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -238,19 +238,15 @@ static bool sun8i_ce_hash_need_fallback(struct ahash_request *areq)
 int sun8i_ce_hash_digest(struct ahash_request *areq)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
-	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
 	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
-	struct sun8i_ce_alg_template *algt;
-	struct sun8i_ce_dev *ce;
+	struct sun8i_ce_dev *ce = ctx->ce;
 	struct crypto_engine *engine;
 	int e;
 
 	if (sun8i_ce_hash_need_fallback(areq))
 		return sun8i_ce_hash_digest_fb(areq);
 
-	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
-	ce = algt->ce;
-
 	e = sun8i_ce_get_engine_number(ce);
 	rctx->flow = e;
 	engine = ce->chanlist[e].engine;
-- 
2.49.0


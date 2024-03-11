Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5FE53E11
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Mar 2024 17:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710179287; cv=none; b=qddOYSshmfHLuG+cv6ycyhzOdyAlbHNo5yk55rIyX6Onnge5HwcPCRj5VSxFuyGU4C8lDfalzZr1nD/EJzViIvYxCUjbmW3FI+54dJEanVhF29jsByeGqZQXlKoZkzEzdppB5IDaCnew8vDkEpMe97TgV8OXuQVhIXtkCtadGuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710179287; c=relaxed/simple;
	bh=QpOspqS1sUE0IbYuXAACK5NlHXEDQgmm6lMqvlqIAUc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=id1zaCOyZUaPkcyQ+mehpnrNQahZe3vSbN4/wWJT+M/NnT5uUAFoKwH+yLddmxpmvMfb7H20F2zsU6plIVXtmB5GNaBHlEr1aT6zvz/UcCGFABejVz34hdB/cqX+jinES0TbYU6Q8rTFCeMoqpAky3omGiahptpOWJ521f0TVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3DpfIoh; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3DpfIoh"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso5657889a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Mar 2024 10:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710179284; x=1710784084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNZf2SCv2RklLk9YcBHwBHEt4OlXPV3XYvDGnMvMDSE=;
        b=c3DpfIohMhA6uSe6tbuHrMkxoVOaxpGwjad+bJIsDjzRE1BKrZmmuNzqcQj4p4pqnQ
         PnlOicxdDxbGQn/ePnOBNELOpiEpk+/GiAcaD5QirFQan8+X4mIzzPGHeA7QkUsxg8dd
         HOV20zO7t6RrmnBLg3UpGKmb7zW7o+nkYtfIOupcuWg4MLhAkVjfcS493XWd9TX3ipxr
         n/9hKIwI2duwjEje7YRtGZdgZC4KUfodKQzP0eiWhxb7bZpQcFeOw0k+6uj9iNG7ofeD
         dTm38yHaH5SaDB//anVolv9l7RohLEJHOmLz41Ky5jINc6amu38ye5u0kU9gV2K7AsL6
         2OIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710179284; x=1710784084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNZf2SCv2RklLk9YcBHwBHEt4OlXPV3XYvDGnMvMDSE=;
        b=DVVjjBzAqnDKbnaTbmFESCY2uuIUHs4MT8+2j93qfYuCuWV96eh+xfehT/G1HyTh8o
         VNS4uxiswO7fMJLzPdLSS3ii1DTsclWD5QL4lPQ0nLuNLneBS5/c7WmaeRGLqWDORkvc
         G/1Gou6LSXu/9qZ1SPgdVu2m6V4WlqjsuHGNTBbEDJ34kGl+z+KsDe5gsO9Q3AUxJho2
         QkA4mko/nQTi89c7ccq2vInHM15cGYMzVuSTS3yT8hGzPwgXPk8S8Nd4I7tuH2xLHSd9
         OyxtIXLZW8rig/0QmXRhNKSD9OplNjqu4xNOAlWUH+L9tNL7zm4DaF4t23jTDyBweXzw
         Bz8g==
X-Forwarded-Encrypted: i=1; AJvYcCXhpQiNVI7yM3RYBr2XE0jRmUtp7b8I6qP2CGNay+9VjX2odejlJTL1yG56K3ncMhueESHlzYJB0YRU1C8FIVOzQd2QfiOgXjT6T78=
X-Gm-Message-State: AOJu0Yzdx5DNwXw8NODx1yKrNvdgFsAuc0IID6UTP6/maicWYOHdz/GN
	xrwwbFYCOy0rJScHbAifdqISrhnN/306ub15LAmvhnfS+8Z+H5ZShGLWPvWdW6I=
X-Google-Smtp-Source: AGHT+IEfEpXQwgYNY3cU0+74crCvKEyvf16zoIYvSnDxGZ9ZsZ7oxhece1/qUyzG7NgURAtrn4p4CA==
X-Received: by 2002:a50:cd4d:0:b0:566:ac89:b7d5 with SMTP id d13-20020a50cd4d000000b00566ac89b7d5mr776040edj.28.1710179283586;
        Mon, 11 Mar 2024 10:48:03 -0700 (PDT)
Received: from localhost.localdomain (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id r24-20020aa7d158000000b00568525ab2e8sm1757060edo.55.2024.03.11.10.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 10:48:03 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
To: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kamil Kasperski <ressetkk@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: sunxi: add T95 string
Date: Mon, 11 Mar 2024 18:47:48 +0100
Message-Id: <20240311174750.6428-2-ressetkk@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240311174750.6428-1-ressetkk@gmail.com>
References: <20240311174750.6428-1-ressetkk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

T95 is a commonly known as series of cheap chinese TV Boxes with unknown brand.
Since their Android OS is built from Google Pixel 2 sources, all footprints metadata contain Google strings.
Let's assume the vendor of these boxes is t95.

Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index dfb834a9279f..b9b6a72545a5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1381,6 +1381,8 @@ patternProperties:
   "^synopsys,.*":
     description: Synopsys, Inc. (deprecated, use snps)
     deprecated: true
+  "^t95,.*":
+    description: T95
   "^tbs,.*":
     description: TBS Technologies
   "^tbs-biometrics,.*":
-- 
2.34.1


Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F92A43B3CA
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Aug 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975056; cv=none; b=KRbPL/8ZESJaj+RVjsBuP+lU1lAQWKilk802wbJsccUCqH7GbwVoH0mbyZnCdyTIZcEgINmOl6bD/FztO6V0UQuLFMIluPe45tnZ3Hoop+YvSS+ej14KG1bPMXZMjZiNcBrOmLjhJaCadongwn1Yp+Gd4b35X6W8J/IrzzteICo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975056; c=relaxed/simple;
	bh=RGN10SVXvm3i++Bfg+6kRY/5FXtYBlYmz8CMVkacggg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d02+UDGZ36B0p+//WaJdhVNJYSWHTUdSiV/CM9PMsuNE74y2lbHXZIJjjwyKgSV28SG47yfe4L7sqGBaJxe8yVSFN7DqsZA3C4/ucixFSHg4aKvsC2f43tJZClsNyThNq8V6kAPwXb0PHQRTeOERLtIaByh8ofA8uKGsLC+fJXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=fhwh73tW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="fhwh73tW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a10d6f455dso499878a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Aug 2026 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786975052; x=1787579852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4sFYLrF8YcFxl1e2AvAjI7qSfV6fkkSPS8k5RbbIFQ=;
        b=fhwh73tWLw6PzvPAusGsTbWdQrZMm1cgWfL1IOU/AEm8/o5AVqsFFtwNuLmbrX5BCx
         /FlTdwNIHLxyQgXc0Pj5pcD756k6qqBt/vtGtmMG4FP84PN2Em2380KZhNLSXOx8gptI
         0CmGB9jlpu/feoMULUBL5aiUCDLYk40+SCJaPQngC2jBMwp3qc+qbmKUIwoZbapDfjSF
         D9iCCjNzL8Dipfn7qAraTTDhmq8ayRxQ0NT+/R2wB68a1E2ba7Z4tnG9HtdfLXgfVr9C
         8NH00iIdKOQk4Zqi8CxVMcUWAIH3wGK9wp/pQVvNEGvRPs8vlehNi8r5HJej4SO0cuzs
         7+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975052; x=1787579852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4sFYLrF8YcFxl1e2AvAjI7qSfV6fkkSPS8k5RbbIFQ=;
        b=mtkGfB6wx5W/tUqLp3R34NJ2l2vqKrCpRjTYjtKGOuGNKnEJA81SSbcArcd6dlnGsF
         zRnVGqg+7jXZMUAS8HfbquV7WIMU6ouHB39O7WJRSrwd5ZafpfJ/vlCzoFCDEdapu+83
         uK/67RBw4aCNOE+DHgVah4mqHtWoLa9I8y9po8r7KwVYNrxyqmSOyhFhkT0k8IdLNg0H
         rli33LhlA0sVFlTZrz9PPtLGWgBdh/TuWJZgDYH62K+l3aR58UpJDb6VJ3RTR1saF92a
         n+xgUnx5uhY+QFlw23gcvRjrzudBh4iPByE6YxXMQFuWLT4iTAdwfXViRyQ2do2UQEwG
         IGOw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0dh/M2sWIlYFaeDSsasKw1e2P5/9Qkrzj5myeJ+9GetICYU8yisVJ3PfWZHpLrFh3En/r9uQirzFnHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBJgyLARYRD6lf8v8ETbFUIwy/eOOMaW5r3Eg7MQZtcswNArGn
	gAhMiMWcLOoDuEqwkQPiedp6CIyQrnCfX0D1OiRfqeqKZGZInL4Q/CQX2n/sVqYaZ4s=
X-Gm-Gg: AR+sD1087mVUw9KzFhg/QoIb//9knTn8AL3f1iQP8x/Em/ca7B+WqBNuNw5DF8xmmE3
	aNJpEnwg/a+p1L7nEQTeSW79VJZqyQa/pB/THsyDCcjsIXAiW5BxxOai6CyKjnGZvRSGR0WtzHA
	KS/76YCyIsp6l1aOSyHMcBKZLgLy22Vf9fefuYxfBJcEVQ7koPEGcvTk/zG56PowZBqZHc52fWs
	VxVtFZGz/fGB3+bcG2z+rCPjYRyhz43fwdSxDKhc1p0nrudSkwSzbQ23AqaxL7+Ng6cXejmhE3R
	NkC1/Nok8sB753nvnpSwejC71PxhCbVPTJcx723q1eXjxcqaELf2KhS/zpCZW5txtDHd6rXEHB6
	pxdvM+8pc56W6kV18XxQsIzDY5b7sbtkD+2apH69szKA1jPACjGtg0WO0NXTEHF5qHtV1IZyVg2
	v4/31y9my1F8DfAYD0vGX76kB03+jkN9tfiTGpDpLcNtR4/COtRcsmEzldgNUluA8aLDQd8uElY
	O4edPDHldDr1hCWBSLWzeWMXTMwMjr7hDOZM82OB3zbmFHqypASc/pGE8w=
X-Received: by 2002:a05:6402:3888:b0:6a1:8d3e:ee77 with SMTP id 4fb4d7f45d1cf-6a38a8b7c62mr6178631a12.1.1786975051651;
        Mon, 17 Aug 2026 06:57:31 -0700 (PDT)
Received: from Mac.localdomain (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85319b1sm810238a12.13.2026.08.17.06.57.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Aug 2026 06:57:31 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>
Subject: [PATCH v3 0/2] dmaengine: sun6i: Fix two bugs in the DMA status path
Date: Mon, 17 Aug 2026 15:51:21 +0200
Message-ID: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review, Frank.

Changes in v3:
  - Patch 1: trim commit message to the root-cause explanation and fix
    description, dropping the debug/reproduction part per feedback
  - Patch 2: unchanged since v2

Christian Lugnberg (2):
  dmaengine: sun6i: fix non-atomic read of DMA position registers
  dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status

 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.54.0 (Apple Git-156)


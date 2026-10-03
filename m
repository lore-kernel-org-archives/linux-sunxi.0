Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B112FCBF6
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Oct 2026 01:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990845; cv=none; b=FsfywNFkgLwmJ+GmNWvbJwl9NTJ5PPxguwgEgyFztEKI1UaH+7kGK0oaoJDwUHJGiZB6+Oo6/62dtX3ezOZ0+rLHrGg728uWJ+V/341IN4T4L7d1LtwmTwiAVEtqP/Q4dOQaU2btnDBkRsmTfKUr+eLt6YsaDU7MV3AECMNvfFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990845; c=relaxed/simple;
	bh=fqgab4hqliuJ5sJXJfAfVMHg91lDalrjupRyxoQcC/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0FAUpkTLphyIuSCDU1QcHvJFJmDStzAUMIP4mL0Sju1u2fydfxYyTZtMUd6o3YVfJlK2kWM//xFEcn3sNBI/OtyK25ct5BC/RLR6fl7LyBKpxLK9XFJOiy1g7i85R7yyfJnFgr+E7S5NApcLeqWfqeheQKiH1ORRxr6e1qJEjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-34bb8b31647so280652eec.0
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Oct 2026 18:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990840; x=1791595640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WQLlaZBcT5TiKH6jHmoF4Nd+NZMHVC1YNos0SXXELk=;
        b=T9/26lFjDTAn+tG7kKysyNeCnk/DlqUALub/ClRdQZS5/8SqV0G5lTSu5HVH7j4imA
         SGRZGzuhWJwrEFsFZM/mykKaqTNbgIQTkWrlcAVuLEoCTRTTICBufDIbcZTXmc3ux3GC
         ywCkFT7f5AkXhGLKM3ThYy87V4PYLfsRHEWsy6GueX50BBTbgRMUij9YQv4WcxflsOe1
         AH1OVq9z/wnA6h0yXqhSWCuZIVR3sM0+9CAMBuatxI/WHdKS0uog7gbIsQXWOf9DgbZp
         ibstZzC8sw4d0/kf3p4RcbnaW8WpEDoLkhMmwjSZDtueAQDYMrT2hQGDwi9PnEN/i4wA
         LnCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmmDmuyNM6P8jEGpPqxJpj0ntSVlMB9VdzLGRooP1JRoa4vjdnbZmqdBaUasR95DXrfVYUwN3kXp0yeg==@lists.linux.dev
X-Gm-Message-State: AFuF++k5Rg25LAXPBe2Gepb20RC206iw0jbI9QXeKFjP1G3G3E9O02rO
	CRPvqXt3VNSXg80WxaZXVB8QI70THv8OiEARNeNw5ybo3His0LXKxw2M
X-Gm-Gg: AYBFou1h4saaDfwAiuo4qV3EqythG4qsxuPfBcv7aIPfHfg+OOcO7i+vFsKlF65gnaY
	B0ITL2ITJsU+alvdByXEPXgZVOLEtw8SidV8gJVA39uOy9hixn/YoENf91jq7gkJ2Ja7jYAkqoX
	Ux01+lOrYlLRqDLyDbiyu0o3Fpa21IdRE28ByIgaLJ3eDZ73/TDmOJzvqsaMz0yIKV1XHUrymqO
	3VNxS3Og7Qp0h4tlZ+ql7wqZK3SE21nOVfVPsUYpOdLVQE4gdMOjMOZ13ANbMyRMtbMJW0FG4Ou
	/pdJ/bBamJ7jdA/fV8ZlVe3Ccb/UEQLqrvH0sRU+UIUd+GMEFhA3yw+p7BRajBZd+odSf3jkRrL
	uiW8tuHemagfxbY7Bh/zh/DGQmjXuvDhXRtiMhJgNYviUJv09WiJvM/P1+SFFfKRnlZKtQ2L/2j
	y9UamRvOuvud7hxYTAEOjEjouv2ZsOUvo3HKudNQIZu87ZvM8xdO/8XixNASc3ix6s0R/RyFPm5
	4VaJogJd3/44K4OFGArlinEXrD9oDKUpdYJiaOVBnPBg2fzriFgaRkCnh8NVZ4IB5f8xxnQcLnp
	/uMsdSaVXOrheIMRozfP65+Dh3kMLYxpXBBj8pRh79B5
X-Received: by 2002:a05:701b:4510:20b0:144:eaa7:2763 with SMTP id a92af1059eb24-151c2d0b226mr1341545c88.16.1790990839589;
        Fri, 02 Oct 2026 18:27:19 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa74fa1csm1218093c88.1.2026.10.02.18.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:27:18 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] dt-bindings: nvmem: SID: Add binding for R40 SID controller
Date: Fri,  2 Oct 2026 22:25:35 -0300
Message-ID: <20261003012534.418820-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003012534.418820-3-otavio@ossystems.com.br>
References: <20261003012534.418820-3-otavio@ossystems.com.br>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner R40 SID exposes its 2Kbit eFuse at offset 0x200 of the
controller, readable directly from MMIO like on the A64. Add the R40
compatible with the A64 one as fallback, as done for the A100, H616 and
A523.

On an A40i, all 64 eFuse words read through the MMIO window match the
words read through the SID_PRCTL/SID_RDKEY registers, so the R40 does
not need the register-based readout of the H3.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
index f67470b8a2ed2..a4960b0ef8cbe 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-sid
       - items:
           - enum:
+              - allwinner,sun8i-r40-sid
               - allwinner,sun50i-a100-sid
               - allwinner,sun50i-h616-sid
               - allwinner,sun55i-a523-sid
-- 
2.55.0


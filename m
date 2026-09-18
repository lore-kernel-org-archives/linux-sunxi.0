Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3656751813D
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Sep 2026 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750488; cv=none; b=Vg/b3Y9oz24llT67xVnEA3zwW4W1aJl2Au9aYK/igM2DyP6cM4K/VTcOvf9WdSviV3Z0WgfpHaI7jFsEjoLBbxHMir0tliR47PF8xqDQjIDe4WS/0k4uPweljPIpKp/DqhbrJnrtJ1VeX7NELMYXkIi03+hyEap+pqUrg+82p8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750488; c=relaxed/simple;
	bh=qnoog98K51vnfZCiv1es1iBsnXh8XTJszGX/9tFR+MU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bD/Uv6UWVSn4IaJaRGVWXV1sxaHReoJ00oi7tV4PonT76TD0RXwoGPOyiGJqtVnU4GPb0SYjL7DD5bgcsecXpRx7GvxoXWltCd6OsAm2qAxRuB6UOdV7Dfw9iC2SvEcusSEuSzXVFkpGnWtm/EdAu8ZR8NjbbURslRVYy4asOEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLgKQkjB; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLgKQkjB"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398beb616f5so388981a91.1
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Sep 2026 09:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750485; x=1790355285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=oLgKQkjBOWjmoLQlYC1UTBTFpMN5LHjZxSOxDq+co8ZzPSmqsxC6vEnwpgnCpCG9cQ
         nfypBXt5+HcvwCAZjCamdp3/VnHXL63RnlGTWO637gAdTFBYqTmxT/DCPiFNJhnQDM2y
         ipTGwbCkUsBxTzz0Lr1zYnuhQiovGYGsEy7HfEzIdF97WjM0/6SbuPh2vdbfQMrYnY/c
         dHCoKdHqZ8ls+Wv3dG2PER+ZCP/8pQ8E0OtwD81bfVHLl7Sff40gc4L3CtGzme7i2FaP
         5ZsS+xvF2gR2bEDPW1h/gHkK8kGaLr+Koo3BLCR9JIfEf+eNOIAVzxNPIHo345e4lGUp
         KXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750485; x=1790355285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=Ud0UOeywC+Bgo6udDAR1n0d7TSInt2NHw+lZgV202+lVUHtJDI02SLN7QgSIuPg7ar
         k7l0JrD5Q50gZstJZgltyM7syh8jlvjlZJC/9ZkT9FskeBKra3zq83d6qk8NeQyG/Zpq
         FD1S2M4BZu3mBNNwm3YdKiIGtR6GMvNPIw+aUwyg5PUzQQRgda6CuCmHrJ1ndFgWCwoH
         tcLOoMeX+xtJqGhsKv1V12sauyISkbzpzzfZnM23TgK0vHT76VaTjv2oQMnzKSkvb5aA
         upm4ZxuCVBEiDyCFg3YfMsWNQww6uRx7RDq8xoo3+dgeXeZJHSPVJZ3w6it0aSCnpIyd
         5Dxg==
X-Forwarded-Encrypted: i=1; AKwUvBwHYotrYue5vYoqxGM2d0JqYbu4Y5nWWaKORC5q/Wtd4/x12lA41skq45DIFZ1aa8EBLz8P+jHlRWa1Hw==@lists.linux.dev
X-Gm-Message-State: AFuF++lHa+DpuZmzFGYuLvft3KfdHKOn/UQXhsaao7qROes8/jExQ6Ea
	hT0vJTse6RkI4nlAXE8dxt8dmSZc1pYw+sZgOWPykgUp2MdDpPRVAhcD
X-Gm-Gg: AYBFou07uuwsk8hChbHix9sEsobpMLzjjLTHadgw6UOhm/KerLM881oxKvZihmk/5Rm
	YyA5lsMsNKJnBcf1AfTVMvjGRlU2a7QECILqQdyQ7l02nl//qPe4n2X0MS3411BcAui0acWkwtV
	J+5XeA04JJHLZjKXQuqcQcvPTLeeZDqfXDUswqU9R/eMXbcNRWDlB7v023BfCvLvo9GVwb8Pvof
	TcTm+kpL+XbiuVr+uAao8BjhW2q6kOCNjBZEaT8acxfuh/N0TT6tHIoA0xCXlUKpGVBVtNo72PY
	nhFsOi8kKEL8Xqw+HByRq5xO5Rz9BSklIkqlGTe7si3j5T3c8J7oaRLHpYw//4U/x1hbr1Q39yx
	TGyO99NiiCkaDODp7vn15ClfaUakaDyWuW9K22SW5eqP1HsNXS8+wFMYYl0lL8plfNJKBEOzNKj
	7yn7HEQij77W4mXi4NxiSIuMDntsnyIBY+8cz/4IEH3wRNScDQSHGdSpNUrTh9BxC431YLe6DqB
	w==
X-Received: by 2002:a17:90b:534d:b0:39e:6c68:fd8d with SMTP id 98e67ed59e1d1-39e6c68ff21mr213045a91.34.1789750485331;
        Fri, 18 Sep 2026 09:54:45 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:45 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 2/4] dt-bindings: arm: sunxi: Add Teclast P85T tablet
Date: Sat, 19 Sep 2026 00:54:12 +0800
Message-ID: <20260918165414.1129076-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the Teclast P85T tablet, which is based on
the Allwinner A523 SoC.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..b9c2268fe 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -933,6 +933,11 @@ properties:
           - const: tbs-biometrics,a711
           - const: allwinner,sun8i-a83t
 
+      - description: Teclast P85T
+        items:
+          - const: teclast,p85t
+          - const: allwinner,sun55i-a523
+
       - description: Topwise A721 Tablet
         items:
           - const: topwise,a721
-- 
2.55.0


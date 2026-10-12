Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B3847CA8D
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799801; cv=none; b=VeX38ltPydqGjWnypBzR0o6f6bCchpZljp/Pik2AXK8e+LYYq8YxyyNIq1e6lSiT8iEhUuGj3KVW45wt50bpxGgJrb+pZiC54L8QVCh9BfUnZi7D0/iWt3GLmTH1Hduyz6d8ycPf09/7wKCskZ60msySyFORn36t1D9x9PtYXLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799801; c=relaxed/simple;
	bh=nSeIB9SqI3YR3qh8EwI2spWM6L+JrfQJZacP9d3kjTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsQqBquy0wXnwXEDUbu5ahBWUDBs/volrS5JmWBx+08N7uMhayqtP4XuwD/Av7OewZ7SakyKWqpFD81I5ctNxIWZ8YNyQCc5aXhuj6TqHUXuwufDEyOcZKYKC3FeffioOl6vTyEphIT6cXOnZXrVBSDcLVJPVrE9H+bE1U/gKz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c65L1W3D; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c65L1W3D"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso11247365e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799785; x=1792404585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=c65L1W3D18npzb8wVHK+Z4ibTGR9SISG6lJJqIsF45d87LUi9MgQmSvBKVSHvjRF4m
         okary6O9I/ha3xyQ7d3AvyUDvTdmyX1UcCEaAFhrJFxFEi3GygPfgVSyouY9QoakVyet
         2fH9I7OZNQzLFsqZNgWni0UGrXYed+z4SvhDxFAOkevCUbY+WUJG6QRXR1sO49wAVLm8
         JWEbFeoFOALgmjO4oLk2E2yyp/ZxgWHSBz7PZyTCNzxz5xqkSbJ3+W/I6DfawNb16qm/
         m/hrSDehh3ldjixK6xxdgLy/p5lpjEQNVb+r1e34CTxI9LqlIMxiEUXEy8EZw1Z94nNc
         ky8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799785; x=1792404585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=oa2PmQkE+CGW5Xkl/ncY31kI1iaib3xpnCnHJyeRNJrPYMs8CbknTfu7dQ11ri5l0P
         B2roA/lCp6ZD59K5+Ug9BcYTav+SCNLFKVU3MOwMBsKBGtnLOsvI3CRVJtKdt1kIBqPZ
         MgqQIe+VDCnlx+MOfROelHmlnUVzLnxeRcb1zWuD+BtzbWrxreRNBmhfSPp1KiPpFyoh
         jjCOwjj6QDM2nkUtLJSyp3VXG/7wgCpaOfFLRFqSAlcCAzcsLVDK5HmMcxWtaxAjJ6IK
         yQLh3OvlAE+RMfigSigPRn7lwp4tDfwB8CuWP0Tn8DmiSV+Ggc/ACuls4aqEirYZT2Xw
         cqkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxbxQ3LLlA3iEO+wXRYhAViaa5e+86j5u1C9QF+hGN0puDkrD50bQ8lPfjD/CE+2QEftOjBHmVoEx3ZA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLXDy3f85x23UW0MZV4r3XD0ORHrNB0odgGJDICKj0jTB+cDyoa
	+Ss0115GWEVgax93CttfnXxgr90zRfZFQBzQ1aYoRvpxkDD+VbQFVKGt
X-Gm-Gg: AYBFou3mklElZTq/n7v04dfX+eYFs50tvH4GGVR0IggyaC9zAL94rXo4+MC5VKMZpvO
	ZNUCNsVIraxdnRI0LHWFJzUujax0UiF04UimPGTS2RSarlm3ssfoCUZ3zTjoOdd8i3GAYQTnbYX
	CiKEaF54BH1phxDv5x7ntIdpG82yFvvPIEcFFiJD7zkoEGeg3+jQVSZtfp9E6PBI/NREgaJi9NS
	5wtZZ6GjS+C193fAlhVIXjuZRseHDpnCLuTbxVHs3I4NwVGSqC9sJpZP9wDxiEkztGy0UMCXNaj
	2uG5T8SsuwsBr99PSXdhOUlbBHDQKEVTaF9YV3LPXFPI8aBha9QHAL4PTKPd9XLSuiP5eDc06km
	yhOBfKW5aYzFZByvi1IVjCO64IEInAkGkk/7gQLzpg0it7NpR4ns13IDXzYnjLLaLVeM2ZZGvkz
	Wbzi90ZSUGYqzvBsAlis+uLX7MWpQBztg7GJ99A4xlNtu8nniOtn4yAhhxPYaebp+ERmB5eVRrI
	JOm62WUPOq6d2ESbbHgPjM6baWWhY/K
X-Received: by 2002:a05:600c:4fc1:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-4a19a9cf1e6mr56555745e9.30.1791799785371;
        Mon, 12 Oct 2026 03:09:45 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:44 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Mon, 12 Oct 2026 11:08:15 +0100
Message-ID: <20261012100816.331033-11-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01..fa34786f0652 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -811,6 +811,11 @@ properties:
           - const: pocketbook,614-plus
           - const: allwinner,sun5i-a13
 
+      - description: PocketBook Verse (PB629)
+        items:
+          - const: pocketbook,verse
+          - const: allwinner,sun8i-b288
+
       - description: Point of View Protab2-IPS9
         items:
           - const: pov,protab2-ips9
-- 
2.52.0

